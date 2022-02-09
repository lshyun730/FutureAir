package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.air.future.vo.Destination;

@Repository
public class AdminFlightDAO {
	@Autowired
	SqlSession sqlSession; 

/* 
--------------
비행일정 페이지
-------------- 
*/
	// 비행 리스트 갯수 
	public int getRouteTotal(HashMap<String, String> searchList) {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		int total = mapper.getRouteTotal(searchList);
		return total;
	}

	// 비행일정 리스트
	public ArrayList<HashMap<String, String>> routeList(HashMap<String, String> searchList, int startRecord, int countPerPage) {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		ArrayList<HashMap<String, String>> routeList = mapper.routeList(searchList,rb);
		return routeList;
	}

	// 비행 선택삭제
	public int deleteRoute(String route_num) {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		int result = mapper.deleteRoute(route_num);
		return result;
	}
	
	
/* 
--------------
예약현황 페이지
-------------- 
*/
	// 예약현황 리스트
	public ArrayList<HashMap<String, String>> reservationList(HashMap<String, String> searchList, int startRecord, int countPerPage) {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		ArrayList<HashMap<String, String>> reservationList = mapper.reservationList(searchList,rb);
		return reservationList;
	}
	
	// 예약현황 리스트 갯수
	public int getReservationTotal(HashMap<String, String> searchList) {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		int result = mapper.getReservationTotal(searchList);
		return result;
	}

	// 예약 선택삭제
	@Transactional
	public int deleteReservation(String reservation_num) {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		mapper.deleteSchedule(reservation_num);
		int result = mapper.deleteReservation(reservation_num);
		return result;
	}
	
	
/* 
--------------
공통 메소드
-------------- 
*/	
	// 취향지 리스트
	public ArrayList<Destination> destinationList() {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		ArrayList<Destination> destinationList = mapper.destinationList();
		return destinationList;
		
	}
}
