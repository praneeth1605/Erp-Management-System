package com.klef.jfsd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.model.Admin;
import com.klef.jfsd.model.Course;
import com.klef.jfsd.model.Faculty;
import com.klef.jfsd.model.FacultyCourseMapping;
import com.klef.jfsd.model.Student;
import com.klef.jfsd.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("admin")
public class AdminController 
{
	@Autowired
	private AdminService adminService;
	
	@GetMapping("login")
   public ModelAndView admiLogin()
   {
	   ModelAndView mv = new ModelAndView();
	   mv.setViewName("adminlogin");
	   return mv;
   }
	
	@GetMapping("/logout")
	 public ModelAndView adminLogout()
	   {
		   ModelAndView mv = new ModelAndView();
		   mv.setViewName("adminlogin");
		   return mv;
	   }
	
	@PostMapping("/checklogin")
	public ModelAndView adminHome(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		String uname = request.getParameter("username");
		String pwd = request.getParameter("password");
		
		Admin admin = adminService.checkAdminLogin(uname, pwd);
		
		if(admin!=null)
		{
			mv.setViewName("adminhome");
		}
		else
		{
			mv.setViewName("adminloginfail");
			mv.addObject("msg","Login Failed");
		}
		return mv;
	}
	
	@GetMapping("adminhome")
	   public ModelAndView adminHome()
	   {
		   ModelAndView mv = new ModelAndView();
		   mv.setViewName("adminhome");
		   return mv;
	   }
	
	
	@GetMapping("studentreg")
	public ModelAndView studentreg()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studentreg");
		return mv;
	}
	
	@PostMapping("addstudent")
	public ModelAndView addstudent(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String contact = request.getParameter("contactno");
		String dob = request.getParameter("dob");
		String fname = request.getParameter("fname");
		String mname = request.getParameter("mname");
		String dept = request.getParameter("dept");
		
		Student s = new Student();
		
		s.setId(id);
		s.setName(name);
		s.setGender(gender);
		s.setEmail(email);
		s.setPassword(password);
		s.setContactno(contact);
		s.setDob(dob);
		s.setFname(fname);
		s.setMname(mname);
		s.setDepartment(dept);
		
		String msg = adminService.addStudent(s);
		
		mv.setViewName("studentregsuccess");
		mv.addObject("msg", msg);
		
		return mv;
		
	}
	
	@GetMapping("viewallstudents")
	public ModelAndView viewallstudents()
	{
		List<Student> slist = adminService.viewallstudents();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("managestudents");
		mv.addObject("students",slist);
		
		return mv;
	}
	
	@GetMapping("deletestudent/{id}")
	public String deletestudent(@PathVariable("id") int sid)
	{
         
		adminService.deleteStudent(sid);
		
		return "redirect:/admin/viewallstudents";
	}
	
	@GetMapping("updatestudent/{id}")
	public ModelAndView updatestudent(@PathVariable("id") int sid)
	{
		ModelAndView mv = new ModelAndView();
        
		mv.setViewName("updatestudent");
		mv.addObject("id",sid);
		
		return mv;
	}
	
	@PostMapping("updatestd")
	public ModelAndView updatestudentdetails(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
        
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String dob = request.getParameter("dob");
		String email = request.getParameter("email");
		String contact = request.getParameter("contactno");
		
		Student s = new Student();
		
		s.setId(id);
		s.setContactno(contact);
		s.setDob(dob);
		s.setEmail(email);
		s.setName(name);
		
		String msg = adminService.updateStudent(s);
		
		mv.setViewName("studentupdatesuccess");
		mv.addObject("msg", msg);
		
		return mv;
	}
	
	@GetMapping("facultyreg")
	public ModelAndView facultyreg()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("facultyreg");
		return mv;
	}
	
	@PostMapping("addfaculty")
	public ModelAndView addfaculty(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String contact = request.getParameter("contactno");
		String dept = request.getParameter("dept");
		String des = request.getParameter("des");
		
		Faculty f = new Faculty();
		
		f.setId(id);
		f.setName(name);
		f.setGender(gender);
		f.setEmail(email);
		f.setPassword(password);
		f.setContact(contact);
		f.setDepartment(dept);
		f.setDesignation(des);
		
		String msg = adminService.addFaculty(f);
		
		mv.setViewName("facultyregsuccess");
		mv.addObject("msg", msg);
		
		return mv;
		
	}
	
	@GetMapping("viewallfaculty")
	public ModelAndView viewallfaculty()
	{
		List<Faculty> flist = adminService.viewallfaculty();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("managefaculty");
		mv.addObject("flist",flist);
		
		return mv;
	}
	
	@GetMapping("deletefaculty/{id}")
	public String deletefaculty(@PathVariable("id") int fid)
	{
         
		adminService.deleteFaculty(fid);
		
		return "redirect:/viewallfaculty";
	}
	
	@GetMapping("updatefaculty/{id}")
	public ModelAndView updatefaculty(@PathVariable("id") int fid)
	{
		ModelAndView mv = new ModelAndView();
        
		mv.setViewName("updatefaculty");
		mv.addObject("id",fid);
		
		return mv;
	}
	
	@PostMapping("updatefac")
	public ModelAndView updatefacultydetails(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
        
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String dept = request.getParameter("dept");
		String email = request.getParameter("email");
		String contact = request.getParameter("contactno");
		String des = request.getParameter("des");
		
		Faculty f = new Faculty();
		
		f.setId(id);
		f.setName(name);
		f.setDepartment(dept);
		f.setDesignation(des);
		f.setContact(contact);
		f.setEmail(email);
		
		String msg = adminService.updateFaculty(f);
		
		mv.setViewName("facultyupdatesuccess");
		mv.addObject("msg", msg);
		
		return mv;
	}
	
	
	@GetMapping("coursemapping")
	   public ModelAndView coursemapping()
	   {
		   ModelAndView mv = new ModelAndView();
		   mv.setViewName("coursemapping");
		   
		   List<Faculty> flist = adminService.viewallfaculty();
		   List<Course> clist = adminService.viewallcourses();
		   mv.addObject("faculties", flist);
		   mv.addObject("courses", clist);
		   return mv;
	   }
	
	@PostMapping("/map")
	public ModelAndView map(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView("redirect:coursemapping");
		int cid = Integer.parseInt(request.getParameter("cid")); 
		int fid = Integer.parseInt(request.getParameter("fid"));
		int section = Integer.parseInt(request.getParameter("section"));
		
		Course c=adminService.viewCourseById(cid);
		Faculty f=adminService.viewFacultyById(fid);
		
		if(adminService.getcount(cid, fid, section)==0)
		{
		 String res = adminService.mapFacultyToCourse(section,f,c);
		mv.addObject("msg", res);
		}
		else
		{
			mv.addObject("msg", "Already Mapped");
		}
		
		return mv;		
	}
	
	@GetMapping("/viewcoursemappedfaculty")
	public ModelAndView viewmappedfaculty()
	{
		ModelAndView mv = new ModelAndView();
		List<FacultyCourseMapping> clist = adminService.viewFacultyMappedcourses();
		mv.addObject("courses",clist);
		
		mv.setViewName("viewcoursemappedfaculty");
		
		return mv;
	}
	
	@GetMapping("coursereg")
	   public ModelAndView coursereg()
	   {
		   ModelAndView mv = new ModelAndView();
		   mv.setViewName("coursereg");
		   return mv;
	   }
	   
	   @PostMapping("addcourse")
	   public ModelAndView addcourse(HttpServletRequest request)
	   {
		   ModelAndView mv = new ModelAndView();
		   
		   String name = request.getParameter("name");
		   String code = request.getParameter("code");
		   double credits = Double.parseDouble(request.getParameter("credits"));
		   String dept = request.getParameter("dept");
		   //int ins_id = Integer.parseInt(request.getParameter("instructorid"));
		   
		   Course c = new Course();
		   
		   c.setName(name);
		   c.setCode(code);
		   c.setCredits(credits);
		   c.setDepartment(dept);
		   
		   String msg = adminService.addCourse(c);
		   
		   mv.setViewName("courseregsuccess");
		   mv.addObject("msg", msg);
		   
		   return mv;
	   }
	   
	   @GetMapping("viewallcourses")
	   public ModelAndView viewallcourses()
		{
			List<Course> clist = adminService.viewallcourses();
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("managecourses");
			mv.addObject("clist",clist);
			
			return mv;
		}
	   
	   @GetMapping("deletecourse/{id}")
		public String deletecourse(@PathVariable("id") int cid)
		{
	        
			adminService.deleteCourse(cid);
			
			return "redirect:/viewallcourses";
		}
		
		@GetMapping("updatecourse/{id}")
		public ModelAndView updatecourse(@PathVariable("id") int cid)
		{
			ModelAndView mv = new ModelAndView();
	       
			mv.setViewName("updatecourse");
			mv.addObject("id",cid);
			
			return mv;
		}
		
		@PostMapping("courseupdate")
		public ModelAndView updatecoursedetails(HttpServletRequest request)
		{
			ModelAndView mv = new ModelAndView();
	       
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String dept = request.getParameter("dept");
			String code = request.getParameter("code");
			double credits = Double.parseDouble(request.getParameter("credits"));
			//int insid = Integer.parseInt(request.getParameter("instructorid"));

	        Course c = new Course();
	        
	        c.setCode(code);
	        c.setId(id);
	        //c.setInstructor_id(insid);
	        c.setCredits(credits);
	        c.setDepartment(dept);
	        c.setName(name);
			
			
			String msg = adminService.updateCourse(c);
			
			mv.setViewName("courseupdatesuccess");
			mv.addObject("msg", msg);
			
			return mv;
		}
}
