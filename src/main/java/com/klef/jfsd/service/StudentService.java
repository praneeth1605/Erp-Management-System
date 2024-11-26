package com.klef.jfsd.service;

import java.util.List;

import com.klef.jfsd.model.FacultyCourseMapping;
import com.klef.jfsd.model.Student;
import com.klef.jfsd.model.Student_Course;

public interface StudentService 
{
  public Student checkStudentLogin(int id, String pwd);

  public List<FacultyCourseMapping> getSectionByCourseId(int cid);

  public Long checkStudentCourseAndSection(int sid, int cid, int section);

  public String addStudentCourse(Student_Course course);

  public List<Student_Course> ViewAllCourses();
}
