package com.air.future.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.air.future.dao.CustomerDAO;
import com.air.future.vo.Customer;

@Service
public class CustomerService {

	@Autowired
	CustomerDAO dao;

	public Customer loginAction(String id, String password) {
		
		HashMap<String, String> value = new HashMap<>();
		value.put("customer_id", id);
		value.put("customer_pw", password);
		
		Customer customer = dao.loginAction(value);
		return customer ;
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

	public int getMyMileage(String customer_id) {
		int mileage = dao.getMyMileage(customer_id);
		return mileage;
	}

	public ArrayList<HashMap<String, String>> getMyReservationList(String customer_id) {
		ArrayList<HashMap<String, String>> myReservationList = dao.getMyReservationList(customer_id);
		return myReservationList;
	}

	public ArrayList<HashMap<String, String>> getMyQnAList(String customer_id) {
		ArrayList<HashMap<String, String>> myQnAList = dao.getMyQnAList(customer_id);
		return myQnAList;
	}
	


}
