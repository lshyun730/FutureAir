package com.air.future.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.air.future.service.BoardService;
import com.air.future.service.PageNavigator;
import com.air.future.vo.Admin;
import com.air.future.vo.Board;

@RequestMapping(value = "admin")
@Controller
public class BoardController {
	
	@Autowired
	BoardService service;
	
	final int countPerPage = 10; // 페이지 당 글 수
	final int pagePerGroup = 5; // 페이지 이동 그룹 당 표시할 페이지 수
	
	
	//보드 매니저 페이지 불러오기
	@RequestMapping(value = "board/boardManager", method = RequestMethod.GET)
	public String boardManager(@RequestParam(value = "page", defaultValue = "1") int page,
								@RequestParam(value = "topic_type", defaultValue = "전체")String board_status,
								@RequestParam(value = "reply_type", defaultValue = "전체")String reply_status, 
								@RequestParam(value = "searchtext", defaultValue = "") String searchtext,
								@RequestParam(value = "search1", defaultValue = "") String search1,
								@RequestParam(value = "search2", defaultValue = "") String search2,
								Model model) {
		
		
		int total = service.getTotal(board_status, reply_status, searchtext, search1, search2);
		//System.out.println(total);
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		HashMap<String, String> map = new HashMap<>();
		map.put("topic_type", board_status);
		map.put("reply_type", reply_status);
		map.put("title", searchtext);
		map.put("time1", search1);
		map.put("time2", search2);
		
		
		//게시판 불러오기
		ArrayList<Board> boardList = service.selectBoard(map,navi);	

		//게시판 정보 모델에 저장하기
		model.addAttribute("map", map);
		model.addAttribute("boardList", boardList);
		model.addAttribute("navi", navi);
		
		return "admin/board/boardManager";
	}
	
	//게시판 삭제하기
	@RequestMapping(value = "board/delete", method = RequestMethod.GET)
	public String boardDelete(Model model, int[] boardCheck,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "topic_type", defaultValue = "전체")String board_status,
			@RequestParam(value = "reply_type", defaultValue = "전체")String reply_status, 
			@RequestParam(value = "searchtext", defaultValue = "") String searchtext, 
			@RequestParam(value = "time1", defaultValue = "") String search1, 
			@RequestParam(value = "time2", defaultValue = "") String search2) {
		
		for(int s : boardCheck) {
			int result  = service.deleteBoard(s);
			
		}
		HashMap<String, String> map = new HashMap<>();
		map.put("topic_type", board_status);
		map.put("reply_type", reply_status);
		map.put("title", searchtext);
		map.put("time1", search1);
		map.put("time2", search2);
		
		
		
		int total = service.getTotal(board_status, reply_status, searchtext, search1, search2);
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		ArrayList<Board> boardList = service.selectBoard(map,navi);	
		model.addAttribute("boardList", boardList);
		model.addAttribute("navi", navi);
		
		return "admin/board/boardManager";
	}
	
	//보드 세팅 페이지 불러오기
	@RequestMapping(value = "board/boardSetting", method = RequestMethod.GET)
	public String boardSetting(@RequestParam(value = "page", defaultValue = "1") int page,
								Model model) {
		//보드 세팅 총 갯수 가져오기
		int settingTotal = service.getSettingTotal();
		System.out.println(settingTotal);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, settingTotal);
		
		//보드 세팅 내역 불러오기
		ArrayList<Board> boardList = service.selectBoardSetting(navi);
		
		//보드 세팅 내역 모델에 저장하기
		model.addAttribute("boardList", boardList);
		model.addAttribute("navi", navi);
		return "admin/board/boardSetting";
	}
	
	//미사용
	@RequestMapping(value = "board/searchBoard", method = RequestMethod.POST)
	public String searchBoard(Model model, String board_status, String reply_status, String searchtext, String search1, String search2) {
		
		ArrayList<Board> boardList = service.searchBoard(board_status, reply_status, searchtext, search1, search2);
		//보드 세팅 내역 모델에 저장하기
		model.addAttribute("boardList", boardList);
		
		return "admin/board/boardManager";
	}
	
	//게시판 작성자 이동 버튼
		@RequestMapping(value = "board/customerInfo", method = RequestMethod.GET)
		public String customerinfo() {
			
			
			
			return "admin/customer/customerInfo";
		}
		
	
	//게시판 추가 버튼
	@RequestMapping(value = "board/boardSettingNotice", method = RequestMethod.GET)
	public String boardSettingNotice() {
		
		
		
		return "admin/board/boardSettingNotice";
	}
	
	
	//보드세팅에서 삭제하기 버튼
	@RequestMapping(value = "board/boardSettingDelete", method = RequestMethod.GET)
	public String boardSettingDelete(Model model, int[] boardCheck) {
		
		for(int check : boardCheck) {
			System.out.println(check);
		}
		
		
		return "admin/board/boardSetting";
	}
	
	@RequestMapping(value = "board/insertBoard", method = RequestMethod.GET)
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
		ArrayList<Board> boardList = service.selectBoardSetting(navi);
				
		//보드 세팅 내역 모델에 저장하기
		model.addAttribute("boardList", boardList);
		model.addAttribute("navi", navi);
		
		return "admin/board/boardSetting";
	}
	
	
	
}
