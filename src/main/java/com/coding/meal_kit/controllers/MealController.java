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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.coding.meal_kit.models.Areas;
import com.coding.meal_kit.models.CountryMeals;
import com.coding.meal_kit.models.Meal;
import com.coding.meal_kit.models.Meals;
import com.coding.meal_kit.models.User;
import com.coding.meal_kit.services.MealService;
import com.coding.meal_kit.services.ReviewService;
import com.coding.meal_kit.services.UserService;

@Controller
public class MealController {

	@Autowired
	private MealService mealService;

	@Autowired
	private UserService uService;
	
	@Autowired
	private ReviewService rService;

	private Areas areas;

	@EventListener(ApplicationReadyEvent.class)
	public void loadData() {
		// do something
		areas = mealService.getCountryList();
		System.out.println("Loaded country list size=" + areas.getAreas().size());
	}

	@GetMapping("/")
	public String home(Model model, HttpSession session) {
		if (session.getAttribute("userId") == null)
			model.addAttribute("noactive", true);
		else {
			User user = this.uService.findById((Long) session.getAttribute("userId"));
			model.addAttribute("user", user);
		}
		
		model.addAttribute("apiAreas", this.areas);
		return "/meal/home.jsp";
	}

	@GetMapping("/getMeal/{id}")
	public String showMealByCountry(@PathVariable("id") Long id, Model model, HttpSession session) {
		if (session.getAttribute("userId") == null)
			return "redirect:login/";
		Meal meal = mealService.getMealbyID(id);
		User user = this.uService.findById((Long) session.getAttribute("userId"));
		model.addAttribute("meal", meal);
		model.addAttribute("user", user);
		model.addAttribute("apiAreas", this.areas);
		return "/meal/details.jsp";
	}

	@GetMapping("/details")
	public String details(Model model, HttpSession session) {
		if (session.getAttribute("userId") == null)
			return "redirect:/login";
		Meal meal = mealService.getRandomMeal();
		User user = this.uService.findById((Long) session.getAttribute("userId"));
		model.addAttribute("user", user);
		model.addAttribute("meal", meal);
		model.addAttribute("apiAreas", this.areas);
//		meal id
//		

		return "/meal/details.jsp";
	}

	@GetMapping("/searchByCountry")
	public String getMealByCountry(@RequestParam("country") String country, Model model, HttpSession session) {
		if (session.getAttribute("userId") == null)
			return "redirect:login/";
		CountryMeals meals = mealService.getMealbyCountry(country);
		model.addAttribute("apiAreas", this.areas);
		model.addAttribute("apiData", meals);
		return "/meal/searchpage.jsp";
	}

	@GetMapping("/search")
	public String search(@RequestParam("term") String term, @RequestParam("by") String by, Model model,
			HttpSession session) {
		if (session.getAttribute("userId") == null)
			return "redirect:login/";

		if (by.equals("name")) {
			Meals meal = mealService.getMealbyName(term);
			if (meal.getMeals() == null) {
				model.addAttribute("noresult", true);
			} else {
				model.addAttribute("apiMeals", meal);
				model.addAttribute("display", "byname");
			}
		} else {
			CountryMeals cmeal = mealService.getMealbyIngredient(term);
			if (cmeal.getMeals() == null) {
				model.addAttribute("noresult", true);
			} else {
				model.addAttribute("apiMeals", cmeal);
				model.addAttribute("display", "byingredients");
			}

		}

		return "/meal/mealsearch.jsp";
	}

	@GetMapping("/profile/{id}")
	public String profile(@PathVariable("id") Long id, Model model, HttpSession session) {
		if (session.getAttribute("userId") == null)
			return "redirect:/login";
		model.addAttribute("pUser", uService.findById(id));
//		model.addAttribute("showR", rService.getOneR(id) );
		return "/meal/profile.jsp";

	}

	@GetMapping("profile/{id}/edit")
	public String edit(@ModelAttribute("Edit") User user, @PathVariable("id") Long id, Model model,
			HttpSession session) {
		if (session.getAttribute("userId") == null)
			return "redirect:/login";

		model.addAttribute("EditOne", uService.findById(id));

		return "/meal/edit.jsp";
		
	}

	@PutMapping("/update/{id}")
	public String update(@Valid @ModelAttribute("Edit") User user, BindingResult results, @PathVariable("id") Long id,
			Model model, HttpSession session) {
//		if (session.getAttribute("userId") == null)
//			return "redirect:login/";
		if (results.hasErrors()) {
			model.addAttribute("EditOne", uService.findById(id));
			return "/meal/edit.jsp";
//			return "redirect:/profile/{id}/edit";
//			
		} else {
			System.out.println("hello");
			model.addAttribute("update", uService.updateU(user));

			return "redirect:/details";
		}
	}

	@DeleteMapping("/delete/{id}")
	public String deleteRoom(@PathVariable("id") Long id, HttpSession session) {
		if (session.getAttribute("userId") == null)
			return "redirect:login/";
		uService.deleteU(id);
		return "redirect:/";
	}

	// Like
	@GetMapping("/{id}/like")
	public String like(HttpSession session, @PathVariable("id") Long id) {

		// Check if there is any active user session.
		if (session.getAttribute("userId") == null)
			return "redirect:login/";
		User user = this.uService.findById((Long) session.getAttribute("userId"));
		Meal meal = this.mealService.getMealbyID(id);// idMeal
		this.mealService.likeMeal(user, meal);
		return "redirect:/getMeal/" + id;
	}

	// Unlike
	@GetMapping("/{id}/unlike")
	public String unlike(HttpSession session, @PathVariable("id") Long id) {
		// Check if there is any active user session.
		if (session.getAttribute("userId") == null)
			return "redirect:login/";
		User user = this.uService.findById((Long) session.getAttribute("userId"));
		Meal meal = this.mealService.getMealbyID(id);// idMeal
		this.mealService.unlikeMeal(user, meal);
		return "redirect:/getMeal/" + id;
	}

	// Add Favorite
	@GetMapping("/{id}/addFavorites")
	public String addFavorite(HttpSession session, @PathVariable("id") Long id) {

		// Check if there is any active user session.
		if (session.getAttribute("userId") == null)
			return "redirect:login/";
		User user = this.uService.findById((Long) session.getAttribute("userId"));
		Meal meal = this.mealService.getMealbyID(id);// idMeal
		this.mealService.addFavoriteMeal(user, meal);
		return "redirect:/getMeal/" + id;
	}

	// Remove From Favorites
	@GetMapping("/{id}/removeFavorite")
	public String removeFavorite(HttpSession session, @PathVariable("id") Long id) {
		// Check if there is any active user session.
		if (session.getAttribute("userId") == null)
			return "redirect:login/";
		User user = this.uService.findById((Long) session.getAttribute("userId"));
		Meal meal = this.mealService.getMealbyID(id);// idMeal
		this.mealService.removeFromFavorites(user, meal);
		return "redirect:/getMeal/" + id;
	}

}
