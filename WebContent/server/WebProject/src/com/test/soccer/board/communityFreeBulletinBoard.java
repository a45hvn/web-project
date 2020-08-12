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

@WebServlet("/board/communityFreeBulletinBoard.do")
public class communityFreeBulletinBoard extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. DB작업 > select
		//2. 결과값 전달 + JSP 호출하기
		
		
		//communityFreeBulletinBoard.jsp에서 보낸 검색어(searchkeyword) 받아오기
		String search = req.getParameter("searchkeyword");
		
		//** 검색어를  Hashmap에 담는건데, 이거 모르겠다...
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		
		
		//페이징 처리 관련 변수
		int nowPage = 0;			//현재 페이지 번호
		int totalCount = 0;			//총 게시물 수
		int pageSize = 10;			//한페이지 당 출력 갯수
		int totalPage = 0;			//총 페이지 수
		int begin = 0;				//rnum 시작 번호
		int end = 0;				//rnum 끝 번호
		int n = 0;					//페이지바 관련 변수
		int loop = 0;				//페이지바 관련 변수
		int blockSize = 10;			//페이지바 관련 변수
		
		//communityFreeBulletinBoard.jsp에서 클릭한 페이지 받아오기
		//** 이거 어디서 받아오는거임?
		String page = req.getParameter("page");
		
//		System.out.println(page);
		
		if(page == null || page == "") nowPage = 1; //default
		else nowPage = Integer.parseInt(page); //보고싶은 페이지
		
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
//		System.out.println(begin);
//		System.out.println(end);
		
		map.put("begin", begin + "");
		map.put("end", end + "");
		
		
		//1.
		BoardDAO dao = new BoardDAO();
		
		//총 페이지 수 계산하기
		
		//총 게시물
		totalCount = dao.getTotalCount(map);
		//총페이지수 = 총 게시물 수 / 한 페이지당 출력 게시물 수
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		//전체 목록이 list에 담겨져 있다.
		//map(search) 매개 변수를 넣어줌
		ArrayList<BoardDTO> list = dao.list(map);
		
		//1.5 
		Calendar now = Calendar.getInstance();
		
		//##작성시간##
		//오늘 쓴 글 구분하기
		for (BoardDTO dto : list) {
			
			//오늘 날짜 일때
			if (dto.getRegdate().startsWith(String.format("%tF", now))) {
				//시간만 출력
				dto.setRegdate(dto.getRegdate().substring(11));
			//오늘 날짜가 아닐때
			} else {
				//날짜만 출력
				dto.setRegdate(dto.getRegdate().substring(0, 10));
			}
		//##검색어 부각##
		if (search != null && search != "") {
			
			String title = dto.getTitle();
			title = title.replace(search, "<span style='font-weight:bold; color:tomato;'>"+ search + "</span>");
			dto.setTitle(title);
			
		}
		
				
		}//for
		
		
		//페이지 제작
		loop = 1; //평범한 루프		
		n = ((nowPage - 1) / blockSize) * blockSize + 1; //출발 값
		
		String pagebar = "";
		
		pagebar += "<nav class=\"pagebar\" style=\"float: right\">";
		pagebar += "<ul class=\"pagination\">";
				
		//이전 10페이지
		if (n == 1) {
			pagebar += "<li class='disabled'>";
			pagebar += "<a href=\"#!\" aria-label=\"Previous\">";
			pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		} else {
			pagebar += "<li>";
			pagebar += String.format("<a href=\"/soccer/board/communityFreeBulletinBoard.do?page=%d\" aria-label=\"Previous\">", n - 1);
			pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		}
		
		//for (int i=1; i<=totalPage; i++) {
		while(!(loop > blockSize || n > totalPage)) { //n > totalPage 18페이지 까진데 19 20 은 x
			//페이지 번호
			if (n == nowPage) {
				pagebar += "<li class='active'>";
				pagebar += String.format("<a href=\"#!\">%d</a>", n); //#! 의미없는 링크를 만들떄, 현재페이지는 클릭안되게
				pagebar += "</li>";	
			
			} else {
				pagebar += "<li>";
				pagebar += String.format("<a href=\"/soccer/board/communityFreeBulletinBoard.do?page=%d\">%d</a>", n, n);
				pagebar += "</li>";	
			}
			loop++;
			n++;
		}
		
		//다음 10페이지
		if (n > totalPage) {
			pagebar += "<li class='disabled'>";
			pagebar += "<a href=\"#!\" aria-label=\"Next\">";
			pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		} else {
			pagebar += "<li>";
			pagebar += String.format("<a href=\"/soccer/board/communityFreeBulletinBoard.do?page=%d\" aria-label=\"Next\">", n);
			pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
			pagebar += "</a>";
			pagebar += "</li>";
		}
		
		pagebar += "</ul>";		
		pagebar += "</nav>";
		
		//2.
		//목록
		req.setAttribute("list", list);
		//검색어
		req.setAttribute("search", search);
		//페이지
		req.setAttribute("page", page);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		
		req.setAttribute("pagebar", pagebar);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/communityFreeBulletinBoard.jsp");
		dispatcher.forward(req, resp);
		
	}

}