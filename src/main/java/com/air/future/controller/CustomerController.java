package com.air.future.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.air.future.service.CustomerService;
import com.air.future.vo.Customer;

@SessionAttributes("customer")
@Controller
public class CustomerController {
	
	@Autowired
	CustomerService service;
	
	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "customer/login";
	}
  
	// 로그인 액션
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginAction(String id, String password, Model model, HttpSession session) {
		Customer customer = service.loginAction(id, password);
		if(customer == null) {
			model.addAttribute("errorMsg", "아이디 혹은 비밀번호가 잘못되었습니다.");
			return "customer/login";
		} 
		session.setAttribute("customer", customer);
		return "redirect:/";
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
	
	// 마이페이지
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage(@ModelAttribute("customer") Customer customer, Model model) {
		int mileage = service.getMyMileage(customer.getCustomer_id());
		ArrayList<HashMap<String, String>> myReservationList = service.getMyReservationList(customer.getCustomer_id());
		ArrayList<HashMap<String, String>> myQnAList = service.getMyQnAList(customer.getCustomer_id());
		
		model.addAttribute("mileage", mileage);
		model.addAttribute("myReservationList", myReservationList);
		model.addAttribute("myQnAList", myQnAList);
		
		System.out.println(myQnAList);
		
		return "customer/mypage";
	}
		
  
	
}
