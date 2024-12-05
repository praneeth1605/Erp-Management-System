package com.klef.jfsd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.model.Course;
import com.klef.jfsd.model.Faculty;
import com.klef.jfsd.model.FacultyCourseMapping;
import com.klef.jfsd.model.Student;
import com.klef.jfsd.model.Student_Course;
import com.klef.jfsd.repository.AttendanceRepository;
import com.klef.jfsd.repository.CourseRepository;
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
	
	@Autowired
	private CourseRepository courseRepository;
	
	@Autowired
	private AttendanceRepository attendanceRepository;

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
	public List<Student_Course> ViewAllCourses(Student s)
	{
		return CourseMapping.findByStudent(s);
	}

	@Override
	public String changePassword(int id, String pwd) 
	{
		Student s = studentRepository.findById(id).orElseThrow();
		s.setPassword(pwd);
		studentRepository.save(s);
		
		return "success";
	}
	
	@Override
	public List<Course> viewcoursebysem(String ay, String semester)
	{
		return courseRepository.viewcoursebysem(ay, semester);
	}
	
	@Override
	public int findSectionByCourseAndStudent(Course c, Student s)
	{
        Student_Course scm =  CourseMapping.findByCourseAndStudent(c, s);
        
        return scm.getSection();
	}
	
	@Override
	  public int getStudentAttedance(Course course, Student student,int section)
	  {
	    long t = attendanceRepository.countByCourseAndSection(course, section);
	    
	    long p = attendanceRepository.countByStudentAndCourseAndStatusTrue(student, course);
	    
	    return (int) (((double)p/t)*100);
	    
	  }
	
	@Override
	public long getTotalClasses(Course c , int sec)
	{
		return attendanceRepository.countByCourseAndSection(c, sec);
	}
	
	@Override
	public long getTotalAttendendClasses(Student s, Course c)
	{
		return attendanceRepository.countByStudentAndCourseAndStatusTrue(s, c);
	}
	
	@Override
	public List<Student_Course> getstudentcourses(int id, String ay, String semester)
	{
		return CourseMapping.findStudentByAyAndSem(id, ay, semester);
				
	}
	
	
}
