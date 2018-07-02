package dao;

import java.util.List;

import dto.Board;

public interface BoardMapper {
	public List<Board> boardList();
	public int insertBoard(Board board);
}
