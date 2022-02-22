package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.air.future.vo.Airplane;
import com.air.future.vo.Destination;
import com.air.future.vo.Route;

@Repository
public class AdminFlightDAO {
	@Autowired
	SqlSession sqlSession; 

/* 
--------------
비행일정 페이지
-------------- 
*/
	// 비행일정 갯수 검색
	public int getRouteTotal(HashMap<String, String> searchList) {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		int total = mapper.getRouteTotal(searchList);
		return total;
	}

	// 비행일정 리스트 검색
	public ArrayList<HashMap<String, String>> routeList(HashMap<String, String> searchList, int startRecord, int countPerPage) {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		ArrayList<HashMap<String, String>> routeList = mapper.routeList(searchList,rb);
		return routeList;
	}
	
	// 비행일정 검색
	public HashMap<String, String>  getRoute(String route_num) {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		HashMap<String, String>  route = mapper.getRoute(route_num);
		return route;
	}

	// 비행일정 추가
	public int insertFlight(HashMap<String, String> routeForm) {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		int result = mapper.insertFlight(routeForm);
		return result;
	}

	// 비행일정 업데이트
	public int updateFlight(HashMap<String, String> routeForm) {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		int result = 0;
		result = mapper.updateFlight(routeForm);
		return result;
	}
	
	// 비행일정 삭제
	public int deleteRoute(String route_num) {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		int reservationCount = mapper.getReservationCountByRoutrnum(route_num);
		
		if (reservationCount > 0) return -1;
		
		int result = mapper.deleteRoute(route_num);
		return result;
	}
	
	// 비행기 리스트 검색 
	public ArrayList<Airplane> getAirplaneList() {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		ArrayList<Airplane> planeList = mapper.getAirplaneList();
		return planeList;
	}
	
	// 비행일정상세 - 예약고객리스트
	public ArrayList<HashMap<String, String>> getReservationByRoutenum(String route_num) {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		ArrayList<HashMap<String, String>> reservationList = mapper.getReservationByRoutenum(route_num);
		return reservationList;
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
	public int reservationCancle(String reservation_num) {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		// mapper.deleteSchedule(reservation_num);
		int result = mapper.reservationCancle(reservation_num);
		return result;
	}
	
	
/* 
--------------
공통 메소드
-------------- 
*/	
	// 취향지 리스트
	public ArrayList<ArrayList<Destination>> destinationList() {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		ArrayList<String> continentsList = mapper.continentsList();
		ArrayList<ArrayList<Destination>> destinationList = new  ArrayList<ArrayList<Destination>>();
		
		for (String continent : continentsList) {
			destinationList.add(mapper.destinationList(continent));
		}
		return destinationList;
	}



}
