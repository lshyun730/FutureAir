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
	
	/*
	public Board() {
		
	}
	
	
	public Board(int board_index, String title, String writer, String topic_type, String contents, String reply_type) {
		super();
		this.board_index = board_index;
		this.title = title;
		this.writer = writer;
		this.topic_type = topic_type;
		this.contents = contents;
		this.reply_type = reply_type;
	}
	public int getBoard_index() {
		return board_index;
	}
	public void setBoard_index(int board_index) {
		this.board_index = board_index;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTopic_type() {
		return topic_type;
	}
	public void setTopic_type(String topic_type) {
		this.topic_type = topic_type;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getReply_type() {
		return reply_type;
	}
	public void setReply_type(String reply_type) {
		this.reply_type = reply_type;
	}


	@Override
	public String toString() {
		return "Board [board_index=" + board_index + ", title=" + title + ", writer=" + writer + ", topic_type="
				+ topic_type + ", contents=" + contents + ", reply_type=" + reply_type + "]";
	}
	
	*/
	
	
	

}
