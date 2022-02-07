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

	public ArrayList<HashMap<String, String>> routeList(HashMap<String, String> map, PageNavigator navi ) {
		
		if(map.get("departure_date_start").isEmpty()) {
			LocalDate today = LocalDate.now();
			map.put("departure_date_start", today.toString());
		}
		
		if(map.get("departure_date_end").isEmpty()) {
			LocalDate yearsAgoDate = LocalDate.now().plusDays(365);
			map.put("departure_date_end", yearsAgoDate.toString());
		}
		
		ArrayList<HashMap<String, String>> routeList = dao.routeList(map, navi.getStartRecord(), navi.getCountPerPage());
		return routeList;
	}

	public int getRouteTotal(HashMap<String, String> map) {
		int total = dao.getRouteTotal(map);
		return total;
	}
	
	public ArrayList<Destination> destinationList() {
		ArrayList<Destination> destinationList = dao.destinationList();
		return destinationList;
	}

	public int deleteRoute(String route_num) {
		int result = dao.deleteRoute(route_num);
		return result;
	}

}
