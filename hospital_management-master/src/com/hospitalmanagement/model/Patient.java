package com.hospitalmanagement.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="Patient")
public class Patient {
	@Id
	@Column(name="ID")
	private Long id;
	@Column(name="NAME")
	private String name;
	@Column(name = "DATE_OF_BIRTH")
	private Date dob;
	@Column(name = "GENDER")
	private String gender;
	@Column(name = "ADDRESS")
	private String address;
	@Column(name = "PHONE_NUMBER")
	private String phoneNumber;
	public String getName() {
		return name;
	}
	
	public Patient(Long id, String name, Date dob, String gender, String address, String phoneNumber) {
		super();
		this.id = id;
		this.name = name;
		this.dob = dob;
		this.gender = gender;
		this.address = address;
		this.phoneNumber = phoneNumber;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Patient() {
		super();
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
}
