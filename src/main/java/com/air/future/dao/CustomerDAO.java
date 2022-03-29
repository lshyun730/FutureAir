package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.air.future.vo.Customer;


@Repository
public class CustomerDAO {
	
	@Autowired
	SqlSession sqlSession;

	public Customer loginAction(HashMap<String, String> value) {
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class); 
		Customer customer = mapper.loginAction(value);
		return customer;
	}

	public int validateIdAjax(String customer_id) {
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class); 
		int result = mapper.validateIdAjax(customer_id);
		return result;
	}

	public int joinForm(Customer customer) {
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class); 
		int result = mapper.joinForm(customer);
		return result;
	}

	public int getMyMileage(String customer_id) {
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class); 
		int mileage = mapper.getMyMileage(customer_id);
		return mileage;
	}

	public ArrayList<HashMap<String, String>> getMyReservationList(String customer_id) {
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class); 
		ArrayList<HashMap<String, String>> myReservationList = mapper.getMyReservationList(customer_id);
		return myReservationList;
	}

	public ArrayList<HashMap<String, String>> getMyQnAList(String customer_id) {
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class); 
		ArrayList<HashMap<String, String>> myQnAList = mapper.getMyQnAList(customer_id);
		return myQnAList;
	}

	




}
