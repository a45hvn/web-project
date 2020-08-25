package com.test.soccer.broadcast;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.soccer.DBUtil;
import com.test.soccer.team.PlayerInformationDTO;

public class BroadcastDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	private ResultSet rs2;

	public BroadcastDAO() {
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

	//문자중계데이터를 불러오는 작업
	public ArrayList<BroadcastDTO> broadCastList(String leagueGame_seq){
		
		try {
			String sql = "select rownum,bc.time, lg.seq as leagueGame_seq, t.name as teamName, m.name as playerName, bca.event from tblbroadcast bc " + 
					"inner join tblbroadcastact bca on bc.broadcastact_seq = bca.seq " + 
					"    inner join TBLPLAYERENTRY pl on pl.seq = bc.playerentry_seq " + 
					"        inner join TBLLEAGUEGAME lg on lg.seq = bc.leaguegame_seq" + 
					"            inner join TBLMEMBER_TEAM mt on mt.seq = pl.member_team_seq" + 
					"                inner join TBLTRANSFER ts on ts.seq = mt.transfer_seq" + 
					"                    inner join TBLMEMBER m on m.seq = ts.member_seq" + 
					"                        inner join tblteam t on t.seq = ts.team_seq where bc.leaguegame_seq=? order by bc.leaguegame_seq" ;
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, "leagueGame_seq");
			rs = pstat.executeQuery();
			
			
			ArrayList<BroadcastDTO> broadCastList = new ArrayList<BroadcastDTO>();
			while(rs.next()) {
				BroadcastDTO dto = new BroadcastDTO();
				dto.setTime(rs.getString("time"));
				dto.setPlayerName(rs.getString("playerName"));
				dto.setTeam(rs.getString("team"));
				dto.setEvent(rs.getString("event"));	
				dto.setRownum(rs.getString("rownum"));	
				
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

	public ArrayList<BroadcastDTO> broadcastScheduleList(HashMap<String, String> map) {
		try {
			String sql = "select * from (select a.*, rownum as rnum from (select * from vwbroadcastschedule order by seq desc)a) where rnum >=? and rnum <=? order by seq desc";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("begin"));
			pstat.setString(2, map.get("end"));
			
			rs = pstat.executeQuery();
			ArrayList<BroadcastDTO> broadcastScheduleList = new ArrayList<BroadcastDTO>();
			
			while(rs.next()) {
				BroadcastDTO dto = new BroadcastDTO();
				dto.setRownum(rs.getString("rnum"));
				dto.setLeague(rs.getString("league"));
				dto.setGamedate(rs.getString("gamedate"));
				dto.setGround(rs.getString("ground"));
				dto.setHomeTeam(rs.getString("hometeam"));
				dto.setAwayTeam(rs.getString("awayTeam"));
				dto.setHomeGoal(rs.getString("homegoal"));
				dto.setAwayGoal(rs.getString("awaygoal"));
				broadcastScheduleList.add(dto);
		
			}
			
			return broadcastScheduleList;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int getTotalCount(HashMap<String, String> map) {
		try {
			// 목록 or 검색

//			String where = "";
//			if (map.get("search") != null) {
//				//이름 & 제목 & 내용 - 포괄 검색
//				where = String.format("where (name like '%%%s%%' or subject like '%%%s%%' or content like '%%%s%%')", map.get("search"), map.get("search"), map.get("search"));
//			}
			
			String sql= "select count(*)as cnt from tblleaguegame";
			stat = conn.createStatement();					
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		return 0;
	}

	public ArrayList<BroadcastDTO> list(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	
	
	
	
}
