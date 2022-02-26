package com.coding.meal_kit.models;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class Meals {

	@JsonProperty("meals")
	List<Meal> meals;
}

