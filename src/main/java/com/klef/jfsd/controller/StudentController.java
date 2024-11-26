package com.klef.jfsd.controller;

import java.util.List;

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
			session.setAttribute("student", student);
			mv.setViewName("redirect:/student/studenthome");
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
	public ModelAndView viewMyCourses()
	{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewMyCourses");
		mv.addObject("clist",studentService.ViewAllCourses());
		
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
	public ModelAndView facultylogout(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
		session.removeAttribute("student");
	    
		mv.setViewName("studentlogin");
		return mv;
	}
		
	
	
}
