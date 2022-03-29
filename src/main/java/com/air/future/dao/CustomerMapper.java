package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.air.future.vo.*;

public interface CustomerMapper {

// 로그인 & 회원가입	
	// 일반 회원 로그인
	public Customer loginAction(HashMap<String, String> value);
	
	// 회원 가입시 ID 중복여부 확인
	public int validateIdAjax(String customer_id);
	
	// 회원가입
	public int joinForm(Customer customer);

	
	
// 마이페이지
	// 보유 마일리지
	public int getMyMileage(String customer_id);
	
	// 나의예약내역
	public ArrayList<HashMap<String, String>> getMyReservationList(String customer_id);

	// 나의문의내역
	public ArrayList<HashMap<String, String>> getMyQnAList(String customer_id);
	


	
	
	
	

}