package com.klef.jfsd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.model.Admin;
import com.klef.jfsd.model.Course;
import com.klef.jfsd.model.Faculty;
import com.klef.jfsd.model.FacultyCourseMapping;
import com.klef.jfsd.model.Student;
import com.klef.jfsd.repository.AdminRepository;
import com.klef.jfsd.repository.CourseRepository;
import com.klef.jfsd.repository.FacultyCourseMappingRepository;
import com.klef.jfsd.repository.FacultyRepository;
import com.klef.jfsd.repository.StudentRepository;

@Service
public class AdminServiceImpl implements AdminService
{

	@Autowired
	AdminRepository adminRepository;
	
	@Autowired
	StudentRepository studentRepository;
	
	@Autowired
	FacultyRepository facultyRepository;
	
	@Autowired
	CourseRepository courseRepository;
	
	@Autowired
	FacultyCourseMappingRepository mapping;
	
	@Override
	public String addStudent(Student s) 
	{
		 studentRepository.save(s);
		 
		 return "Student Record Inserted Successfully";
	}

	@Override
	public String addFaculty(Faculty f) 
	{
		facultyRepository.save(f);
		 
		 return "Faculty Record Inserted Successfully";
	}

	@Override
	public String addCourse(Course c) 
	{
		courseRepository.save(c);
		
		return "Course Record Inserted Successfully";
	}

	@Override
	public Admin checkAdminLogin(String uname, String pwd) 
	{
		
		return adminRepository.checkAdminLogin(uname, pwd);
	}

	@Override
	public String updateStudent(Student s) 
	{
		Student student = studentRepository.findById(s.getId());
		
		student.setEmail(s.getEmail());
		student.setContactno(s.getContactno());
		student.setName(s.getName());
		student.setDob(s.getDob());
		student.setStatus(s.getStatus());
		
		studentRepository.save(student);
		
		return "Student record updated successfully";
	}

	@Override
	public String updateFaculty(Faculty f) 
	{
        Faculty faculty = facultyRepository.findById(f.getId()).orElseThrow();
        
        faculty.setDepartment(f.getDepartment());
        faculty.setContact(f.getContact());
        faculty.setDesignation(f.getDesignation());
        faculty.setEmail(f.getEmail());
        faculty.setName(f.getName());
        faculty.setStatus(f.getStatus());
        
        facultyRepository.save(faculty);
		
		return "Faculty record updated successfully";
	}

	@Override
	public String updateCourse(Course c) 
	{
		
		Course course = courseRepository.findById(c.getId()).orElseThrow();
		
		//course.setInstructor_id(c.getInstructor_id());
		course.setCredits(c.getCredits());
		course.setName(c.getName());
		course.setDepartment(c.getDepartment());
		course.setCode(c.getCode());
		
		courseRepository.save(course);
		
		
		return "Course record updated successfully";
	}

	@Override
	public void deleteStudent(int id) 
	{
        Student s = studentRepository.findById(id);
        s.setStatus("Inactive");
        
        studentRepository.save(s);
		
	}

	@Override
	public void deleteFaculty(int id) 
	{
		
		Faculty f = facultyRepository.findById(id).get();
		f.setStatus("Inactive");
		facultyRepository.save(f);
		
	}

	@Override
	public void deleteCourse(int id) 
	{
		courseRepository.deleteById(id);
	}
	
	@Override
	public Faculty viewFacultyById(int id) 
	{
		return facultyRepository.findById(id).get();
		
	}
	@Override
	public Course viewCourseById(int id) 
	{
		return courseRepository.findById(id).get();
		
	}

	@Override
	public List<Student> viewallstudents() 
	{
		List<Student> slist = studentRepository.findAll();
		
		return slist;
	}

	@Override
	public List<Faculty> viewallfaculty() 
	{
		List<Faculty> flist = facultyRepository.findAll();
		
		return flist;
	}

	@Override
	public List<Course> viewallcourses() 
	{
		List<Course> clist = courseRepository.findAll();
		
		return clist;
	}

	@Override
	public String mapFacultyToCourse(int section,Faculty f,Course c) 
	{
		FacultyCourseMapping courseMapping = new FacultyCourseMapping();
		courseMapping.setInstructor(f);
		courseMapping.setSection(section);
		courseMapping.setCourse(c);
		mapping.save(courseMapping);
	    return "Course Mapped successfully";
	}
	
	@Override
	public List<FacultyCourseMapping> viewFacultyMappedcourses() 
	{
		return mapping.findAll();
		
	}

	@Override
	public long getcount(int cid, int fid, int sec) {
		return mapping.getCount(fid, cid, sec);
	}

	@Override
	public long getstudentcount() 
	{
		return studentRepository.getStudentCount();
	}
	
	@Override
	public long getfacultycount() 
	{
		return facultyRepository.getFacultyCount();
	}
	
	@Override
	public long getcoursecount() 
	{
		return courseRepository.getcoursecount();
	}
	
	

}
