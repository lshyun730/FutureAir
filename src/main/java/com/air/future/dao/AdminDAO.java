package com.air.future.dao;

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

}
