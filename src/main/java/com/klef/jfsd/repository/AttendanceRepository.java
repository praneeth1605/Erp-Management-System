package com.klef.jfsd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.model.Attendance;
import com.klef.jfsd.model.Course;
import com.klef.jfsd.model.Student;


@Repository
public interface AttendanceRepository extends JpaRepository<Attendance, Integer> 
{
    public long countByStudentAndCourseAndStatusTrue(Student student, Course course);
    public long countByCourseAndSection(Course course, int section);
}
