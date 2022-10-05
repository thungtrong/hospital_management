package com.hospitalmanagement.request;

import java.util.Date;
import java.util.List;

import com.hospitalmanagement.model.Patient;
import com.hospitalmanagement.model.TestFormDetail;

public class TestFormRequest {
	private Long id;
	private Date creationDate;
	private Patient patient;
	private List<TestFormDetail> details;
	private List<Long> removedTestFormDetailIds;
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
	public Patient getPatient() {
		return patient;
	}
	public void setPatient(Patient patient) {
		this.patient = patient;
	}
	public List<TestFormDetail> getDetails() {
		return details;
	}
	public void setDetails(List<TestFormDetail> details) {
		this.details = details;
	}
	public List<Long> getRemovedTestFormDetailIds() {
		return removedTestFormDetailIds;
	}
	public void setRemovedTestFormDetailIds(List<Long> removedTestFormDetailIds) {
		this.removedTestFormDetailIds = removedTestFormDetailIds;
	}
	
	
}
