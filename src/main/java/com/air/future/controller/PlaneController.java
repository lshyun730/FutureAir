package com.air.future.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value = "plane")
@Controller
public class PlaneController {
	
	// 클래스별 서비스
	@RequestMapping(value = "seatClass", method = RequestMethod.GET)
	public String seatClass() {
		return "plane/seatClass";
	}
	
	// 기내식
	@RequestMapping(value = "service/flightMeals", method = RequestMethod.GET)
	public String meals() {
		return "plane/flightMeals";
	}
	
	// 항공기 안내
	@RequestMapping(value = "aircraft", method = RequestMethod.GET)
	public String aircraft() {
		return "plane/aircraft";
	}
}
