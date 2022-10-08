package com.hospitalmanagement.model;

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

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "test_detail")
public class TestFormDetail {
	@Id
	@SequenceGenerator(name = "seq_test_detail_pk", allocationSize = 1)
	@GeneratedValue(generator = "seq_test_detail_pk", strategy = GenerationType.SEQUENCE)
	private Long id;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "test_id", referencedColumnName = "id")
	private Test test;

	private String result;

	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "test_form_id", referencedColumnName = "id", foreignKey = @ForeignKey(name = "test_form_detail_fk"))
	private TestForm testForm;

	public TestFormDetail() {
		super();
	}

	public TestFormDetail(Long id, Test test, TestForm testForm, String result) {
		super();
		this.id = id;
		this.test = test;
		this.testForm = testForm;
		this.result = result;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Test getTest() {
		return test;
	}

	public void setTest(Test test) {
		this.test = test;
	}

	public TestForm getTestForm() {
		return testForm;
	}

	public void setTestForm(TestForm testForm) {
		this.testForm = testForm;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

}
