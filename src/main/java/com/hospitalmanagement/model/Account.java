package com.hospitalmanagement.model;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name = "account")
public class Account implements Serializable {

	@Id
	private String username;
	@Column(name = "password", length = 60, nullable = false)
	private String password;
	private String role;
	@Column(columnDefinition = "CHAR(1) default 1", nullable = false)
	private Boolean enable;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "doctor_id", referencedColumnName = "id")
	private Doctor doctor;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Boolean getEnable() {
		return enable;
	}

	public void setEnable(Boolean enable) {
		this.enable = enable;
	}

	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	@Override
	public String toString() {
		return "Account [username=" + username + ", password=" + password + ", role=" + role + ", enable=" + enable + "]";
	}


}
