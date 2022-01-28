package com.air.future.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.air.future.dao.AdminDAO;
import com.air.future.vo.Admin;

@Service
public class AdminService {

	@Autowired
	AdminDAO dao;
	
	// 관리자 정보 받아오기
	public Admin selectAdmin(String admin_id) {
		Admin admin = dao.selectAdmin(admin_id);
		return admin;
	}

}
