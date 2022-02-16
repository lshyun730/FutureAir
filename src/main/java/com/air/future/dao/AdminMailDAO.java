package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.air.future.vo.Customer;
import com.air.future.vo.Mail;

@Repository
public class AdminMailDAO {

	@Autowired
	SqlSession sqlSession; 
	
	// 등급으로 회원검색 - 메일보내기
	public ArrayList<Customer> getCustomerBygrade(String customer_grade) {
		AdminMailMapper mapper = sqlSession.getMapper(AdminMailMapper.class);
		ArrayList<Customer> customerList = mapper.getCustomerBygrade(customer_grade);
		return customerList;
	}

	public ArrayList<Mail> getMailList() {
		AdminMailMapper mapper = sqlSession.getMapper(AdminMailMapper.class);
		ArrayList<Mail> mailList = mapper.getMailList();
		return mailList;
	}

	public int mailCheckChange(HashMap<String, String> mailInfo) {
		AdminMailMapper mapper = sqlSession.getMapper(AdminMailMapper.class);
		int result = mapper.mailCheckChange(mailInfo);
		return result;
	}

	public Mail getMail(String mail_num) {
		AdminMailMapper mapper = sqlSession.getMapper(AdminMailMapper.class);
		Mail mail = mapper.getMail(mail_num);
		return mail;
	}

	public int mailUpdate(HashMap<String, String> mailForm) {
		AdminMailMapper mapper = sqlSession.getMapper(AdminMailMapper.class);
		int result = mapper.mailUpdate(mailForm);
		return result;
	}
}
