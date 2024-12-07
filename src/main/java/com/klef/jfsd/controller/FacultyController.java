package com.klef.jfsd.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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

import com.klef.jfsd.model.Attendance;
import com.klef.jfsd.model.Course;
import com.klef.jfsd.model.Faculty;
import com.klef.jfsd.model.FacultyCourseMapping;
import com.klef.jfsd.model.Student_Course;
import com.klef.jfsd.service.AdminService;
import com.klef.jfsd.service.CaptchaService;
import com.klef.jfsd.service.EmailService;
import com.klef.jfsd.service.FacultyService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("faculty")
public class FacultyController 
{
    @Autowired
    private FacultyService facultyService;
	
    @Autowired
    private AdminService adminService;
    
    @Autowired
    private EmailService emailService;
    
    @Autowired
	private CaptchaService captchaService;
    
    private String generatedotp;
    
    @GetMapping("login")
	public ModelAndView facultyLogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("facultylogin");
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
		HttpSession session = request.getSession();
		
		int id = Integer.parseInt(request.getParameter("id"));
		String pwd = request.getParameter("password");
		
		Faculty faculty = facultyService.checkFacultyLogin(id, pwd);
		
		String Captcha = request.getParameter("Captcha");
		boolean isCaptchaValid = captchaService.validateCaptcha(Captcha);

	      if (!isCaptchaValid) 
	      {
	          mv.addObject("message", "Invalid Captcha. Please try again.");
	          mv.setViewName("redirect:/faculty/login");
	          return mv;
	      }
	      else
	      {
				if(faculty!=null)
				{
					if(faculty.getStatus().equals("Active"))
					{
						session.setAttribute("faculty", faculty);
						mv.setViewName("redirect:/faculty/home");
					}
					else
					{
						mv.setViewName("blocked");
					}
					
				}
				else
				{
					mv.setViewName("facultyloginfail");
					mv.addObject("msg","Login Failed");
				}
	      }	
		
		return mv;
	}
    
    
	@GetMapping("home")
	public ModelAndView facultyhome()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("facultyhome");
		return mv;
	}
	
	@GetMapping("postattendance/{courseid}/{section}")
	public ModelAndView postattendance(@PathVariable("courseid") int cid, @PathVariable("section") int sec)
	{
		
		List<Student_Course> slist = facultyService.viewstudentsbycourse(cid, sec);
		
		Course course = facultyService.findcoursebyid(cid);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("postattendance");
		mv.addObject("attendance",slist);
		mv.addObject("course",course);
		mv.addObject("sec",sec);
		return mv;
	}
	
	
	@GetMapping("postinternals/{courseid}/{section}")
	public ModelAndView postinternals(@PathVariable("courseid") int cid, @PathVariable("section") int sec)
	{
		
		List<Student_Course> slist = facultyService.viewstudentsbycourse(cid, sec);
		
		Course course = facultyService.findcoursebyid(cid);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("postinternals");
		mv.addObject("slist",slist);
		mv.addObject("course",course);
		mv.addObject("sec",sec);
		return mv;
	}
	
	@PostMapping("attendancepost")
	public ModelAndView postattendance(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		int cid = Integer.parseInt(request.getParameter("cid"));
		Course course = facultyService.findcoursebyid(cid);
		int section = Integer.parseInt(request.getParameter("section"));
		System.out.println(cid+section);
		List<Student_Course> slist = facultyService.viewstudentsbycourse(cid, section);
		
		Map<Integer, Attendance> map = new HashMap<Integer, Attendance>();

	      for (int i = 0; i < slist.size(); i++) {
	          String[] selectedHours = request.getParameterValues("hours");
              
	          
	          
	          for (String hour : selectedHours) {
	              Attendance att = new Attendance();
	              att.setStudent(slist.get(i).getStudent());
	              att.setCourse(course);
	              att.setSection(section);

	              att.setHours(Integer.parseInt(hour));
	              System.out.println(hour);

	              String present = request.getParameter(Integer.toString(i));
	              att.setStatus(!("false".equals(present)));

	              LocalDate today = LocalDate.now();
	              DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	              String formattedDate = today.format(formatter);
	              att.setDate(formattedDate);
	              System.out.println(hour + present + formattedDate);
	              map.put(i, att);
	          }
	      }
	      
	      String msg = facultyService.PostAttendance(map);
	      
	      mv.addObject("message", msg);
	      mv.setViewName("redirect:/faculty/home");
	      return mv;
		
	}
	
	@PostMapping("internalspost")
	public ModelAndView postinternals(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();

	      HttpSession session = request.getSession();
	      //Faculty f = (Faculty) session.getAttribute("faculty");
	      int cid = Integer.parseInt(request.getParameter("cid"));
	      int section = Integer.parseInt(request.getParameter("section"));


	      List<Student_Course> scmlist = facultyService.viewstudentsbycourse(cid, section);

	      for (int i = 0; i < scmlist.size(); i++) {
	          Student_Course scm = scmlist.get(i);

	          int studentInternals = Integer.parseInt(request.getParameter(Integer.toString(i)));
	          if(scm.getStudentInternals() == -1) 
	          {
	          scm.setStudentInternals(studentInternals);

	          facultyService.UpdateInternals(scm);
	          }
	      }

	      mv.addObject("message", "Internals updated successfully!");
	      mv.setViewName("redirect:/faculty/home");
	      
	      return mv;
	}

	
	@GetMapping("logout")
	public ModelAndView facultylogout(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
		session.removeAttribute("faculty");
	    
		mv.setViewName("facultylogin");
		return mv;
	}
	
	@GetMapping("mycourses")
	public ModelAndView mycourses(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		Faculty f = (Faculty)  session.getAttribute("faculty");
		List<FacultyCourseMapping> fcmlist = facultyService.mycourses(f);
		
		mv.setViewName("facultymycourses");
		mv.addObject("mycourselist", fcmlist);
		
		return mv;
		
	}
	
	
	@GetMapping("attendance")
	public ModelAndView attendance()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("selectYearSem");
		return mv;
	}
	
	@GetMapping("internals")
	public ModelAndView internals()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("facultyinternalsyearsem");
		return mv;
	}
	
	@PostMapping("getcoursesattendance")
	public ModelAndView getcoursesattendance(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("facultycourses");
		
		String ay = request.getParameter("ay");
		String semester = request.getParameter("semester");
		
		HttpSession session = request.getSession();
		Faculty f = (Faculty)  session.getAttribute("faculty");
		List<FacultyCourseMapping> fcmlist = facultyService.viewfacultycourses(f.getId(),ay,semester);
		mv.addObject("mycourselist", fcmlist);
		
		return mv;
	}
	
	@PostMapping("getcoursesinternals")
	public ModelAndView getcoursesinternals(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("facultyinternals");
		
		String ay = request.getParameter("ay");
		String semester = request.getParameter("semester");
		
		HttpSession session = request.getSession();
		Faculty f = (Faculty)  session.getAttribute("faculty");
		List<FacultyCourseMapping> fcmlist = facultyService.viewfacultycourses(f.getId(),ay,semester);
		mv.addObject("mycourselist", fcmlist);
		
		return mv;
	}
	
	@GetMapping("/SessionExpired")
	public ModelAndView SessionExpired()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sessionexpired");
		return mv;
	}
	
	@GetMapping("forgotpassword")
	public ModelAndView forgotpassword()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("forgotpasswordfaculty");
		return mv;
	}
	
	@PostMapping("otpgeneration")
	public ModelAndView otpgeneration(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();
	    int fid = Integer.parseInt(request.getParameter("sid"));
	    Faculty f = facultyService.getFacultyById(fid);
	    request.getSession().setAttribute("fid", fid);
	    
	    String toemail = f.getEmail();
	    
	    String subject = "Your One-Time Password (OTP) for Password Reset";

	   
	    int number = (int) (Math.random() * 900000) + 100000;
	    generatedotp = Integer.toString(number);

	    String name = f.getName();
	    

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

	    mv.setViewName("facultyotp");
	
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
			mv.setViewName("redirect:facultyotp?msg=invalid");
		}
		
		return mv;
	}
	
	@GetMapping("facultyotp")
	public ModelAndView studentotp(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView("facultyotp");
		return mv;
	}
	
	@PostMapping("forgotpasswordupdate")
	public ModelAndView forgotpasswordupdate(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		int fid = (Integer) request.getSession().getAttribute("fid");		
		String pwd = request.getParameter("password");
		
		String msg = facultyService.changePassword(fid, pwd);
		
		mv.setViewName("redirect:/faculty/login");
		mv.addObject("msg",msg);
		
		return mv;
	}
	
	@GetMapping("facultyprofile")
	public ModelAndView facultyprofile()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("facultyprofile");
		
		return mv;
	}
	
	@GetMapping("changepwd")
	public ModelAndView changepwd()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("facultychangepassword");
		return mv;
	}
	
	@PostMapping("updatepwd")
	public ModelAndView updatepassword(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		Faculty faculty = (Faculty) session.getAttribute("faculty");
		
		int id = faculty.getId();
		String pwd = request.getParameter("password");
		
		
		String msg = facultyService.changePassword(id, pwd);
		
		mv.setViewName("redirect:/faculty/changepwd");
		mv.addObject("msg",msg);
		
		return mv;
	}
	
}
