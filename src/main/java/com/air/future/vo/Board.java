package com.air.future.vo;

import lombok.Data;

@Data
public class Board {
	private String board_name;
	private int board_id;
	private String board_type;
	private String reply_type;
	private String write_right;
	private String read_right;
}
