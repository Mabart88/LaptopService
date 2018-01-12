package com.github.mabart88.controllers;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.mabart88.entities.Laptop;
import com.github.mabart88.entities.User;
import com.github.mabart88.repositories.LaptopRepository;

@Controller
public class LaptopController {

	@Autowired
	LaptopRepository laptopRepository;

	@GetMapping("/registerLaptop")
	public String registerLaptop(Model model) {
		model.addAttribute("laptop", new Laptop());
		return "registerLaptop";
	}

	@PostMapping("/registerLaptop")
	public String registerLaptop(@Valid Laptop laptop, BindingResult result, Model model, HttpSession sess) {
		
		if(!result.hasErrors() && laptop.getPurchaseDate()!=null) {
			laptop.setUser((User) sess.getAttribute("logged"));
			sess.setAttribute("laptop", laptop);
			return "redirect:/repair";
		}
		
		model.addAttribute("dateError", "Niepoprawna data, wpisz datę w formacie RRRR-MM-DD");
		return "registerLaptop";

	}
	@RequestMapping("/removeLaptop/{id}")
	public String removeLaptop(@PathVariable long id, HttpSession sess) {

		Laptop laptop = laptopRepository.findOne(id);
		User user = (User) sess.getAttribute("logged");
		if(user!=null && laptop.getUser().getId()==user.getId()) {
			laptopRepository.delete(laptop);
			return "redirect:/account";
		}
		return "redirect:/";
		
		
	}

}
