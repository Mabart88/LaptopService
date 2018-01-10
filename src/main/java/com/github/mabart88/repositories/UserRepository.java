package com.github.mabart88.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.github.mabart88.entities.User;

@Repository
public interface UserRepository extends JpaRepository<User,	Long>{

	User findByEmail(String email);
	
}
