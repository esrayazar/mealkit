package com.coding.meal_kit.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.coding.meal_kit.models.User;
import com.coding.meal_kit.repositories.UserRepository;

@Component
public class UserValidator implements Validator{

	@Autowired 
	private UserRepository uRepo;
	
	@Override
	public boolean supports(Class<?> clazz) {
		
		return User.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		User user = (User) target;
		if(!user.getConfirm_password().equals(user.getPassword())) {
			errors.rejectValue("password", "Match", "Password does not match");
		}
		if(uRepo.findByEmail(user.getEmail())!=null) {
			errors.rejectValue("email", "unique", "Email address already taken.");
		}
	}
}
