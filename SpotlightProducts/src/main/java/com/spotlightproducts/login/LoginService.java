package com.spotlightproducts.login;

import org.springframework.stereotype.Service;

@Service
public class LoginService {
	public boolean validateUser(String user, String password) {
		return user.equalsIgnoreCase("admin@spotlight.com") && password.equals("admin");
	}

}