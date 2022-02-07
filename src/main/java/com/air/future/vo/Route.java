package com.air.future.vo;

import lombok.Data;

@Data
public class Route {
	private String route_num;
	private String airplane_id;
	private String departure_date;
	private String arrival_date;
	private String departure_name;
	private String arrival_name;
	private int eta;
	private int normal_price;
	private int prestige_price;
	private int first_price;
	private Airplane airplane;
}
