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

import com.air.future.service.AdminFlightService;
import com.air.future.util.PageNavigator;
import com.air.future.vo.Airplane;
import com.air.future.vo.Destination;
import com.air.future.vo.Route;


@RequestMapping(value = "admin/flight")
@Controller
public class AdminFlightController {
	
	@Autowired
	AdminFlightService service;
	
	final int countPerPage = 10;		// 페이지 당 글 수
	final int pagePerGroup = 5;			// 페이지 이동 그룹 당 표시할 페이지 수
	
/* 
--------------
비행일정 페이지
-------------- 
*/	
	// 비행일정 페이지
	@RequestMapping(value = "flightList", method = RequestMethod.GET)
	public String flight(
		@RequestParam(value="page", defaultValue="1") int page,
		@RequestParam(value="departure_name", defaultValue="") String departure_name,
		@RequestParam(value="arrival_name", defaultValue="") String arrival_name,
		@RequestParam(value="route_num", defaultValue="") String route_num,
		@RequestParam(value="departure_date_start", defaultValue ="") String departure_date_start,
		@RequestParam(value="departure_date_end", defaultValue="") String departure_date_end,
		Model model
		) {
		
		// 받은 파라미터 맵에 저장
		HashMap<String, String> searchList = new HashMap<>();
		searchList.put("departure_name", departure_name);
		searchList.put("arrival_name", arrival_name);
		searchList.put("route_num", route_num);
		searchList.put("departure_date_start", departure_date_start);
		searchList.put("departure_date_end", departure_date_end);
		
		int total = service.getRouteTotal(searchList); // 검색된리스트갯수
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); // 페이징처리
		ArrayList<ArrayList<Destination>> destinationList =  service.destinationList(); // 지역리스트
		ArrayList<HashMap<String, String>> routeList = service.routeList(searchList, navi); // 검색된 비행일정리스트
		
		model.addAttribute("searchMap", searchList);
		model.addAttribute("destinationList", destinationList);
		model.addAttribute("routeList", routeList);
		model.addAttribute("navi", navi);
		
		return "admin/flight/flightList";
	}
	
	// 비행일정 수정 이동
	@RequestMapping(value = "flightUpdateForm", method = RequestMethod.GET)
	public String flightUpdateForm(String route_num, Model model) {
		ArrayList<ArrayList<Destination>> destinationList =  service.destinationList(); // 지역리스트
		HashMap<String, String>  route = service.getRoute(route_num); // 수정할 비행일정 정보
		
		model.addAttribute("destinationList", destinationList); 
		model.addAttribute("route", route);
		return "admin/flight/flightUpdate";
	}
	
	// 비행일정 상세
	@RequestMapping(value = "flightView", method = RequestMethod.GET)
	public String flightView(String route_num, Model model) {
		HashMap<String, String>  route = service.getRoute(route_num); // 상세 확인할 비행일정 정보
		model.addAttribute("route", route);
		return "admin/flight/flightView";
	}
	
	// 비행일정 삽입 이동
	@RequestMapping(value = "flightInsertForm", method = RequestMethod.GET)
	public String flightView(Model model) {
		ArrayList<ArrayList<Destination>> destinationList =  service.destinationList(); // 지역리스트
		ArrayList<Airplane> planeList = service.getAirplaneList(); // 비행기종류 리스트
		model.addAttribute("destinationList", destinationList);
		model.addAttribute("planeList", planeList);
		return "admin/flight/flightInsert";
	}
	
	
	// 비행일정 삽입
	@RequestMapping(value = "flightInsert", method = RequestMethod.POST)
	@ResponseBody
	public int flightInsert(@RequestParam HashMap<String, String> routeForm, Model model) {
		int result = service.insertFlight(routeForm); // 비행일정삽입
		return result;
	}
	
	// 비행일정 수정
	@RequestMapping(value = "flightUpdate", method = RequestMethod.POST)
	@ResponseBody
	public int flightUpdate(@RequestParam HashMap<String, String> routeForm, Model model) {
		int result = service.updateFlight(routeForm); // 비행일정수정
		return result;
	}

	
	// 비행일정 삭제
	@RequestMapping(value = "flightDelete", method = RequestMethod.POST)
	@ResponseBody
	public int flightDelete(HttpServletRequest request) {
		String route_num = request.getParameter("route_num"); 
		int result = service.deleteRoute(route_num); // 비행일정삭제
		return result;
	}
	
	// 비행일정리스트 삭제
	@RequestMapping(value = "flightDeleteList", method = RequestMethod.POST)
	@ResponseBody
	public int deleteRoute(HttpServletRequest request) {
		String[] deleteList = request.getParameterValues("deleteList");
		int result = service.deleteRouteList(deleteList); // 비행일정리스트 삭제
		return result;
	}
	

/* 
--------------
예약현황 페이지
-------------- 
*/
	// 예약현황 페이지
	@RequestMapping(value = "reservationList", method = RequestMethod.GET)
	public String reservation(
		@RequestParam(value="page", defaultValue="1") int page,
		@RequestParam(value="departure_name", defaultValue="") String departure_name,
		@RequestParam(value="arrival_name", defaultValue="") String arrival_name,
		@RequestParam(value="departure_date_start", defaultValue ="") String departure_date_start,
		@RequestParam(value="departure_date_end", defaultValue="") String departure_date_end,
		@RequestParam(value="reservation_date_start", defaultValue ="") String reservation_date_start,
		@RequestParam(value="reservation_date_end", defaultValue="") String reservation_date_end,
		@RequestParam(value="customer_name", defaultValue="") String customer_name,
		Model model
		) {
		
		// 받은 파라미터 맵에 저장
		HashMap<String, String> searchList = new HashMap<>();
		searchList.put("departure_name", departure_name);
		searchList.put("arrival_name", arrival_name);
		searchList.put("departure_date_start", departure_date_start);
		searchList.put("departure_date_end", departure_date_end);
		searchList.put("reservation_date_start", reservation_date_start);
		searchList.put("reservation_date_end", reservation_date_end);
		searchList.put("customer_name", customer_name);
		
		int total = service.getReservationTotal(searchList); // 검색된 리스트 갯수
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); // 페이징처리
		ArrayList<ArrayList<Destination>> destinationList =  service.destinationList(); // 지역리스트
		ArrayList<HashMap<String, String>> reservationList = service.reservationList(searchList, navi); // 검색된 예약 리스트
		
		model.addAttribute("searchMap", searchList);
		model.addAttribute("destinationList", destinationList);
		model.addAttribute("reservationList", reservationList);
		model.addAttribute("navi", navi);
		
		
		return "admin/flight/reservationList"; 
	}
	
	// 예약 삭제
	@RequestMapping(value = "reservationCancle", method = RequestMethod.POST)
	@ResponseBody
	public int reservationDelete(HttpServletRequest request) {
		String route_num = request.getParameter("reservation_num");
		int result = service.reservationCancle(route_num); // 예약취소
		return result;
	}
	
	
	// 예약리스트 삭제
	@RequestMapping(value = "reservationCancleList", method = RequestMethod.POST)
	@ResponseBody
	public int deleteReservation(HttpServletRequest request, Model model) {
		String[] deleteList = request.getParameterValues("deleteList");
		int result = service.reservationCancleList(deleteList); // 예약리스트 삭제
		return result;
	}
		
}

