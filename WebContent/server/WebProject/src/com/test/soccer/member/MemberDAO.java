package com.test.soccer.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.soccer.DBUtil;

public class MemberDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MemberDAO() {
		//DB 연결
		
		DBUtil util = new DBUtil();
		conn = util.open();
		
	}
	
	
	//회원가입 insert
	public int add(MemberDTO dto) {
		
		try {

			String sql = "insert into tblMember (seq, name, id, pw, tel, birth, address, regdate, image, home_seq) values (Member_seq.nextVal, ?, ?, ?, ?, to_date(?,'yyyy-mm-dd'), ?, default, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getId());
			pstat.setString(3, dto.getPw());
			pstat.setString(4, dto.getTel());
			pstat.setString(5, dto.getBirth().replace("-", ""));
			pstat.setString(6, dto.getAddress());
			pstat.setString(7, dto.getImage());
			pstat.setString(8,dto.getHomeseq().substring(0,1));
			
			System.out.println("insert완료");
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("MemberDAO.add()");
			e.printStackTrace();
		}
		
		return 0;
	}
	
	
	//Login 서블릿이 아이디와 암호를 줄테니 이사람이 회원이 맞는지 검사?
		public int login(MemberDTO dto) {
			
			try {

				String sql = "select count(*) as cnt from tblMember where id=? and pw=?";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getId());
				pstat.setString(2, dto.getPw());
				
				rs = pstat.executeQuery();
				
				if (rs.next()) {
					return rs.getInt("cnt");
				}

			} catch (Exception e) {
				System.out.println("MemberDAO.login()");
				e.printStackTrace();
			}
			
			return 0;
		}

		//Login 서블릿이 아이디를 줄테니 회원 정보 전부를 다오.
		public MemberDTO getMember(String id) {
			
			try {

				String sql = "select * from tblMember where id = ?";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, id);
				
				rs = pstat.executeQuery();
				
				if (rs.next()) {
					//DTO -> Data Transfer Object
					//VO -> Value Object
					MemberDTO dto = new MemberDTO();
					
					dto.setSeq(rs.getString("seq"));
					dto.setId(rs.getString("id"));
					dto.setName(rs.getString("name"));
					dto.setRegdate(rs.getString("regdate"));
					dto.setImage(rs.getString("image"));
					
					return dto;	
				}

			} catch (Exception e) {
				System.out.println("MemberDAO.getMember()");
				e.printStackTrace();
			}
			
			return null;
		}
	
	
}
