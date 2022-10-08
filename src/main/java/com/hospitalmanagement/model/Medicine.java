package com.hospitalmanagement.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "medicine")
public class Medicine {
	@Id
	@SequenceGenerator(name = "seq_medicine_pk", allocationSize = 1, initialValue = 1000)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_medicine_pk")
	private Integer id;
	@NotBlank(message = "Please enter medicine name")
	private String name;
	@NotBlank(message = "Please enter medicine unit")
	private String unit;
	private String instruction;

	public Medicine() {
		super();
	}

	public Medicine(Integer id, String name, String unit, String instruction) {
		super();
		this.id = id;
		this.name = name;
		this.unit = unit;
		this.instruction = instruction;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getInstruction() {
		return instruction;
	}

	public void setInstruction(String instruction) {
		this.instruction = instruction;
	}

	@Override
	public String toString() {
		return "Medicine [id=" + id + ", name=" + name + ", unit=" + unit + ", instruction=" + instruction + "]";
	}

}
