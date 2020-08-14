package com.test.soccer.team;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

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
	public ArrayList<TeamlistDTO> list(HashMap<String,String> map) {
		// TODO Auto-generated method stub
		try {
			//--seq, logo, name, coachname, birth, count, ground, lat,lng, points,league_seq
			String sql="select seq, logo, name, coachname, to_char(birth,'yyyymmdd') birth, count, ground, lat,lng, points,league_seq from teamlist";
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
				dto.setPoints(rs.getString("points"));
				dto.setLeague_seq(rs.getString("league_seq"));
				
				list.add(dto);
			}
			stat.close();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	//teamlist 서블릿 -> 리스트의 총 개수를 돌려준다.
	public int getTotalCount(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return 0;
	}
}//TeamlistDAO
