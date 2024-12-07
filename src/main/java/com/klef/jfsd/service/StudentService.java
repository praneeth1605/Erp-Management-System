package com.klef.jfsd.service;

import java.util.List;

import com.klef.jfsd.model.Course;
import com.klef.jfsd.model.FacultyCourseMapping;
import com.klef.jfsd.model.Student;
import com.klef.jfsd.model.Student_Course;

public interface StudentService 
{
  public Student checkStudentLogin(int id, String pwd);

  public List<FacultyCourseMapping> getSectionByCourseId(int cid);

  public Long checkStudentCourseAndSection(int sid, int cid, int section);

  public String addStudentCourse(Student_Course course);

  public List<Student_Course> ViewAllCourses(Student s);
  
  
  
  public String changePassword(int id,String pwd);

  public List<Course> viewcoursebysem(String ay, String semester);

  public int findSectionByCourseAndStudent(Course c, Student s);

  public int getStudentAttedance(Course c, Student s, int sec);

  public long getTotalClasses(Course c, int sec);

  public long getTotalAttendendClasses(Student s, Course c);

  public List<Student_Course> getstudentcourses(int id, String ay, String semester);

  public Student getstudentbyid(int id);
  
  public long getRegisteredCoursesCount(Student s);

  
  
}
