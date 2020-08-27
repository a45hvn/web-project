package com.test.project.black;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.notice.DBUtil;

public class BlackDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BlackDAO() {
		DBUtil util = new DBUtil();
		conn = util.open();
	}
	
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getTotalCount(HashMap<String, String> map) {	
		
		try {
			String where = "";
			if(map.get("search")!= null && map.get("searchKeyWord")!=null) {
				//이름 or 사유 검색
				where = String.format("where %s like '%%%s%%' ",map.get("searchKeyWord"),map.get("search") );
			}
			
			String sql = String.format("select count(*) as cnt from (select t.*, rownum as rnum from(select b.seq as seq, m.name as name, b.reason as reason, b.startdate as startdate, b.enddate as enddate from tblblacklist b\r\n inner join tblmember m\r\n on b.member_seq = m.seq\r\n order by seq asc) t %s)order by seq asc"
					, where);
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			if(rs.next()){
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println("BlackDAO.getTotalCount()");
			e.printStackTrace();
		}
	
		return 0;
	}

	public ArrayList<BlackDTO> list(HashMap<String, String> map) {//목록, 검색
		try {
			//목록 or 검색
			String where = "";
			if(map.get("search")!= null && map.get("searchKeyWord")!=null) {
				//이름 or 사유 검색
				where = String.format("where %s like '%%%s%%' ",map.get("searchKeyWord"),map.get("search") );
			}
			String sql = String.format("select * from (select t.*, rownum as rnum from(select b.seq as seq, m.name as name, b.reason as reason, b.startdate as startDate, b.enddate as endDate from tblblacklist b inner join tblmember m on b.member_seq = m.seq order by %s asc) t %s) where rnum >=%s and rnum<=%s order by %s asc"
					, map.get("sort")
					, where
					, map.get("begin")
					, map.get("end")
					, map.get("sort"));
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<BlackDTO> list = new ArrayList<BlackDTO>();
			
			while(rs.next()) {
				//레코드 1줄 -> BlackDTO 1개
				BlackDTO dto = new BlackDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setReason(rs.getString("reason"));
				dto.setStartDate(rs.getDate("startDate"));
				dto.setEndDate(rs.getDate("endDate"));
				
				list.add(dto);
			}
			System.out.println("blacklist list 성공");
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("blacklist list 실패");
		}
		return null;
	}

}
