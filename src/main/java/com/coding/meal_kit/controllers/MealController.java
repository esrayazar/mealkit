package com.coding.meal_kit.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.coding.meal_kit.models.Areas;
import com.coding.meal_kit.models.CountryMeals;
import com.coding.meal_kit.models.Meals;
import com.coding.meal_kit.services.MealService;


@Controller
public class MealController {


	@Autowired
	private MealService mealService;
	
	
	private Areas areas;
	
    @EventListener(ApplicationReadyEvent.class)
    public void loadData()
    {
        // do something
    	areas = mealService.getCountryList();
    	System.out.println("Loaded country list size="+areas.getAreas().size());
    }

	@GetMapping("/")
	public String home(Model model) {
		Meals meals = mealService.getRandomMeal();
		// System.out.println(areas.getAreas().toString());
		model.addAttribute("apiData", meals);
		model.addAttribute("apiAreas", this.areas);
		return "/meal/home.jsp";
	}

	@GetMapping("/getMeal/{id}")
	public String showMealByCountry(@PathVariable("id") String id, Model model) {
		Meals meals = mealService.getMealbyID(id);
		model.addAttribute("apiData", meals);
		model.addAttribute("apiAreas", this.areas);
		return "/meal/home.jsp";
	}


	@GetMapping("/details")
	public String details(Model model) {
		Meals meals = mealService.getRandomMeal();
		// System.out.println(areas.getAreas().toString());
		model.addAttribute("apiData", meals);
		model.addAttribute("apiAreas", this.areas);
		return "/meal/details.jsp";
	}

	@GetMapping("/searchByCountry")
	public String getMealByCountry(@RequestParam("country") String country, Model model) {
		CountryMeals meals = mealService.getMealbyCountry(country);
		model.addAttribute("apiAreas", this.areas);
		model.addAttribute("apiData", meals);
		return "/meal/searchpage.jsp";
	}
	
	@GetMapping("/search")
	public String search(@RequestParam("term") String term, 
			@RequestParam("by") String by, Model model) {
		System.out.println(">>>");
		return "/meal/mealsearch.jsp";
		
	}
	


}
