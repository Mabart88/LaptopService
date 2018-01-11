package com.github.mabart88.entities;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotBlank;


@Entity
public class Laptop {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	@NotBlank
	@NotNull
	private String brand;
	
	@NotBlank(groups = { RepairGroup.class })
	@NotNull(groups = { RepairGroup.class })
	private String model;
	
	@NotBlank(groups = { RepairGroup.class })
	@NotNull(groups = { RepairGroup.class })
	@Size(min=5, groups = { RepairGroup.class })
	private String serialNumber;
	
	
	private LocalDate purchaseDate;
	
	@ManyToOne
	@JoinColumn
	private User owner;
	
	@OneToMany(mappedBy="laptop")
	private List<Repair> repairs;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public LocalDate getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(LocalDate purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public User getUser() {
		return owner;
	}

	public void setUser(User user) {
		this.owner = user;
	}

	@Override
	public String toString() {
		return brand + " " + model + ", numer seryjny: " + serialNumber;
	}
	
	

}
