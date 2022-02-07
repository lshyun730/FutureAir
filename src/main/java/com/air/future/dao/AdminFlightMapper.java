package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.air.future.vo.Destination;

public interface AdminFlightMapper {
	
	// 비행일정 갯수
	public int getRouteTotal(HashMap<String, String> route);
	
	// 비행일정 리스트
	public ArrayList<HashMap<String, String>> routeList(HashMap<String, String> route, RowBounds rb);
	
	// 취향지 리스트
	public ArrayList<Destination> destinationList();
	
	// 비행일정 삭제
	public int deleteRoute(String route_num);

}
