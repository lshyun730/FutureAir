package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.air.future.vo.Route;

public interface AdminFlightMapper {

	public int getRouteTotal(HashMap<String, String> route);
	public ArrayList<Route> routeList(HashMap<String, String> route, RowBounds rb);

}
