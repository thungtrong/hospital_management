package com.hospitalmanagement.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "patient")
@Inheritance
public class Patient extends Person {
	@Id
	@SequenceGenerator(allocationSize = 1, name = "seq_patient_pk", initialValue = 1000)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_patient_pk")
	private Long id;

	@OneToMany(mappedBy = "patient")
	private List<AdmissionForm> admissionForms;

	public Patient() {
	}

	public Patient(Long id, String name, Boolean gender, String phoneNumber, String address,
			java.util.Date dateOfBirth) {
		super(name, gender, phoneNumber, address, dateOfBirth);
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Patient [id=" + id + ", name=" + name + ", dateOfBirth=" + dateOfBirth + ", gender=" + gender
				+ ", address=" + address + ", phoneNumber=" + phoneNumber + "]";
	}

}
