package com.klef.jfsd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.model.FacultyCourseMapping;
import com.klef.jfsd.model.Faculty;


@Repository
public interface FacultyCourseMappingRepository extends JpaRepository<FacultyCourseMapping, Integer>
{
	@Query("select f from FacultyCourseMapping f where f.instructor.id=?1 and f.course.academicYear=?2 and f.course.semester=?3")
	public List<FacultyCourseMapping> attendance(int id, String ay , String semester);
	
	@Query("SELECT COUNT(fcm) FROM FacultyCourseMapping fcm where fcm.instructor.id = ?1 and fcm.course.id = ?2 AND fcm.section = ?3")
	public long getCount(int fid, int cid, int sec);
	
	@Query("select fcm FROM FacultyCourseMapping fcm WHERE fcm.course.id=?1")
	public List<FacultyCourseMapping> getSectionByCourseId(int cid);
	
	public List<FacultyCourseMapping> findByInstructor(Faculty instructor);
	
}
