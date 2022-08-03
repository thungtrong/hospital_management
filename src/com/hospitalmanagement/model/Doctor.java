package com.hospitalmanagement.model;

import java.util.Date;

public class Doctor {
	private Long id;
	private String name; 
	private String phoneNumber;
	private Character gender;
	private String address;
	private Date dateOfBirth;
	
//	private Department department;
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
	@Override
	public String toString() {
		return "Doctor [id=" + id + ", name=" + name + ", phoneNumber=" + phoneNumber + ", gender=" + gender
				+ ", address=" + address + ", dateOfBirth=" + dateOfBirth + "]";
	}

	
	
}
