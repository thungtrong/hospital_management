package com.hospitalmanagement.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@MappedSuperclass
public class Person {
	@NotEmpty(message = "Please fill your full name")
	@Column(name="name")
	protected String name;
	
	@NotNull(message = "Please choose your gender")
	@Column(name="gender")
	protected Boolean gender;
	
	@NotEmpty(message = "Please fill your phone number")
	@Column(name = "phone_number")
	protected String phoneNumber;
	
	@NotEmpty(message = "Please fill your address")
	@Column(name = "address")
	protected String address;
	
	@NotNull(message = "Please fill your birth day")
	@Temporal(TemporalType.DATE)
	@Column(name="date_of_birth")
	protected Date dateOfBirth;
	public Person() {
	}
	
	public Person(String name, Boolean gender, String phoneNumber, String address, Date dateOfBirth) {
		super();
		this.name = name;
		this.gender = gender;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.dateOfBirth = dateOfBirth;
	}


	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Boolean getGender() {
		return gender;
	}
	public void setGender(Boolean gender) {
		this.gender = gender;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
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
	
	
}
