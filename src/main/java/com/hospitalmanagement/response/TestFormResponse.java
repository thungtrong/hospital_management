package com.hospitalmanagement.response;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.hospitalmanagement.model.Patient;
import com.hospitalmanagement.model.TestForm;
import com.hospitalmanagement.model.TestFormDetail;

public class TestFormResponse {
	private Long id;
	@Temporal(TemporalType.DATE)
	private Date creationDate;
	private Patient patient;
	private String details;
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
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	
	public static TestFormResponse fromTestForm(TestForm testForm)
	{
		TestFormResponse response = new TestFormResponse();
		response.creationDate = testForm.getCreationDate();
		response.id = testForm.getId();
		response.patient = testForm.getPatient();
		List<String> testNames = new ArrayList<>();
		for (TestFormDetail detail: testForm.getDetails())
		{
			testNames.add(detail.getTest().getTestName());
		}
		response.details = String.join(", ", testNames);
		return response;
	}
}
