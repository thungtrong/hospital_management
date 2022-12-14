package com.hospitalmanagement.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "doctor")
@NamedQueries({
		@NamedQuery(name = "findDoctorsByDepartment", query = "from Doctor where department.id=:id")
})
@Inheritance
public class Doctor extends Person {
	@Id
	@SequenceGenerator(name = "seq_doctor_pk", allocationSize = 1, initialValue = 1000)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_doctor_pk")
	private Long id;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "department_id", referencedColumnName = "id", foreignKey = @ForeignKey(name = "doctor_department_fk"))
	private Department department;

	@OneToOne(mappedBy = "doctor")
	private Account account;

	public Doctor() {
	}

	public Doctor(Long id, String name, Boolean gender, String phoneNumber, String address, Date dateOfBirth) {
		super(name, gender, phoneNumber, address, dateOfBirth);
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@Override
	public String toString() {
		return "Doctor [id=" + id + ", name=" + name + ", phoneNumber=" + phoneNumber + ", gender=" + gender
				+ ", address=" + address + ", dateOfBirth=" + dateOfBirth + ", department=" + department.getName()
				+ "]";
	}

}
