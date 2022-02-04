package com.air.future.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Route {
	private String route_num;
	private String airplane_id;
	private Date departure_date;
	private Date arrival_date;
	private String departure_code;
	private String arrival_code;
	private int eta;
	private int normal_price;
	private int prestige_price;
	private int first_price;
}
