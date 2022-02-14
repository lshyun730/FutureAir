package com.air.future.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.air.future.dao.AdminCustomerDAO;
import com.air.future.util.MailHandler;
import com.air.future.vo.Customer;

@Service
public class AdminMailService {
	
	@Autowired
	private JavaMailSender sender;

	@Autowired
	AdminCustomerDAO dao;
	
	public int send(HashMap<String, String> mailForm) {
		
		ArrayList<Customer> customerList = dao.getCustomerBygrade(mailForm.get("grade"));
		int result = 0;
		for (Customer customer : customerList) {
			result = sandMail(customer, mailForm.get("title"), mailForm.get("body"));
		}
		
		return result; 
	}
	
	public int sandMail(Customer customer, String title, String body) {
		
		MailHandler mail;
		
		try {
			mail = new MailHandler(sender);
			mail.setFrom("no-reply@future.com", "미래항공");
			mail.setTo(customer.getCustomer_email()); 
			mail.setSubject(title);
			mail.setText(body);
			mail.send();
			System.out.println(customer.getCustomer_id() + "회원 - 전송완료");
			
		} catch (MessagingException e) {
			e.printStackTrace();
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			
		}
		
		int result = 1;
		return result;
	}
	
}
