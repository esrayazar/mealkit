package com.coding.meal_kit.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.coding.meal_kit.models.Review;

@Repository
public interface ReviewRepository extends CrudRepository<Review,Long>{
	List <Review> findAll();

}
