package com.coding.meal_kit.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding.meal_kit.models.Rating;
import com.coding.meal_kit.repositories.RatingRepository;

@Service
public class RatingService {

	@Autowired
	private RatingRepository ratingRepo;
	
	public void AddRating(Rating rating) {
		ratingRepo.save(rating);
	}
	
	
}
