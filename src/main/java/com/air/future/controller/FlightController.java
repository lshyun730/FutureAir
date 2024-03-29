package com.air.future.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.air.future.service.AdminFlightService;
import com.air.future.service.FlightService;
import com.air.future.vo.Customer;
import com.air.future.vo.Destination;

@SessionAttributes("customer")
@RequestMapping(value = "book")
@Controller
public class FlightController {
	
	@Autowired
	FlightService service;
	
	@Autowired
	AdminFlightService adminService;
	
	// 항공권예약
	@RequestMapping(value = "flightBook", method = RequestMethod.GET)
	public String flightBook(Model model) {
		ArrayList<ArrayList<Destination>> destinationList = adminService.destinationList();
		model.addAttribute("destinationList", destinationList);
		return "book/bookFlightForm";
	}
	
	// 항공권예약검색
	@RequestMapping(value = "flightBook", method = RequestMethod.POST)
	public String flightBookSearch(@RequestParam HashMap<String, String> bookForm, Model model) {

		System.out.println(bookForm);
		ArrayList<ArrayList<Destination>> destinationList = adminService.destinationList();
		ArrayList<ArrayList<HashMap<String, String>>> weekList = service.getWeekInfo(bookForm);
		ArrayList<ArrayList<HashMap<String, String>>> flightListType = service.getFlightList(bookForm);

		model.addAttribute("bookForm", bookForm);
		model.addAttribute("destinationList", destinationList);
		model.addAttribute("flightListType", flightListType);
		model.addAttribute("weekList", weekList);
		
		return "book/bookFlightForm";
	}

	// 항공권예약 - 고객정보입력
	@RequestMapping(value = "passengerInfo", method = RequestMethod.POST)
	public String passengerInfo(@RequestParam HashMap<String, String> bookForm, Model model, @ModelAttribute("customer") Customer customer) {
		
		ArrayList<HashMap<String, String>> flightInfo = service.getRoute(bookForm);
		bookForm = service.customerTypeList(bookForm);
		
		model.addAttribute("customer", customer);
		model.addAttribute("bookForm", bookForm);
		model.addAttribute("flightInfo", flightInfo);
		System.out.println(bookForm);
		return "book/bookInfoForm";
	}
	
	// 항공권예약 - 완료
	@RequestMapping(value = "bookDone", method = RequestMethod.POST)
	public String bookDone(@RequestParam HashMap<String, String> bookForm, Model model) {
		
		String reservationNum = service.getReservationNum();
		int result = service.insertReservation(reservationNum, bookForm);
		if(result > 0) {
			model.addAttribute(reservationNum);
		}
		return "book/bookDone";			
	}
}
