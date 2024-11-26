package com.klef.jfsd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.model.Faculty;
import com.klef.jfsd.model.FacultyCourseMapping;
import com.klef.jfsd.repository.FacultyCourseMappingRepository;
import com.klef.jfsd.repository.FacultyRepository;

@Service
public class FacultyServiceImpl implements FacultyService
{
   @Autowired
   private FacultyRepository facultyRepository;
   
   @Autowired
   private FacultyCourseMappingRepository fcm;

@Override
public Faculty checkFacultyLogin(int id, String pwd) 
{
	return facultyRepository.checkFacultyLogin(id, pwd);
}

@Override
public List<FacultyCourseMapping> viewfacultycourses(int id) 
{
	return fcm.mycourses(id);
}
   
   
}
