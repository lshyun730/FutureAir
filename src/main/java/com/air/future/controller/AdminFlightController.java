package com.air.future.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.air.future.service.AdminFlightService;
import com.air.future.util.PageNavigator;
import com.air.future.vo.Route;


@RequestMapping(value = "admin/flight")
@Controller
public class AdminFlightController {
	
	@Autowired
	AdminFlightService service;
	
	final int countPerPage = 10;		// 페이지 당 글 수
	final int pagePerGroup = 5;			// 페이지 이동 그룹 당 표시할 페이지 수
	
	
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
		
		HashMap<String, String> map = new HashMap<>();
		map.put("departure_name", departure_name);
		map.put("arrival_name", arrival_name);
		map.put("route_num", route_num);
		map.put("departure_date_start", departure_date_start);
		map.put("departure_date_end", departure_date_end);
		
		int total = service.getRouteTotal(map);
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		model.addAttribute("searchMap", map);
		model.addAttribute("routeList", service.routeList(map, navi));
		model.addAttribute("navi", navi);
		
		return "admin/flight/flightList";
	}
}

