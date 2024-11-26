package com.klef.jfsd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.model.Faculty;

public interface FacultyRepository extends JpaRepository<Faculty, Integer>
{
  @Query("select f from Faculty f where f.id = ?1 and f.password = ?2")
  public Faculty checkFacultyLogin(int id, String pwd);
  

}
