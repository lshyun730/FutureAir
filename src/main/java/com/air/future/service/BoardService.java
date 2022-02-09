package com.air.future.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.air.future.dao.BoardDAO;
import com.air.future.vo.Board;

@Service
public class BoardService {
	
	
	@Autowired
	BoardDAO dao;
	
	public ArrayList<Board> selectBoard(){
		
		ArrayList<Board> board = dao.selectBoard();
		
		return board;
		
	}
	
	public int deleteBoard(int board_index) {
		
		int result = dao.deleteBoard(board_index);
		
		return result;
		
	}
	
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
	
	
}
