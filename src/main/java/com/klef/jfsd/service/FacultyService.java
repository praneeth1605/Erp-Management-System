package com.klef.jfsd.service;

import java.util.List;

import com.klef.jfsd.model.Faculty;
import com.klef.jfsd.model.FacultyCourseMapping;

public interface FacultyService 
{
   public Faculty checkFacultyLogin(int id, String pwd);
   public List<FacultyCourseMapping> viewfacultycourses(int id);
}
