package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface FlightMapper {
	
	ArrayList<HashMap<String, String>> getFlightList(HashMap<String, String> bookForm);

	ArrayList<HashMap<String, String>> getWeekInfo(HashMap<String, String> bookForm);

}
