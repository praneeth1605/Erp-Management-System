package com.klef.jfsd.service;

import java.util.List;
import java.util.Map;

import com.klef.jfsd.model.Attendance;
import com.klef.jfsd.model.Course;
import com.klef.jfsd.model.Faculty;
import com.klef.jfsd.model.FacultyCourseMapping;
import com.klef.jfsd.model.Student_Course;

public interface FacultyService 
{
   public Faculty checkFacultyLogin(int id, String pwd);
   public List<FacultyCourseMapping> viewfacultycourses(int id,String ay,String semester);
   public List<Student_Course> viewstudentsbycourse(int cid,int sec);
   public Course findcoursebyid(int cid);
   public String PostAttendance(Map<Integer, Attendance> att);
   public List<FacultyCourseMapping> mycourses(Faculty faculty);
   public String UpdateInternals(Student_Course scm);
   public Faculty getFacultyById(int id);
   public String changePassword(int id, String pwd);  
   
}
