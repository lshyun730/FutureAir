package com.air.future.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value = "admin/customer")
@Controller



public class AdminMailController {
	
	@RequestMapping(value = "sendMail", method = RequestMethod.GET)
	public String boardManager() {
		return "admin/mail/sendMail";
	}
	
}
