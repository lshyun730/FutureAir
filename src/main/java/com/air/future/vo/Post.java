package com.air.future.vo;

import lombok.Data;

@Data
public class Post {
	private int post_index;										
	private String title;																
	private String writer;																
	private String board_name;															
	private String contents;
	private String post_date;
	private int hits;
	private String notice_index;	
	private String post_type;	
	private String reply_index;
}
