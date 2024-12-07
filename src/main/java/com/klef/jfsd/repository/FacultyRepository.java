package com.klef.jfsd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.model.Faculty;
import com.klef.jfsd.model.Student_Course;

@Repository
public interface FacultyRepository extends JpaRepository<Faculty, Integer>
{
  @Query("select f from Faculty f where f.id = ?1 and f.password = ?2")
  public Faculty checkFacultyLogin(int id, String pwd);
  
  @Query("select s from Student_Course s where s.course.id=?1 and s.section=?2")
  public List<Student_Course> viewstudentsbycourse(int cid, int sec);
  
  @Query("select count(f) from Faculty f ")
  public long getFacultyCount();
}
