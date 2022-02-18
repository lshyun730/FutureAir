package com.air.future.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="service")
@Controller
public class serviceController {

	@RequestMapping(value = "notice",  method = RequestMethod.GET)
	public String notice() {
		return "service/notice";
	}
	
	@RequestMapping(value = "faq",  method = RequestMethod.GET)
	public String faq() {
		return "service/faq";
	}
}
