package com.air.future.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.air.future.service.AdminFlightService;
import com.air.future.vo.Destination;

@Controller
public class HomeController {
	
	@Autowired
	AdminFlightService adminService;
	
	// 메인홈페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		ArrayList<ArrayList<Destination>> destinationList = adminService.destinationList();
		model.addAttribute("destinationList", destinationList);
		return "home";
	}
	


	

}
