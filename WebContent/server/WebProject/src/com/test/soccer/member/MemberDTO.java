package com.test.soccer.member;

public class MemberDTO {
	
	private String seq;
	private String id;
	private String pw;
	private String name;
	private String image;
	private String tel;
	private String birth;
	private String address;
	private String homeseq;
	private String regdate;
	
	private String team;	//팀이름
	private String position;//포지션
	private String backnumber; //등번호
	private String height; //키
	private String weight; //몸무게
	
	private String mseq;	//플레이어 번호
	private String pgoal;	//친선골
	private String lgoal;	//리그골
	private String assist;
	private String foul;
	
	private String home; //연고지
	
	
	


	
	public String getAssist() {
		return assist;
	}
	public void setAssist(String assist) {
		this.assist = assist;
	}
	public String getFoul() {
		return foul;
	}
	public void setFoul(String foul) {
		this.foul = foul;
	}
	public String getBacknumber() {
		return backnumber;
	}
	public void setBacknumber(String backnumber) {
		this.backnumber = backnumber;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getPgoal() {
		return pgoal;
	}
	public void setPgoal(String pgoal) {
		this.pgoal = pgoal;
	}
	public String getLgoal() {
		return lgoal;
	}
	public void setLgoal(String lgoal) {
		this.lgoal = lgoal;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getHomeseq() {
		return homeseq;
	}
	public void setHomeseq(String homeseq) {
		this.homeseq = homeseq;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getMseq() {
		return mseq;
	}
	public void setMseq(String mseq) {
		this.mseq = mseq;
	}
	public String getHome() {
		return home;
	}
	public void setHome(String home) {
		this.home = home;
	}
	
	
}
