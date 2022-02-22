package com.air.future.dao;

import java.util.ArrayList;

import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.air.future.vo.Admin;
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
	public int deletePost(String post_index) {
		AdminBoardMapper mapper = sqlSession.getMapper(AdminBoardMapper.class);
		int result = mapper.deletePost(post_index);
		return result;
	}
	
	// 게시판 이름 리스트
	public ArrayList<String> getTopicList(){
		AdminBoardMapper mapper = sqlSession.getMapper(AdminBoardMapper.class);
		ArrayList<String> topicList = mapper.getTopicList();	
		return topicList;		
	}
	
	// 총 갯수 가져오기
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
	
	// 게시판 수정
	@Transactional
	public int updateBoard(HashMap<String, String> boardForm) {
		AdminBoardMapper mapper = sqlSession.getMapper(AdminBoardMapper.class);
		mapper.updateBoard(boardForm);
		int result = updatePostBoardName(boardForm.get("board_name_old"), boardForm.get("board_name"));
		return result;
	}
	
	// 게시글 제목수정 - 게시판 수정시
	public int updatePostBoardName(String board_name_old, String board_name) {
		AdminBoardMapper mapper = sqlSession.getMapper(AdminBoardMapper.class);
		HashMap<String, String> change =  new HashMap<>();
		change.put("board_name_old", board_name_old);
		change.put("board_name", board_name);
		int result = mapper.updatePostBoardName(change);
		return result;
	}
	
	@Transactional
	public int deleteBoard(String board_name) {
		AdminBoardMapper mapper = sqlSession.getMapper(AdminBoardMapper.class);
		mapper.deletePostByBoardname(board_name);
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

	public Post getPost(String post_index) {
		AdminBoardMapper mapper = sqlSession.getMapper(AdminBoardMapper.class);
		Post post = mapper.getPost(post_index);
		return post;
	}
	

	
	//게시물 관리 수정하기
	public int PostUpdate(HashMap<String, String>  post) {
		AdminBoardMapper mapper = sqlSession.getMapper(AdminBoardMapper.class);
		int result = mapper.PostUpdate(post);
		return result;
	}
	
	//관리자 정보 가져오기
	public Admin getAdmin() {
		AdminBoardMapper mapper = sqlSession.getMapper(AdminBoardMapper.class);
		Admin admin = mapper.getAdmin();
		return admin;
	}
	
	//게시판 설정에서 게시물 추가하기
	public int insertPost(HashMap<String, String> post) {
		AdminBoardMapper mapper = sqlSession.getMapper(AdminBoardMapper.class);
		int result = mapper.insertPost(post);
		
		return result;
	}
	
	// 고정글 추가하기
	public int insertNotice(Post post) {
		AdminBoardMapper mapper = sqlSession.getMapper(AdminBoardMapper.class);
		int result = mapper.insertNotice(post);
		return result;
	}
	
	
	
}
