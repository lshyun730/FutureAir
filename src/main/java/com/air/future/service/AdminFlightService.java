package com.air.future.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.air.future.dao.AdminFlightDAO;
import com.air.future.util.PageNavigator;
import com.air.future.vo.Airplane;
import com.air.future.vo.Destination;
import com.air.future.vo.Route;

@Service
public class AdminFlightService {
	@Autowired
	AdminFlightDAO dao;

/* 
--------------
비행일정 페이지
-------------- 
*/	
	// 비행일정 리스트
	public ArrayList<HashMap<String, String>> routeList(HashMap<String, String> searchList, PageNavigator navi ) {
		
		// departure_date_start에 오늘 날짜 입력
		if(searchList.get("departure_date_start").isEmpty()) {
			LocalDate today = LocalDate.now();
			searchList.put("departure_date_start", today.toString());
		}
		// departure_date_end에 일년 뒤 날짜 입력
		if(searchList.get("departure_date_end").isEmpty()) {
			LocalDate yearsAgoDate = LocalDate.now().plusDays(365);
			searchList.put("departure_date_end", yearsAgoDate.toString());
		}
		
		ArrayList<HashMap<String, String>> routeList = dao.routeList(searchList, navi.getStartRecord(), navi.getCountPerPage());
		return routeList;
	}

	// 비행일정 리스트 갯수
	public int getRouteTotal(HashMap<String, String> searchList) {
		int total = dao.getRouteTotal(searchList);
		return total;
	}
	
	// 비행일정 검색
	public Route getRoute(String route_num) {
		Route route = dao.getRoute(route_num);
		return route;
	}
	
	// 비행일정 추가
	public int insertFlight(HashMap<String, String> routeForm) {
		String departure_date = routeForm.get("departure_date") + " " + routeForm.get("departure_time");
		String arrival_date = routeForm.get("arrival_date") + " " + routeForm.get("arrival_time");
		
		routeForm.put("departure_date", departure_date);
		routeForm.put("arrival_date", arrival_date);
		int result = dao.insertFlight(routeForm);
		return result;
	}

	// 비행일정 업데이트
	public int updateFlight(HashMap<String, String> routeForm) {
		String departure_date = routeForm.get("departure_date") + " " + routeForm.get("departure_time");
		String arrival_date = routeForm.get("arrival_date") + " " + routeForm.get("arrival_time");
		
		routeForm.put("departure_date", departure_date);
		routeForm.put("arrival_date", arrival_date);
		int result = dao.updateFlight(routeForm);
		return result;
	}
		
	// 비행 선택삭제
	public int deleteRoute(String route_num) {
		int result = dao.deleteRoute(route_num);
		return result;
	}
	
	// 비행 선택리스트 삭제
	public int deleteRouteList(String[] deleteList) {
		int result = 0;
		for (String route_num : deleteList) {
			result = dao.deleteRoute(route_num);
		}
		return result;
	}
	
	// 비행기 리스트 검색
	public ArrayList<Airplane> getAirplaneList() {
		ArrayList<Airplane> planeList = dao.getAirplaneList();
		return planeList;
	}

	
	
/* 
--------------
예약현황 페이지
-------------- 
*/
	// 예약현황 리스트
	public ArrayList<HashMap<String, String>> reservationList(HashMap<String, String> searchList, PageNavigator navi) {
		ArrayList<HashMap<String, String>> reservationList = dao.reservationList(searchList, navi.getStartRecord(), navi.getCountPerPage());
		return reservationList;
	}
	
	// 예약현황 리스트 갯수
	public int getReservationTotal(HashMap<String, String> searchList) {
		int total = dao.getReservationTotal(searchList);
		return total;
	}

	// 예약 선택삭제
	public int deleteReservation(String reservation_num) {
		int result = dao.deleteReservation(reservation_num);
		return result;
	}

	// 예약 선택삭제 리스트
	public int deleteReservation(String[] deleteList) {
		int result = 0;
		for (String reservation_num : deleteList) {
			result = dao.deleteReservation(reservation_num);
		}
		return result;
	}


	
/* 
--------------
공통 메소드
-------------- 
*/
	// 취향지 리스트
	public ArrayList<ArrayList<Destination>> destinationList() {
		ArrayList<ArrayList<Destination>> destinationList = dao.destinationList();
		return destinationList;
	}

	


}
