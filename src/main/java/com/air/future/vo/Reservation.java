package com.air.future.vo;

import lombok.Data;

@Data
public class Reservation {
	private String reservation_num;
	private String customer_id;
	private String reservation_date;
	private String reservation_state;
	private String payment;
}
