package com.selenanguyen.loginandregistration.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.selenanguyen.loginandregistration.models.LoginUser;
import com.selenanguyen.loginandregistration.models.User;
import com.selenanguyen.loginandregistration.repos.UserRepo;


@Service
public class UserService {
	
	@Autowired
	private UserRepo repo;
	// ================ Register and Login ==================
	public User register(User newUser, BindingResult result) {
		if (repo.findByEmail(newUser.getEmail()).isPresent()) {
			result.rejectValue("email", "Unique", "Email is already in use");
		}
		
		if (!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirmPassword", "Matches", "Password and Confirm Password must match");
		}
		
		if (result.hasErrors()) {
			return null;
		}
		
		String hashBrowns = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashBrowns);
		
		
		return repo.save(newUser);
	}
	
	public User login(LoginUser newLogin, BindingResult result) {
		if(result.hasErrors()) {
			return null;
		}
		
		Optional<User> optUser = repo.findByEmail(newLogin.getEmail());
		if (!optUser.isPresent()) {
			result.rejectValue("email", "Unique", "Invalid Credentials");
			
			return null;
		}
		
		User user = optUser.get();
		if (!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Matches", "Invalid Credentials");
			
			return null;
		}
		
		return user;
		
	}
	
	// ================ Create/Update ==================
	
	
	
	// ================ Read ==================
	public User getOne(Long id) {
		return repo.findById(id).orElse(null);
	}
	
	
	
	// ================ Delete ==================

}
