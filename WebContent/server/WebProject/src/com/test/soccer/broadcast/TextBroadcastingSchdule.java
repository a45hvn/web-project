package com.test.soccer.broadcast;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/textbroadcastingschedule.do")
public class TextBroadcastingSchdule extends HttpServlet{

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
	
	//1. 
	BoardDAO dao = new BoardDAO();
	
	//총 페이지 수 계산하기 
	
	
		
		
		
		
		
		
		
		
	RequestDispatcher dispatcher = req.getRequestDispatcher("WEB-INF/views/broadcast/textbroadcastingschedule.jsp");
	dispatcher.forward(req, resp);
	}
	
}
