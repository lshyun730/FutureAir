package com.air.future.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.air.future.vo.Customer;


@Repository
public class HomeControllerDAO {
	
	@Autowired
	SqlSession sqlSession;

	public int loginAction(HashMap<String, String> value) {
		HomeControllerMapper mapper = sqlSession.getMapper(HomeControllerMapper.class); 
		int result = mapper.loginAction(value);
		return result;
	}

	public int validateIdAjax(String customer_id) {
		HomeControllerMapper mapper = sqlSession.getMapper(HomeControllerMapper.class); 
		int result = mapper.validateIdAjax(customer_id);
		return result;
	}

	public int joinForm(Customer customer) {
		HomeControllerMapper mapper = sqlSession.getMapper(HomeControllerMapper.class); 
		int result = mapper.joinForm(customer);
		return result;
	}

	




}
