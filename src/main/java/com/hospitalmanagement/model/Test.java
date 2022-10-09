package com.hospitalmanagement.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name = "test")
public class Test {
	@Id
	@SequenceGenerator(name = "seq_test_pk", initialValue = 1000, allocationSize = 1)
	@GeneratedValue(generator = "seq_test_pk", strategy = GenerationType.SEQUENCE)
	private Integer id;

	@NotEmpty(message = "Please fill test name")
	@Column(name = "test_name", nullable = false)
	private String testName;

	@NotEmpty(message = "Please fill normal result of the test")
	@Column(name = "normal_result", nullable = false)
	private String normalResult;

	@Column(name = "description")
	private String description;

	public Test(Integer id, String testName, String normalResult, String description) {
		super();
		this.id = id;
		this.testName = testName;
		this.normalResult = normalResult;
		this.description = description;
	}

	public Test() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTestName() {
		return testName;
	}

	public void setTestName(String testName) {
		this.testName = testName;
	}

	public String getNormalResult() {
		return normalResult;
	}

	public void setNormalResult(String normalResult) {
		this.normalResult = normalResult;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Test [id=" + id + ", testName=" + testName + ", normalResult=" + normalResult + ", description="
				+ description + "]";
	}

}
