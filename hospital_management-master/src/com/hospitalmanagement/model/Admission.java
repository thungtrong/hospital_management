package com.hospitalmanagement.model;

import javax.persistence.*;
import java.util.Date;
@Entity
@Table(name = "ADMISSION_FORM")
public class Admission {
    @Id
    @Column(name = "ID")
    private Long id;
    @Column(name = "DATE_IN")
    private Date Date_In;
    @Column(name = "DATE_OUT")
    private Date Date_Out;

    @ManyToOne
    @JoinColumn(name = "PATIENT_ID")
    private Patient patient;

    public Admission() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDate_In() {
        return Date_In;
    }

    public void setDate_In(Date date_In) {
        Date_In = date_In;
    }

    public Date getDate_Out() {
        return Date_Out;
    }

    public void setDate_Out(Date date_Out) {
        Date_Out = date_Out;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Admission(Long id, Date date_In, Date date_Out, Patient patient) {
        this.id = id;
        Date_In = date_In;
        Date_Out = date_Out;
        this.patient = patient;
    }
}
