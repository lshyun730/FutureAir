package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FlightDAO {
	
	@Autowired
	SqlSession sqlSession; 

	// 비행일정리스트
	public ArrayList<HashMap<String, String>> getFlightList(HashMap<String, String> bookForm) {
		FlightMapper mapper = sqlSession.getMapper(FlightMapper.class);
		ArrayList<HashMap<String, String>> flightList = mapper.getFlightList(bookForm);
		return flightList;
	}

	public ArrayList<HashMap<String, String>> getWeekInfo(HashMap<String, String> bookForm) {
		FlightMapper mapper = sqlSession.getMapper(FlightMapper.class);		
		ArrayList<HashMap<String, String>> weekList = mapper.getWeekInfo(bookForm);
		return weekList;
	}

}
