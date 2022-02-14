package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.air.future.vo.Airplane;
import com.air.future.vo.Destination;
import com.air.future.vo.Route;

public interface AdminFlightMapper {

//비행일정 페이지
	
	// 비행일정 갯수
	public int getRouteTotal(HashMap<String, String> searchList);
	
	// 비행일정 리스트
	public ArrayList<HashMap<String, String>> routeList(HashMap<String, String> searchList, RowBounds rb);
	
	// 비행일정 삭제
	public int deleteRoute(String route_num);
	
	
	
	
// 예약현황	
	
	// 예약현황 갯수
 	public int getReservationTotal(HashMap<String, String> searchList);
	
	// 예약현황 리스트
	public ArrayList<HashMap<String, String>> reservationList(HashMap<String, String> searchList, RowBounds rb);
	
	// 예약 삭제 (스케줄 테이블)
	public void deleteSchedule(String reservation_num);
	
	// 예약 삭제 (예약 테이블)
	public int deleteReservation(String reservation_num);

	
	
// 공통
	
	// 취향지 리스트
	public ArrayList<Destination> destinationList(String destinationList);
	
	public ArrayList<String> continentsList();

	public Route getRoute(String route_num);

	public int insertFlight(HashMap<String, String> routeForm);

	public ArrayList<Airplane> getAirplaneList();

	public int updateFlight(HashMap<String, String> routeForm);


	
}
