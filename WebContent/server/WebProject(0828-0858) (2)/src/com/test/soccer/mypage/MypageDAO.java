package com.test.soccer.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.soccer.DBUtil;

public class MypageDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	private ResultSet rs2;

	public MypageDAO() {
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

	public ArrayList<MypageDTO> list(String seq) {

		try {
			System.out.println(seq);
			String sql = "select * from vwmemberinfo where seq = " + seq;
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			ArrayList<MypageDTO> list = new ArrayList<MypageDTO>();

			while (rs.next()) {
				MypageDTO dto = new MypageDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setTeam(rs.getString("teamname"));
				dto.setPosition(rs.getString("position"));
				dto.setHeight(rs.getString("height"));
				dto.setWeight(rs.getString("weight"));
				dto.setImage(rs.getString("image"));
				list.add(dto);

			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public ArrayList<DmDTO> dmlist(String seq) {
		try {
			System.out.println(seq);
			String sql = "select dm.seq, dm.\"read_name\", dm.\"read_image\", dm.content, to_char(dm.regdate,'yyyy-mm-dd hh24:mi:ss') as regdate, dm.read_member_seq, dm.writer_member_seq, mb.name as \"writer_name\", mb.image as \"writer_image\"  from vwdm dm inner join tblmember mb on mb.seq = dm.writer_member_seq where read_member_Seq ="
					+ seq;
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			ArrayList<DmDTO> dmlist = new ArrayList<DmDTO>();

			while (rs.next()) {
				DmDTO dto2 = new DmDTO();
				dto2.setSeq(rs.getString("seq"));
				dto2.setContent(rs.getString("content"));
				dto2.setRegdate(rs.getString("regdate"));
				dto2.setRead_member_seq(rs.getString("read_member_seq"));
				dto2.setWriter_member_seq(rs.getString("writer_member_seq"));
				dto2.setRead_image(rs.getString("read_image"));
				dto2.setRead_name(rs.getString("read_name"));
				dto2.setWriter_image(rs.getString("writer_image"));
				dto2.setWriter_name(rs.getString("writer_name"));
				dmlist.add(dto2);

			}

			return dmlist;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public ArrayList<LeagueDTO> leaguelist(String seq) {
		try {
			System.out.println(seq);
			String sql = "select rownum as rnum, lg.seq as seq, to_char(lg.gamedate, 'yyyy-mm-dd') as gamedate, gr.address as ground, (select name from tblteam where seq = lg.awayteam_seq) as awayname"
					+ "  from TBLLEAGUEGAME lg" + "    inner join tblteamentry te on te.seq = lg.hometeam_seq"
					+ "        inner join tblteam t on t.seq = te.team_seq"
					+ "            left join tbltransfer ts on ts.team_seq = t.seq"
					+ "                inner join tblmember m on m.seq = ts.member_seq"
					+ "                    inner join TBLMEMBER_TEAM mt on ts.seq = mt.transfer_Seq"
					+ "                        inner join TBLPLAYERENTRY pl on pl.member_team_seq = mt.seq"
					+ "                            inner join tblground gr on gr.seq = lg.ground_seq"
					+ "                                where pl.league_seq=? and lg.league_seq =? and m.seq=? order by lg.seq desc";

			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, 3);
			pstat.setInt(2, 3);
			pstat.setString(3, seq);

			rs = pstat.executeQuery();
			ArrayList<LeagueDTO> leaguelist = new ArrayList<LeagueDTO>();

			while (rs.next()) {
				LeagueDTO dto3 = new LeagueDTO();
				dto3.setRnum(rs.getString("rnum"));
				dto3.setSeq(rs.getString("seq"));
				dto3.setGameDate(rs.getString("gamedate"));
				dto3.setGround(rs.getString("ground"));
				dto3.setAwayName(rs.getString("awayname"));

				leaguelist.add(dto3);

			}
			return leaguelist;
		} catch (Exception e) {
			e.printStackTrace();

		}

		return null;
	}


	public ArrayList<FriendsDTO> followingList(String seq) {
		try {
		
			// 내가 팔로우하는 친구 목록 조회
			String sql = "select f.seq, f.follow__member_seq as following_seq, f.follower__member_seq as me_seq, (select name from tblmember where seq = f.follow__member_seq) as followingName, (select image from tblmember where seq = f.follow__member_seq) as followingImage from tblfriends f inner join tblmember m on f.follower__member_seq = m.seq where m.seq = "
					+ seq;

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);
			

			ArrayList<FriendsDTO> followingList = new ArrayList<FriendsDTO>();
			
			while (rs.next()) {
				FriendsDTO dto = new FriendsDTO();
				dto.setFollowing_seq(rs.getString("following_seq"));
				dto.setFollowingName(rs.getString("followingName"));
				dto.setFollowingImage(rs.getString("followingImage"));
				followingList.add(dto);
			}

			return followingList;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<FriendsDTO> followerList(String seq) {
		try {
			// 나를 팔로우 하는 친구 목록 조회
			String sql = "select f.seq, f.follow__member_seq as me_seq , f.follower__member_seq as follower_seq, (select name from tblmember where seq = f.follower__member_seq) as followerName ,(select image from tblmember where seq = f.follower__member_seq) as followerImage from tblfriends f inner join tblmember m on f.follow__member_seq = m.seq where m.seq ="
					+ seq;
		
			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			ArrayList<FriendsDTO> followerList = new ArrayList<FriendsDTO>();
			
			while (rs.next()) {
				FriendsDTO dto = new FriendsDTO();
				dto.setFollower_seq(rs.getString("follower_seq"));
				dto.setFollowerName(rs.getString("followerName"));
				dto.setFollowerImage(rs.getString("followerImage"));
				followerList.add(dto);
			}
	
			return followerList;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	//following 목록에 친구 추가 
	public int follow(FriendsDTO dto, String seq) {
		try {
			String sql ="insert into tblfriends values(friends_seq.nextVal,?,?)";
//			System.out.println(dto.getFollower_seq());
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getFollower_seq());
			pstat.setString(2, seq);
			
			return pstat.executeUpdate();//성공하면 1
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;//실패하면 0 을 반환함
	}

	
	public int unfollow(FriendsDTO dto, String seq) {
		
		try {
			String sql ="delete from tblfriends where follower__member_seq = ? and follow__member_seq =? ";
//			System.out.println(dto.getFollower_seq());
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			pstat.setString(2, dto.getFollowing_seq());
			
			return pstat.executeUpdate();//성공하면 1
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

}
