package com.test.soccer.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.soccer.DBUtil;
import com.test.soccer.board.formationDTO;

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

	
	//오희준
	//포미에션 위치값 가지고 오기
	public ArrayList<formationDTO> formation(String member_seq) {
		
		try {
			
			String sql = "select f.seq, f.formation, f.position_x, f.position_y from TBLTEAM te inner join TBLTRANSFER tr on te.seq = tr.team_seq inner join TBLMEMBER_TEAM mt on mt.seq = tr.seq inner join TBLPLAYERENTRY p on p.member_team_seq = mt.seq inner join TBLFORMATION f on f.playerentry_seq = p.seq inner join TBLPOSITION po on po.seq = f.position_seq inner join TBLMEMBER m on m.seq = tr.member_seq inner join TBLCOACH c on c.team_seq = te.seq where te.seq = ? order by f.seq"; 
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, member_seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<formationDTO> list = new ArrayList<formationDTO>();
			
			while(rs.next()) {
				
				formationDTO dto = new formationDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setPosition_x(rs.getString("position_x"));
				dto.setPosition_y(rs.getString("position_y"));
				dto.setFormation(rs.getString("formation"));
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			
			System.out.println("AjaxDAO.formation()");
			e.printStackTrace();
			
		}
		
		return null;
	}
	
	//오희준
	//포메이션 위치값 수정
	public int editFormation(formationDTO dto) {
		
		try {
			
			String sql = "update tblformation set position_x = ?, position_y = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getPosition_x());
			pstat.setString(2, dto.getPosition_y());
			pstat.setString(3, dto.getSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			
			System.out.println("AjaxDAO.editFormation()");
			e.printStackTrace();
			
		}
		
		return 0;
	}

	public String getTeam_seq(String member_seq) {
		// TODO Auto-generated method stub
		try {
			
			String sql="select * from tblmember m inner join tblcoach c on m.seq = c.member_seq inner join tblteam t on t.seq = c.team_seq where m.seq=?";
			
			pstat=conn.prepareStatement(sql);
			pstat.setString(1,member_seq);
			
			rs=pstat.executeQuery();
			if(rs.next()) {
				return rs.getString("team_seq");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	

}
