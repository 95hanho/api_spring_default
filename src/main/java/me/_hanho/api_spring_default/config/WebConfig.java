package me._hanho.api_spring_default.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	
	@Autowired
	private JwtInterceptor jwtInterceptor;

	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**")
		.allowedOrigins("http://localhost:5173", "https://95hanho.pe.kr", "http://localhost:3000")
		.allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
		.allowedHeaders("*") // ✅ 모든 헤더 허용
		.allowCredentials(true)
		.exposedHeaders("Authorization"); // 클라이언트에서 Authorization 응답 헤더를 읽게 하려면
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(jwtInterceptor)
//		.addPathPatterns("/**");
			.addPathPatterns("/bapi/auth", "/bapi/board/**");
//			.excludePathPatterns("/bapi/auth/signup");
	}
}
