package com.github.mabart88.entities;

import java.sql.Timestamp;
import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.validator.constraints.NotBlank;

@Entity
public class Repair {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	@CreationTimestamp
	@Column(updatable = false)
	private Timestamp created;

	@UpdateTimestamp
	private Timestamp updated;
	
	@NotNull
	@NotBlank
	private String description;
	
	private String repairDesc;

	@ManyToOne
	@JoinColumn
	private User repairman;
	
	@ManyToOne
	@JoinColumn
	private Laptop laptop;
	
	@NotNull
	private boolean warranty;
	
	private boolean isFinished;
	
	public Timestamp getUpdated() {
		return updated;
	}

	public void setUpdated(Timestamp updated) {
		this.updated = updated;
	}

	public String getRepairDesc() {
		return repairDesc;
	}

	public void setRepairDesc(String repairDesc) {
		this.repairDesc = repairDesc;
	}


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
	
	public String getStatus() {
		String status="";
		if(this.repairman==null) {
			status="Naprawa zgłoszona";
		}else if(this.isFinished) {
			status="Naprawa zakończona"+"<br>Opis naprawy: "+this.repairDesc;
		}else {
			status="W naprawie, "+"<br>Opis naprawy: "+this.repairDesc;
		}
		return status;
	}

	@Override
	public String toString() {
		return "Numer naprawy: " + id + ", opis usterki: " + description;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Repair other = (Repair) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	
}
