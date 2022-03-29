package com.air.future.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.air.future.vo.Post;

public interface ServiceMapper {

	public ArrayList<Post> getNoticeList(String searchText, RowBounds rb);

	public int getNoticeListCount(String searchText);

	public ArrayList<Post> getFixList();

	public ArrayList<String> getPostType();

	public ArrayList<Post> getfaqList(String type);


}
