package com.hospitalmanagement.model;

import javax.persistence.*;
import java.util.Date;

@SuppressWarnings("JpaAttributeTypeInspection")
@Entity
@Table(name = "Doctor")

public class Doctor {
	@Id
	@Column(name = "ID")
	private Long id;
	@Column(name = "NAME")
	private String name;
	@Column(name = "GENDER")
	private Character gender;
	@Column(name = "PHONE_NUMBER")
	private String phoneNumber;
	@Column(name = "ADDRESS")
	private String address;
	@Column(name = "DATE_OF_BIRTH")
	private Date dateOfBirth;
	@Column(name = "DEPARTMENT_ID")
	private Integer departmentId;
	@OneToOne
	@JoinColumn(name = "department_id")
	private Department department;

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Doctor() {
		// TODO Auto-generated constructor stub
	}
	public Doctor(Long id, String name, String phoneNumber, Character gender, String address, Date dateOfBirth, Department department) {
		super();
		this.id = id;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.gender = gender;
		this.address = address;
		this.dateOfBirth = dateOfBirth;
		this.department = department;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public Character getGender() {
		return gender;
	}
	public void setGender(Character gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	
	public Integer getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}
	@Override
	public String toString() {
		return "Doctor [id=" + id + ", name=" + name + ", phoneNumber=" + phoneNumber + ", gender=" + gender
				+ ", address=" + address + ", dateOfBirth=" + dateOfBirth + "]";
	}

	
	
}
