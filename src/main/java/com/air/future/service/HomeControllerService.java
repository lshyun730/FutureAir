package com.air.future.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.air.future.dao.HomeControllerDAO;
import com.air.future.vo.Customer;

@Service
public class HomeControllerService {

	@Autowired
	HomeControllerDAO dao;

	public int loginAction(String id, String password) {
		
		HashMap<String, String> value = new HashMap<>();
		value.put("customer_id", id);
		value.put("customer_pw", password);
		
		int result = dao.loginAction(value);
		return result;
	}

	public int validateIdAjax(String customer_id) {
		int result = dao.validateIdAjax(customer_id);
		return result;
	}

	public int joinForm(String customer_id, String customer_name, String customer_pw, String customer_phone
						, String customer_birth, String customer_gender, String customer_email
						, String customer_country, String customer_address) {
		
		Customer customer = new Customer();
		customer.setCustomer_id(customer_id);
		customer.setCustomer_name(customer_name);
		customer.setCustomer_pw(customer_pw);
		customer.setCustomer_phone(customer_phone);
		customer.setCustomer_birth(customer_birth.replaceAll("[^0-9]",""));
		customer.setCustomer_gender(customer_gender);
		customer.setCustomer_email(customer_email);
		customer.setCustomer_country(customer_country);
		customer.setCustomer_address(customer_address);
		
		return dao.joinForm(customer);
	}
	


}
