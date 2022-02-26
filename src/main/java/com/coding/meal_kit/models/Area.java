package com.coding.meal_kit.models;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class Area {
	@JsonProperty("strArea")
	String strArea;
}
