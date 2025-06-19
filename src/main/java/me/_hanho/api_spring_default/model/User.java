package me._hanho.api_spring_default.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {

	private String id;
	private String password;
	private String password_check;
	private String name;
	private String zonecode;
	private String address;
	private String birthday;
	private String phone;
	private String email;
	
	private Date created_at;

}
