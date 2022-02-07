package com.air.future.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.air.future.service.CustomerService;
import com.air.future.vo.Customer;
import com.air.future.vo.Grade;

@Transactional
@RequestMapping(value = "admin/customer")
@Controller
public class AdminCustomerController {

	@Autowired
	CustomerService service;
	
	// 회원정보 이동 및 회원정보 전체 불러오기(customerList.jsp)
	@RequestMapping(value = "customerList", method = RequestMethod.GET)
	public String customerList(Model model) {
		ArrayList<Customer> customerListAll = service.customerListAll();	// 회원정보 불러오는 파트
		model.addAttribute("customerListAll", customerListAll);
		return "admin/customer/customerList";
	}
	
	// 회원정보 검색을 통해 회원정보 부분에 회원정보 값 불러오기(customerList.jsp)
	@RequestMapping(value = "customerFind", method = RequestMethod.GET)
	public String customerFind(Model model, String customer_name, String customer_id, String customer_email
								, String customer_phone, String customer_gender, String customer_grade) {
		ArrayList<Customer> customerListAll = 
				service.customerFind(customer_name, customer_id, customer_email
									, customer_phone, customer_gender, customer_grade);		// 검색한 회원정보 불러오는 파트
		model.addAttribute("customerListAll", customerListAll);
		return "admin/customer/customerList";
	}

	// 회원정보 삭제버튼을 통한 회원정보 삭제하기(customerList.jsp)
	@RequestMapping(value = "customerDelete", method = RequestMethod.POST)
	public String customerDelete(Model model, String[] customer_checkbox) {
		service.customerDelete(customer_checkbox);							// 삭제 요청한 회원 삭제하기
		ArrayList<Customer> customerListAll = service.customerListAll();	// 삭제 후 새로 회원정보 불러오는 파트
		model.addAttribute("customerListAll", customerListAll);
		return "admin/customer/customerList";
	}
	
	// 회원 세부정보 팝업창 띄우기(customerInfo.jsp)
	@RequestMapping(value = "customerInfo", method = RequestMethod.GET)
	public String customerInfo(Model model, String id) {
		Customer customerList = service.customerInfoFind(id);	// 회원 세부정보 회원 정보 리스트를 불러오는 파트
		String mileage = service.customerMileageFind(id);		// 회원 세부정보 회원 마일리지를 불러오는 파트
		model.addAttribute("customerList", customerList);
		model.addAttribute("mileage", mileage);
		return "admin/customer/customerInfo";
	}
	
	// 회원등급 이동 및 회원등급, 회원등급별 회원관리 부분 불러오기(customerGrade.jsp)
	@RequestMapping(value = "customerGrade", method = RequestMethod.GET)
	public String customerGrade(Model model) {
		ArrayList<Grade> customerGradeAll = service.customerGradeAll(); 	// 설정된 회원등급 및 등급에 따른 회원수 불러오는 파트
		ArrayList<Customer> customerListAll = service.customerListAll();	// 회원등급 별 회원관리를 위한 회원정보 불러오는 파트
		model.addAttribute("customerGradeAll", customerGradeAll);
		model.addAttribute("customerListAll", customerListAll);
		return "admin/customer/customerGrade";
	}
	
	// 회원정보 검색을 통해 회원등급 별 회원관리 부분에 회원정보 값 불러오기(customerGrade.jsp)
	@RequestMapping(value = "gradeFind", method = RequestMethod.GET)
	public String gradeFind(Model model, String customer_name, String customer_id, String customer_grade) {
		ArrayList<Grade> customerGradeAll = service.customerGradeAll(); 		// 설정된 회원등급 및 등급에 따른 회원수 불러오는 파트
		ArrayList<Customer> customerListAll
			= service.gradeFind(customer_name, customer_id, customer_grade);	// 검색한 회원등급 별 회원관리를 위한 회원정보 불러오는 파트
		model.addAttribute("customerGradeAll", customerGradeAll);
		model.addAttribute("customerListAll", customerListAll);
		return "admin/customer/customerGrade";
	}
	
	// 모달창으로 받은 등급 관련 정보 추가하기(customerGrade.jsp > modal)
	@RequestMapping(value = "gradeAdd", method = RequestMethod.POST)
	public String gradeAdd(Model model, String grade, String mileage_exp, String mileage_scope
							, String mileage_ratio, String pay_scope, String pay_ratio, String promo_terms) {
		//int result = service.gradeDuplication(grade);						// 등급 추가 이전에 등급명칭 중복 검사하기
		
		service.gradeAdd(grade, mileage_exp, mileage_scope, mileage_ratio
							, pay_scope, pay_ratio, promo_terms);			// 등급 추가 파트
		ArrayList<Grade> customerGradeAll = service.customerGradeAll(); 	// 설정된 회원등급 및 등급에 따른 회원수 불러오는 파트
		ArrayList<Customer> customerListAll = service.customerListAll();	// 회원등급 별 회원관리를 위한 회원정보 불러오는 파트
		model.addAttribute("customerGradeAll", customerGradeAll);
		model.addAttribute("customerListAll", customerListAll);
		return "admin/customer/customerGrade";
	}
	
	// AJAX를 통한 등급 추가 이전에 등급 명칭 중복 검사하기(customerGrade.jsp)
	@ResponseBody
	@RequestMapping(value = "checkGradeName", method = RequestMethod.POST)
	public String checkGradeName(String grade) {
		return Integer.toString(service.gradeDuplication(grade));
	}

	
	
	// (customerReservation.jsp)
	@RequestMapping(value = "customerReservation", method = RequestMethod.GET)
	public String customerReservation(Model model) {
		return "admin/customer/customerReservation";
	}
	
	// (customerMileage.jsp)
	@RequestMapping(value = "customerMileage", method = RequestMethod.GET)
	public String customerMileage(Model model) {
		return "admin/customer/customerMileage";
	}
	
}
