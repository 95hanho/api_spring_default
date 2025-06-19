package me._hanho.api_spring_default.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me._hanho.api_spring_default.model.Board;
import me._hanho.api_spring_default.repository.BoardRepository;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardRepository boardDAO;

	@Override
	public List<Board> getBoards() {
		return boardDAO.getBoards();
	}

}
