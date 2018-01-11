package com.github.mabart88.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.github.mabart88.entities.Laptop;

@Repository
public interface LaptopRepository extends JpaRepository<Laptop, Long> {
	
	List<Laptop> findByOwnerId(long id);

}
