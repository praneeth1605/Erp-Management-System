package com.klef.jfsd.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "student_table")
public class Student 
{
   @Id
   @Column(name = "student_id")
   private int id;
   @Column(name = "student_name",nullable = false,length = 40)
   private String name;
   @Column(name = "student_email",nullable = false,length = 40,unique = true)
   private String email;
   @Column(name = "student_contactno",nullable = false,length = 20,unique = true)
   private String contactno;
   @Column(name = "student_dob",nullable = false,length = 20)
   private String dob;
   @Column(name = "student_dept",nullable = false,length = 20)
   private String department;
   @Column(name = "student_fathername",nullable = false,length = 40)
   private String fname;
   @Column(name = "student_mothername",nullable = false,length = 40)
   private String mname;
   @Column(name = "student_password",nullable = false,length = 40)
   private String password;
   @Column(name = "student_gender",nullable = false,length = 10)
   private String gender;
   @Column(name = "student_status",nullable=false,length = 10)
   private String status;
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
public String getContactno() {
	return contactno;
}
public void setContactno(String contactno) {
	this.contactno = contactno;
}
public String getDob() {
	return dob;
}
public void setDob(String dob) {
	this.dob = dob;
}
public String getFname() {
	return fname;
}
public void setFname(String fname) {
	this.fname = fname;
}
public String getMname() {
	return mname;
}
public void setMname(String mname) {
	this.mname = mname;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public String getDepartment() {
	return department;
}
public void setDepartment(String department) {
	this.department = department;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
   
}