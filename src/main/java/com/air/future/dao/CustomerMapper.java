package com.air.future.dao;

import java.util.ArrayList;

import com.air.future.vo.Customer;
import com.air.future.vo.Grade;

public interface CustomerMapper {

	// 회원정보 전체 불러오기
	public ArrayList<Customer> customerListAll();
	
	// 회원정보 검색 결과 값 불러오기
	public ArrayList<Customer> customerFind(Customer customer);
	
	// 회원 마일리지(mileage_fa) 삭제하기
	public int mileageDelete(ArrayList<Customer> customerList);
	
	// 회원 예약(reservation_fa) 삭제하기
	public int reservationDelete(ArrayList<Customer> customerList);
	
	// 회원(customer_fa) 삭제하기
	public int customerDelete(ArrayList<Customer> customerList);
	
	// 회원 세부정보 팝업창에 필요한 회원 정보 불러오기
	public Customer customerInfoFind(String customer_id);
	
	// 회원 세부정보 팝업창에 필요한 회원 마일리지 불러오기
	public String customerMileageFind(String mileage_id);
	
	// 회원등급 및 회원등급에 따른 전체 회원수 불러오기
	public ArrayList<Grade> customerGradeAll();
	
	// 회원등급별 회원관리 검색 결과 값 불러오기
	public ArrayList<Customer> gradeFind(Customer customer);
	
	// 모달창을 통한 회원 등급을 추가하기 이전에 등급 명칭 중복 검사
	public int gradeDuplication(String grade);
	
	// 모달창을 통한 회원 등급 추가하기
	public int gradeAdd(Grade grade);
	
	

}