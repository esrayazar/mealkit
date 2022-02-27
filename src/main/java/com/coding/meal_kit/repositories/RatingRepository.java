package com.coding.meal_kit.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.coding.meal_kit.models.Rating;

@Repository
public interface RatingRepository extends CrudRepository<Rating, Long>{

}
