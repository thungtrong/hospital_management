package com.hospitalmanagement.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name = "illness")
public class Illness {
	@Id
	@SequenceGenerator(name = "seq_illness_pk", allocationSize = 1, initialValue = 1000)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_illness_pk")
	private Integer id;
	@NotEmpty(message = "Please fill in the name")
	private String name;
	@NotEmpty(message = "Please fill in the description")
	private String description;

	public Illness() {
		super();
	}

	public Illness(Integer id, String name, String description) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Illness [id=" + id + ", name=" + name + ", description=" + description + "]";
	}

}
