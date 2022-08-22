package com.hospitalmanagement.model;

import javax.persistence.*;
import java.util.Date;
@Entity
@Table(name = "HEALTH_RECORD")
public class HealthRecord {
    @Id
    @Column(name = "ID")
    private Long id;
    @Column(name = "CREATION_DATE")
    private Date creationDate;
    @Column(name = "RE_DATE")
    private Date reDate;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "DOCTOR_ID")
    private Doctor doctor;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "PATIENT_ID")
    private Patient patient;

    public HealthRecord() {

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

    public HealthRecord(Long id, Date creationDate, Date reDate, Doctor doctor, Patient patient) {
        this.id = id;
        this.creationDate = creationDate;
        this.reDate = reDate;
        this.doctor = doctor;
        this.patient = patient;
    }
}
