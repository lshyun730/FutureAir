package com.air.future.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.air.future.dao.AdminCustomerDAO;
import com.air.future.dao.AdminCustomerMapper;
import com.air.future.vo.*;

@Service
public class AdminCustomerService {

	@Autowired
	AdminCustomerDAO dao;
	
	// 페이징 처리 : 회원정보(customerList.jsp)를 위한 부분
	public int customerGetTotal(String customer_name, String customer_id, String customer_email
						, String customer_phone, String customer_gender, String customer_grade) {
		Customer customer = new Customer();
		customer.setCustomer_name(customer_name);
		customer.setCustomer_id(customer_id);
		customer.setCustomer_email(customer_email);
		customer.setCustomer_phone(customer_phone);
		customer.setCustomer_gender(customer_gender);
		customer.setCustomer_grade(customer_grade);
		int result = dao.customerGetTotal(customer);
		return result;
	}
	
	// 페이징 처리 : 회원정보(customerList.jsp) 검색 결과 값 불러오기
	public ArrayList<Customer> customerFind(String customer_name, String customer_id
											, String customer_email, String customer_phone
											, String customer_gender, String customer_grade
											, int startRecord, int countPerPage) {
		
		Customer customer = new Customer();
		customer.setCustomer_name(customer_name);
		customer.setCustomer_id(customer_id);
		customer.setCustomer_email(customer_email);
		customer.setCustomer_phone(customer_phone);
		customer.setCustomer_gender(customer_gender);
		customer.setCustomer_grade(customer_grade);
		
		ArrayList<Customer> customerFind = dao.customerFind(customer, startRecord, countPerPage);
		return customerFind;
	}
	
	// 페이징 처리 : 회원등급(customerGrade.jsp)을 위한 부분
	public int gradeGetTotal(String customer_name, String customer_id, String customer_grade) {
		Customer customer = new Customer();
		customer.setCustomer_name(customer_name);
		customer.setCustomer_id(customer_id);
		customer.setCustomer_grade(customer_grade);
		int result = dao.gradeGetTotal(customer);
		return result;
	}
	

	// 회원정보 전체 불러오기
	public ArrayList<Customer> customerListAll() {
		ArrayList<Customer> customerListAll = dao.customerListAll();
		return customerListAll;
	}
	
	// 회원정보 삭제하기
	public int customerDelete(String[] customers) {
		int result = 0;
		for(String customer_id : customers) {
			result = dao.customerDelete(customer_id);
			if(result == 0) {
				return 0;
			} 
		}
		return result;
	}
	
	// 회원 세부정보에 필요한 회원정보 불러오기
	public Customer customerInfoFind(String customer_id) {
		Customer customer = dao.customerInfoFind(customer_id);
		return customer;
	}
	
	// 회원 세부정보에 필요한 회원 마일리지 불러오기
	public String customerMileageFind(String mileage_id) {
		String mileage = dao.customerMileageFind(mileage_id);
		return mileage;
	}
	
	// 회원 세부정보에 필요한 회원 총결제금액 불러오기
	public String customerFullPay(String customer_id) {
		String customerFullPay = dao.customerFullPay(customer_id);
		return customerFullPay;
	}
	
	// 회원등급 전체 불러오기
	public ArrayList<Grade> customerGradeAll(){
		ArrayList<Grade> customerGradeAll = dao.customerGradeAll();
		return customerGradeAll;
	}
	
	// 회원등급 검색을 통한 결과값 불러오기
	public ArrayList<Customer> gradeFind(String customer_name, String customer_id, String customer_grade
											, int startRecord, int countPerPage) {
		Customer customer = new Customer();
		customer.setCustomer_name(customer_name);
		customer.setCustomer_id(customer_id);
		customer.setCustomer_grade(customer_grade);
		ArrayList<Customer> customerListAll = dao.gradeFind(customer, startRecord, countPerPage);
		return customerListAll;
	}
	
	// 모달창을 통한 회원 등급을 추가하기 이전에 등급 명칭 중복 검사
	public int gradeDuplication(String grade) {
		int result = dao.gradeDuplication(grade);
		return result;
	}
	
	// 모달창을 통한 회원 등급 추가하기
	public int gradeAdd(String grade, String mileage_exp, String mileage_scope
						, String mileage_ratio, String pay_scope, String pay_ratio, String promo_terms) {
		Grade gradeAll = new Grade();
		gradeAll.setGrade(grade);
		gradeAll.setMileage_exp(Integer.parseInt(mileage_exp));
		gradeAll.setMileage_scope(Integer.parseInt(mileage_scope));
		gradeAll.setMileage_ratio(Integer.parseInt(mileage_ratio));
		gradeAll.setPay_scope(Integer.parseInt(pay_scope));
		gradeAll.setPay_ratio(Integer.parseInt(pay_ratio));
		gradeAll.setPromo_terms(Integer.parseInt(promo_terms));
		int result = dao.gradeAdd(gradeAll);
		return result;
	}
	
	// 회원 총 마일리지 불러오기
	public String mileageAll(String id) {
		return dao.mileageAll(id);
	}
	// 회원 사용한 마일리지 불러오기
	public String mileageUsed(String id) {
		return dao.mileageUsed(id);
	}
	// 회원 사용가능한 마일리지 불러오기
	public String mileageUsable(String id) {
		return dao.mileageUsable(id);
	}
	// 회원 미가용 마일리지 불러오기
	public String mileageFUsable(String id) {
		return dao.mileageFUsable(id);
	}
	// 회원 마일리지 내역 불러오기
	public List<HashMap<String, String>> mileageBalance(String id){
		return dao.mileageBalance(id);
	}
	
	
	// 팝업창 : 예약 전체내역 불러오기 위한 부분
	public List<HashMap<String, String>> getCommonReservation(String id, String reservation_start, String reservation_end){
		HashMap<String, String> value = new HashMap<>();
		value.put("customer_id", id);
		value.put("reservation_start", reservation_start);
		value.put("reservation_end", reservation_end);
		List<HashMap<String, String>> result = dao.getCommonReservation(value);
		return result;
	}
	
	// 팝업창: 예약 세부내역 불러오기 위한 Payment부분
	public String getPayment(String reservation_num) {
		return dao.getPayment(reservation_num);
	}
	// 팝업창: 예약 세부내역 불러오기 위한 Schedule부분
	public ArrayList<Schedule> getSchedule(String reservation_num){
		return dao.getSchedule(reservation_num);
	}
	// 팝업창: 예약 세부내역 불러오기 위한 Route부분
	public ArrayList<Route> getRoute(ArrayList<Schedule> scheduleList){
		return dao.getRoute(scheduleList);
	}
	// 팝업창: 예약 세부내역 불러오기 위한 Airplane부분
	public ArrayList<Airplane> getAirplane(ArrayList<Route> routeList) {
		return dao.getAirplane(routeList);
	}
	// 팝업창 : 예약 세부내역 불러오기 위한 getName부분
	public String getName(String id) {
		return dao.getName(id);
	}

	
	
	

	// 팝업창 : 회원정보 수정하기에서 회원정보 가져오기(customerUpdate.jsp)
	public Customer userInfoFind(String id) {
		return dao.userInfoFind(id);
	}

	// 팝업창 : 회원정보 수정하기에서 회원정보 수정하기(customerUpdate.jsp)
	public int userInfoChange(String customer_id, String customer_name, String customer_birth
								, String customer_country, String customer_gender, String customer_grade
								, String customer_email, String customer_phone, String customer_address) {
		Customer customer = new Customer();
		customer.setCustomer_id(customer_id);
		customer.setCustomer_name(customer_name);
		customer.setCustomer_birth(customer_birth.replaceAll("[^0-9]",""));
		customer.setCustomer_country(customer_country);
		customer.setCustomer_gender(customer_gender);
		customer.setCustomer_grade(customer_grade);
		customer.setCustomer_email(customer_email);
		customer.setCustomer_phone(customer_phone);
		customer.setCustomer_address(customer_address);
		return dao.userInfoChange(customer);
	}

	
	// 팝업창 : 회원 등급 수정하기 부분의 회원등급 정보 가져오기(customerGradeUpdate.jsp)
	public Grade customerGradeSet(String grade) {
		return dao.customerGradeSet(grade);
	}
	// 팝업창 : 회원 등급 수정하기 부분의 회원등급 수정하기(customerGradeUpdate.jsp)
	public int customerGradeChange(String grade, int mileage_scope, int mileage_ratio, int mileage_exp
									, int pay_scope, int pay_ratio, int promo_terms) {
		Grade gradeSet = new Grade();
		gradeSet.setGrade(grade);
		gradeSet.setMileage_scope(mileage_scope);
		gradeSet.setMileage_ratio(mileage_ratio);
		gradeSet.setMileage_exp(mileage_exp);
		gradeSet.setPay_scope(pay_scope);
		gradeSet.setPay_ratio(pay_ratio);
		gradeSet.setPromo_terms(promo_terms);
		return dao.customerGradeChange(gradeSet);
	}

	public int gradeDelete(String[] deleteList) {
		ArrayList<String> values = new ArrayList<>();
		for(String s : deleteList) {
			values.add(s);
		}
		return dao.gradeDelete(values);
	}

	public int countGrade() {
		return dao.countGrade();
	}

	
	// 회원 등급 삭제하기 위한 등급조절


}
