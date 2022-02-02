package com.air.future.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.air.future.service.BoardService;
import com.air.future.vo.Board;

@RequestMapping(value = "admin")
@Controller
public class BoardController {
	
	@Autowired
	BoardService service;
	
	//보드 매니저 페이지 불러오기
	@RequestMapping(value = "board/boardManager", method = RequestMethod.GET)
	public String boardManager(Model model) {
				
		//게시판 불러오기
		ArrayList<Board> boardList = service.selectBoard();		
		//게시판 정보 모델에 저장하기
		model.addAttribute("boardList", boardList);
		return "admin/board/boardManager";
	}
	
	//게시판 삭제하기
	@RequestMapping(value = "board/delete", method = RequestMethod.GET)
	public String boardDelete(Model model, int[] boardCheck) {
		
		for(int s : boardCheck) {
			int result  = service.deleteBoard(s);
			
		}
		ArrayList<Board> boardList = service.selectBoard();	
		model.addAttribute("boardList", boardList);
		return "admin/board/boardManager";
	}
	
	//보드 세팅 페이지 불러오기
	@RequestMapping(value = "board/boardSetting", method = RequestMethod.GET)
	public String boardSetting(Model model) {
		//보드 세팅 내역 불러오기
		ArrayList<Board> boardList = service.selectBoard();
		
		//보드 세팅 내역 모델에 저장하기
		model.addAttribute("boardList", boardList);
		
		return "admin/board/boardSetting";
	}
	
	@RequestMapping(value = "board/searchBoard", method = RequestMethod.POST)
	public String searchBoard(Model model, String board_status, String reply_status, String searchtext, String search1, String search2) {
		
		ArrayList<Board> boardList = service.searchBoard(board_status, reply_status, searchtext, search1, search2);
		//보드 세팅 내역 모델에 저장하기
		model.addAttribute("boardList", boardList);
		
		return "admin/board/boardManager";
	}
	
	
	
}
