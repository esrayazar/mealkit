package com.coding.meal_kit.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding.meal_kit.models.Review;
import com.coding.meal_kit.repositories.ReviewRepository;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewRepository rRepo;
	
	public List<Review> getAll(){
		return rRepo.findAll();
	}
	
	public Review getOneR(Long id){
		return rRepo.findById(id).orElse(null);
	}
	
	public Review createReview(Review r){
		return rRepo.save(r);
	}
	
	public void AddReview(Review review) {
		rRepo.save(review);
	}

}
