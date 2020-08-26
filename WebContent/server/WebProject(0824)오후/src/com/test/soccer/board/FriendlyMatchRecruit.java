package com.test.soccer.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.soccer.broadcast.BoardDAO;

@WebServlet("/board/friendlymatchrecruit.do")
public class FriendlyMatchRecruit extends HttpServlet{

	//친선경기모집게시판을 보여주는 list	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		
	//1. DB작업 > select
	//2. 결과값 전달 + jsp호출하기
		
	//세션얻어오기
	HttpSession session = req.getSession();
	
	//일반 목록인지 검색인지 구분하기
	//목록 : list.do
	//검색 : list.do?search=검색어
	
	String search = req.getParameter("search");
	
	//정렬 기준 
	//list.do
	//list.do?sort=seq
	//list.do?sort=readcount
	//list.do?sort=heart
	
	
	String sort = req.getParameter("sort");
	
	//sort 설정이 없으면  기본값으로 설정
	if(sort == null|| sort=="") {
		sort = "thread";
	}
	
	
	HashMap<String, String> map = new HashMap<String, String>();
	map.put("search", search);	
	map.put("sort", sort);	
	
	//페이징 처리 관련 변수 
	int nowPage =0; 			//현재 페이지 번호
	int totalCount = 0;			//총 게시물 수 
	int pageSize = 10; 			//한페이지 당 출력 갯수
	int totalPage = 0;			//총 페이지 수
	int begin = 0;				//rnum 시작 번호
	int end = 0;				//rnum 끝 번호
	int n = 0;					//페이지바 관련 변수
	int loop = 0;				//페이지바 관련 변수
	int blockSize = 10;			//페이지바 관련 변수
	
	//list.do-> list.do?page=1로 변경
	
	String page = req.getParameter("page");
	if(page==null||page=="") nowPage =1;//default값
	else nowPage = Integer.parseInt(page);
		
	//nowPage -> 보려는 페이지 번호 
	//1page ->where rnum >=1 and rnum <=10
	//2page ->where rnum >=11 and rnum <=20
	//3page ->where rnum >=21 and rnum <=30

		begin = ((nowPage-1)*pageSize)+1;
		end = begin+pageSize-1;
	
		map.put("begin", begin+"");
		map.put("end", end+"");
		
	//1. 
	BoardDAO dao = new BoardDAO();
	
	//총 페이지 수 계산하기 
	//총 페이지 수 = 총 게시물 수 / 한페이지 당 출력 게시물 수 
	//?= 243/10 -> 24.3 -> 25
	totalCount = dao.getTotalCount(map);
	System.out.println(totalCount);
	totalPage = (int)Math.ceil((double)totalCount/pageSize);
	//System.out.println(totalPage);
		
	ArrayList<BoardDTO> list = dao.list(map);

	//list: 게시판 목록 원본
	//-> list 가공

	
	//1.5
	//c.최신글 표시하기
	//글쓴지 1시간 이내의 글 들을 최신글이라고 가정
	//- 현재시각  - 글쓴 시각 < 1시간 
	// 얘는 sql에서 한다. 
	
	Calendar now = Calendar.getInstance();
	for(BoardDTO dto : list) {
		if(dto.getRegdate().substring(0,10).equals(String.format("%tF",now))) {
			dto.setRegdate(dto.getRegdate().substring(11));
			
		}else {
			dto.setRegdate(dto.getRegdate().substring(0,10));
		}
		
		
	}
	//새로고침에 의한 조회수 증가 방지
	session.setAttribute("read", false);
	
	//페이지바 만들기
			loop=1;
			n=((nowPage-1)/blockSize)*blockSize +1;
			String pagebar ="";
			pagebar += "<nav class=\"pagebar\" style=\"float:right;\">";
			pagebar += "<ul class=\"pagination\">";
			
			//list.do?page=1;
			//1 2 3 4 5 
			
			//list.do?page=3;
			//1 2 3 4 5
			
			//list.do?page=11;
			//11 12 13 14 15 
			
			
			
			//이전 10페이지
			

			if(n==1) {
				pagebar +="<li class='disabled'>";
				pagebar +="<a href=\"#!\" aria-label=\"Previous\">";
				pagebar +=" <span aria-hidden=\"true\">&laquo;</span>";
				pagebar +="</a>";
				pagebar +="</li>";
				
			}else {

				pagebar +="<li>";
				pagebar +=String.format("<a href=\"/soccer/board/friendlymatchrecruit.do?page=%d\" aria-label=\"Previous\">",n-1);
				pagebar +=" <span aria-hidden=\"true\">&laquo;</span>";
				pagebar +="</a>";
				pagebar +="</li>";
				
			}
			
//			for(int i=1;i<totalPage;i++) {
			while(!(loop > blockSize || n>totalPage)) {	
			//페이지번호
				if(n==nowPage) {
					pagebar += "<li class=\"active\">";
					pagebar += String.format("<a href='#!'>%d</a>",n);
					pagebar += "</li>";

				}else {
					pagebar += "<li>";
					pagebar += String.format("<a href=\"/soccer/board/friendlymatchrecruit.do?page=%d\">%d</a>",n,n);
					pagebar += "</li>";
					
				}
		
				loop++;
				n++;
			
			}
			
			//		}
			
			//다음 10페이지
			
			if(n>totalPage) {
				pagebar +="<li class=\"disabled\">";
				pagebar += "<a href=\"#!\" aria-label=\"Next\">";
				pagebar +=" <span aria-hidden=\"true\">&raquo;</span>";
				pagebar +="</a>";
				pagebar +="</li>";
			
				
				
			}else{
				
				pagebar +="<li>";
				pagebar += String.format("<a href=\"/soccer/board/friendlymatchrecruit.do?page=%d\" aria-label=\"Next\">", n);
				pagebar +=" <span aria-hidden=\"true\">&raquo;</span>";
				pagebar +="</a>";
				pagebar +="</li>";
			}
			pagebar += "</ul>";
			pagebar += "</nav>";
	
	
	//2. 결과 값 전달 
	
	req.setAttribute("list", list);
	req.setAttribute("search", search);
	req.setAttribute("sort", sort);
	req.setAttribute("page", page);
	req.setAttribute("totalCount", totalCount);
	req.setAttribute("totalPage", totalPage);
	req.setAttribute("pagebar", pagebar);
		
		
		
	RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/friendlymatchrecruit.jsp");
	dispatcher.forward(req, resp);
	
	
	
	
	
	}
	
	
}
