package com.air.future.dao;

import java.util.ArrayList;

import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.air.future.vo.Board;

@Repository
public class BoardDAO {

	@Autowired
	SqlSession sqlSession;
	
	//게시판 정보 가져오기
	public ArrayList<Board> selectBoard(HashMap map, int startRecord, int countPerPage){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		ArrayList<Board> board = mapper.selectBoard(map,rb);
		
		return board;
		
	}
	//게시판 삭제
	public int deleteBoard(int board_index) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = mapper.deleteBoard(board_index);
		
		return result;
		
	}
	
	//게시판 검색
	public ArrayList<Board> searchBoard(HashMap map){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		ArrayList<Board> boardlist = mapper.searchBoard(map);
		
		return boardlist;

	}
	
	//총 갯수 가져오기
	public int getTotal(HashMap map){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = mapper.getTotal(map);
		
		return result;

	}
	//보드 세팅 가져오기
	public ArrayList<Board> selectBoardSetting(int startRecord, int countPerPage){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		ArrayList<Board> selectBoardSetting = mapper.selectBoardSetting(rb);
		
		return selectBoardSetting;
	}
	//보드 세팅 총갯수 가져오기
	public int getSettingTotal() {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = mapper.getSettingTotal();
		
		return result;
	}
	//게시판에 추가하기
	public int insertBoard(HashMap map) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		System.out.println("Dao 전");
		int result = mapper.insertBoard(map);
		System.out.println("Dao 후");
		return result;
		
	}
	
}
