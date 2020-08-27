package com.test.ground;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.notice.BoardDTO;
import com.test.notice.DBUtil;

public class GroundDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public GroundDAO() {
		DBUtil util =new DBUtil();
		conn = util.open();
	}
	
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int getTotalCount(HashMap<String, String> map) {//총 페이지 수 구하기

		try {
			String where = "";
			if(map.get("search")!= null && map.get("searchKeyWord")!=null) {
				//이름 & 제목 & 내용 - 포괄검색
				where = String.format("where %s like '%%%s%%'  ", map.get("searchKeyWord"),  map.get("search"));
			}
			String sql = String.format("select count(*) as cnt from (select ground.* , rownum as rnum from(select g.seq as seq , g.name as name, g.address as address, g.lat as lat, g.lng as lng , h.home as home from tblground g inner join tblhome h on h.seq = g.home_seq order by seq asc) ground %s) where rnum>=1 and rnum<=10 order by seq asc"     
					, where);
			
		
			
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			System.out.println("success");
			if(rs.next()) {
				return rs.getInt("cnt");
				
			}
		} catch (Exception e) {
			System.out.println("GroundDAO.getTotalCount()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<GroundDTO> list(HashMap<String, String> map) {//목록 불러오기
		try {
			//목록 or 검색
			String where = "";
			
			if(map.get("search")!= null && map.get("searchKeyWord")!=null) {
				//이름 & 제목 & 내용 - 포괄검색
				where = String.format("where %s like '%%%s%%'  ", map.get("searchKeyWord"),  map.get("search"));
			}
		
		String sql = String.format(
				"select * from (select ground.* , rownum as rnum from(select g.seq as seq , g.name as name, g.address as address, g.lat as lat, g.lng as lng , h.home as home from tblground g inner join tblhome h on h.seq = g.home_seq order by %s asc) ground %s) where rnum>=%s and rnum<=%s order by %s asc"      
				,
				map.get("sort"),where ,
				map.get("begin"),map.get("end"),
				 map.get("sort"));	
			
		stat = conn.createStatement();
		rs = stat.executeQuery(sql);
		
		
		ArrayList<GroundDTO> list = new ArrayList<GroundDTO>();
		
		//rs -> list 복사
		while(rs.next()) {
			//레코드 1줄 -> BoardDTO 1개
			GroundDTO dto = new GroundDTO();
			
			dto.setSeq(rs.getString("seq"));
			dto.setName(rs.getString("name"));
			dto.setAddress(rs.getString("address"));
			dto.setLat(rs.getString("lat"));
			dto.setLng(rs.getString("lng"));
			dto.setHome(rs.getString("home"));
			
			
			list.add(dto);
		}
			return list;
		} catch (Exception e) {
			System.out.println("GroundDAO list error");
			e.printStackTrace();
		}
		return null;
	}

	public GroundDTO getloc(GroundDTO dto2) {//경기장 이름으로 경도위도 가져오기
		
		try {
			String sql = "select g.lat as lat, g.lng as lng from tblground g  inner join tblhome h on h.seq = g.home_seq where name = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto2.getName());//이름
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				GroundDTO dto = new GroundDTO();
				
				dto.setLng(rs.getString("lng"));
				dto.setLat(rs.getString("lat"));
				
				System.out.println("Lat Lng Success");
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("lat lng error");
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	

	

}
