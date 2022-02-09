package com.air.future.service;

import java.util.ArrayList;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.air.future.dao.BoardDAO;
import com.air.future.dao.BoardMapper;
import com.air.future.vo.Board;
import com.air.future.service.*;


@Service
public class BoardService {
	
	
	@Autowired
	BoardDAO dao;
	
	
	//보드 매니저 가져오기
	public ArrayList<Board> selectBoard(HashMap<String, String> map,PageNavigator navi){
		
		ArrayList<Board> board = dao.selectBoard(map,navi.getStartRecord(),navi.getCountPerPage());
		
		return board;
		
	}
	
	//보드 매니저 삭제하기
	public int deleteBoard(int board_index) {
		
		int result = dao.deleteBoard(board_index);
		
		return result;
		
	}
	
	//미사용
	public ArrayList<Board> searchBoard(String board_status, String reply_status, String searchtext, String search1, String search2){
		
		HashMap<String, String> map = new HashMap<>();
		map.put("topic_type", board_status);
		map.put("reply_type", reply_status);
		map.put("title", searchtext);
		map.put("time1", search1);
		map.put("time2", search2);

		/*
		Board board = new Board();
		board.setTopic_type(board_status);
		board.setReply_type(reply_status);
		board.setTitle(searchtext);
		ArrayList<Board> boardlist = dao.searchBoard(board);
		*/
		ArrayList<Board> boardlist = dao.searchBoard(map);
		
		return boardlist;

	}
	
	//보드 매니저 총 갯수
	public int getTotal(String board_status,
						String reply_status, 
						String searchtext, 
						String search1, 
						String search2){
		
		HashMap<String, String> map = new HashMap<>();
		map.put("topic_type", board_status);
		map.put("reply_type", reply_status);
		map.put("title", searchtext);
		map.put("search1", search1);
		map.put("search2", search2);

		/*
		Board board = new Board();
		board.setTopic_type(board_status);
		board.setReply_type(reply_status);
		board.setTitle(searchtext);
		ArrayList<Board> boardlist = dao.searchBoard(board);
		*/
		int getTotal = dao.getTotal(map);
		
		return getTotal;

	}
	
	//보드 세팅 가져오기
	public ArrayList<Board> selectBoardSetting(PageNavigator navi){
		
		ArrayList<Board> selectBoardSetting = dao.selectBoardSetting(navi.getStartRecord(),navi.getCountPerPage());
		
		return selectBoardSetting;
	}
	//보드 갯수 총 개수
	public int getSettingTotal() {
		
		int result = dao.getSettingTotal();
		
		return result;
	}
	
	//게시판 추가하기
	public int insertBoard(HashMap map) {
		System.out.println("서비스 전");
		int result = dao.insertBoard(map);
		
		return result;
		
	}
	
}
