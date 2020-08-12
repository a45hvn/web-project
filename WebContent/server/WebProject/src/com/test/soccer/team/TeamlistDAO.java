package com.test.soccer.team;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.soccer.DBUtil;

public class TeamlistDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public TeamlistDAO() {
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
	//teamlist 서블릿 -> 팀목록
	public ArrayList<TeamlistDTO> list() {
		// TODO Auto-generated method stub
		try {
			String sql="select*from teamlist";
			stat=conn.createStatement();
			rs=stat.executeQuery(sql);
			//seq, logo, name, coachname, birth, count, ground, lat,lng
			ArrayList<TeamlistDTO> list=new ArrayList<TeamlistDTO>();
			while(rs.next()) {
				TeamlistDTO dto=new TeamlistDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setLogo(rs.getString("logo"));
				dto.setName(rs.getString("name"));
				dto.setCoachname(rs.getString("coachname"));
				dto.setBirth(rs.getString("birth"));
				dto.setCount(rs.getString("count"));
				dto.setGround(rs.getString("ground"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				
				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
}//TeamlistDAO
