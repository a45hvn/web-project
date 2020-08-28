package com.test.soccer.broadcast;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.soccer.DBUtil;
import com.test.soccer.board.BoardDTO;

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
	
	//페이징에 필요한 총 게시물 수를 가져오는 메소드
	public int getTotalCount(HashMap<String, String> map) {

		try {
			// 목록 or 검색

//			String where = "";
//			if (map.get("search") != null) {
//				//이름 & 제목 & 내용 - 포괄 검색
//				where = String.format("where (name like '%%%s%%' or subject like '%%%s%%' or content like '%%%s%%')", map.get("search"), map.get("search"), map.get("search"));
//			}
			
			String sql= "select count(*) as cnt from tblBoard where category_seq=5 order by seq";
			
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

	//friendylrecruit (게시판 리스트 출력하기)
	public ArrayList<BoardDTO> list(HashMap<String, String> map) {
		try {
			String sql = String.format("select * from (select a.*, rownum as rnum from (select * from vwfriendlyboard order by seq desc)a) where rnum >=%s and rnum <=%s order by seq desc", map.get("begin"), map.get("end"));
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			while(rs.next()) {
				//레코드 1줄 -> boardDTO 1개
				BoardDTO dto = new BoardDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setGap(rs.getInt("gap"));
				dto.setName(rs.getString("name"));
				dto.setCategory_seq(rs.getString("category_seq"));
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}


	
	
	
}
