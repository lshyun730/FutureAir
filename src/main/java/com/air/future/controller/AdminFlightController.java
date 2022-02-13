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
		
		int total = service.getRouteTotal(searchList);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		ArrayList<ArrayList<Destination>> destinationList =  service.destinationList();
		ArrayList<HashMap<String, String>> routeList = service.routeList(searchList, navi);
		ArrayList<Airplane> planeList = service.getAirplaneList();
		
		model.addAttribute("searchMap", searchList);
		model.addAttribute("destinationList", destinationList);
		model.addAttribute("routeList", routeList);
		model.addAttribute("navi", navi);
		model.addAttribute("planeList", planeList);
		
		return "admin/flight/flightList";
	}
	
	// 비행일정 수정이동
	@RequestMapping(value = "flightUpdateForm", method = RequestMethod.GET)
	public String flightUpdateForm(String route_num, Model model) {
		ArrayList<ArrayList<Destination>> destinationList =  service.destinationList();
		Route route = service.getRoute(route_num);
		
		model.addAttribute("destinationList", destinationList);
		model.addAttribute("route", route);
		return "admin/flight/flightUpdate";
	}
	
	// 비행일정 수정
	@RequestMapping(value = "flightUpdate", method = RequestMethod.POST)
	public String flightUpdate(Route route, Model model) {
		System.out.println(route);
		return "admin/flight/flightList";
	}
	
	// 비행일정 삽입
	@RequestMapping(value = "flightInsert", method = RequestMethod.POST)
	@ResponseBody
	public String flightInsert(@RequestParam HashMap<String, String> routeForm, Model model) {
		System.out.println(routeForm);
		service.insertFlight(routeForm);
		return"admin/flight/flightList";
	}
	
	// 비행일정 상세
	@RequestMapping(value = "flightView", method = RequestMethod.GET)
	public String flightView(String route_num, Model model) {
		Route route = service.getRoute(route_num);
		
		model.addAttribute("route", route);
		return "admin/flight/flightView";
	}

	
	// 비행일정 삭제
	@RequestMapping(value = "deleteRoute", method = RequestMethod.POST)
	@ResponseBody
	public int deleteRoute(HttpServletRequest request) {
		String[] deleteList = request.getParameterValues("deleteList");
		int result = service.deleteRoute(deleteList);
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
		
		int total = service.getReservationTotal(searchList);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		ArrayList<ArrayList<Destination>> destinationList =  service.destinationList();
		ArrayList<HashMap<String, String>> reservationList = service.reservationList(searchList, navi);
		
		model.addAttribute("searchMap", searchList);
		model.addAttribute("destinationList", destinationList);
		model.addAttribute("reservationList", reservationList);
		model.addAttribute("navi", navi);
		
		
		return "admin/flight/reservationList"; 
	}
	
	// 예약 삭제
	@RequestMapping(value = "deleteReservation", method = RequestMethod.POST)
	@ResponseBody
	public int deleteReservation(HttpServletRequest request, Model model) {
		String[] deleteList = request.getParameterValues("deleteList");
		int result = service.deleteReservation(deleteList);
		return result;
	}
		
}

