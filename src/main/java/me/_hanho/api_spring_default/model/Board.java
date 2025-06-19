package me._hanho.api_spring_default.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int board_id;
	private String title;
	private String content;
	private Date created_at;
	private String user_id;
	
	private String name;
	
}
