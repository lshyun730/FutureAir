package com.air.future.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.air.future.dao.AdminFlightDAO;
import com.air.future.util.PageNavigator;
import com.air.future.vo.Destination;

@Service
public class AdminFlightService {
	@Autowired
	AdminFlightDAO dao;

	// 비행일정 리스트
	public ArrayList<HashMap<String, String>> routeList(HashMap<String, String> map, PageNavigator navi ) {
		
		// departure_date_start에 오늘 날짜 입력
		if(map.get("departure_date_start").isEmpty()) {
			LocalDate today = LocalDate.now();
			map.put("departure_date_start", today.toString());
		}
		// departure_date_end에 일년 뒤 날짜 입력
		if(map.get("departure_date_end").isEmpty()) {
			LocalDate yearsAgoDate = LocalDate.now().plusDays(365);
			map.put("departure_date_end", yearsAgoDate.toString());
		}
		
		ArrayList<HashMap<String, String>> routeList = dao.routeList(map, navi.getStartRecord(), navi.getCountPerPage());
		return routeList;
	}

	// 비행일정 갯수
	public int getRouteTotal(HashMap<String, String> map) {
		int total = dao.getRouteTotal(map);
		return total;
	}
	
	// 선택삭제
	public ArrayList<Destination> destinationList() {
		ArrayList<Destination> destinationList = dao.destinationList();
		return destinationList;
	}

	public int deleteRoute(String[] deleteList) {
		int result = 0;
		for (String route_num : deleteList) {
			result = dao.deleteRoute(route_num);
		}
		return result;
	}

}
