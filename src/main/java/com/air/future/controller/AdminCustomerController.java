package com.air.future.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.air.future.service.AdminCustomerService;
import com.air.future.service.HomeControllerService;
import com.air.future.util.PageNavigator;
import com.air.future.vo.Airplane;
import com.air.future.vo.Customer;
import com.air.future.vo.Grade;
import com.air.future.vo.Route;
import com.air.future.vo.Schedule;

@Transactional
@RequestMapping(value = "admin/customer")
@Controller
public class AdminCustomerController {

	@Autowired
	AdminCustomerService service;
	
	// 게시판 관련 상수값들
	final int countPerPage 	= 10;			// 페이지 당 글 수
	final int pagePerGroup	= 5;			// 페이지 이동 그룹 당 표시할 페이지 수
	
	// 회원정보 이동 및 회원정보 전체 불러오기(customerList.jsp)
	// 회원정보 검색을 통해 회원정보 부분에 회원정보 값 불러오기(customerList.jsp)
	@RequestMapping(value = "customerList", method = RequestMethod.GET)
	public String customerList(Model model
								, @RequestParam(value="page", defaultValue = "1") int page
								, @RequestParam(value="customer_name", defaultValue = "") String customer_name
								, @RequestParam(value="customer_id", defaultValue = "") String customer_id
								, @RequestParam(value="customer_email", defaultValue = "") String customer_email
								, @RequestParam(value="customer_phone", defaultValue = "") String customer_phone
								, @RequestParam(value="customer_gender", defaultValue = "전체") String customer_gender
								, @RequestParam(value="customer_grade", defaultValue = "전체") String customer_grade
								) {
		
		// 필요한 총 갯수만 들고오기.
		int total 			= service.customerGetTotal(customer_name, customer_id, customer_email
														, customer_phone, customer_gender, customer_grade);
		PageNavigator navi 	= new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		// 설정된 회원등급 및 등급에 따른 회원수 불러오는 파트
		ArrayList<Grade> customerGradeAll = service.customerGradeAll(); 		
		
		// (검색한) 회원정보 불러오는 파트
		ArrayList<Customer> customerListAll = 
				service.customerFind(customer_name, customer_id, customer_email
									, customer_phone, customer_gender, customer_grade
									, navi.getStartRecord(), navi.getCountPerPage());
		
		model.addAttribute("customer_name", customer_name);
		model.addAttribute("customer_id", customer_id);
		model.addAttribute("customer_email", customer_email);
		model.addAttribute("customer_phone", customer_phone);
		model.addAttribute("customer_gender", customer_gender);
		model.addAttribute("customer_grade", customer_grade);
		
		model.addAttribute("customerGradeAll", customerGradeAll);
		model.addAttribute("customerListAll", customerListAll);
		model.addAttribute("navi", navi);
		
		return "admin/customer/customerList";
	}


	
	// 회원등급 이동 및 회원등급, 회원등급별 회원관리 부분 불러오기(customerGrade.jsp)
	// 회원정보 검색을 통해 회원등급 별 회원관리 부분에 회원정보 값 불러오기(customerGrade.jsp)
	@RequestMapping(value = "customerGrade", method = RequestMethod.GET)
	public String customerGrade(Model model
							, @RequestParam(value="page", defaultValue = "1") int page
							, @RequestParam(value="customer_name", defaultValue = "") String customer_name
							, @RequestParam(value="customer_id", defaultValue = "") String customer_id
							, @RequestParam(value="customer_grade", defaultValue = "") String customer_grade) {
		
		int total 			= service.gradeGetTotal(customer_name, customer_id, customer_grade);
		PageNavigator navi 	= new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		
		
		ArrayList<Grade> customerGradeAll = service.customerGradeAll(); 		// 설정된 회원등급 및 등급에 따른 회원수 불러오는 파트
		ArrayList<Customer> customerListAll
			= service.gradeFind(customer_name, customer_id, customer_grade
					, navi.getStartRecord(), navi.getCountPerPage());	// 검색한 회원등급 별 회원관리를 위한 회원정보 불러오는 파트
		
		model.addAttribute("customer_name", customer_name);
		model.addAttribute("customer_id", customer_id);
		model.addAttribute("customer_grade", customer_grade);
		model.addAttribute("customerGradeAll", customerGradeAll);
		model.addAttribute("customerListAll", customerListAll);
		model.addAttribute("navi", navi);
		
		return "admin/customer/customerGrade";
	}
	
	// AJAX를 통한 등급 추가 이전에 등급 명칭 중복 검사하기(customerGrade.jsp)
	@ResponseBody
	@RequestMapping(value = "checkGradeName", method = RequestMethod.POST)
	public String checkGradeName(String grade) {
		return Integer.toString(service.gradeDuplication(grade));
	}

	
	// 팝업창 : 회원 세부정보(customerInfo.jsp)
	@RequestMapping(value = "customerInfo", method = RequestMethod.GET)
	public String customerInfo(Model model, String id) {
		Customer customerList 	= service.customerInfoFind(id);	// 회원 세부정보 회원 정보 리스트를 불러오는 파트
		String mileage 			= service.customerMileageFind(id);		// 회원 세부정보 회원 마일리지를 불러오는 파트
		String customerFullPay 	= service.customerFullPay(id);	// 회원 세부정보 회원 총결제금액을 불러오는 파트
		
		model.addAttribute("id", id);
		model.addAttribute("customerList", customerList);
		model.addAttribute("mileage", mileage);
		model.addAttribute("customerFullPay", customerFullPay);
		return "admin/customer/customerInfo";
	}
	
	// 팝업창 : 회원 마일리지 세부정보(customerMileage.jsp)
	@RequestMapping(value = "customerMileage", method = RequestMethod.GET)
	public String customerMileage(Model model, String id) {
		Customer customer 		= service.getCustomerNG(id);
		String mileageAll 		= service.mileageAll(id);
		String mileageUsed 		= service.mileageUsed(id);
		String mileageUsable 	= service.mileageUsable(id);
		String mileageFUsable 	= service.mileageFUsable(id);
		List<HashMap<String, String>> mileageBalance = service.mileageBalance(id);

		model.addAttribute("id", id);
		model.addAttribute("customer", customer);
		model.addAttribute("mileageAll", mileageAll);
		model.addAttribute("mileageUsed", mileageUsed);
		model.addAttribute("mileageUsable", mileageUsable);
		model.addAttribute("mileageFUsable", mileageFUsable);
		model.addAttribute("mileageBalance", mileageBalance);
		return "admin/customer/customerMileage";
	}
	
	// 팝업창 : 회원별 전체 예약 확인하기(customerReservation.jsp)
	@RequestMapping(value = "customerReservation", method = RequestMethod.GET)
	public String customerReservation(Model model
										, @RequestParam(value = "page", defaultValue = "1") int page
										, @RequestParam(value = "id", defaultValue = "") String id
										, @RequestParam(value = "reservation_start", defaultValue = "") String reservation_start
										, @RequestParam(value = "reservation_end", defaultValue = "") String reservation_end
										) {
		
		Customer customer = service.getCustomerNG(id);
		
		int total 			= service.reservationGetTotal(id, reservation_start, reservation_end);
		PageNavigator navi 	= new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		List<HashMap<String, String>> reservationList = service.getCommonReservation(id, reservation_start, reservation_end);

		
		model.addAttribute("customer", customer);
		model.addAttribute("reservationList", reservationList);
		model.addAttribute("id", id);
		model.addAttribute("reservation_start", reservation_start);
		model.addAttribute("reservation_end", reservation_end);
		model.addAttribute("navi", navi);
		
		return "admin/customer/customerReservation";
	}
	
	// 팝업창 : 회원별 세부 예약 내역 확인하기(customerReservationDetail.jsp)
	@RequestMapping(value = "customerReservationDetail", method = RequestMethod.GET)
	public String customerReservationDetail(Model model, String id, String reservationNum) {
		Customer customer 					= service.getCustomerNG(id);
		String name							= service.getName(id);
		String payment 						= service.getPayment(reservationNum);
		ArrayList<Schedule> scheduleList 	= service.getSchedule(reservationNum);
		ArrayList<Route> getRoute 			= service.getRoute(scheduleList);
		ArrayList<Airplane> airplaneList	= service.getAirplane(getRoute);
		
		for(Airplane a : airplaneList) {
			for(Route r : getRoute) {
				if(a.getAirplane_id().equals(r.getAirplane_id())) {
					r.setAirplane(a);
				}
			}
		}

		model.addAttribute("customer", customer);
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		model.addAttribute("reservationNum", reservationNum);
		model.addAttribute("payment", payment);
		model.addAttribute("scheduleList", scheduleList);
		model.addAttribute("getRoute", getRoute);
		//model.addAttribute("airplaneList", airplaneList);
		
		return "admin/customer/customerReservationDetail";
	}
	
	
	/*
	// 팝업창 : 회원정보 수정하기 열기(customerUpdate.jsp)
	@RequestMapping(value="customerUpdate", method = RequestMethod.GET)
	public String customerUpdate(Model model, @RequestParam(value="customer_id", defaultValue = "") String customer_id) {
		
		// 설정된 회원등급 및 등급에 따른 회원수 불러오는 파트
		ArrayList<Grade> customerGradeAll = service.customerGradeAll();
		// 기존 회원정보를 들고오는 파트
		Customer customer = service.userInfoFind(customer_id);
		model.addAttribute("customer", customer);
		model.addAttribute("customerGradeAll", customerGradeAll);
		return "admin/customer/customerUpdate";
	}*/

	
	// 팝업창 : 회원 등급 수정하기(customerGradeUpdate.jsp)
	@RequestMapping(value="customerGradeUpdate", method = RequestMethod.GET)
	public String customerGradeUpdate(Model model, @RequestParam(value="grade", defaultValue = "") String grade) {
		// 설정된 회원등급과 관련된 정보 불러오는 파트
		Grade gradeSet = service.customerGradeSet(grade);
		model.addAttribute("gradeSet", gradeSet);
		return "admin/customer/customerGradeUpdate";
	}
	
	// 팝업창 : 회원등급 삭제 AJAX 처리(customerGradeUpdate.jsp)
	@RequestMapping(value = "gradeDelete", method = RequestMethod.POST)
	@ResponseBody
	public int gradeDelete(HttpServletRequest request) {
		String[] deleteList = request.getParameterValues("deleteList");
		if(service.countGrade() > 1) {
			int result = service.gradeDelete(deleteList);
			return result;
		} else {
			return 1000;
		}
	}
	// 회원정보 삭제버튼을 통한 회원정보 삭제 AJAX 처리(customerList.jsp)
	@RequestMapping(value = "customerDelete", method = RequestMethod.POST)
	@ResponseBody
	public int customerDelete(HttpServletRequest request) {
		String[] deleteList = request.getParameterValues("deleteList");
		int result = service.customerDelete(deleteList);							// 삭제 요청한 회원 삭제하기
		return result;
	}
	// customerGrade.jsp 등급추가 모달창 AJAX 처리
	@ResponseBody
	@RequestMapping(value = "gradeAddAjax", method = RequestMethod.POST)
	public int gradeAddAjax(HttpServletRequest request, Grade grade) {
		int result = service.gradeAdd(grade);
		return result;
	}
	// customerUpdate.jsp AJAX 처리
	@ResponseBody
	@RequestMapping(value = "customerUpdateAjax", method = RequestMethod.POST)
	public int customerUpdateAjax(HttpServletRequest request, Customer customer) {
		int result = service.userInfoChange(customer);
		return result;
	}
	// customerGradeUpdate.jsp AJAX 처리
	@ResponseBody
	@RequestMapping(value = "gradeUpdateAjax", method = RequestMethod.POST)
	public int graderUpdateAjax(HttpServletRequest request, Grade grade) {
		int result = service.customerGradeChange(grade);
		return result;
	}
}
