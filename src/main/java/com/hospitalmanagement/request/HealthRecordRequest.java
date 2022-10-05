package com.hospitalmanagement.request;

import java.util.Date;
import java.util.List;

import com.hospitalmanagement.model.Doctor;
import com.hospitalmanagement.model.Illness;
import com.hospitalmanagement.model.Patient;
import com.hospitalmanagement.model.PrescriptionDetail;

public class HealthRecordRequest {
	private Long id;
	private Date creationDate;
	private Date reDate;
	private List<Illness> illnessList;
	private Doctor doctor;
	private Patient patient;
	private List<PrescriptionDetail> healthRecordDetails;
	private List<Long> removeIllnessIds;
	private List<Long> removeHealthRecordDetailIds;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public Date getReDate() {
		return reDate;
	}

	public void setReDate(Date reDate) {
		this.reDate = reDate;
	}

	public List<Illness> getIllnessList() {
		return illnessList;
	}

	public void setIllnessList(List<Illness> illnessList) {
		this.illnessList = illnessList;
	}

	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public List<PrescriptionDetail> getHealthRecordDetails() {
		return healthRecordDetails;
	}

	public void setHealthRecordDetails(List<PrescriptionDetail> healthRecordDetails) {
		this.healthRecordDetails = healthRecordDetails;
	}

	public List<Long> getRemoveIllnessIds() {
		return removeIllnessIds;
	}

	public void setRemoveIllnessIds(List<Long> removeIllnessIds) {
		this.removeIllnessIds = removeIllnessIds;
	}

	public List<Long> getRemoveHealthRecordDetailIds() {
		return removeHealthRecordDetailIds;
	}

	public void setRemoveHealthRecordDetailIds(List<Long> removeHealthRecordDetailIds) {
		this.removeHealthRecordDetailIds = removeHealthRecordDetailIds;
	}

}
