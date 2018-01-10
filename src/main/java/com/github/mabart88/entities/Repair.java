package com.github.mabart88.entities;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.validator.constraints.NotBlank;

@Entity
public class Repair {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	@CreationTimestamp
	@Column(updatable = false)
	private Timestamp created;
	
	@NotNull
	@NotBlank
	private String description;
	
	@ManyToOne
	@JoinColumn
	private User repairman;
	
	@ManyToOne
	@JoinColumn
	private Laptop laptop;
	
	@NotNull
	private boolean warranty;
	
	private boolean isFinished;

	public boolean isFinished() {
		return isFinished;
	}

	public void setFinished(boolean isFinished) {
		this.isFinished = isFinished;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Timestamp getCreated() {
		return created;
	}

	public void setCreated(Timestamp created) {
		this.created = created;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public User getRepairman() {
		return repairman;
	}

	public void setRepairman(User repairman) {
		this.repairman = repairman;
	}

	public Laptop getLaptop() {
		return laptop;
	}

	public void setLaptop(Laptop laptop) {
		this.laptop = laptop;
	}

	public boolean isWarranty() {
		return warranty;
	}

	public void setWarranty(boolean warranty) {
		this.warranty = warranty;
	}
	
	
}