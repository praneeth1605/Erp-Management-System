package com.klef.jfsd.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;

@Entity
@Table(name = "student_course")
public class Student_Course 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
   private int id;
	@ManyToOne
	@JoinColumn(name = "student_id")
   private Student student;
	@ManyToOne
	@JoinColumn(name = "faculty_id")
   private Faculty faculty;
	@ManyToOne
	@JoinColumn(name = "course_id")
   private Course course;
	
	@Column(nullable = false)
	private int section;
	
	@Column(nullable = false, columnDefinition = "int default -1")
    @Min(value = -1, message = "Student internals cannot be less than -1")
    @Max(value = 60, message = "Student internals cannot exceed 60")
    private int studentInternals = -1;

    @Column(nullable = false, columnDefinition = "int default -1")
    @Min(value = -1, message = "Student externals cannot be less than -1")
    @Max(value = 40, message = "Student externals cannot exceed 40")
    private int studentExternals = -1;

    @Column(nullable = false, columnDefinition = "int default -1")
    @Min(value = -1, message = "Grade cannot be less than -1")
    @Max(value = 10, message = "Grade cannot exceed 10")
    private int grade = -1;
    
    @Column(name = "result")
    private String result;
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Faculty getFaculty() {
		return faculty;
	}

	public void setFaculty(Faculty faculty) {
		this.faculty = faculty;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public int getSection() {
		return section;
	}

	public void setSection(int section) {
		this.section = section;
	}
	
	public int getStudentInternals() {
        return studentInternals;
    }

    public void setStudentInternals(int studentInternals) {
        this.studentInternals = studentInternals;
        calculateGrade();
    }

    public int getStudentExternals() {
        return studentExternals;
    }

    public void setStudentExternals(int studentExternals) {
        this.studentExternals = studentExternals;
        calculateGrade();
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }
    
    public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

    private void calculateGrade() {
        int total = studentInternals + studentExternals;
        if (total >= 90 && studentInternals >= 25 && studentExternals >= 16) {
            grade = 10;
            result = "O";
        } 
        else if (total >= 80 && studentInternals >= 25 && studentExternals >= 16) {
            grade = 9;
            result = "A+";
        } 
        else if (total >= 70 && studentInternals >= 25 && studentExternals >= 16) {
            grade = 8;
            result = "A";
        } 
        else if (total >= 60 && studentInternals >= 25 && studentExternals >= 16) {
            grade = 7;
            result = "B";
        } 
        else if (total >= 50 ) {
            grade = 6;
            result = "C";
        } 
        else if (total >= 40) {
            grade = 5;
            result = "D";
        } 
        else if(studentInternals <= 25 || studentExternals <= 16)
        {
          grade = 0;
          result="F";
        }
        else {
            grade = -1; 
        }
    }

	
 
}
