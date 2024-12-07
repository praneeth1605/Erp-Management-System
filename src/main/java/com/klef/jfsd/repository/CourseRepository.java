package com.klef.jfsd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.model.Course;
import java.util.List;


public interface CourseRepository extends JpaRepository<Course, Integer>
{
   @Query("select c from Course c where c.academicYear=?1 and c.semester=?2")
   public List<Course> viewcoursebysem(String ay, String semester);
   
   @Query("select count(c) from Course c")
   public long getcoursecount();
}
