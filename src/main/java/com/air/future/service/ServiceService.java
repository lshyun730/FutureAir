package com.air.future.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.air.future.dao.ServiceDAO;
import com.air.future.util.PageNavigator;
import com.air.future.vo.Post;


@Service
public class ServiceService {

	@Autowired
	ServiceDAO dao;

	public ArrayList<Post> getNoticeList(String searchText, PageNavigator navi) {
		ArrayList<Post> noticeList = dao.getNoticeList(searchText, navi.getStartRecord(), navi.getCountPerPage());
		return noticeList;
	}

	public int getNoticeListCount(String searchText) {
		int count = dao.getNoticeListCount(searchText);
		return count;
	}

	public ArrayList<Post> getFixList() {
		ArrayList<Post> fixList = dao.getFixList();
		return fixList;
	}

	public ArrayList<ArrayList<Post>> getfaqList() {
		ArrayList<ArrayList<Post>> faqList = dao.getfaqList();
		return faqList;
	}

	public ArrayList<String> getPostType() {
		ArrayList<String> postType = dao.getPostType();
		return postType;
	}

}
