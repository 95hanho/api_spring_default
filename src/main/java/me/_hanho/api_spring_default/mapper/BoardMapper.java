package me._hanho.api_spring_default.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import me._hanho.api_spring_default.model.Board;

@Mapper
public interface BoardMapper {

	List<Board> getBoard();

}
