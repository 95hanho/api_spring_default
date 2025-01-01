package me._hanho.api_spring_default.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me._hanho.api_spring_default.mapper.AuthMapper;
import me._hanho.api_spring_default.model.Token;
import me._hanho.api_spring_default.model.User;

@Repository
public class AuthRepository {

	@Autowired
	private AuthMapper authMapper;
	
	public User getUser(User user) {
		return authMapper.getUser(user);
	}
	
	public User getUser(String id) {
		return authMapper.getUser3(id);
	}
	
	public User getUser(Token token) {
		return authMapper.getUser2(token);
	}

	public void insertToken(Token token) {
		authMapper.insertToken(token);
	}

	public void updateToken(Token token) {
		int token_id = authMapper.getToken_id(token);
		token.setToken_id(token_id);
		authMapper.updateToken(token);
	}





}
