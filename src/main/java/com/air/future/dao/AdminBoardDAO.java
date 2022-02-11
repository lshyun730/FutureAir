package com.air.future.dao;

import java.util.ArrayList;

import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.air.future.vo.Board;
import com.air.future.vo.Post;

@Repository
public class AdminBoardDAO {

	@Autowired
	SqlSession sqlSession;
	
/* 
--------------
게시물관리 페이지
-------------- 
*/		
	// 게시물 정보 가져오기
	public ArrayList<HashMap<String, String>> getPostList(HashMap<String, String> searchList, int startRecord, int countPerPage){
		AdminBoardMapper mapper = sqlSession.getMapper(AdminBoardMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		ArrayList<HashMap<String, String>> postList = mapper.getPostList(searchList,rb);
		return postList;		
	}
	
	// 게시물 삭제
	public int deletePost(String board_index) {
		AdminBoardMapper mapper = sqlSession.getMapper(AdminBoardMapper.class);
		int result = mapper.deletePost(board_index);
		return result;
	}
	
	// 게시판 이름 리스트
	public ArrayList<String> getTopicList(){
		AdminBoardMapper mapper = sqlSession.getMapper(AdminBoardMapper.class);
		ArrayList<String> topicList = mapper.getTopicList();	
		return topicList;		
	}
	
	//총 갯수 가져오기
	public int getTotal(HashMap<String, String> map){
		AdminBoardMapper mapper = sqlSession.getMapper(AdminBoardMapper.class);
		int result = mapper.getTotal(map);
		return result;

	}

/* 
--------------
게시판설정 페이지
-------------- 
*/	
	// 게시판 리스트
	public ArrayList<HashMap<String, String>> getBoardList(int startRecord, int countPerPage){
		AdminBoardMapper mapper = sqlSession.getMapper(AdminBoardMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		ArrayList<HashMap<String, String>> boardList = mapper.getBoardList(rb);
		return boardList;
	}
	
	// 게시판 리스트 갯수
	public int getSettingTotal() {
		AdminBoardMapper mapper = sqlSession.getMapper(AdminBoardMapper.class);
		int result = mapper.getSettingTotal();
		return result;
	}
	
	// 게시판 추가하기
	public int insertBoard(Board board) {
		AdminBoardMapper mapper = sqlSession.getMapper(AdminBoardMapper.class);
		int result = mapper.insertBoard(board);
		return result;
		
	}

	public int deleteBoard(String board_name) {
		AdminBoardMapper mapper = sqlSession.getMapper(AdminBoardMapper.class);
		int result = mapper.deleteBoard(board_name);
		return result;
	}

	public Board getBoard(String board_name) {
		AdminBoardMapper mapper = sqlSession.getMapper(AdminBoardMapper.class);
		Board board = mapper.getBoard(board_name);
		return board;
	}

	public int getPostTotalByBoard(String board_name) {
		AdminBoardMapper mapper = sqlSession.getMapper(AdminBoardMapper.class);
		int result = mapper.getPostTotalByBoard(board_name);
		return result;
	}

	public ArrayList<Post> getPostListByBoard(String board_name, int startRecord, int countPerPage) {
		AdminBoardMapper mapper = sqlSession.getMapper(AdminBoardMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		ArrayList<Post> postList = mapper.getPostListByBoard(board_name, rb);
		return postList;
	}

	public ArrayList<Post> getNoticeList(String board_name) {
		AdminBoardMapper mapper = sqlSession.getMapper(AdminBoardMapper.class);
		ArrayList<Post> noticeList = mapper.getNoticeList(board_name);
		return noticeList;
	}
	
}
