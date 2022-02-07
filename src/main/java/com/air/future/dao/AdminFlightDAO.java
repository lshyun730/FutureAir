package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.air.future.vo.Route;

@Repository
public class AdminFlightDAO {
	@Autowired
	SqlSession sqlSession; 


	public int getRouteTotal(HashMap<String, String> route) {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		int total = mapper.getRouteTotal(route);
		System.out.println(total);
		return total;
	}

	public ArrayList<Route> routeList(HashMap<String, String> route, int startRecord, int countPerPage) {
		AdminFlightMapper mapper = sqlSession.getMapper(AdminFlightMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		ArrayList<Route> routeList = mapper.routeList(route,rb);
		System.out.println(routeList);
		return routeList;
	}
}
