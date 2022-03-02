package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.air.future.vo.Customer;

public interface FlightMapper {
	
	ArrayList<HashMap<String, String>> getFlightList(HashMap<String, String> bookForm);

	ArrayList<HashMap<String, String>> getWeekInfo(HashMap<String, String> bookForm);

	HashMap<String, String> getFlight(String route_num);

	Customer getCustomerInfo(String userInfo);

}
