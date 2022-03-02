package com.coding.meal_kit.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.coding.meal_kit.models.Areas;
import com.coding.meal_kit.models.Review;
import com.coding.meal_kit.models.User;
import com.coding.meal_kit.services.MealService;
import com.coding.meal_kit.services.ReviewService;
import com.coding.meal_kit.services.UserService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService rService;
	
	@Autowired
	private MealService mService;
	
	@Autowired
	private UserService uService;
	
	private Areas areas;

	@EventListener(ApplicationReadyEvent.class)
	public void loadData() {
		// do something
		areas = mService.getCountryList();
		System.out.println("Loaded country list size=" + areas.getAreas().size()+" in ReviewController");
	}

	@GetMapping("/addReview/{id}")
	public String reviews(@PathVariable("id") Long id, @ModelAttribute("PostAReview") Review review, Model model) {
		model.addAttribute("mealId", mService.getMealbyID(id));
		return "/meal/review.jsp";
	}

	@PostMapping("/createReviews")
	public String createReview(@Valid @ModelAttribute("PostAReview") Review review, BindingResult results,
			Model model, HttpSession session) {
		if (results.hasErrors()) {
			model.addAttribute("mealId", mService.getMealbyDBID(review.getReviewedMeal().getId()));
			return "/meal/review.jsp";
		}
		Long userR = (Long)session.getAttribute("userId");
		
		model.addAttribute("writeReview", rService.createReview(review));
		return "redirect:/profile/" + userR;
	}
	
	@DeleteMapping("/delete/{id}/review")
	public String deleteReview(@PathVariable("id") Long id, HttpSession session, Model  model) {
		if (session.getAttribute("userId") == null)
			return "redirect:";
		User user = this.uService.findById((Long) session.getAttribute("userId"));
		rService.deleteReview(id);
		return "redirect:/profile/" + user.getId();
	}	
	

	@GetMapping("/edit/{id}/review")
	public String editReview(HttpSession session, @ModelAttribute("Edit") Review review, @PathVariable("id") Long id, Model model) {
		Review rev = rService.getOneR(id);
		User user = this.uService.findById((Long) session.getAttribute("userId"));
		model.addAttribute("user", user);
		model.addAttribute("apiAreas", areas);
		model.addAttribute("review", rev);
		return "/meal/reviewedit.jsp";
	}
	
	@PostMapping("/update/{id}/review")
	public String update(@Valid @ModelAttribute("Edit") Review review, BindingResult results, @PathVariable("id") Long id,
			Model model, HttpSession session) {
		if (session.getAttribute("userId") == null)
			return "redirect:login/";
		if (results.hasErrors()) {
			Review rev = rService.getOneR(id);
			model.addAttribute("EditOne", rev);
			return "/meal/reviewedit.jsp";
		} else {
			Review rev = rService.getOneR(id);
			rev.setReview(review.getReview());
			rService.updateR(rev);
			//model.addAttribute("update", );
			return "redirect:/profile/"+rev.getReviewedBy().getId();
		}
	}

}
