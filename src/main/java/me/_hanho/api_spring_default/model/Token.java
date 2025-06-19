package me._hanho.api_spring_default.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Token {

	private int token_id;
	private String connect_ip;
	private String connect_agent;
	private String refresh_token;
	private String id;
	
}
