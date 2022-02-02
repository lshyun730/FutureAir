package com.air.future.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.air.future.dao.CustomerDAO;
import com.air.future.vo.Customer;
import com.air.future.vo.Grade;

@Service
public class CustomerService {

	@Autowired
	CustomerDAO dao;
	
	// 회원정보 전체 불러오기
	public ArrayList<Customer> customerListAll() {
		ArrayList<Customer> customerListAll = dao.customerListAll();
		return customerListAll;
	}
	
	// 회원정보 검색 결과 값 불러오기
	public ArrayList<Customer> customerFind(String customer_name, String customer_id, String customer_email
											, String customer_phone, String customer_gender, String customer_grade) {
		Customer customer = new Customer();
		customer.setCustomer_name(customer_name);
		customer.setCustomer_id(customer_id);
		customer.setCustomer_email(customer_email);
		customer.setCustomer_phone(customer_phone);
		customer.setCustomer_gender(customer_gender);
		customer.setCustomer_grade(customer_grade);
		ArrayList<Customer> customerFind = dao.customerFind(customer);
		return customerFind;
	}
	
	// 회원정보 삭제하기
	public int customerDelete(String[] customers) {
		ArrayList<Customer> customerList = new ArrayList<>();
		for(String customer : customers) {
			Customer c = new Customer();
			c.setCustomer_id(customer);
			customerList.add(c);
		}
		int result = dao.customerDelete(customerList);
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
	
	// 회원등급 전체 불러오기
	public ArrayList<Grade> customerGradeAll(){
		ArrayList<Grade> customerGradeAll = dao.customerGradeAll();
		return customerGradeAll;
	}
	
	// 회원등급 검색을 통한 결과값 불러오기
	public ArrayList<Customer> gradeFind(String customer_name, String customer_id, String customer_grade) {
		Customer customer = new Customer();
		customer.setCustomer_name(customer_name);
		customer.setCustomer_id(customer_id);
		customer.setCustomer_grade(customer_grade);
		ArrayList<Customer> customerListAll = dao.gradeFind(customer);
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

}
