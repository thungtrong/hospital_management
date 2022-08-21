package com.hospitalmanagement.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="doctor")
public class Doctor {
	@Id
	@SequenceGenerator(name = "sequence_doctor_pk", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator="sequence_doctor_pk")
	private Long id;
	private String name; 
	private Character gender;
	private String phoneNumber;
	private String address;
	private Date dateOfBirth;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "department_id", referencedColumnName = "id")
	private Department department;
	
	public Doctor() {
		// TODO Auto-generated constructor stub
	}
	public Doctor(Long id, String name, String phoneNumber, Character gender, String address, Date dateOfBirth) {
		super();
		this.id = id;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.gender = gender;
		this.address = address;
		this.dateOfBirth = dateOfBirth;
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
	
//	public Integer getDepartmentId() {
//		return departmentId;
//	}
//	public void setDepartmentId(Integer departmentId) {
//		this.departmentId = departmentId;
//	}
	
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	
	@Override
	public String toString() {
		return "Doctor [id=" + id + ", name=" + name + ", phoneNumber=" + phoneNumber + ", gender=" + gender
				+ ", address=" + address + ", dateOfBirth=" + dateOfBirth + ", department="+ department.getName()+"]";
	}
	
	
}
