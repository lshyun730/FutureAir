package com.air.future.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.air.future.dao.FlightDAO;
import com.air.future.vo.Customer;

@Service
public class FlightService {
	
	@Autowired
	FlightDAO dao;

	public ArrayList<ArrayList<HashMap<String, String>>> getFlightList (HashMap<String, String> bookForm)  {
		
		HashMap<String, String> bookSearch =  new HashMap<String, String>(bookForm);
		ArrayList<ArrayList<HashMap<String, String>>> flightListType = new ArrayList<>();
		String reser_type = bookSearch.get("reservation_type");
		String[] date = null;

		if(!bookSearch.get("pick_date_list").equals("")) date = bookSearch.get("pick_date_list").split(",");
		if(bookSearch.get("pick_date_list").equals("")) date = bookSearch.get("departure_date").split(" ~ ");

		for (int i = 0; i < date.length; i++) {
		    bookSearch.put("departure_date", date[i]);
		    if(i == 1 && reser_type.equals("왕복")) {
		        String departure_name = bookSearch.get("departure_name");
		        bookSearch.put("departure_name", bookSearch.get("arrival_name"));
		        bookSearch.put("arrival_name", departure_name);
		    }
		    flightListType.add(dao.getFlightList(bookSearch));
		}
		return flightListType;
	}
	
	public ArrayList<ArrayList<HashMap<String, String>>> getWeekInfo(HashMap<String, String> bookForm) {
		
		ArrayList<ArrayList<HashMap<String, String>>> weekInfo = new ArrayList<>();
		HashMap<String, String> bookSearch =  new HashMap<String, String>(bookForm);
		String reser_type = bookSearch.get("reservation_type");
		String[] date = null;
		
		if(!bookSearch.get("pick_date_list").equals("")) date = bookSearch.get("pick_date_list").split(",");
		if(bookSearch.get("pick_date_list").equals("")) date = bookSearch.get("departure_date").split(" ~ ");	
		
		for (int i = 0; i < date.length; i++) {
			bookSearch.put("pick_date", date[i]);
			if(i == 1 && reser_type.equals("왕복")) {
				String departure_name = bookSearch.get("departure_name");
				bookSearch.put("departure_name", bookSearch.get("arrival_name"));
				bookSearch.put("arrival_name", departure_name);
			}
			weekInfo.add(dao.getWeekInfo(bookSearch));
		}
		return weekInfo;
	
	}

	public ArrayList<HashMap<String, String>> getRoute(HashMap<String, String> bookForm) {
		ArrayList<HashMap<String, String>> flightList = new ArrayList<>();
		System.out.println(bookForm.get("route_num[]"));
		String[] route_num_list = bookForm.get("route_num[]").split(",");
		for (int i = 0; i < route_num_list.length; i++) {
			System.out.println(route_num_list[i]);
			flightList.add(dao.getRoute(route_num_list[i]));
		}
		return flightList;
	}

	public Customer getCustomerInfo(String userInfo) {
		Customer customer = dao.getCustomerInfo(userInfo);
		return customer;
	}
}
