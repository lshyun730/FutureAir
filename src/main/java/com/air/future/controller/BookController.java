package com.air.future.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value = "book")
@Controller
public class BookController {
	// 항공권예약
	@RequestMapping(value = "flightBook", method = RequestMethod.GET)
	public String flightBook() {
		return "book/bookFlightForm";
	}
	
	// 항공권예약 - 고객정보입력
	@RequestMapping(value = "passengerInfo", method = RequestMethod.GET)
	public String passengerInfo() {
		return "book/bookInfoForm";
	}
	
	// 항공권예약 - 완료
	@RequestMapping(value = "bookDone", method = RequestMethod.GET)
	public String bookDone() {
		return "book/bookDone";
	}
}
