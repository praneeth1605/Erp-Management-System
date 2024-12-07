package com.klef.jfsd.service;

import java.util.List;

import com.klef.jfsd.model.Admin;
import com.klef.jfsd.model.Course;
import com.klef.jfsd.model.Faculty;
import com.klef.jfsd.model.FacultyCourseMapping;
import com.klef.jfsd.model.Student;

public interface AdminService 
{
   public String addStudent(Student s);
   public String addFaculty(Faculty f);
   public String addCourse(Course c);
   public Admin checkAdminLogin(String username, String password);
   public String updateStudent(Student s);
   public String updateFaculty(Faculty f);
   public String updateCourse(Course c);
   public void deleteStudent(int id);
   public void deleteFaculty(int id);
   public void deleteCourse(int id);
   public Faculty viewFacultyById(int id);
   public Course viewCourseById(int id);
   public List<Student> viewallstudents();
   public List<Faculty> viewallfaculty();
   public List<Course> viewallcourses();
   public String mapFacultyToCourse(int section, Faculty f, Course c);
   public long getcount(int cid, int fid, int sec);
   public List<FacultyCourseMapping> viewFacultyMappedcourses();
   public long getstudentcount();
   public long getfacultycount(); 
   public long getcoursecount();
   
}
