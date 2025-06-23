package me._hanho.api_spring_default.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import me._hanho.api_spring_default.model.Board;
import me._hanho.api_spring_default.service.BoardService;

@RestController
@RequestMapping("/bapi/board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping
	public ResponseEntity<Map<String, Object>> getBoards() {
		logger.info("getBoards");
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<Board> boardList = boardService.getBoards();
		System.out.println(boardList);
		result.put("msg", "success");
		result.put("boardList", boardList);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
}
