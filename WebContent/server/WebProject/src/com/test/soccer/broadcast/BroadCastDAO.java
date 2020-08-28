package com.test.soccer.broadcast;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.soccer.DBUtil;

public class BroadCastDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	private ResultSet rs2;

	public BroadCastDAO() {
		// DB 연결

		DBUtil util = new DBUtil();
		conn = util.open();

	}

	public void close() {
		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public ArrayList<BroadCastDTO> broadCastList(String leagueGame_seq){
		
		try {
			String sql = "select * from tblbroadcast where leaguegame_seq =" + leagueGame_seq;
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			
			ArrayList<BroadCastDTO> broadCastList = new ArrayList<BroadCastDTO>();
			while(rs.next()) {
				BroadCastDTO dto = new BroadCastDTO();
				dto.setTime(rs.getString("time"));
				dto.setPlayerName(rs.getString("playerName"));
				dto.setTeam(rs.getString("team"));
				dto.setEvent(rs.getString("event"));	
				
				broadCastList.add(dto);
			
			}
			return broadCastList;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	
	
	public ArrayList<PlayerInformationDTO> getPlayerInformation(String teamname) {
	      // TODO Auto-generated method stub
	      /*
	       select*from player
	       mt.seq member_Seq, mt.backnumber backnumber, mt.height height,
	        mt.weight weight, position.position position, member.name playername,
	        member.image playerimage, to_char(member.birth,'yyyymmdd') birth,
	        team.name teamname, to_char(transfer.completedate,'yyyymmdd') completedate
	       */
	      try {
	         String where ="";
	         if(teamname!=null||teamname!="") {
	            where=String.format("where teamname='%s'",teamname);
	         }
	         String sql=String.format("select*from player %s",where);
	         
	         //return 할 ArrayList<>
	         ArrayList<PlayerInformationDTO> playerInfo=new ArrayList<PlayerInformationDTO>();
	         
	         pstat=conn.prepareStatement(sql);
	         rs=pstat.executeQuery();
	         while(rs.next()) {
	            PlayerInformationDTO dto=new PlayerInformationDTO();
	            dto.setMember_seq(rs.getString("member_seq"));
	            dto.setBacknumber(rs.getString("backnumber"));
	            dto.setHeight(rs.getString("height"));
	            dto.setWeight(rs.getString("weight"));
	            dto.setPlayerimage(rs.getString("playerimage"));
	            dto.setPlayername(rs.getString("playername"));
	            dto.setBirth(rs.getString("birth"));
	            dto.setCompletedate(rs.getString("completedate"));
	            dto.setPosition(rs.getString("position"));
	            dto.setTeamname(rs.getString("teamname"));
	            
	            playerInfo.add(dto);
	         }
	         
	         return playerInfo;
	      } catch (Exception e) {
	         // TODO: handle exception
	         e.printStackTrace();
	      }
	      return null;
	   }
	
	
	
	
	
	
	
	
	
}
