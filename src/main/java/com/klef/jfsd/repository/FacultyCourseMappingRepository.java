package com.klef.jfsd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.model.FacultyCourseMapping;

@Repository
public interface FacultyCourseMappingRepository extends JpaRepository<FacultyCourseMapping, Integer>
{
	@Query("select f from FacultyCourseMapping f where f.instructor.id=?1")
	public List<FacultyCourseMapping> mycourses(int id);
	
	@Query("SELECT COUNT(fcm) FROM FacultyCourseMapping fcm where fcm.instructor.id = ?1 and fcm.course.id = ?2 AND fcm.section = ?3")
	public long getCount(int fid, int cid, int sec);
	
	@Query("select fcm FROM FacultyCourseMapping fcm WHERE fcm.course.id=?1")
	public List<FacultyCourseMapping> getSectionByCourseId(int cid);
}
