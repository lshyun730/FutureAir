package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.air.future.vo.Board;

public interface BoardMapper {
	
	public ArrayList<Board> selectBoard();
	
	public int deleteBoard(int board_index);
	
	public ArrayList<Board> searchBoard(HashMap map);
}
