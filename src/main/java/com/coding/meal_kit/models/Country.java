package com.coding.meal_kit.models;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;



@Data
public class Country {

	@JsonProperty("meals")
	List<Country> mealsByCountry;
}





