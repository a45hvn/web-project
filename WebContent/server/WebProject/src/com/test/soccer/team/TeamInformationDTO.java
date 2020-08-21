package com.test.soccer.team;

public class TeamInformationDTO {
//team.seq seq,member.name coachname,,coach.introduce indroduce, team.logo logo,
//team.name teamname, team.birth birth, team.slogan slogan,
//team.hello hello, teamground.name ground, teamground.address address,
//teamground.lat lat, teamground.lng lng, home.home home
	
	private String seq;
	private String coachname;
	private String introduce;
	private String logo;	
	private String teamname;  
	private String birth;
	private String slogan;
	private String hello;
	private String ground;
	private String address;
	private String lat;
	private String lng;
	private String home;
	private String image;
	
	public String getImage() {
		return image;
	}
	public String getCoachname() {
		return coachname;
	}
	public void setCoachname(String coachname) {
		this.coachname = coachname;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getSlogan() {
		return slogan;
	}
	public void setSlogan(String slogan) {
		this.slogan = slogan;
	}
	public String getHello() {
		return hello;
	}
	public void setHello(String hello) {
		this.hello = hello;
	}
	public String getGround() {
		return ground;
	}
	public void setGround(String ground) {
		this.ground = ground;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public String getHome() {
		return home;
	}
	public void setHome(String home) {
		this.home = home;
	}
	public void setImage(String string) {
		// TODO Auto-generated method stub
		
	}
	
}
