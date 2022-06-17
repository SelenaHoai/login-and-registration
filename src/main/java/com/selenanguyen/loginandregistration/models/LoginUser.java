package com.selenanguyen.loginandregistration.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

public class LoginUser {
	
	// ================= Member Variables ==================
    @NotEmpty(message="Email is required!")
    @Email(message="Invalid email format!")
    private String email;
    
    @NotEmpty(message="Password is required!")
    private String password;
    
	// ================= Constructors ==================
	public LoginUser() {}
	
	// ================= Getters & Getters ==================
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	

	

}
