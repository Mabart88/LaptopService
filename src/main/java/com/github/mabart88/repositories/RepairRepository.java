package com.github.mabart88.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.github.mabart88.entities.Repair;

public interface RepairRepository extends JpaRepository<Repair,	Long>{
	
	@Query
	List<Repair> findByLaptopOwnerIdOrderByCreatedDesc(long id);
	
	@Query
	List<Repair> findAllByOrderByCreatedDesc();

}
