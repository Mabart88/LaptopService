package com.github.mabart88.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.mabart88.entities.User;
import com.github.mabart88.repositories.LaptopRepository;
import com.github.mabart88.repositories.RepairRepository;

@Controller
@RequestMapping("/account")
public class UserController {
	
	@Autowired
	LaptopRepository laptopRepository;
	
	@Autowired
	RepairRepository repairRepository;
	
	@RequestMapping("")
	public String account(Model model, HttpSession sess) {
		User user = (User) sess.getAttribute("logged");
		model.addAttribute("laptops", laptopRepository.findByOwnerId(user.getId()));
		model.addAttribute("repairs", repairRepository.findByLaptopOwnerIdOrderByCreatedDesc(user.getId()));
		return "account";
	}

}
