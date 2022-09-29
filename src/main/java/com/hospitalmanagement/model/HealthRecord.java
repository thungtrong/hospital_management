package com.hospitalmanagement.model;

import java.util.Date;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="health_record")
public class HealthRecord {
	@Id
	@SequenceGenerator(name="health_record_pk")
	@GeneratedValue(generator = "health_record_pk", strategy = GenerationType.SEQUENCE)
	private Long id;
	@Temporal(TemporalType.DATE)
	@Column(name="creation_date")
	private Date creationDate;
	@Temporal(TemporalType.DATE)
	@Column(name="re_date")
	private Date reDate;
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(
		name="health_record_detail",
		joinColumns = @JoinColumn(name="health_record_id", referencedColumnName = "id"),
		inverseJoinColumns = @JoinColumn(name="illness_id", referencedColumnName = "id")
	)
	private List<Illness> illnessList;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="doctor_id", referencedColumnName = "id")
	private Doctor doctor;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="patient_id", referencedColumnName = "id")
	
	private Patient patient;
	public HealthRecord() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HealthRecord(Long id, Date creationDate, Date reDate, List<Illness> illnessList, Doctor doctor, Patient patient) {
		this.id = id;
		this.creationDate = creationDate;
		this.reDate = reDate;
		this.illnessList = illnessList;
		this.doctor = doctor;
		this.patient = patient;
	}

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

	@Override
	public String toString() {
		return "HealthRecord{" +
				"id=" + id +
				", creationDate=" + creationDate +
				", reDate=" + reDate +
				", illnessList=" + illnessList +
				", doctor=" + doctor +
				", patient=" + patient +
				'}';
	}
}
