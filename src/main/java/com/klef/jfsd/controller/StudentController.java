package com.klef.jfsd.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.model.Course;
import com.klef.jfsd.model.Faculty;
import com.klef.jfsd.model.FacultyCourseMapping;
import com.klef.jfsd.model.Student;
import com.klef.jfsd.model.Student_Course;
import com.klef.jfsd.service.AdminService;
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
	
	@PostMapping("checklogin")
	public ModelAndView checkStudentLogin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		int id = Integer.parseInt(request.getParameter("id"));
		String pwd = request.getParameter("password");
		
		Student student = studentService.checkStudentLogin(id, pwd);
		
		HttpSession session = request.getSession();
		
		if(student!=null)
		{
			if(student.getStatus().equals("Active"))
			{
				session.setAttribute("student", student);
				mv.setViewName("redirect:/student/studenthome");
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
	        res = Math.round((sum / csum) * 100.0) / 100.0; // Rounds to 2 decimal places
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
		double sum=0;
		double csum=0,res=0;
		for(int i=0;i<scm.size();i++)
		{
			sum = sum + (scm.get(i).getGrade() * scm.get(i).getCourse().getCredits());
			csum=csum+scm.get(i).getCourse().getCredits();
			
			res = sum/csum;
		}
		if (csum != 0) {
	        res = Math.round((sum / csum) * 100.0) / 100.0; // Rounds to 2 decimal places
	    }
		mv.addObject("mycourselist", scm);
		mv.addObject("cgpa", res);
		
		return mv;
	}
	
	
}
