package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.air.future.vo.Destination;

@Repository
public class AdminFlightDAO {
	@Autowired
	SqlSession sqlSession; 


	public int getRouteTotal(HashMap<String, String> route) {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		int total = mapper.getRouteTotal(route);
		return total;
	}

	public ArrayList<HashMap<String, String>> routeList(HashMap<String, String> route, int startRecord, int countPerPage) {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		ArrayList<HashMap<String, String>> routeList = mapper.routeList(route,rb);
		return routeList;
	}
	
	public ArrayList<Destination> destinationList() {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		ArrayList<Destination> destinationList = mapper.destinationList();
		return destinationList;
		
	}

	public int deleteRoute(String route_num) {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		int result = mapper.deleteRoute(route_num);
		return result;
	}
}
