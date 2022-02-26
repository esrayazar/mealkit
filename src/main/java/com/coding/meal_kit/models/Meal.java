package com.coding.meal_kit.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;



@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name="meals")
public class Meal {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private Long idMeal;
	
	private String strMeal;
	
	private String strDrinkAlternate;
	
	private String strCategory;
	private String strArea;
	private String strInstructions;
	private String strMealThumb;
	private String strTags;
	private String strYoutubeVideoID;
	private String strYoutube;
	private String strIngredient1;
	private String strIngredient2;
	private String strIngredient3;
	private String strIngredient4;
	private String strIngredient5;
	private String strIngredient6;
	private String strIngredient7;
	private String strIngredient8;
	private String strIngredient9;
	private String strIngredient10;
	private String strIngredient11;
	private String strIngredient12;
	private String strIngredient13;
	private String strIngredient14;
	private String strIngredient15;
	private String strIngredient16;
	private String strIngredient17;
	private String strIngredient18;
	private String strIngredient19;
	private String strIngredient20;
	private String strMeasure1;
	private String strMeasure2;
	private String strMeasure3;
	private String strMeasure4;
	private String strMeasure5;
	private String strMeasure6;
	private String strMeasure7;
	private String strMeasure8;
	private String strMeasure9;
	private String strMeasure10;
	private String strMeasure11;
	private String strMeasure12;
	private String strMeasure13;
	private String strMeasure14;
	private String strMeasure15;
	private String strMeasure16;
	private String strMeasure17;
	private String strMeasure18;
	private String strMeasure19;
	private String strMeasure20;
	private String strSource;
	private String strImageSource;
	private String strCreativeCommonsConfirmed;
	private Date dateModified;
	
}
