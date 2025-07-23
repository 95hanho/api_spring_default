package me._hanho.api_spring_default.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.HttpServletRequest;
import me._hanho.api_spring_default.model.Token;
import me._hanho.api_spring_default.model.User;
import me._hanho.api_spring_default.service.AuthService;
import me._hanho.api_spring_default.service.TokenService;

@RestController
@RequestMapping("/bapi/auth")
public class AuthController {
	
	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);

	@Autowired
	private AuthService authService;
	
	@Autowired
	private TokenService tokenService;
	
	// 유저정보가져오기
	@GetMapping
	public ResponseEntity<Map<String, Object>> getUserInfo(@RequestAttribute(required = false, value = "id") String id, @RequestParam("type") String type,
			@RequestParam("nextId") String nextId) {
		logger.info("getUserInfo" + type);
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(type.equals("nextjs")) {
			User user = authService.getUser(nextId);
			result.put("msg", "success");
			result.put("user", user);
			return new ResponseEntity<>(result, HttpStatus.OK);
		} else if(id != null) {
			User user = authService.getUser(id);
			result.put("msg", "success");
			result.put("user", user);
			return new ResponseEntity<>(result, HttpStatus.OK);
		} else {
			result.put("msg", "token제대로 안됨");
			logger.error("token 제대로 안온듯");
			return new ResponseEntity<>(result, HttpStatus.UNAUTHORIZED);
		}
	}
	
	@PostMapping
	public ResponseEntity<Map<String, Object>> login(@ModelAttribute User user, @RequestHeader("user-agent") String agent
			, HttpServletRequest request, @RequestParam(required = false, value = "type") String type, @RequestParam(required = false, value = "nextjs_token") String nextjs_token) {
		logger.info(type + " login :" + user);
		String ipAddress = request.getRemoteAddr();
		Map<String, Object> result = new HashMap<String, Object>();
		
		User checkUser = authService.getUser(user);
		if (checkUser == null || !authService.passwordCheck(user.getPassword(), checkUser.getPassword())) {
			result.put("msg", "입력하신 아이디 또는 비밀번호가 일치하지 않습니다");
			result.put("response_code", 430);
			result.put("status", "success");
			logger.error("입력하신 아이디 또는 비밀번호가 일치하지 않습니다");
			
			return new ResponseEntity<>(
					result
					, HttpStatus.BAD_REQUEST);
		} else if(type != null && type.equals("nextjs")) {
			Token token = Token.builder().connect_ip(ipAddress).connect_agent(agent).refresh_token(nextjs_token).id(checkUser.getId()).build();
			authService.insertToken(token);
			result.put("msg", "로그인");
			result.put("status", "success");
			result.put("response_code", 200);
			return new ResponseEntity<>(
					result
					, HttpStatus.OK);
		} else {
			User onlyId = new User();
			onlyId.setId(checkUser.getId());
			String accessToken = tokenService.makeJwtToken(3, onlyId);
//			String accessToken = tokenService.makeJwtToken(60 * 10, onlyId);
			String refreshToken = tokenService.makeJwtToken(60 * 30);
			
			Token token = Token.builder().connect_ip(ipAddress).connect_agent(agent).refresh_token(refreshToken).id(checkUser.getId()).build();
			authService.insertToken(token);
			
			result.put("msg", "로그인");
			result.put("status", "success");
			result.put("response_code", 200);
			result.put("access_token", accessToken);
			result.put("refresh_token", refreshToken);
			return new ResponseEntity<>(
					result
					, HttpStatus.OK);
		}
	}
	
	
	@GetMapping("/id")
	public ResponseEntity<Map<String, Object>> idDuplcheck(@RequestParam("id") String id) {
		logger.info("idDuplcheck");
		Map<String, Object> result = new HashMap<String, Object>();
		
		boolean hasId = authService.getId(id);
		
		if(!hasId) {
			result.put("msg", "success");
			return new ResponseEntity<>(result, HttpStatus.OK);
		} else {
			result.put("msg", "fail");
			return new ResponseEntity<>(result, HttpStatus.NOT_FOUND);
		}
	}
	
	@PostMapping("/phone")
	public ResponseEntity<Map<String, Object>> phoneAuth(@RequestParam("phone") String phone) {
		logger.info("phoneAuth");
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@PostMapping("/member")
	public ResponseEntity<Map<String, Object>> join(@ModelAttribute User user) {
		logger.info("join : " + user);
		Map<String, Object> result = new HashMap<String, Object>();
		
		authService.joinMember(user);
		
		result.put("msg", "success");
		return new ResponseEntity<>(null, HttpStatus.OK);
	}
	
	@PostMapping("/token")
	public ResponseEntity<Map<String, Object>> reToken(@RequestParam(required = false, value = "refresh_token") String refresh_token,
			HttpServletRequest request, @RequestHeader("user-agent") String agent, 
			// nextjs용
			@RequestParam(required = false, value = "type") String type,
			@RequestParam(required = false, value = "nextId") String nextId, 
			@RequestParam(required = false, value = "nextjs_token") String nextjs_token, 
			@RequestParam(required = false, value = "nextjs_newToken") String nextjs_newToken) {
		logger.info("reToken " + refresh_token);
		Map<String, Object> result = new HashMap<String, Object>();
		
		Claims claims = null;
		if(type == null || !type.equals("nextjs")) {
			try {
				claims = tokenService.parseJwtToken(refresh_token);
			} catch (Exception e) {
				result.put("msg", "token제대로 안됨");
				return new ResponseEntity<>(result, HttpStatus.UNAUTHORIZED);
			}
		}
		
		if(claims != null) {
			String ipAddress = request.getRemoteAddr();
			Token token = Token.builder().connect_ip(ipAddress).connect_agent(agent).refresh_token(refresh_token).build();
			User checkUser = authService.getUser(token);
			
			if(checkUser != null) {
				User onlyId = new User();
				onlyId.setId(checkUser.getId());
				String re_accessToken = tokenService.makeJwtToken(3, onlyId);
//				String re_accessToken = tokenService.makeJwtToken(60 * 10, onlyId);
				String re_refreshToken = tokenService.makeJwtToken(60 * 30);
				Token token2 = Token.builder().connect_ip(ipAddress).connect_agent(agent).refresh_token(re_refreshToken).id(checkUser.getId()).build(); 
				authService.updateToken(token2);
				
				result.put("msg", "access 토큰 재발급 성공");
				result.put("access_token", re_accessToken);
				result.put("refresh_token", re_refreshToken);
				result.put("response_code", 200);
				result.put("status", "success");
				logger.info("reToken success !!! ");
				return new ResponseEntity<>(result, HttpStatus.OK);
			} else {
				result.put("msg", "token제대로 안됨");
				logger.error("reToken error1");
				return new ResponseEntity<>(result, HttpStatus.UNAUTHORIZED);
			}
		} else if(type != null && type.equals("nextjs")) {
			String ipAddress = request.getRemoteAddr();
			Token token = Token.builder().connect_ip(ipAddress).connect_agent(agent).refresh_token(nextjs_token).build();
			User checkUser = authService.getUser(token);
			
			if(checkUser != null) {
				Token token2 = Token.builder().connect_ip(ipAddress).connect_agent(agent).refresh_token(nextjs_newToken).id(checkUser.getId()).build(); 
				authService.updateToken(token2);
				result.put("status", "success");
				logger.info("nextjs-reToken success !!! ");
				return new ResponseEntity<>(result, HttpStatus.OK);
			}
			return new ResponseEntity<>(result, HttpStatus.UNAUTHORIZED);
		} else {
			result.put("msg", "token제대로 안됨");
			logger.error("reToken error1");
			return new ResponseEntity<>(result, HttpStatus.UNAUTHORIZED);
		}
	}
	

	
}
