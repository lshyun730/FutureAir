package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.air.future.vo.Customer;
import com.air.future.vo.Mail;

public interface AdminMailMapper {
	
	// 등급으로 회원검색 - 메일보내기
	public ArrayList<Customer> getCustomerBygrade(String customer_grade);
	public ArrayList<Mail> getMailList();
	public Mail getMail(String mail_num);
	public int mailCheckChange(HashMap<String, String> mailInfo);
	public int mailUpdate(HashMap<String, String> mailForm);
}
