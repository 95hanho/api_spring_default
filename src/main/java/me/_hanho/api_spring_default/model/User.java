package me._hanho.api_spring_default.model;

import java.util.Date;

public class User {

	private String id;
	private String pwd;
	private String name;
	private Date created_at;

	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(String id, String pwd, String name, Date created_at) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.created_at = created_at;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", pwd=" + pwd + ", name=" + name + ", created_at=" + created_at + "]";
	}
	
	
}
