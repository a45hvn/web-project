package com.test.soccer.board;

public class BoardDTO {

	private String seq;				//번호
	private String title;			//제목
	private String content;			//내용
	private String regdate; 		//등록일
	private int readcount; 			//조회수
	//private int heart; 			//추천수
	private String member_seq; 		//회원번호
	private String category_seq;	//카테고리 번호
	private String img;				//이미지
	
	
	
	public String getCategory_seq() {
		return category_seq;
	}
	public void setCategory_seq(String category_seq) {
		this.category_seq = category_seq;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
//	public int getHeart() {
//		return heart;
//	}
//	public void setHeart(int heart) {
//		this.heart = heart;
//	}
	public String getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(String member_seq) {
		this.member_seq = member_seq;
	}
	
	
	
	
}
