package me._hanho.api_spring_default.service;

import java.nio.charset.StandardCharsets;
import java.security.Key;
import java.util.Date;

import org.springframework.stereotype.Service;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Header;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import me._hanho.api_spring_default.model.User;

@Service
public class TokenService {
private static final String SECRET_KEY = "HANHOSEONGTOKENTESTHANHOSEONGTOKENTEST";
	
	/**
	 * 토큰 생성하기
	 * @return
	 */
	public String makeJwtToken(int seconds) {
		Key key = Keys.hmacShaKeyFor(SECRET_KEY.getBytes(StandardCharsets.UTF_8));
		
		Date now = new Date();
		Date expire = new Date();
		Long expiredTime = seconds * 1000L; // seconds * 1초 
		expire.setTime(expire.getTime() + expiredTime);
		
		return Jwts.builder()
				.setHeaderParam(Header.TYPE, Header.JWT_TYPE)
				.setIssuer("myteam")
				.setIssuedAt(now)
				.setExpiration(expire)
				.signWith(key)
				.compact();
	}
	
	public String makeJwtToken(int seconds, User user) {
		Key key = Keys.hmacShaKeyFor(SECRET_KEY.getBytes(StandardCharsets.UTF_8));
		
		Date now = new Date();
		Date expire = new Date();
		
		Long expiredTime = seconds * 1000L; // seconds * 1초 
		expire.setTime(expire.getTime() + expiredTime);
		
		return Jwts.builder()
				.setHeaderParam(Header.TYPE, Header.JWT_TYPE)
				.setIssuer("myteam")
				.setIssuedAt(now)
				.setExpiration(expire)
				.claim("id", user.getId())
//				.claim("nickName", user.getNickName())
//				.claim("createDate", user.getCreateDate())
				.signWith(key)
				.compact();
	}
	
	/**
	 * 토큰 복호화 하여 본문(Payload) 가져오기
	 * @param token
	 * @return
	 */
	public Claims parseJwtToken(String token) {
		Key key = Keys.hmacShaKeyFor(SECRET_KEY.getBytes(StandardCharsets.UTF_8));
		
		Claims claims = Jwts.parserBuilder()
				.setSigningKey(key)
				.build()
				.parseClaimsJws(token)
				.getBody();
		System.out.println("claims = " + claims.toString());
		
		return claims;
	}
}
