package com.klef.jfsd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.model.Faculty;
import com.klef.jfsd.model.FacultyCourseMapping;
import com.klef.jfsd.model.Student;
import com.klef.jfsd.model.Student_Course;
import com.klef.jfsd.repository.FacultyCourseMappingRepository;
import com.klef.jfsd.repository.StudentRepository;
import com.klef.jfsd.repository.Student_CourseRepository;

@Service
public class StudentServiceImpl implements StudentService
{
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private FacultyCourseMappingRepository facultyCourseMapping;
	
	@Autowired
	private Student_CourseRepository CourseMapping;
	

	@Override
	public Student checkStudentLogin(int id, String pwd) 
	{
		return studentRepository.checkStudentLogin(id, pwd);
	}
	
	@Override
	public List<FacultyCourseMapping> getSectionByCourseId(int cid)
	{
		return facultyCourseMapping.getSectionByCourseId(cid);
	}
	
	@Override
	public Long checkStudentCourseAndSection(int  sid,int cid,int section)
	{
		return CourseMapping.checkStudentCourseAndSection(sid, cid, section);
	}
	
	@Override
	public String addStudentCourse(Student_Course course) 
	{
		CourseMapping.save(course);
		 
		 return "Student Course Registered Successfully";
	}
	@Override
	public List<Student_Course> ViewAllCourses()
	{
		return CourseMapping.findAll();
	}
}
