package com.air.future.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.air.future.service.AdminBoardService;
import com.air.future.service.PageNavigator;
import com.air.future.vo.Admin;
import com.air.future.vo.Board;
import com.air.future.vo.Post;

@RequestMapping(value = "admin/board")
@Controller
public class AdminBoardController {
	
	@Autowired
	AdminBoardService service;
	
	final int countPerPage = 10; // 페이지 당 글 수
	final int pagePerGroup = 5; // 페이지 이동 그룹 당 표시할 페이지 수
	
/* 
--------------
게시물관리 페이지
-------------- 
*/		
	// 게시물관리 페이지 이동
	@RequestMapping(value = "postList", method = RequestMethod.GET)
	public String boardManager(@RequestParam(value = "page", defaultValue = "1") int page,
								@RequestParam(value = "post_date_start", defaultValue = "") String post_date_start,
								@RequestParam(value = "post_date_end", defaultValue = "") String post_date_end,
								@RequestParam(value = "board_name", defaultValue = "전체")String board_name,
								@RequestParam(value = "reply_type", defaultValue = "전체")String reply_type, 
								@RequestParam(value = "search_text", defaultValue = "") String searchtext,
								Model model) {
		
		// 전달받은 파라미터 저장
		HashMap<String, String> searchList = new HashMap<>(); 
		searchList.put("post_date_start", post_date_start);
		searchList.put("post_date_end", post_date_end);
		searchList.put("board_name", board_name);
		searchList.put("reply_type", reply_type);
		searchList.put("search_text", searchtext);
		
		int total = service.getTotal(searchList); // 게시물 갯수
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); // 페이징처리
		ArrayList<HashMap<String, String>> postList = service.getPostList(searchList,navi); // 게시물리스트
		ArrayList<String> boardList = service.getTopicList(); // 게시판이름리스트
		
		model.addAttribute("searchList", searchList);
		model.addAttribute("postList", postList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("navi", navi);
		
		return "admin/board/postList";
	}
	
	//게시물 리스트 삭제
	@RequestMapping(value = "deletePost", method = RequestMethod.POST)
	@ResponseBody
	public int boardDelete(HttpServletRequest request) {
		String[] deleteList = request.getParameterValues("deleteList"); // 삭제할 게시물 번호 리스트
		int result = service.deletePost(deleteList); // 게시물 삭제
		return result;
	}
	
	// 게시글 수정 이동
	@RequestMapping(value = "postUpdate", method = RequestMethod.GET)
	public String postUpdate(String post_index, String board_name, Model model) {
		ArrayList<String> boardList = service.getTopicList(); // 게시판 이름 리스트
		Post post = service.getPost(post_index); // 게시물 정보
		
		model.addAttribute("post", post);
		model.addAttribute("board_name", board_name);
		model.addAttribute("boardList", boardList);
		return "admin/board/postUpdate";
	}
	//게시글 수정하기 버튼 기능 수행
	@RequestMapping(value = "funPostUpdate", method = RequestMethod.GET)
	public String funPostUpdate(int post_index, String board_title,String post_type ,String writer ,
								String contents ,String board_name ,Model model) {
		Post post = new Post();
		post.setContents(contents);
		post.setPost_index(post_index);
		post.setTitle(board_title);
		post.setBoard_name(board_name);
		post.setWriter(writer);
		post.setPost_type(post_type);
		
		int result = service.funPostUpdate(post);
		
		return "redirect:/admin/board/postList";
	}
		
	
/* 
--------------
게시판 설정
-------------- 
*/	
	// 게시판설정 페이지 이동
	@RequestMapping(value = "boardList", method = RequestMethod.GET)
	public String boardSetting(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {

		int settingTotal = service.getSettingTotal(); // 게시판 갯수
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, settingTotal); //페이징처리
		ArrayList<HashMap<String, String>> boardList = service.getBoardList(navi); // 게시판 리스트
		
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("navi", navi);
		return "admin/board/boardList";
	}

	// 게시판삭제
	@RequestMapping(value = "deleteBoard", method = RequestMethod.POST)
	@ResponseBody
	public int deleteBoard(HttpServletRequest request) {
		String[] deleteList = request.getParameterValues("deleteList"); // 삭제할 게시판 이름 리스트
		int result = service.deleteBoard(deleteList); // 게시판 삭제
		return result;
	}
	
	// 게시판 추가
	@RequestMapping(value = "insertBoard", method = RequestMethod.POST)
	public String insertBoard(Board board) {
		service.insertBoard(board); // 게시판 추가
		return "redirect:/admin/board/boardList";
	}
	
	

	
/* 
--------------
게시판 설정 - 팝업
-------------- 
*/	
	// 게시판관리 - 글쓰기
	@RequestMapping(value = "postWrite", method = RequestMethod.GET)
	public String postWrite(String board_name, Model model) {
		ArrayList<String> boardList = service.getTopicList(); // 게시판 이름 리스트
		
		model.addAttribute("board_name", board_name);
		model.addAttribute("boardList", boardList);
		return "admin/board/postWrite";
	}
	
	//게시판 글쓰기 기능 구현
	@RequestMapping(value = "funpostWrite", method = RequestMethod.GET)
	public String funpostWrite(Model model, String board_title, String board_name, String post_type, String contents) {
		Admin admin = service.getAdmin();
		String writer = admin.getAdmin_id();
		Post post = new Post();
		post.setBoard_name(board_name);
		post.setContents(contents);
		post.setPost_type(post_type);
		post.setTitle(board_title);
		post.setWriter(writer);
		
		int result = service.insertPost(post);
		
		
		return "redirect:/admin/board/postList";
	}
	
	// 게시판관리 - 공지글
	@RequestMapping(value = "postNotice", method = RequestMethod.GET)
	public String postNotice(@RequestParam(value = "page", defaultValue = "1") int page, String board_name, Model model) {
		
		int total = service.getPostTotalByBoard(board_name); // 게시물 갯수
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); // 페이징처리	
		ArrayList<Post> noticeList = service.getNoticeList(board_name); // 공지글 리스트
		ArrayList<Post> postList = service.getPostListByBoard(board_name, navi); // 게시글 리스트
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("postList", postList);
		model.addAttribute("navi", navi);
		model.addAttribute("board_name", board_name);
		
		return "admin/board/postNotice";
	}
	//게시판 관리 - 공지글 추가 기능
	@RequestMapping(value = "insertNotice", method = RequestMethod.GET)
	public String insertNotice(Model model, int tableSelect[],String board_name) {

		for( int string : tableSelect) {
			String notice_index = "1";
			Post post = new Post();
			post.setNotice_index(notice_index);
			post.setPost_index(string);
			int result = service.insertNotice(post);
			
		}

		model.addAttribute("board_name", board_name);
		
		return "redirect:/admin/board/postNotice";
	}
	
	//게시판 관리 - 공지글 삭제 기능
	@RequestMapping(value = "deleteNotice", method = RequestMethod.GET)
	public String deleteNotice(Model model, int post_index[],String board_name) {
		
		for( int string : post_index) {
			String notice_index = "0";
			Post post = new Post();
			post.setNotice_index(notice_index);
			post.setPost_index(string);
			int result = service.insertNotice(post);
			
		}

		model.addAttribute("board_name", board_name);
		
		return "redirect:/admin/board/postNotice";
	}
		
	// 게시판 수정 이동
	@RequestMapping(value = "updateBoard", method = RequestMethod.GET)
	public String updateBoard(String board_name,int board_id,String board_type ,Model model,String reply_type
							 ,String write_right, String read_right) {
		Board board = service.getBoard(board_name); // 게시판 정보
		model.addAttribute("board", board);
		return "admin/board/boardUpdate";
	}
	
	//게시판 수정하기 버튼 기능
	@RequestMapping(value = "funUpdateBoard", method = RequestMethod.GET)
	public String funUpdateBoard(String board_name,int board_id,String board_type ,Model model,String reply_type
			 					,String write_right, String read_right) {
		Board updateBoard = new Board();
		updateBoard.setBoard_id(board_id);
		updateBoard.setBoard_name(board_name);
		updateBoard.setBoard_type(board_type);
		updateBoard.setRead_right(read_right);
		updateBoard.setReply_type(reply_type);
		updateBoard.setWrite_right(write_right);
		int result = service.updateBoard(updateBoard);
		
		return "redirect:/admin/board/boardList";
	}
	
	
	
}
