package com.coding.meal_kit.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.coding.meal_kit.models.Areas;
import com.coding.meal_kit.models.CountryMeals;
import com.coding.meal_kit.models.Meals;
import com.coding.meal_kit.repositories.MealRepository;


@Service
public class MealService {
	
	@Autowired
	private MealRepository mealRepository;
	
	RestTemplate restTemplate = new RestTemplate();
	public final String fooResourceUrl
	  = "https://www.themealdb.com/api/json/v1/1/random.php";
	
	public final String mealIDUrl
	  = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=";
	
	public final String countryUrl = "https://www.themealdb.com/api/json/v1/1/list.php?a=list";
	public final String byCountryURL = "https://www.themealdb.com/api/json/v1/1/filter.php?a=";
	public final String byIngredient="https://www.themealdb.com/api/json/v1/1/filter.php?i=";
	public final String byName="https://www.themealdb.com/api/json/v1/1/search.php?s=";

	public Areas getCountryList() {
		Areas areas = restTemplate.getForObject(countryUrl, Areas.class);
		//if(areas == null) System.out.println("NULLL");
		return areas;
	}
	
	public Meals getRandomMeal() {
	
	Meals meal = restTemplate
			  .getForObject(fooResourceUrl, Meals.class);
	String videoID = meal.getMeals().get(0).getStrYoutube();
	
		int pos = videoID.indexOf("=");
	videoID = videoID.substring(pos+1);
		meal.getMeals().get(0).setStrYoutubeVideoID(videoID);
		return meal;
	}
//	
	public Meals getMealbyID(String mealID) {
		//
		Meals meal = restTemplate
				  .getForObject(mealIDUrl+mealID, Meals.class);
		String videoID = meal.getMeals().get(0).getStrYoutube();
		int pos = videoID.indexOf("=");
		videoID = videoID.substring(pos+1);
		meal.getMeals().get(0).setStrYoutubeVideoID(videoID);
		return meal;
	}
	
	//Country API
	
	public CountryMeals getMealbyCountry(String country) {
		System.out.println(byCountryURL+country);
		CountryMeals meal = restTemplate
				  .getForObject(byCountryURL+country, CountryMeals.class);
		return meal;
	}
	
	
	//search By Meal Name
	
	public Meals getMealbyName(String name) {
		System.out.println(byName+name);
		Meals meal = restTemplate
				  .getForObject(byName+name, Meals.class);
		String videoID = meal.getMeals().get(0).getStrYoutube();
		int pos = videoID.indexOf("=");
		videoID = videoID.substring(pos+1);
		meal.getMeals().get(0).setStrYoutubeVideoID(videoID);
		return meal;
	}
	
	
	
	
	//Search By Ingredients
	
	public CountryMeals getMealbyIngredient(String ingredient) {
		System.out.println(byIngredient+ingredient);
		CountryMeals meal = restTemplate
				  .getForObject(byIngredient+ingredient, CountryMeals.class);
		return meal;
	}
	

}
