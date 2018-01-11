package com.github.mabart88.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.mabart88.entities.User;
import com.github.mabart88.repositories.UserRepository;

@Controller
public class LoginController {

	@Autowired
	UserRepository userRepository;

	@GetMapping("/register")
	public String register(Model model) {
		model.addAttribute("user", new User());
		return "register";
	}

	@PostMapping("/register")
	public String register(@Valid User user, BindingResult result) {
		if (result.hasErrors()) {
			return "register";
		}
		userRepository.save(user);
		return "redirect:/";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@PostMapping("/login")
	public String login(@RequestParam String email, @RequestParam String password, HttpSession sess, Model model) {
		User user = userRepository.findByEmail(email);
		if (user != null && user.getPassword().equals(password)) {
			sess.setAttribute("logged", user);
			return "redirect:/";
		}
		model.addAttribute("info", "Błędny login lub hasło");
		return "login";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession sess, Model model) {
		sess.setAttribute("logged", null);
		return "redirect:/";
	}

}
