package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.air.future.vo.Customer;
import com.air.future.vo.Grade;

public interface AdminCustomerMapper {
	
	// 페이징 처리 : 회원정보(customerList.jsp)를 위한 부분
	public int customerGetTotal(Customer customer);
	// 회원정보 전체 불러오기
	public ArrayList<Customer> customerListAll();
	// 페이징 처리 : 회원정보(customerList.jsp) 검색 결과 값 불러오기
	public ArrayList<Customer> customerFind(Customer customer, RowBounds rb);
	
	// 회원 마일리지(mileage_fa) 삭제하기
	public int mileageDelete(String customer_id);
	// 회원 예약(reservation_fa) 삭제하기
	public int reservationDelete(String customer_id);
	// 회원(customer_fa) 삭제하기
	public int customerDelete(String customer_id);
	
	// 회원 세부정보 팝업창에 필요한 회원 정보 불러오기
	public Customer customerInfoFind(String customer_id);
	// 회원 세부정보 팝업창에 필요한 회원 마일리지 불러오기
	public String customerMileageFind(String mileage_id);
	// 회원 세부정보 팝업창에 필요한 회원 총결제금액 불러오기
	public String customerFullPay(String customer_id);
	
	// 페이징 처리 : 회원등급(customerGrade.jsp)을 위한 부분
	public int gradeGetTotal(Customer customer);
	// 회원등급 및 회원등급에 따른 전체 회원수 불러오기
	public ArrayList<Grade> customerGradeAll();
	// 회원등급별 회원관리 검색 결과 값 불러오기
	public ArrayList<Customer> gradeFind(Customer customer, RowBounds rb);
	
	// 모달창을 통한 회원 등급을 추가하기 이전에 등급 명칭 중복 검사
	public int gradeDuplication(String grade);
	// 모달창을 통한 회원 등급 추가하기
	public int gradeAdd(Grade grade);
	
	// 회원 총 마일리지
	public String mileageAll(String id);
	// 회원 사용한 마일리지
	public String mileageUsed(String id);
	// 회원 사용가능한 마일리지
	public String mileageUsable(String id);
	// 회원 미가용 마일리지
	public String mileageFUsable(String id);
	// 회원 마일리지 내역
	public List<HashMap<String, String>> mileageBalance(String id);
	
	
	// 등급으로 회원검색 - 메일보내기
	public ArrayList<Customer> getCustomerBygrade(String customer_grade);

	

	
	
	

}