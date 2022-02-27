package com.coding.meal_kit.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.coding.meal_kit.models.Meal;


@Repository
public interface MealRepository extends CrudRepository<Meal, Long> {
	List<Meal> findAll();
	Meal findByIdMeal(Long idMeal);
	

	
}
