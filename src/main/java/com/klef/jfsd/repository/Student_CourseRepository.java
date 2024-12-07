package com.klef.jfsd.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.model.Student_Course;
import java.util.List;

import com.klef.jfsd.model.Student;
import com.klef.jfsd.model.Course;



@Repository
public interface Student_CourseRepository extends JpaRepository<Student_Course, Integer>
{
	@Query("select COUNT(scm) From Student_Course scm WHERE scm.student.id=?1 and scm.course.id=?2 and scm.section=?3")
	public Long checkStudentCourseAndSection(int sid,int cid,int section);
	
	public List<Student_Course> findByStudent(Student student);
	
	public Student_Course findByCourseAndStudent(Course course, Student student);
	
	@Query("select scm from Student_Course scm where scm.student.id=?1 and scm.course.academicYear=?2 and scm.course.semester=?3")
	public List<Student_Course> findStudentByAyAndSem(int id, String ay, String semester);
	
	public long countByStudent(Student student);
}
