package com.air.future.dao;

import java.util.HashMap;

import com.air.future.vo.*;

public interface HomeControllerMapper {

	// 일반 회원 로그인
	int loginAction(HashMap<String, String> value);
	// 회원 가입시 ID 중복여부 확인
	int validateIdAjax(String customer_id);
	// 
	int joinForm(Customer customer);
	


	
	
	
	

}