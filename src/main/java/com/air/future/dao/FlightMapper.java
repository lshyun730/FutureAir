package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.air.future.vo.Customer;
import com.air.future.vo.Reservation;
import com.air.future.vo.Schedule;

public interface FlightMapper {
	
	// 비행일정 불러오기
	public ArrayList<HashMap<String, String>> getFlightList(HashMap<String, String> bookForm);

	// 선택된 날짜의 전후 3일간의 날짜, 가격 정보 불러오기
	public ArrayList<HashMap<String, String>> getWeekInfo(HashMap<String, String> bookForm);

	// 비행일정 정보 불러오기
	public HashMap<String, String> getFlight(String route_num);

	// 회원정보 불러오기
	public Customer getCustomerInfo(String userInfo);

	// 예약번호 생성하기
	public String getReservationNum();

	// 예약 삽입
	public int insertReservation(Reservation reservation);

	// 예약상세 삽입
	public int insertSchedule(Schedule schedule);

}
