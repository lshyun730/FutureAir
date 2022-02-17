package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.air.future.vo.Admin;
import com.air.future.vo.Board;
import com.air.future.vo.Post;

public interface AdminBoardMapper {
	
	// 게시물 리스트
	public ArrayList<HashMap<String, String>> getPostList(HashMap<String, String> searchList,RowBounds rb);
	
	// 게시물 총 갯수
	public int getTotal(HashMap<String, String> map);
	
	// 게시판 종류리스트
	public ArrayList<String> getTopicList();
	
	// 게시물 삭제
	public int deletePost(String board_index);
	
	// 게시글 정보
	public Post getPost(String post_index);	

	
	// 게시판 리스트
	public ArrayList<HashMap<String, String>> getBoardList(RowBounds rb);
	
	// 게시판 총 갯수
	public int getSettingTotal();
	
	// 게시판 삭제
	public int deleteBoard(String board_name);
	
	// 게시판 추가하기
	public int insertBoard(Board board);
	
	// 게시판 정보
	public Board getBoard(String board_name);
	
	// 게시판 게시글 리스트 갯수
	public int getPostTotalByBoard(String board_name);
	
	// 게시판 게시글 리스트
	public ArrayList<Post> getPostListByBoard(String board_name, RowBounds rb);

	// 게시판 공지글 리스트
	public ArrayList<Post> getNoticeList(String board_name);
	
	//게시판 설정 수정하기
	public int updateBoard(Board board);
	
	//게시물 관리 수정하기
	public int funPostUpdate(Post post);
	
	//관리자 아이디 가져오기
	public Admin getAdmin();
	
	//게시판 설정에서 게시물 추가하기
	public int insertPost(Post post);
	
	//고정글 추가하기
	public int insertNotice(Post post);

	
}
