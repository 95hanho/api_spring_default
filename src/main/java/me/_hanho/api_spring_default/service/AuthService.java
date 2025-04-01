package me._hanho.api_spring_default.service;

import me._hanho.api_spring_default.model.Token;
import me._hanho.api_spring_default.model.User;

public interface AuthService {

	User getUser(User user);
	
	User getUser(String id);
	
	User getUser(Token token);

	void insertToken(Token token);

	void updateToken(Token token);

	boolean getId(String id);
	
	void joinMember(User user);

	boolean passwordCheck(String password, String password2);

}
