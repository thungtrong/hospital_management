package com.hospitalmanagement.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TEST")

public class Test {
    @Id
    @Column(name = "ID")
    private Long id;
    @Column(name = "TEST_NAME")
    private String testName;
    @Column(name = "NOMARL_RESULT")
    private String normal_result;
    @Column(name = "DESCRIPTION")
    private String description;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTestName() {
        return testName;
    }

    public void setTestName(String testName) {
        this.testName = testName;
    }

    public String getNormal_result() {
        return normal_result;
    }

    public void setNormal_result(String normal_result) {
        this.normal_result = normal_result;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Test(Long id, String testName, String normal_result, String description) {
        this.id = id;
        this.testName = testName;
        this.normal_result = normal_result;
        this.description = description;
    }
}
