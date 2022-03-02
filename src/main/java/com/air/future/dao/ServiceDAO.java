package com.air.future.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.air.future.vo.Post;

@Repository
public class ServiceDAO {
	
	@Autowired
	SqlSession sqlSession;

	public ArrayList<Post> getNoticeList(String searchText, int startRecord, int countPerPage) {
		ServiceMapper mapper = sqlSession.getMapper(ServiceMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		ArrayList<Post> noticeList = mapper.getNoticeList(searchText, rb);
		return noticeList;
	}

	public int getNoticeListCount(String searchText) {
		ServiceMapper mapper = sqlSession.getMapper(ServiceMapper.class);
		int count = mapper.getNoticeListCount(searchText);
		return count;
	}

	
}
