package com.klef.jfsd.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.klef.jfsd.model.Course;

public interface CourseRepository extends JpaRepository<Course, Integer>
{

}
