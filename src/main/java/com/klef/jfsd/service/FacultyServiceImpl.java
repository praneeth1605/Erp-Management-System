package com.klef.jfsd.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.model.Attendance;
import com.klef.jfsd.model.Course;
import com.klef.jfsd.model.Faculty;
import com.klef.jfsd.model.FacultyCourseMapping;
import com.klef.jfsd.model.Student;
import com.klef.jfsd.model.Student_Course;
import com.klef.jfsd.repository.AttendanceRepository;
import com.klef.jfsd.repository.CourseRepository;
import com.klef.jfsd.repository.FacultyCourseMappingRepository;
import com.klef.jfsd.repository.FacultyRepository;
import com.klef.jfsd.repository.Student_CourseRepository;

@Service
public class FacultyServiceImpl implements FacultyService
{
   @Autowired
   private FacultyRepository facultyRepository;
   
   @Autowired
   private FacultyCourseMappingRepository fcm;
   
   @Autowired
   private CourseRepository courseRepository;
   
   @Autowired
   private AttendanceRepository attendanceRepository;
   
   @Autowired
   private Student_CourseRepository scmRepository;
   

@Override
public Faculty checkFacultyLogin(int id, String pwd) 
{
	return facultyRepository.checkFacultyLogin(id, pwd);
}

@Override
public List<FacultyCourseMapping> viewfacultycourses(int id, String ay, String semester) 
{
	return fcm.attendance(id,ay,semester);
}

@Override
public List<Student_Course> viewstudentsbycourse(int cid, int sec) 
{
	return facultyRepository.viewstudentsbycourse(cid, sec);
}
 
@Override
 public Course findcoursebyid(int cid)
 {
	 return courseRepository.findById(cid).get();
 }

@Override
public String PostAttendance(Map<Integer, Attendance> att)
{
  try {
    attendanceRepository.saveAll(att.values());
    return "Attendance Posted Successfully";
  }
  catch (Exception e) {
        e.printStackTrace();
        return "Error while posting Attendance";
    }
  
}

@Override
public List<FacultyCourseMapping> mycourses(Faculty faculty)
{
	return fcm.findByInstructor(faculty);
}

@Override
public String UpdateInternals(Student_Course scm) {
      Student_Course mapping = scmRepository.findById(scm.getId()).get();
        mapping.setStudentInternals(scm.getStudentInternals());
        scmRepository.save(mapping);
        return "Added Successfully";
    
}

@Override
public Faculty getFacultyById(int id)
{
	return facultyRepository.findById(id).get();
}

@Override
public String changePassword(int id, String pwd) 
{
	Faculty f = facultyRepository.findById(id).get();
	f.setPassword(pwd);
	facultyRepository.save(f);
	return "success";
}

}
