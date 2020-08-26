package com.test.soccer.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.soccer.DBUtil;

public class MypageDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MypageDAO() {
		//DB 연결
		
		DBUtil util = new DBUtil();
		conn = util.open();
		
	}
	
	public void close() {
		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<MypageDTO> list(String seq) {
		
		try {
			System.out.println(seq);
			String sql = "select * from vwmemberinfo where seq = "+seq;
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			ArrayList<MypageDTO> list = new ArrayList<MypageDTO>();
			
			while(rs.next()) {
				MypageDTO dto = new MypageDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setTeam(rs.getString("teamname"));
				dto.setPosition(rs.getString("position"));
				dto.setHeight(rs.getString("height"));
				dto.setWeight(rs.getString("weight"));
				dto.setImage(rs.getString("image"));

				list.add(dto);
				
				
			}
					
			return list;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}
	
	
}
