package com.air.future.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.air.future.service.HomeControllerService;

@SessionAttributes("userId")
@Controller
public class HomeController {
	
	@Autowired
	HomeControllerService service;
	
	
	
	// 메인홈페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session) {
		return "home";
	}
	
	
	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "customer/login";
	}
  
	// 로그인 액션
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginAction(@RequestParam(value="id", defaultValue = "") String id
								, @RequestParam(value="password", defaultValue = "") String password
								, Model model, HttpSession session) {
		int result = service.loginAction(id, password);
		if(result == 1) {
			session.setAttribute("userId", id);
			return "redirect:/";
		} 
		model.addAttribute("errorMsg", "아이디 혹은 비밀번호가 잘못되었습니다.");
		return "customer/login";
	}
  
	// 로그아웃
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	// 회원가입 - 회원동의
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "customer/joinAgree";
	}

	// 회원가입 - 정보입력
	@RequestMapping(value = "joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "customer/joinForm";
	}
  
	// 회원가입 ID중복 AJAX 처리
	@ResponseBody
	@RequestMapping(value = "validateIdAjax", method = RequestMethod.GET)
	public int validateIdAjax(String id) {
		
		int result = service.validateIdAjax(id);
		return result;
	}
  
	// 회원가입 처리
	@RequestMapping(value = "joinForm", method = RequestMethod.POST)
	public String joinForm(@RequestParam(value="customer_id", defaultValue = "") String customer_id
							, @RequestParam(value="customer_name", defaultValue = "") String customer_name
							, @RequestParam(value="customer_pw", defaultValue = "") String customer_pw
							, @RequestParam(value="customer_phone", defaultValue = "") String customer_phone
							, @RequestParam(value="customer_birth", defaultValue = "") String customer_birth
							, @RequestParam(value="customer_gender", defaultValue = "") String customer_gender
							, @RequestParam(value="customer_email", defaultValue = "") String customer_email
							, @RequestParam(value="customer_country", defaultValue = "") String customer_country
							, @RequestParam(value="customer_address", defaultValue = "") String customer_address
							, Model model) {
		
		int result = service.joinForm(customer_id, customer_name, customer_pw, customer_phone, customer_birth
										, customer_gender, customer_email , customer_country, customer_address);
		if(result == 1) {
			model.addAttribute("newId", customer_id);
			model.addAttribute("newName", customer_name);
			return "customer/joinDone";
		} else {
			return "customer/joinForm";
		}

	}
  
	/*
	// 회원가입 완료 창
	
	// 회원가입 - 완료
	@RequestMapping(value = "joinDone", method = RequestMethod.GET)
	public String joinDone(Model model) {
		return "customer/joinDone";
	}
	*/
	
	// 로그아웃
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage() {
		return "customer/mypage";
	}
		
	

}
