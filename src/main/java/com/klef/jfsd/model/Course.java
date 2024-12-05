package com.klef.jfsd.model;

import jakarta.persistence.*;

@Entity
@Table(name = "course_table")
public class Course {
    @Id
    @Column(name = "course_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "course_name", nullable = false, length = 50)
    private String name;

    @Column(name = "course_code", nullable = false, unique = true, length = 20)
    private String code;

    @Column(name = "course_credits", nullable = false)
    private double credits;

    @Column(name = "course_dept", nullable = false, length = 20)
    private String department;

    @Column(name = "academic_year",nullable = false,length = 20)
    private String academicYear;
    
    @Column(name = "semester",nullable = false,length = 10)
    private String semester;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public double getCredits() {
        return credits;
    }

    public void setCredits(double credits) {
        this.credits = credits;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

	public String getAcademicYear() {
		return academicYear;
	}

	public void setAcademicYear(String academicYear) {
		this.academicYear = academicYear;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

}