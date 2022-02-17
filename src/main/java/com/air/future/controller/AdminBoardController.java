package com.air.future.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.air.future.service.AdminBoardService;
import com.air.future.service.PageNavigator;
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
		
	// 게시판 수정 이동
	@RequestMapping(value = "updateBoard", method = RequestMethod.GET)
	public String updateBoard(String board_name, Model model) {
		Board board = service.getBoard(board_name); // 게시판 정보
		model.addAttribute("board", board);
		return "admin/board/boardUpdate";
	}
}
