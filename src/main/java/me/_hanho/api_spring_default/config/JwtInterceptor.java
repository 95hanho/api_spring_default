package me._hanho.api_spring_default.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me._hanho.api_spring_default.service.TokenService;

@Component
public class JwtInterceptor implements HandlerInterceptor {

	private static final Logger logger = LoggerFactory.getLogger(JwtInterceptor.class);
	
	@Autowired
	private TokenService tokenService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String uri = request.getRequestURI();
		String access_token = request.getHeader("authorization");
		logger.info("preHandle ===> uri : "+ uri + ", access_token : " + access_token);
		String method = request.getMethod(); // "GET", "POST", ...
		
		// 1. OPTIONS 요청은 무조건 통과시킨다 (Preflight CORS 대응) => OPTIONS 요청이 401되면 그냥 CORS요청으로 처리되므로 해줘야함.
	    if (method.equalsIgnoreCase("OPTIONS")) {
	        return true;
	    }
		
		// /bapi/auth 경로 중 GET만 검사하고(유저정보가져오기), POST는 통과(로그인)
		if (uri.equals("/bapi/auth") && method.equalsIgnoreCase("POST")) {
			return true;
		}
		
		// 토큰이 없으면 바로 오류
		if (access_token == null || access_token.isEmpty()) {
			// 토큰이 유효하지 않으면 요청을 거부
        	logger.error("token NO_ACCESSTOKEN");
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			return false;
		}
			
        try {
            // JWT 파싱 및 복호화
            Claims claims = tokenService.parseJwtToken(access_token);
            // login_id 추출
            String id = claims.get("id", String.class);
            request.setAttribute("id", id); // HttpServletRequest에 login_id 추가
            logger.info("tokenPass => id : " + id);
            return true;
        } catch (Exception e) {
            // 토큰이 유효하지 않으면 요청을 거부
        	logger.error("token UNAUTHORIZED");
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            
            return false;
        }
	}
}
