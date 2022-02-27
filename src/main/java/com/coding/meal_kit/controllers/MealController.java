package com.coding.meal_kit.controllers;


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
import com.coding.meal_kit.models.Meals;
import com.coding.meal_kit.models.User;
import com.coding.meal_kit.services.MealService;
import com.coding.meal_kit.services.UserService;


@Controller
public class MealController {

	@Autowired
	private MealService mealService;
	
	@Autowired
	private UserService uService;
	
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
	public String search(@RequestParam("term") String term, @RequestParam("by") String by, Model model) {
		
		if (by.equals("name")) {
			Meals meal = mealService.getMealbyName(term);
			if(meal.getMeals()==null)
			{
				model.addAttribute("noresult",true);
			}else {
				model.addAttribute("apiMeals", meal);
				model.addAttribute("display","byname");
			}
		} else {
			CountryMeals cmeal = mealService.getMealbyIngredient(term);
			if(cmeal.getMeals()==null)
			{
				model.addAttribute("noresult",true);
			} else {
				model.addAttribute("apiMeals", cmeal);
				model.addAttribute("display","byingredients");
			}
			
		}
		
		return "/meal/mealsearch.jsp";
	}
	
	@GetMapping("/profile/{id}")
	public String profile(@PathVariable("id")Long id, Model model) {
		model.addAttribute("pUser", uService.findById(id));
		return "/meal/profile.jsp";
		
	}
	
	@GetMapping("profile/{id}/edit")
	public String edit( @ModelAttribute("Edit") User user, @PathVariable("id") Long id, Model model) {

		model.addAttribute("EditOne", uService.findById(id));

//		model.addAttribute("GetUser", uService.findById(id));

		return "/meal/edit.jsp";
	}

	@PutMapping("/update/{id}")
	public String update(@Valid @ModelAttribute("Edit") User user, BindingResult results, @PathVariable("id") Long id,
			Model model) {
		if (results.hasErrors()) {
			model.addAttribute("EditOne", uService.findById(id));
			return "/meal/edit.jsp";
		} else {
			model.addAttribute("update", uService.updateU(user));
//			model.addAttribute("One", hService.getOne(id));
			
			return "redirect:/profile/{id}";
		}
	}

	@DeleteMapping("/delete/{id}")
	public String deleteRoom(@PathVariable("id") Long id) {
		uService.deleteU(id);
		return "redirect:/";
	}


}
