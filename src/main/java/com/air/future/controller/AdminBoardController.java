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
	@RequestMapping(value = "boardManager", method = RequestMethod.GET)
	public String boardManager(@RequestParam(value = "page", defaultValue = "1") int page,
								@RequestParam(value = "post_date_start", defaultValue = "") String post_date_start,
								@RequestParam(value = "post_date_end", defaultValue = "") String post_date_end,
								@RequestParam(value = "board_name", defaultValue = "전체")String board_name,
								@RequestParam(value = "reply_type", defaultValue = "전체")String reply_type, 
								@RequestParam(value = "search_text", defaultValue = "") String searchtext,
								Model model) {
		
		HashMap<String, String> searchList = new HashMap<>();
		searchList.put("post_date_start", post_date_start);
		searchList.put("post_date_end", post_date_end);
		searchList.put("board_name", board_name);
		searchList.put("reply_type", reply_type);
		searchList.put("search_text", searchtext);
		
		System.out.println(searchList);
		int total = service.getTotal(searchList);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);		
		ArrayList<HashMap<String, String>> postList = service.getPostList(searchList,navi);	
		ArrayList<String> topicList = service.getTopicList();
		
		model.addAttribute("searchList", searchList);
		model.addAttribute("postList", postList);
		model.addAttribute("topicList", topicList);
		model.addAttribute("navi", navi);
		
		return "admin/board/boardManager";
	}
	
	//게시물 삭제하기
	@RequestMapping(value = "deletePost", method = RequestMethod.POST)
	@ResponseBody
	public int boardDelete(HttpServletRequest request) {
		String[] deleteList = request.getParameterValues("deleteList");
		int result = service.deletePost(deleteList);
		return result;
	}
		
	
/* 
--------------
게시판설정 페이지
-------------- 
*/	
	// 게시판설정 페이지 이동
	@RequestMapping(value = "boardSetting", method = RequestMethod.GET)
	public String boardSetting(@RequestParam(value = "page", defaultValue = "1") int page,
								Model model) {

		int settingTotal = service.getSettingTotal();
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, settingTotal);
		ArrayList<HashMap<String, String>> boardList = service.getBoardList(navi);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("navi", navi);
		return "admin/board/boardSetting";
	}

	// 게시판삭제
	@RequestMapping(value = "deleteBoard", method = RequestMethod.POST)
	@ResponseBody
	public int deleteBoard(HttpServletRequest request) {
		String[] deleteList = request.getParameterValues("deleteList");
		int result = service.deleteBoard(deleteList);
		return result;
	}
	
	// 게시물관리 - 글삭제
	@RequestMapping(value = "boardSettingDelete", method = RequestMethod.GET)
	public String boardSettingDelete(String topic_type) {
		return "admin/board/boardSettingDelete";
	}
	
	// 게시물관리 - 공지글지정
	@RequestMapping(value = "boardSettingNotice", method = RequestMethod.GET)
	public String boardSettingNotice(String topic_type) {
		return "admin/board/boardSettingNotice";
	}
		
		
	// 게시판 추가
	@RequestMapping(value = "insertBoard", method = RequestMethod.POST)
	public String insertBoard(Board board) {
		service.insertBoard(board);
		return "redirect:/admin/board/boardSetting";
	}
}
