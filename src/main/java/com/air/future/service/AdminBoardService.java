package com.air.future.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.air.future.dao.AdminBoardDAO;
import com.air.future.vo.Board;
import com.air.future.vo.Post;


@Service
public class AdminBoardService {
	
	
	@Autowired
	AdminBoardDAO dao;
	
/* 
--------------
게시물관리 페이지
-------------- 
*/		
	// 게시글 가져오기
	public ArrayList<HashMap<String, String>> getPostList(HashMap<String, String> searchList,PageNavigator navi){		
		ArrayList<HashMap<String, String>> postList = dao.getPostList(searchList,navi.getStartRecord(),navi.getCountPerPage());		
		return postList;
	}
	
	// 게시글 삭제하기
	public int deletePost(String[] deleteList) {
		int result = 0;
		for (String board_index : deleteList) {
			result = dao.deletePost(board_index);
			if(result == 0) return 0;
		}
		return result;
		
	}
	
	// 게시판 이름 리스트
	public ArrayList<String> getTopicList(){		
		ArrayList<String> topicList = dao.getTopicList();		
		return topicList;
	}
	
	// 게시글 총 갯수
	public int getTotal(HashMap<String, String> searchList){
		int getTotal = dao.getTotal(searchList);
		return getTotal;
	}

	
/* 
--------------
게시판설정 페이지
-------------- 
*/	
	// 게시판 리스트
	public ArrayList<HashMap<String, String>> getBoardList(PageNavigator navi){
		ArrayList<HashMap<String, String>> boardList = dao.getBoardList(navi.getStartRecord(),navi.getCountPerPage());
		return boardList;
	}
	
	// 게시판 리스트 갯수
	public int getSettingTotal() {
		int result = dao.getSettingTotal();
		return result;
	}
	
	// 게시판 삭제하기
	public int deleteBoard(String[] deleteList) {
		int result = 0;
		for (String reply_type : deleteList) {
			result = dao.deleteBoard(reply_type);
			if(result == 0) return 0;
		}
		return result;
	}
	
	// 게시판 추가하기
	public int insertBoard(Board board) {
		int result = dao.insertBoard(board);
		return result;
	}
	
	// 게시판 정보
	public Board getBoard(String board_name) {
		Board board = dao.getBoard(board_name);
		return board;
	}

	public int getPostTotalByBoard(String board_name) {
		int total = dao.getPostTotalByBoard(board_name);
		return total;
	}

	public ArrayList<Post> getPostListByBoard(String board_name, PageNavigator navi) {
		ArrayList<Post> postList = dao.getPostListByBoard(board_name, navi.getStartRecord(),navi.getCountPerPage());
		return postList;
	}

	public ArrayList<Post> getNoticeList(String board_name) {
		ArrayList<Post> noticeList = dao.getNoticeList(board_name);
		return noticeList;
	}

	public Post getPost(String post_index) {
		Post post = dao.getPost(post_index);
		return post;
	}

	
}
