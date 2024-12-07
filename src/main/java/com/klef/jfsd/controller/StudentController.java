package com.klef.jfsd.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.model.Course;
import com.klef.jfsd.model.Faculty;
import com.klef.jfsd.model.Student;
import com.klef.jfsd.model.Student_Course;
import com.klef.jfsd.service.AdminService;
import com.klef.jfsd.service.CaptchaService;
import com.klef.jfsd.service.EmailService;
import com.klef.jfsd.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("student")
public class StudentController 
{
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private CaptchaService captchaService;
	
	public String generatedotp;
	
	@GetMapping("studenthome")
	public ModelAndView studenthome()
	{
	  ModelAndView mv = new ModelAndView();
	  mv.setViewName("studenthome");
	  return mv;
	}	
	
	@GetMapping("login")
	public ModelAndView studentLogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studentlogin");
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/getcaptcha/{length}")
    public String getCaptcha(@PathVariable("length") int captchaLength)
    {
    	return Base64.getEncoder().encodeToString(captchaService.generateCaptcha(captchaLength));
    }
	
	@PostMapping("checklogin")
	public ModelAndView checkStudentLogin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		int id = Integer.parseInt(request.getParameter("id"));
		String pwd = request.getParameter("password");
	  
	    Student student = studentService.checkStudentLogin(id, pwd);
	  		
	  	HttpSession session = request.getSession();
	  		
	  	String Captcha = request.getParameter("Captcha");
	    
	    boolean isCaptchaValid = captchaService.validateCaptcha(Captcha);

	      if (!isCaptchaValid) 
	      {
	          mv.addObject("message", "Invalid Captcha. Please try again.");
	          mv.setViewName("redirect:/student/login");
	          return mv;
	      }
	      else
	      {	  
		  		if(student!=null)
		  		{
		  			if(student.getStatus().equals("Active"))
		  			{
		  				session.setAttribute("student", student);
		  				
		  				Student s = (Student) session.getAttribute("student");
		  				List<Student_Course> scm = studentService.ViewAllCourses(s);
		  				double sum=0;
		  				for(int i=0;i<scm.size();i++)
		  				{
		  					sum = sum + (scm.get(i).getCourse().getCredits());
		  				}
                        
		  				mv.addObject("sum", sum);
		  				mv.addObject("gpa", calGPA(s));
		  				mv.setViewName("studenthome");
		  			}
		  			else
		  			{
		  				mv.setViewName("blocked");
		  			}
		  			
		  		}
		  		
		  		else
		  		{
		  			mv.setViewName("studentloginfail");
		  			mv.addObject("msg","Login Failed");
		  		}
	      }
	 
		return mv;
	}
	
	@GetMapping("coursereg")
	public ModelAndView coursereg()
	{
		ModelAndView mv = new ModelAndView();
        
		mv.setViewName("studentcoursereg");
		List<Course> clist = adminService.viewallcourses();
		
		mv.addObject("course", clist);
		
		for(Course c: clist)
		{
			mv.addObject("sections"+c.getId(),studentService.getSectionByCourseId(c.getId()));
		}
		
		return mv;
	}
	
	@PostMapping("courseregister")
	public ModelAndView courseregister(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		int n = Integer.parseInt(request.getParameter("index"));
		
		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("student");
		String res="";
		
		for(int i=1;i<=n;i++)
		{
			String sec = request.getParameter(Integer.toString(i));
			if(sec!=null&&sec!="") 
			{
			String parts[]  = sec.split("/");
			int cid = Integer.parseInt(parts[0]);
			int sections = Integer.parseInt(parts[1]);
			int fid = Integer.parseInt(parts[2]);
			
			long number = studentService.checkStudentCourseAndSection(student.getId(),cid,sections);
			
			if(number==0)
			{
				Faculty f = adminService.viewFacultyById(fid);
				Course c = adminService.viewCourseById(cid);
				
				Student_Course student_Course = new Student_Course();
				student_Course.setCourse(c);
				student_Course.setFaculty(f);
				student_Course.setSection(sections);
				student_Course.setStudent(student);
				
				res = studentService.addStudentCourse(student_Course);

			}
			}
			
		}
		mv.addObject("msg",res);
		mv.setViewName("redirect:/student/viewMyCourses");
		
		return mv;
	}
	
	@GetMapping("viewMyCourses")
	public ModelAndView viewMyCourses(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewMyCourses");
		Student s = (Student)session.getAttribute("student");
		mv.addObject("clist",studentService.ViewAllCourses(s));
		
		return mv;
	}
	
	@GetMapping("myattendance")
	public ModelAndView myattendance()
	{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studentyearsem");
		return mv;
	}
	
	@PostMapping("studentattendance")
	public ModelAndView viewattendance(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studentattendance");
		String ay = request.getParameter("ay");
		String semester = request.getParameter("semester");
		Student s = (Student)session.getAttribute("student");
		
		List<Course> clist = studentService.viewcoursebysem(ay, semester);
		
		List<Map<String, Object>> attendanceDetails = new ArrayList<Map<String, Object>>();

	      for (Course course : clist) 
	      {
	        
	        int sec = studentService.findSectionByCourseAndStudent(course, s);
	        if(sec!=-1) {
	          Map<String, Object> details = new HashMap<>();
	            details.put("courseName", course.getName());
	            details.put("courseName", course.getName());
	            details.put("courseCode", course.getCode());
	            details.put("totalclasses", studentService.getTotalClasses(course, sec));
	            details.put("attendedclasses", studentService.getTotalAttendendClasses(s, course));
	            details.put("section",sec );
	            details.put("attendancePercentage", studentService.getStudentAttedance(course, s,sec));

	            attendanceDetails.add(details);
	        }
	      }
	      
	    mv.addObject("attendanceDetails", attendanceDetails);
	    return mv;
	}
	
	@GetMapping("/SessionExpired")
	public ModelAndView SessionExpired()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sessionexpired");
		return mv;
	}
	@GetMapping("logout")
	public ModelAndView logout(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
		session.removeAttribute("student");
	    
		mv.setViewName("studentlogin");
		return mv;
	}
		
	@GetMapping("studentprofile")
	public ModelAndView Profile()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studentprofile");
		return mv;
	}
	
	@GetMapping("changepwd")
	public ModelAndView changepwd()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studentchangepassword");
		return mv;
	}
	
	@PostMapping("updatepwd")
	public ModelAndView updatepassword(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		Student student = (Student) session.getAttribute("student");
		
		int id = student.getId();
		String pwd = request.getParameter("password");
		
		
		String msg = studentService.changePassword(id, pwd);
		
		mv.setViewName("redirect:/student/changepwd");
		mv.addObject("msg",msg);
		
		return mv;
	}
	
	@GetMapping("grades")
	public ModelAndView grades()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studentyearsemgrade");
		return mv;
	}
	
	@PostMapping("getcoursegrades")
	public ModelAndView getcoursesgrade(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewgrade");
		
		String ay = request.getParameter("ay");
		String semester = request.getParameter("semester");
		
		HttpSession session = request.getSession();
		Student s = (Student) session.getAttribute("student");
		List<Student_Course> scm = studentService.getstudentcourses(s.getId(), ay, semester);
		double sum=0;
		double csum=0,res=0;
		for(int i=0;i<scm.size();i++)
		{
			sum = sum + (scm.get(i).getGrade() * scm.get(i).getCourse().getCredits());
			csum=csum+scm.get(i).getCourse().getCredits();
			
			res = sum/csum;
		}
		if (csum != 0) {
	        res = Math.round((sum / csum) * 100.0) / 100.0; 
	    }
		mv.addObject("mycourselist", scm);
		mv.addObject("scgpa", res);
		
		return mv;
	}
	
	@GetMapping("mycgpa")
	public ModelAndView mycgpa(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mycgpa");
		HttpSession session = request.getSession();
		Student s = (Student) session.getAttribute("student");
		
		List<Student_Course> scm = studentService.ViewAllCourses(s);
		
		double res= calGPA(s);
		
		mv.addObject("mycourselist", scm);
		mv.addObject("cgpa", res);
		
		return mv;
	}
	
	public double calGPA(Student s)
	{
		List<Student_Course> scm = studentService.ViewAllCourses(s);
		double sum=0;
		double csum=0,res=0;
		for(int i=0;i<scm.size();i++)
		{
			sum = sum + (scm.get(i).getGrade() * scm.get(i).getCourse().getCredits());
			csum=csum+scm.get(i).getCourse().getCredits();
			
			res = sum/csum;
		}
		if (csum != 0) {
	        res = Math.round((sum / csum) * 100.0) / 100.0; 
	    }
		
		return res;
	}
	@GetMapping("forgotpassword")
	public ModelAndView forgotpassword()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("forgotpasswordstudent");
		return mv;
	}
	
	@PostMapping("otpgeneration")
	public ModelAndView otpgeneration(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();
	    int sid = Integer.parseInt(request.getParameter("sid"));
	    Student s = studentService.getstudentbyid(sid);
	    request.getSession().setAttribute("sid", sid);
	    
	    String toemail = s.getEmail();
	    
	    String subject = "Your One-Time Password (OTP) for Password Reset";

	   
	    int number = (int) (Math.random() * 900000) + 100000;
	    generatedotp = Integer.toString(number);

	    String name = s.getName();
	    

	    String message = String.format("""
	    <html>
	    <body style="margin: 0; padding: 0; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: linear-gradient(135deg, #f6f8f9 0%%, #e5ebee 100%%); color: #2c3e50; line-height: 1.6;">
	        <div style="max-width: 600px; margin: 30px auto; background: #ffffff; border-radius: 12px; box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1); overflow: hidden; border: 1px solid #e1e6ea;">
	            <div style="background: linear-gradient(to right, #4CAF50, #45a049); padding: 20px; text-align: center; color: white;">
	                <h2 style="font-size: 26px; margin: 0; font-weight: 300; letter-spacing: 1px;">Password Reset</h2>
	            </div>
	            <div style="padding: 30px; background: #ffffff;">
	                <p style="font-size: 16px; margin-bottom: 20px;">Dear <b>%s</b>,</p>
	                
	                <p style="font-size: 16px; color: #34495e;">We received a request to reset your password. Please use the One-Time Password (OTP) below to complete the process:</p>
	                
	                <div style="background: linear-gradient(145deg, #f0f9f0, #e6f2e6); border: 2px dashed #4CAF50; padding: 20px; text-align: center; border-radius: 10px; margin: 25px 0;">
	                    <span style="font-size: 32px; font-weight: 600; color: #2ecc71; letter-spacing: 5px; display: block;">%s</span>
	                    <p style="font-size: 14px; color: #7f8c8d; margin-top: 10px;">Valid for 10 minutes</p>
	                </div>
	                
	                <p style="font-size: 14px; color: #2c3e50; margin: 25px 0; background-color: #f1f8ff; padding: 15px; border-radius: 8px; border-left: 4px solid #3498db;">
	                    ⚠️ If you did not request this password reset, please ignore this email or contact our support team immediately.
	                </p>
	                
	                <div style="text-align: center; margin-top: 30px;">
	                    <a href="mailto:eduverse@gamil.com" style="display: inline-block; background-color: #3498db; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; transition: background-color 0.3s ease;">
	                        Contact Support
	                    </a>
	                </div>
	            </div>
	            
	            <div style="background: #2ecc71; color: white; padding: 15px; text-align: center; font-size: 14px;">
	                <p style="margin: 0;">© 2024 Eduverse</p>
	            </div>
	        </div>
	    </body>
	    </html>
	    """, name, generatedotp);


	    emailService.sendEmail(toemail, subject, message);

	    mv.setViewName("studentotp");
	    mv.addObject("sid", sid);
	    return mv;
	}

	
	
	@PostMapping("otp")
	public ModelAndView otp(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		String otp = request.getParameter("otp");
		
		
		System.out.println(otp);
		
		if(otp.equals(generatedotp))
		{
			mv.setViewName("forgotchangepasswordstudent");
			
		}
		else
		{
			mv.setViewName("redirect:studentotp?msg=invalid");
		}
		
		return mv;
	}
	
	@GetMapping("studentotp")
	public ModelAndView studentotp(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView("studentotp");
		
		 
		return mv;
	}
	
	@PostMapping("forgotpasswordupdate")
	public ModelAndView forgotpasswordupdate(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		int sid = (Integer) request.getSession().getAttribute("sid");		
		String pwd = request.getParameter("password");
		
		String msg = studentService.changePassword(sid, pwd);
		
		mv.setViewName("redirect:/student/login");
		mv.addObject("msg",msg);
		
		return mv;
	}
	
	
}
