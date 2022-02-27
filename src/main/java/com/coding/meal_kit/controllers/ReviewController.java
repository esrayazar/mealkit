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

import com.coding.meal_kit.models.Rating;
import com.coding.meal_kit.models.Review;
import com.coding.meal_kit.services.RatingService;
import com.coding.meal_kit.services.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService rService;
	
	@Autowired
	private RatingService ratingService;

	@GetMapping("/reviews")
	public String reviews(@ModelAttribute("PostAReview") Review review, Model model) {
		model.addAttribute("createR", rService.getAll());
		return "/meal/review.jsp";
	}

	@PostMapping("/createReviews")
	public String createReview(@Valid @ModelAttribute("PostAReview") Review review, BindingResult results,
			Model model) {
		if (results.hasErrors()) {
			model.addAttribute("createR", rService.getAll());
			return "/meal/review.jsp";
		}
		model.addAttribute("writeReview", rService.createReview(review));
		return "redirect:/";
	}
	
	// Rating
		@PostMapping("/addrating")
		public String addRating(HttpSession session, @ModelAttribute("newRating") Rating rating) {
//			if (session.getAttribute("user_id") == null)
//				return "redirect:/";
			ratingService.AddRating(rating);
			return "redirect:/";

		}

}
