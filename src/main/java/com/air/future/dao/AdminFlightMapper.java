package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.air.future.vo.Airplane;
import com.air.future.vo.Destination;
import com.air.future.vo.Route;

public interface AdminFlightMapper {

//비행일정 페이지
	
	// 비행일정 갯수 검색
	public int getRouteTotal(HashMap<String, String> searchList);
	
	// 비행일정 리스트 검색
	public ArrayList<HashMap<String, String>> routeList(HashMap<String, String> searchList, RowBounds rb);
	
	// 비행일정 검색
	public HashMap<String, String> getRoute(String route_num);

	// 비행일정 추가
	public int insertFlight(HashMap<String, String> routeForm);
		
	// 비행일정 업데이트
	public int updateFlight(HashMap<String, String> routeForm);	
	
	// 비행일정 삭제
	public int deleteRoute(String route_num);
	
	// 비행번호의 예약된 갯수
	public int getReservationCountByRoutrnum(String route_num);
	
	// 비행기 리스트 검색
	public ArrayList<Airplane> getAirplaneList();
	
	
	
// 예약현황	
	
	// 예약현황 갯수 검색
 	public int getReservationTotal(HashMap<String, String> searchList);
	
	// 예약현황 리스트 검색
	public ArrayList<HashMap<String, String>> reservationList(HashMap<String, String> searchList, RowBounds rb);
	
	// 예약 삭제 - 스케줄 테이블
	// public void deleteSchedule(String reservation_num);
	
	// 예약 삭제 - 예약 테이블
	public int reservationCancle(String reservation_num);

	
	
// 공통
	
	// 취향지 리스트 검색
	public ArrayList<Destination> destinationList(String destinationList);
	
	// 대륙 리스트 검색
	public ArrayList<String> continentsList();


}
