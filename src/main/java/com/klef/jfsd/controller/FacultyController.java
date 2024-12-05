package com.klef.jfsd.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.model.Attendance;
import com.klef.jfsd.model.Course;
import com.klef.jfsd.model.Faculty;
import com.klef.jfsd.model.FacultyCourseMapping;
import com.klef.jfsd.model.Student_Course;
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
}
