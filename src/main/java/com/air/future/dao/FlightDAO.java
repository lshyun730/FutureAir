package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.air.future.vo.Customer;
import com.air.future.vo.Reservation;
import com.air.future.vo.Schedule;

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

	public HashMap<String, String> getRoute(String route_num) {
		FlightMapper mapper = sqlSession.getMapper(FlightMapper.class);		
		HashMap<String, String>  flightList = mapper.getFlight(route_num);
		return flightList;
	}

	public Customer getCustomerInfo(String userInfo) {
		FlightMapper mapper = sqlSession.getMapper(FlightMapper.class);		
		Customer customer = mapper.getCustomerInfo(userInfo);
		return customer;
	}

	public String getReservationNum() {
		FlightMapper mapper = sqlSession.getMapper(FlightMapper.class);		
		String reservationNum = mapper.getReservationNum();
		return reservationNum;
	}

	@Transactional
	public int insertReservation(Reservation reservation, ArrayList<Schedule> scheduleList, String string) {
		FlightMapper mapper = sqlSession.getMapper(FlightMapper.class);				
		int result = 0;
		result = mapper.insertReservation(reservation); 
		for (int i = 0; i < scheduleList.size(); i++) {
			result = mapper.insertSchedule(scheduleList.get(i)); 
		}
		return 0;
	}
}
