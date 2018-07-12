package com.simpleboard.web.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.simpleboard.web.dto.Board;

public interface BoardMapper {
	public List<Board> boardList(String searchKeyword, RowBounds rb);
	public int insertBoard(Board board);
	public Board infoBoard(Board board);
	public int updateHits(Board board);
	public int getTotal();
}
