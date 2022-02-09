package com.air.future.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.air.future.service.AdminBoardService;
import com.air.future.service.PageNavigator;
import com.air.future.vo.Admin;
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
								@RequestParam(value = "board_date_start", defaultValue = "") String search1,
								@RequestParam(value = "board_date_end", defaultValue = "") String search2,
								@RequestParam(value = "topic_type", defaultValue = "전체")String topic_type,
								@RequestParam(value = "reply_type", defaultValue = "전체")String reply_type, 
								@RequestParam(value = "search_text", defaultValue = "") String searchtext,
								Model model) {
		
		HashMap<String, String> searchList = new HashMap<>();
		searchList.put("board_date_start", search1);
		searchList.put("board_date_end", search2);
		searchList.put("topic_type", topic_type);
		searchList.put("reply_type", reply_type);
		searchList.put("search_text", searchtext);
		
		int total = service.getTotal(searchList);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);		
		ArrayList<Board> postList = service.getPostList(searchList,navi);	
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

	//게시판 추가
	@RequestMapping(value = "boardSettingNotice", method = RequestMethod.GET)
	public String boardSettingNotice() {
		return "admin/board/boardSettingNotice";
	}
	
	
	//게시물 삭제하기
	@RequestMapping(value = "deleteBoard", method = RequestMethod.POST)
	@ResponseBody
	public int deleteBoard(HttpServletRequest request) {
		String[] deleteList = request.getParameterValues("deleteList");
		int result = service.deleteBoard(deleteList);
		return result;
	}
	
	
	// 게시판 추가
	@RequestMapping(value = "insertBoard", method = RequestMethod.GET)
	public String insertBoard(@RequestParam(value = "page", defaultValue = "1") int page,
								Model model,String title, String topic_type, String contents) {
		String writer = "admin";
		System.out.println(title);
		System.out.println(topic_type);
		System.out.println(contents);
		System.out.println(writer);
		
		
		HashMap<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("topic_type",topic_type);
		map.put("contents",contents);
		map.put("writer",writer);
		
		int result = service.insertBoard(map);
		
		//보드 세팅 총 갯수 가져오기
		int settingTotal = service.getSettingTotal();
		System.out.println(settingTotal);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, settingTotal);
				
		//보드 세팅 내역 불러오기
		ArrayList<HashMap<String, String>> boardList = service.getBoardList(navi);
				
		//보드 세팅 내역 모델에 저장하기
		model.addAttribute("boardList", boardList);
		model.addAttribute("navi", navi);
		
		return "admin/board/boardSetting";
	}
}
