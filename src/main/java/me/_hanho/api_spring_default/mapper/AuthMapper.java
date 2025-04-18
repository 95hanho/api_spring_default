package me._hanho.api_spring_default.mapper;

import org.apache.ibatis.annotations.Mapper;

import me._hanho.api_spring_default.model.Token;
import me._hanho.api_spring_default.model.User;

@Mapper
public interface AuthMapper {

	User getUser(User user);
	
	User getUser2(Token token);
	
	User getUser3(String id);

	void insertToken(Token token);
	
	int getToken_id(Token token);

	void updateToken(Token token);

	int getId(String id);
	
	void joinMember(User user);

	
	
}
