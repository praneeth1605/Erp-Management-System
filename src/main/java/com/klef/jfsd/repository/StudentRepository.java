package com.klef.jfsd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.model.Student;

public interface StudentRepository extends JpaRepository<Student, Integer>
{
  @Query("select s from Student s where s.id=?1 and s.password=?2")
  public Student checkStudentLogin(int id, String pwd);

}
