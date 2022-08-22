package com.hospitalmanagement.model;

import javax.persistence.*;

@Entity
@Table(name = "PRESCRIPTION")
public class Prescription {
    @Id
    @Column(name = "ID")
    private Long id;
    @ManyToOne(targetEntity = HealthRecord.class)
    @JoinColumn(name = "HEALTH_RECORD_ID")
    private HealthRecord healthRecordsId;
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public HealthRecord getHealthRecordsId() {
        return healthRecordsId;
    }

    public void setHealthRecordsId(HealthRecord healthRecordsId) {
        this.healthRecordsId = healthRecordsId;
    }

    public Prescription(Long id, HealthRecord healthRecordsId) {
        this.id = id;
        this.healthRecordsId = healthRecordsId;
    }


}
