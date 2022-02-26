package com.coding.meal_kit.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coding.meal_kit.models.User;
import com.coding.meal_kit.services.UserService;
import com.coding.meal_kit.validators.UserValidator;

@Controller
public class UserController {
	private boolean login_error = false;	
	
	@Autowired 
	private UserService uService;
	
	@Autowired
	private UserValidator uValidator;
	
	
	@GetMapping("/register")
	public String registration(@ModelAttribute("registration") User user) {
		return "/user/register.jsp";
	}
	
	@PostMapping("/register")
	public String register_user(@Valid @ModelAttribute("registration") User user, BindingResult results,  HttpSession session) {
		uValidator.validate(user, results);
		if(results.hasErrors()) {
			return "/user/register.jsp";
		}
		else {
			User newUser = uService.registerUser(user);
			session.setAttribute("userId", newUser.getId());
			return "redirect:/";
		}
	}
	
	@GetMapping("/login")
	public String login(Model model) {
		model.addAttribute("login", login_error);
		return "/user/login.jsp";
	}
	
	@PostMapping("/login")
	public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session, RedirectAttributes redirectAttr) {
		if(uService.authenticateUser(email, password)) {
			User user = uService.findByEmail(email);
			session.setAttribute("userId", user.getId());
			return "redirect:/";
			
		}else {
			redirectAttr.addFlashAttribute("error", "Invalid email/password");
			login_error = true;
			return "redirect:/login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	
	}
}
