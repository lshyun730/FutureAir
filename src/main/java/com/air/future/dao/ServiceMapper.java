package com.air.future.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.air.future.vo.Post;

public interface ServiceMapper {

	ArrayList<Post> getNoticeList(String searchText, RowBounds rb);

	int getNoticeListCount(String searchText);

}
