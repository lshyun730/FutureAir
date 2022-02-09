package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.air.future.vo.Board;

@Repository
public class BoardDAO {

	@Autowired
	SqlSession sqlSession;
	
	//게시판 정보 가져오기
	public ArrayList<Board> selectBoard(){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		ArrayList<Board> board = mapper.selectBoard();
		
		return board;
		
	}
	
	public int deleteBoard(int board_index) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = mapper.deleteBoard(board_index);
		
		return result;
		
	}
	
	public ArrayList<Board> searchBoard(HashMap map){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		ArrayList<Board> boardlist = mapper.searchBoard(map);
		
		return boardlist;

	}
	
}
