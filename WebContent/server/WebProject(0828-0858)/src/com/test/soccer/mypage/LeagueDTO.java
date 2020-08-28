package com.test.soccer.mypage;

public class LeagueDTO {
	
	private String awayName;//상대팀 이름 
	private String seq; //game seq
	private String gameDate; //경기일정
	private String ground; //홈구장
	private String rnum;
	
	
	public String getAwayName() {
		return awayName;
	}
	public void setAwayName(String awayName) {
		this.awayName = awayName;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getGameDate() {
		return gameDate;
	}
	public void setGameDate(String gameDate) {
		this.gameDate = gameDate;
	}
	public String getGround() {
		return ground;
	}
	public void setGround(String ground) {
		this.ground = ground;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	
}
