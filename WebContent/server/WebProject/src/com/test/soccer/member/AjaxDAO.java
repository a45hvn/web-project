package com.test.soccer.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.soccer.DBUtil;

public class AjaxDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;	
	
	public AjaxDAO() {
		DBUtil util = new DBUtil();
		conn = util.open();
	}	
	
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//아이디 중복검사
	public int check(String idCheck) {
		
		try {
			
			String sql = "select count(*) as cnt from tblMember where id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, idCheck);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt"); //1, 0
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	
	//지역선택시 팀명단 가져오기
	public ArrayList<MemberDTO> getTeam(String home1) {
		
		String where = "";
		
		try {
//			System.out.println(home1);
			
			if(!home1.equals("")) {
				
				where = String.format("where homename = '%s'", home1);
				
//				System.out.println(where);
				
			}
			
			String sql = String.format("select teamname from vwteamstat %s",where);
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
//			System.out.println(sql);
			
			ArrayList<MemberDTO> listteam = new ArrayList<MemberDTO>();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				
				dto.setTeam(rs.getString("teamname"));
//				System.out.println(dto.getTeam());
				
				listteam.add(dto);
			}
			
			return listteam;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	//팀선택시 선수명단 가져오기
	public ArrayList<MemberDTO> getPlayer(String team1) {
		try {
			
			
			String sql = String.format("select membername from vwteamanlysis where teamname='%s' group by membername",team1);
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
//			System.out.println(sql);
			
			ArrayList<MemberDTO> listPlayer = new ArrayList<MemberDTO>();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				
				dto.setName(rs.getString("membername"));
//				System.out.println(dto.getTeam());
				
				listPlayer.add(dto);
			}
			
			return listPlayer;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
