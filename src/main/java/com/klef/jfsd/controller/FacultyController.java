package com.klef.jfsd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.model.Course;
import com.klef.jfsd.model.Faculty;
import com.klef.jfsd.model.FacultyCourseMapping;
import com.klef.jfsd.model.Student;
import com.klef.jfsd.service.AdminService;
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
    
    
    
	@GetMapping("login")
	public ModelAndView facultyLogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("facultylogin");
		return mv;
	}
	
	@PostMapping("checklogin")
	public ModelAndView checkStudentLogin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		
		int id = Integer.parseInt(request.getParameter("id"));
		String pwd = request.getParameter("password");
		
		Faculty faculty = facultyService.checkFacultyLogin(id, pwd);
		
		if(faculty !=null)
		{
			session.setAttribute("faculty", faculty);
			mv.setViewName("redirect:/faculty/home");
		}
		else
		{
			mv.setViewName("facultyloginfail");
			mv.addObject("msg","Login Failed");
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
	
	@GetMapping("postattendance")
	public ModelAndView postattendance()
	{
		List<Course> clist = adminService.viewallcourses();
		List<Student> slist = adminService.viewallstudents();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("postattendance");
		mv.addObject("courses",clist);
		mv.addObject("students",slist);
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
		ModelAndView mv = new ModelAndView();
		mv.setViewName("facultycourses");
		HttpSession session = request.getSession();
		Faculty f = (Faculty)  session.getAttribute("faculty");
		List<FacultyCourseMapping> fcmlist = facultyService.viewfacultycourses(f.getId());
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
}
