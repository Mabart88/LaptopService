package com.github.mabart88.controllers;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.mabart88.entities.Laptop;
import com.github.mabart88.entities.Repair;
import com.github.mabart88.entities.User;
import com.github.mabart88.repositories.LaptopRepository;
import com.github.mabart88.repositories.RepairRepository;

@Controller
@RequestMapping("/repair")
public class RepairController {

	@Autowired
	RepairRepository repairRepository;

	@Autowired
	LaptopRepository laptopRepository;

	@GetMapping("/{id}")
	public String repair(Model model) {
		model.addAttribute("repair", new Repair());
		return "registerRepair";
	}
	
	@GetMapping("/update/{id}")
	public String update(@PathVariable long id, HttpSession sess, Model model) {
		model.addAttribute("repair", repairRepository.findOne(id));
		return "finishRepair";
	}
	
	@PostMapping("/update/{id}")
	public String update(@Valid Repair repair) {
		repairRepository.save(repair);
		return "redirect:/repair/all";
	}
	
	@RequestMapping("/assign/{id}")
	public String assign(@PathVariable long id, HttpSession sess) {
		User user = (User) sess.getAttribute("logged");
		Repair repair = repairRepository.findOne(id);
		repair.setRepairDesc("Diagnozowanie usterki");
		repair.setRepairman(user);
		repairRepository.save(repair);
		return "redirect:/repair/all";
	}

	@PostMapping("/{id}")
	public String repair(@PathVariable long id, @Valid Repair repair, BindingResult result, Model model,
			HttpSession sess) {
		Laptop laptop = laptopRepository.findOne(id);
		User user = (User) sess.getAttribute("logged");
		if (!result.hasErrors() && laptop.getUser().getId() == user.getId()) {
			if(laptop.getPurchaseDate().isAfter(LocalDate.now().minusYears(2))) {
				repair.setWarranty(true);
			}
			repair.setLaptop(laptop);
			repairRepository.save(repair);
			return "redirect:/";
		}

		return "registerRepair";
	}

	@GetMapping("")
	public String repair(Model model, HttpSession sess) {
		Laptop laptop = (Laptop) sess.getAttribute("laptop");
		if (laptop != null) {
			model.addAttribute("repair", new Repair());
			return "registerRepair";
		}
		return "redirect:../login";
	}

	@PostMapping("")
	public String repair(@Valid Repair repair, BindingResult result, Model model, HttpSession sess) {

		Laptop laptop = (Laptop) sess.getAttribute("laptop");
		User user = (User) sess.getAttribute("logged");
		if (!result.hasErrors() && laptop.getUser().getId() == user.getId()) {
			if(laptop.getPurchaseDate().isAfter(LocalDate.now().minusYears(2))) {
				repair.setWarranty(true);
			}
			repair.setLaptop(laptop);
			laptopRepository.save(laptop);
			repairRepository.save(repair);
			
			return "redirect:/repair/done";
		}

		return "registerRepair";
	}

	@RequestMapping("/all")
	public String repairs(HttpSession sess) {
		User user = (User) sess.getAttribute("logged");
		if (user == null || !user.isRepairman()) {
			return "redirect:/error";
		}
		return "repairs";
	}
	
	@GetMapping("/finish/{id}")
	public String finish(@PathVariable long id, Model model) {
		Repair repair = repairRepository.findOne(id);
		model.addAttribute("repair", repair);
		return "finishRepair";
	}
	
	@PostMapping("/finish/{id}")
	public String finish(@Valid Repair repair, BindingResult result) {
		repair.setFinished(true);
		repairRepository.save(repair);
		return "redirect:/repair/all";
	}
	
	@GetMapping("/status")
	public String status() {
		return "status";
	}
	@PostMapping("/status")
	public String status(@RequestParam String id, Model model) {
		long ident = Long.parseLong(id);
		Repair repair = repairRepository.findOne(ident);
//		System.out.println(repair);
		model.addAttribute("repair", repair);
		
		return "status";
	}
	
	
	@RequestMapping("/done")
	public String done() {
		return "done";
	}

	@ModelAttribute("repairs")
	public List<Repair> repairList() {
		return repairRepository.findAllByOrderByCreatedDesc();
	}

}
