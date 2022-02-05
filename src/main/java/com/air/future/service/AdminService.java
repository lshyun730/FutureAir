package com.air.future.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.air.future.dao.AdminDAO;
import com.air.future.vo.Admin;

@Service
public class AdminService {

	@Autowired
	AdminDAO dao;
	
	// 관리자 정보 받아오기
	public Admin selectAdmin(String admin_id) {
		Admin admin = dao.selectAdmin(admin_id);
		return admin;
	}

	// 오늘 수익, 예약수
	public HashMap<String, String> todayInfo() {
		HashMap<String, String> todayInfo = dao.todayInfo();
		return todayInfo; 
	}
		
	// 인기 항공권
	public ArrayList<HashMap<String, String>> popularFlight() {
		ArrayList<HashMap<String, String>> popularFlight = dao.popularFlight();
		return popularFlight; 
	}
	
	// 기간 매출 그래프
	public ArrayList<HashMap<String, String>> graphIncome() {
		ArrayList<HashMap<String, String>> graphIncome = dao.graphIncome();
		return graphIncome; 
	}
	
	// 예약분석
	public ArrayList<HashMap<String, String>> graphReservation() {
		ArrayList<HashMap<String, String>> graphReservation = dao.graphReservation();
		return graphReservation;
	}
		
	// 대륙별 점유율 
	public ArrayList<HashMap<String, String>> rateContinents() {
		ArrayList<HashMap<String, String>> rateContinents = dao.rateContinents();
		return rateContinents; 
	}
	
	// 최근 예약
	public ArrayList<HashMap<String, String>> recentReservation() {
		ArrayList<HashMap<String, String>> recentReservation = dao.recentReservation();
		return recentReservation; 
	}
	
	
}
