package com.air.future.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.air.future.service.AdminCustomerService;
import com.air.future.service.AdminMailService;
import com.air.future.vo.Grade;
import com.air.future.vo.Mail;


@RequestMapping(value = "admin/customer")
@Controller
public class AdminMailController {
	
	@Autowired
	AdminMailService service;
	
	@Autowired
	AdminCustomerService customerService;
	
	@RequestMapping(value = "sendMail", method = RequestMethod.GET)
	public String sendMail(Model model) {
		ArrayList<Mail> mailList= service.getMailList();
		 ArrayList<Grade> gradeList= customerService.customerGradeAll();
		 
		 model.addAttribute("mailList", mailList);
		 model.addAttribute("gradeList", gradeList);
		return "admin/mail/sendMail";
	}
	
	
	@RequestMapping(value = "mailView", method = RequestMethod.GET)
	public String mailView(String mail_num, Model model) {
		Mail mail = service.getMail(mail_num);
		model.addAttribute("mail", mail);
		return "admin/mail/mailView";
	}
	
	@RequestMapping(value = "mailUpdateForm", method = RequestMethod.GET)
	public String mailUpdate(String mail_num, Model model) {
		Mail mail = service.getMail(mail_num);
		model.addAttribute("mail", mail);
		return "admin/mail/mailUpdate";
	}
	
	@RequestMapping(value = "mailCheckChange", method = RequestMethod.GET)
	public String mailCheckChange(@RequestParam HashMap<String, String> mailInfo, Model model) {
		service.mailCheckChange(mailInfo);
		return "redirect:/admin/customer/sendMail";
	}
	
	@RequestMapping(value = "sendMail", method = RequestMethod.POST)
	@ResponseBody
	public int sendMail(@RequestParam HashMap<String, String> mailForm) {
		System.out.println(mailForm);
		int result = service.send(mailForm);
		System.out.println("전송완료");
		return result;
	}
	
	@RequestMapping(value = "mailUpdate", method = RequestMethod.POST)
	@ResponseBody
	public int mailUpdate(@RequestParam HashMap<String, String> mailForm) {
		System.out.println(mailForm);
		int result = service.mailUpdate(mailForm);
		return result;
	}
	
}
