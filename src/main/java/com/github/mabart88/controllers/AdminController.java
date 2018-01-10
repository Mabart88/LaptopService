package com.github.mabart88.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.mabart88.entities.User;
import com.github.mabart88.repositories.UserRepository;

@RequestMapping("/admin")
@Controller
public class AdminController {

	@Autowired
	UserRepository userRepository;

	@RequestMapping("/check")
	public String checkAdmin(Model model) {
		List<User> users = userRepository.findAll();

		Optional<User> user = users.stream().filter(User::isAdmin).findFirst();

		if (!user.isPresent()) {
			User admin = new User();
			admin.setAdmin(true);
			admin.setEmail("admin@admin");
			admin.setFirstName("admin");
			admin.setLastName("admin");
			admin.setPassword("admin");
			userRepository.save(admin);
		}

		return "home";
	}
	
	@RequestMapping("/users")
	public String users(Model model) {
		return "users";
	}
	
	@ModelAttribute("users")
	public List<User> users(){
		return userRepository.findAll();
		
	}

}
