package com.air.future.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.air.future.service.ServiceService;
import com.air.future.util.PageNavigator;
import com.air.future.vo.Post;

@RequestMapping(value="service")
@Controller
public class ServiceController {
	
	@Autowired
	ServiceService service;
	
	final int countPerPage = 10;	
	final int pagePerGroup = 10;	

// 공지사항
	@RequestMapping(value = "notice",  method = RequestMethod.GET)
	public String notice(@RequestParam(value="page", defaultValue="1") int page, @RequestParam(value="searchText", defaultValue="") String searchText, Model model) {
		int total = service.getNoticeListCount(searchText);;
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); 
		ArrayList<Post> fixList = service.getFixList();
		ArrayList<Post> noticeList = service.getNoticeList(searchText, navi);
		
		model.addAttribute("fixList", fixList);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("navi", navi);
		model.addAttribute("searchText", searchText);
		return "service/notice";
	}

	
// 자주묻는질문
	@RequestMapping(value = "faq",  method = RequestMethod.GET)
	public String faq(Model model) {
		ArrayList<String> postType = service.getPostType();
		ArrayList<ArrayList<Post>> faqList = service.getfaqList();
		
		model.addAttribute("postType", postType);
		model.addAttribute("faqList", faqList);
		return "service/faq";
	}
	
// 마이페이지
	
	
}
