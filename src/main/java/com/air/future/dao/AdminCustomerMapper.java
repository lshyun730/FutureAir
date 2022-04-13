package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.air.future.vo.*;

public interface AdminCustomerMapper {
	
	// 페이징 처리 : 회원정보(customerList.jsp)를 위한 부분
	public int customerGetTotal(Customer customer);
	// 회원정보 전체 불러오기
	public ArrayList<Customer> customerListAll();
	// 페이징 처리 : 회원정보(customerList.jsp) 검색 결과 값 불러오기
	public ArrayList<Customer> customerFind(Customer customer, RowBounds rb);
	
	
	// 회원 마일리지(mileage_fa) 삭제하기
	public int mileageDelete(String customer_id);
	// 회원 스케쥴(schedule_fa) 삭제하기
	public int scheduleDelete(String customer_id);
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

	// 팝업창 : 회원정보 수정하기에서 회원정보 가져오기(customerUpdate.jsp)
	public Customer userInfoFind(String id);
	// 팝업창 : 회원정보 수정하기에서 회원정보 수정하기(customerUpdate.jsp)
	public int userInfoChange(Customer customer);
	
	
	// 팝업창 : 회원 등급 수정하기 부분의 회원등급 정보 가져오기(customerGradeUpdate.jsp)
	public Grade customerGradeSet(String grade);
	// 팝업창 : 회원 등급 수정하기 부분의 회원등급 수정하기(customerGradeUpdate.jsp)
	public int customerGradeChange(Grade gradeSet);
	

	// 회원 등급 삭제하기 전 삭제할 회원등급에 있는 사람 회원등급 낮추기
	public int gradeDown(ArrayList<String> values);
	// 회원 등급 삭제하기
	public int gradeDelete(ArrayList<String> values);
	// 회원 등급 개수 확인하기
	public int countGrade();


	// 팝업창 : 예약 전체내역 불러오기 위한 페이징 처리 부분
	public int reservationGetTotal(HashMap<String, String> value);
	// 팝업창 : 예약 내역 불러오기 위한 부분
	public ArrayList<HashMap<String, String>> getCommonReservation(HashMap<String, String> value, RowBounds rb);
	// 팝업창: 예약 세부내역 불러오기 위한 Payment부분
	public String getPayment(String reservation_num);
	// 팝업창: 예약 세부내역 불러오기 위한 Schedule부분
	public ArrayList<Schedule> getSchedule(String reservation_num);
	// 팝업창: 예약 세부내역 불러오기 위한 Route부분
	public ArrayList<Route> getRoute(ArrayList<Schedule> scheduleList);
	// 팝업창: 예약 세부내역 불러오기 위한 Airplane부분
	public ArrayList<Airplane> getAirplane(ArrayList<Route> routeList);
	// 팝업창 : 예약 세부내역 불러오기 위한 이름 가져오기
	public String getName(String id);
	// 팝업창에 필요한 회원 이름과 등급 가져오기
	public Customer getCustomerNG(String id);
	
	// 회원정보상세
	public ArrayList<HashMap<String, String>> getscheduleByresernum(String reservation_num);


	
	
	
	
	
	

}