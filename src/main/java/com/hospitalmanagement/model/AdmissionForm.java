package com.hospitalmanagement.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "admission_form")
public class AdmissionForm {
	@Id
	@SequenceGenerator(name = "seq_admission_form_pk", allocationSize = 1, initialValue = 1000)
	@GeneratedValue(generator = "seq_admission_form_pk", strategy = GenerationType.SEQUENCE)
	private Long id;

	@NotNull(message = "Please fill patient's date in")
	@Temporal(TemporalType.DATE)
	@Column(name = "date_in", nullable = false)
	private Date dateIn;

	@Temporal(TemporalType.DATE)
	@Column(name = "date_out")
	private Date dateOut;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "patient_id", referencedColumnName = "id", foreignKey = @ForeignKey(name = "admission_patient_fk"))
	private Patient patient;

	public AdmissionForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdmissionForm(Long id, Date dateIn, Date dateOut) {
		super();
		this.id = id;
		this.dateIn = dateIn;
		this.dateOut = dateOut;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDateIn() {
		return dateIn;
	}

	public void setDateIn(Date dateIn) {
		this.dateIn = dateIn;
	}

	public Date getDateOut() {
		return dateOut;
	}

	public void setDateOut(Date dateOut) {
		this.dateOut = dateOut;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	@Override
	public String toString() {
		return "AdmissionForm [id=" + id + ", dateIn=" + dateIn + ", dateOut=" + dateOut + ", patient="
				+ patient.getId() + "]";
	}

}
