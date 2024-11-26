package com.klef.jfsd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.model.Student_Course;

@Repository
public interface Student_CourseRepository extends JpaRepository<Student_Course, Integer>
{
	@Query("select COUNT(scm) From Student_Course scm WHERE scm.student.id=?1 and scm.course.id=?2 and scm.section=?3")
	public Long checkStudentCourseAndSection(int sid,int cid,int section);
}
