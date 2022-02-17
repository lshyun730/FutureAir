package com.air.future.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	// 메인홈페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home( ) {
		return "home";
	}
	
	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "customer/login";
	}
	
	// 회원가입
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "customer/joinAgree";
	}
	
	@RequestMapping(value = "joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "customer/joinForm";
	}
	
	@RequestMapping(value = "joinDone", method = RequestMethod.GET)
	public String joinDone() {
		return "customer/joinDone";
	}

}
