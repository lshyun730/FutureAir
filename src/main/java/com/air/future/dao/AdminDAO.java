package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.air.future.vo.Admin;

@Repository
public class AdminDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	// 관리자 정보 받아오기
	public Admin selectAdmin(String admin_id) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class); 
		Admin admin = mapper.selectAdmin(admin_id);
		return admin;
	}
	
	// 오늘 수익, 예약수, 비행일정
	public HashMap<String,String> todayInfo() {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		HashMap<String,String> todayInfo = mapper.todayInComeReservation();
		todayInfo.putAll(mapper.todayFlight());
		return todayInfo;
	}
	
	// 기간 매출 그래프
	public ArrayList<HashMap<String,String>> graphIncome() {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		ArrayList<HashMap<String,String>> todayInfo = mapper.graphIncome();
		return todayInfo;
	}
	
	// 기간 예약분석
	public ArrayList<HashMap<String,String>> graphReservation() {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		ArrayList<HashMap<String,String>> graphReservation = mapper.graphReservation();
		return graphReservation;
	}
		
	// 대륙별 점유율 
	public ArrayList<HashMap<String,String>> rateContinents() {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		ArrayList<HashMap<String,String>> rateContinents = mapper.rateContinents();
		return rateContinents;
	}
	
	// 인기항공권 
		public ArrayList<HashMap<String,String>> popularFlight() {
			AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
			ArrayList<HashMap<String,String>> popularFlight = mapper.popularFlight();
			return popularFlight;
		}
	
	// 최근예약
	public ArrayList<HashMap<String,String>> recentReservation() {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		ArrayList<HashMap<String,String>> recentReservation = mapper.recentReservation();
		return recentReservation;
	}

}
