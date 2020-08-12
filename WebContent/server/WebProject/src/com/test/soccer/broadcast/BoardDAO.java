package com.test.soccer.broadcast;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.soccer.DBUtil;

public class BoardDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BoardDAO() {
		//DB연결
		DBUtil util = new DBUtil();
		conn = util.open();
	}
	
	public void close() {
		try {
			
		} catch (Exception e) {
	
			e.printStackTrace();
		}
	}
	
	//recruit (게시판 리스트 출력하기)
	public ArrayList<BoardDTO> list(HashMap<String,String> map)}


	
	
	
}
