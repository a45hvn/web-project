package com.test.soccer.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.soccer.DBUtil;

public class BoardDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public BoardDAO() {
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
	
	//communityFreeBulletinBoard 서블릿 -> 게시판 목록 주세요.
	public ArrayList<BoardDTO> list(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			String begin = map.get("begin");
			String end = map.get("end");
			String category = map.get("category");
			String search = map.get("search");
			String selectKeyword = map.get("selectKeyword");
			
			
			//검색어가 있을때
			if (search != null) {
				 where = String.format("and %s like '%%%s%%'", selectKeyword , search);
			
			}
			
			//String sql = String.format("select * from (select a.*, rownum as rnum from (select * from tblBoard where category_seq = %s %s order by seq) a) where rnum >= %s and rnum <= %s",category, where, begin, end);
			String sql = String.format("select * from (select a.*, rownum as rnum from (select * from tblBoard b inner join tblMember m on m.seq = b.member_seq where category_seq = %s %s order by b.seq) a) where rnum >= %s and rnum <= %s",category, where, begin, end);
			
			
			stat = conn.prepareStatement(sql);			
			rs = stat.executeQuery(sql);
						
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			//rs -> list 복사
			while (rs.next()) {
				
				// 레코드 1줄 -> BoardDTO 1개
				BoardDTO dto = new BoardDTO();
				
				
				dto.setSeq(rs.getString("seq"));				//번호
				dto.setTitle(rs.getString("title"));			//제목
				dto.setContent(rs.getString("content"));		//내용
				dto.setRegdate(rs.getString("regdate"));		//등록일
				dto.setReadcount(rs.getInt("readcount"));		//조회수
				//dto.setReadcount(rs.getInt("category_seq"));	//게시판 카테고리번호
				dto.setMember_seq(rs.getString("member_seq"));	//회원 번호
				dto.setImage(rs.getString("image"));			//이미지
				dto.setName(rs.getString("name"));				//회원이름
				
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("BoardDAO.list()");
			e.printStackTrace();
		}
		
		return null;
	}

	//communityFreeBulletinBoard 서블릿 -> 페이지(총 게시글 수)
	public int getTotalCount(HashMap<String, String> map) {
				
		try {
			
			String where = "";
			
			String search = map.get("search");
			String selectKeyword = map.get("selectKeyword");
			
			if (search != null) {
				 where = String.format("and %s like '%%%s%%'", selectKeyword , search);
			
			}
			
			String sql = String.format("select count(*) as cnt from tblboard b inner join tblMember m on m.seq = b.member_seq where category_seq = 3 %s", where);
		
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {

			System.out.println("BoardDAO.getTotalCount()");
			e.printStackTrace();
			
		}
		
		return 0;
	}

	public void updateReadCount(String seq) {
		try {
			String sql = "update tblBoard set readcount = readcount+1 where seq=?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			pstat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	//게시판의 내용을 보여주기 위해 가져오는 쿼리
	public BoardDTO get(BoardDTO dto2) {

		try {

			String sql = "select a.*, (select name from tblmember where seq = a.mseq)as name, (select count(*) from tblHeart where bseq = a.seq and mseq=?) as heart from tblBoard a where seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto2.getMember_seq());
			pstat.setString(2, dto2.getSeq());
			rs = pstat.executeQuery();

			if (rs.next()) {
				BoardDTO dto = new BoardDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setMember_seq(rs.getString("member_seq"));
				dto.setName(rs.getString("name"));
//				dto.setHeart(rs.getInt("heart"));
//
//				dto.setThread(rs.getInt("thread"));
//				dto.setDepth(rs.getInt("depth"));

				return dto;
			}	

		} catch (Exception e) {

			e.printStackTrace();

		}
		return null;
	}

	//댓글 목록 가져오기
	public ArrayList<CommentDTO> listComment(String seq) {
	
		try {
			
			String sql =  String.format("select *, (select name from tblMember where seq = tblcomment.member_seq) as name from tblcomment where board_seq = %s");
			stat = conn.createStatement();
			rs  = stat.executeQuery(sql);
			
			ArrayList<CommentDTO> clist = new ArrayList<CommentDTO>();
			
			while(rs.next()) {
				// 레코드 1줄 -> BoardDTO 1개
				CommentDTO dto = new CommentDTO();
			
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setMember_seq(rs.getString("member_seq"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));

				clist.add(dto);
			
			}
			return clist;
			
		} catch (Exception e) {
			e.printStackTrace();
		
	//BulletinBoardContent 서블릿 -> 글번호 주고 게시물 받아오기
	public BoardDTO content(String seq) {
		
		try {
			
			String sql = select 
			
			
		} catch (Exception e) {
			
			System.out.println("BoardDAO.content()");
			e.printStackTrace();
			

		}
		
		return null;
	}

	
	
	
}//class
