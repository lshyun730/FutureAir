package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.air.future.vo.Airplane;
import com.air.future.vo.Customer;
import com.air.future.vo.Grade;
import com.air.future.vo.Route;
import com.air.future.vo.Schedule;

@Repository
public class AdminCustomerDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	// 페이징 처리 : 회원정보(customerList.jsp)를 위한 부분
	public int customerGetTotal(Customer customer) {
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class); 
		int result = mapper.customerGetTotal(customer);
		return result;
	}
	
	// 회원정보 전체 불러오기
	public ArrayList<Customer> customerListAll() {
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class); 
		ArrayList<Customer> customerListAll = mapper.customerListAll();
		return customerListAll;
	}
	
	// 페이징 처리 : 회원정보(customerList.jsp) 검색 결과 값 불러오기
	public ArrayList<Customer> customerFind(Customer customer, int startRecord, int countPerPage) {
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class); 
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		ArrayList<Customer> customerFind = mapper.customerFind(customer, rb);
		return customerFind;
	}
	
	// 회원정보 삭제하기
	public int customerDelete(String customer_id) {
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class);
		mapper.mileageDelete(customer_id);
		//mapper.reservationDelete(customer_id);
		System.out.println("123123123123123");
		int result = mapper.customerDelete(customer_id);
		return result;
	}
	
	// 회원 세부정보에 필요한 회원정보 불러오기
	public Customer customerInfoFind(String customer_id) {
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class); 
		Customer customer = mapper.customerInfoFind(customer_id);
		return customer;
	}
	
	// 회원 세부정보에 필요한 회원 마일리지 불러오기
	public String customerMileageFind(String mileage_id) {
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class);
		String mileage = mapper.customerMileageFind(mileage_id);
		return mileage;
	}
	
	// 회원 세부정보에 필요한 회원 총결제금액 불러오기
	public String customerFullPay(String customer_id) {
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class);
		String customerFullPay = mapper.customerFullPay(customer_id);
		return customerFullPay;
	}
	
	// 페이징 처리 : 회원등급(customerGrade.jsp)을 위한 부분
	public int gradeGetTotal(Customer customer) {
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class); 
		int result = mapper.gradeGetTotal(customer);
		return result;
	}

	
	// 회원등급 및 회원등급에 따른 전체 회원수 불러오기
	public ArrayList<Grade> customerGradeAll() {
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class); 
		ArrayList<Grade> customerGradeAll = mapper.customerGradeAll();
		return customerGradeAll;
	}
	
	// 페이징 처리 : 회원등급별 회원관리 부분 검색 결과 값 불러오기
	public ArrayList<Customer> gradeFind(Customer customer, int startRecord, int countPerPage) {
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		ArrayList<Customer> gradeFind = mapper.gradeFind(customer, rb);
		return gradeFind;
	}
	
	// 모달창을 통한 회원 등급을 추가하기 이전에 등급 명칭 중복 검사
	public int gradeDuplication(String grade) {
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class); 
		int result = mapper.gradeDuplication(grade);
		return result;
	}
	
	// 모달창을 통한 회원 등급 추가하기
	public int gradeAdd(Grade grade) {
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class); 
		int result = mapper.gradeAdd(grade);
		return result;
	}
	
	// 회원 총 마일리지 불러오기
	public String mileageAll(String id) {
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class); 
		String result = mapper.mileageAll(id);
		return result;
	}
	// 회원 사용한 마일리지 불러오기
	public String mileageUsed(String id) {
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class); 
		String result = mapper.mileageUsed(id);
		return result;
	}
	// 회원 사용가능한 마일리지 불러오기
	public String mileageUsable(String id) {
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class); 
		String result = mapper.mileageUsable(id);
		return result;
	}
	// 회원 미가용 마일리지 불러오기
	public String mileageFUsable(String id) {
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class); 
		String result = mapper.mileageFUsable(id);
		return result;
	}
	// 회원 마일리지 내역 불러오기
	public List<HashMap<String, String>> mileageBalance(String id) {
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class);
		List<HashMap<String, String>> result = mapper.mileageBalance(id);
		return result;
	}
	
	// 팝업창 : 예약 내역 불러오기 위한 부분
	public List<HashMap<String, String>> getCommonReservation(HashMap<String, String> value) {
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class);
		List<HashMap<String, String>> result = mapper.getCommonReservation(value);
		return result;
	}
	
	// 팝업창: 예약 세부내역 불러오기 위한 Payment부분
	public String getPayment(String reservation_num) {
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class);
		String payment = mapper.getPayment(reservation_num);
		return payment;
	}
	
	// 팝업창: 예약 세부내역 불러오기 위한 Schedule부분
	public ArrayList<Schedule> getSchedule(String reservation_num){
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class);
		ArrayList<Schedule> scheduleList = mapper.getSchedule(reservation_num);
		return scheduleList;
	}
	// 팝업창: 예약 세부내역 불러오기 위한 Route부분
	public ArrayList<Route> getRoute(ArrayList<Schedule> scheduleList){
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class);
		ArrayList<Route> routeList = mapper.getRoute(scheduleList);
		return routeList;
	}
	// 팝업창: 예약 세부내역 불러오기 위한 Airplane부분
	public ArrayList<Airplane> getAirplane(ArrayList<Route> routeList) {
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class);
		ArrayList<Airplane> airplaneList = mapper.getAirplane(routeList);
		return airplaneList;
	}
	// 팝업창: 예약 세부내역 불러오기 위한 getName부분
	public String getName(String id) {
		AdminCustomerMapper mapper = sqlSession.getMapper(AdminCustomerMapper.class);
		String name = mapper.getName(id);
		return name;
	}


	





}
