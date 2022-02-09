package com.air.future.vo;

import lombok.Data;

@Data
public class Board {
	private int board_index;										
	private String title;																
	private String writer;																
	private String topic_type;															
	private String contents;
	private String board_date;
	private int hits;
	private String reply_type;
	private String reply_index;
}
