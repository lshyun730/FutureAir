package com.air.future.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.air.future.dao.AdminCustomerDAO;
import com.air.future.dao.AdminMailDAO;
import com.air.future.util.MailHandler;
import com.air.future.vo.Customer;
import com.air.future.vo.Mail;

@Service
public class AdminMailService {
	
	@Autowired
	private JavaMailSender sender;

	@Autowired
	AdminMailDAO dao;
	
	public int send(HashMap<String, String> mailForm) {
		ArrayList<Customer> customerList = dao.getCustomerBygrade(mailForm.get("grade"));
		System.out.println(customerList + mailForm.get("grade"));
		int result = 0;
		result = sandMail(customerList, mailForm.get("title"), mailForm.get("body"));
		return result; 
	}
	
	public int sandMail(ArrayList<Customer> customerList, String title, String body) {
		
		MailHandler mail;
		try {
			mail = new MailHandler(sender);
			mail.setFrom("no-reply@future.com", "미래항공");
			mail.setSubject(title);
			mail.setText(body);
			for (Customer customer : customerList) {
				mail.setTo(customer.getCustomer_email());
				mail.send();
				System.out.println(customer.getCustomer_id() + " 회원 - 전송완료");
			}
			
		} catch (MessagingException e) {
			e.printStackTrace();
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			
		}
		
		int result = 1;
		return result;
	}

	public ArrayList<Mail> getMailList() {
		ArrayList<Mail> mailList = dao.getMailList();
		return mailList;
	}

	public int mailCheckChange(HashMap<String, String> mailInfo) {
		if(mailInfo.get("mail_check").equals("1")) {
			mailInfo.put("mail_check", "0");
		} else {
			mailInfo.put("mail_check", "1");			
		}
		int result = dao.mailCheckChange(mailInfo);
		return result;
	}

	public Mail getMail(String mail_num) {
		Mail mail = dao.getMail(mail_num);
		return mail;
	}

	public int mailUpdate(HashMap<String, String> mailForm) {
		int result = dao.mailUpdate(mailForm);
		return result;
	}
	
}
