package com.klef.jfsd.model;

import jakarta.persistence.*;

@Entity
@Table(name = "faculty_table")
public class Faculty {
    @Id
    @Column(name = "faculty_id")
    private int id;

    @Column(name = "faculty_name", nullable = false, length = 50)
    private String name;

    @Column(name = "faculty_email", unique = true, nullable = false, length = 40)
    private String email;

    @Column(name = "faculty_password", nullable = false, length = 30)
    private String password;

    @Column(name = "faculty_department", nullable = false, length = 50)
    private String department;

    @Column(name = "faculty_gender", length = 10, nullable = false)
    private String gender;

    @Column(name = "faculty_contact", unique = true, length = 15, nullable = false)
    private String contact;

    @Column(name = "faculty_designation", length = 50, nullable = false)
    private String designation;
    
    @Column(name = "faculty_status",nullable=false,length = 10)
    private String status;

    
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


    
}
