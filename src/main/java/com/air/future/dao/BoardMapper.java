package com.air.future.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.air.future.vo.Board;

public interface BoardMapper {
	//보드 매니저 가져오기
	public ArrayList<Board> selectBoard(HashMap map,RowBounds rb);
	//보드 매니저 삭제하기
	public int deleteBoard(int board_index);
	//미사용
	public ArrayList<Board> searchBoard(HashMap map);
	//보드 매니저 총 갯수
	public int getTotal(HashMap map);
	//보드 세팅 가져오기
	public ArrayList<Board> selectBoardSetting(RowBounds rb);
	//보드 세팅 총갯수 가져오기
	public int getSettingTotal();
	//게시판 추가하기
	public int insertBoard(HashMap map);
	
}
