package me._hanho.api_spring_default.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me._hanho.api_spring_default.mapper.BoardMapper;
import me._hanho.api_spring_default.model.Board;

@Repository
public class BoardRepository {
	
	@Autowired
	private BoardMapper boardMapper;

	public List<Board> getBoards() {
		return boardMapper.getBoard();
	}

}
