package com.test.soccer.player;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.soccer.member.MemberDAO;
import com.test.soccer.member.MemberDTO;


@WebServlet("/player/playerStatus.do")
public class PlayerStatus extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		HttpSession session = request.getSession();
		
		//검색
		String search = request.getParameter("search");
		
		String sort = request.getParameter("sort");
		
		if (sort == null || sort == "") {
			sort = "thread"; //기본값
		}
	
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("search", search);
		map.put("sort", sort);
		
		
		//----------------------------------
		//페이징 처리 관련 변수
				int nowPage = 0; 			//현재 페이지 번호
				int totalCount = 0; 		//총 게시물 수
				int pageSize = 10; 			//한페이지 당 출력 갯수
				int totalPage = 0;			//총 페이지 수
				int begin = 0;				//rnum 시작 번호
				
				int end = 0;				//rnum 끝 번호
				int n = 0;					//페이지바 관련 변수
				int loop = 0;				//페이지바 관련 변수
				int blockSize = 10;			//페이지바 관련 변수
				
				//list.do -> list.do?page=1 변경
				//list.do?page=3
				String page = request.getParameter("page");
				
				if (page == null || page == "") nowPage = 1; //default
				else nowPage = Integer.parseInt(page); //
				
				//nowPage -> 보려는 페이지 번호!!
				//1page -> where rnum >= 1 and rnum <= 10
				//2page -> where rnum >= 11 and rnum <= 20
				//3page -> where rnum >= 21 and rnum <= 30
				begin = ((nowPage - 1) * pageSize) + 1;
				end = begin + pageSize - 1;
				
				map.put("begin", begin + "");
				map.put("end", end + "");
				
				MemberDAO dao = new MemberDAO();
				
				
				
				//총 페이지 수 계산하기
				//총 페이지 수 = 총 게시물 수 / 한페이지당 출력 게시물 수
				//? = 175 / 10 -> 17.5 -> 18
				totalCount = dao.getTotalCount(map);
				//System.out.println(totalCount);
				
				totalPage = (int)Math.ceil((double)totalCount / pageSize);
				//System.out.println(totalPage);
				
				
				ArrayList<MemberDTO> list = dao.getMemberInfo(map);
				
				
				//list : 게시판 목록 원본
				// -> list 가공
				
				//데이터 가공 시점
				// - 최소 규칙 : 최대한 빨리한다.
				//1. SQL
				//2. 서블릿
				//3. JavaScript
				
				
				for (MemberDTO dto : list) {	
					
					if (search != null && search != "") {
						//d. 검색어 부각시키기
						// - 제목
						
						String name = dto.getName();
						name = name.replace(search, "<span style='font-weight:bold;color:tomato;'>" + search + "</span>");
						dto.setName(name);
					}
					
					
				}//for
				
				
				
				
				
				//새로고침 조회수 증가 방지
				session.setAttribute("read", false);
				
				
				
				
				//페이지바 제작
				loop = 1;
				n = ((nowPage - 1) / blockSize) * blockSize + 1;
				
				//list.do?page=1
				//1 2 3 4 5 6 7 8 9 10
				
				//list.do?page=3
				//1 2 3 4 5 6 7 8 9 10
				
				//list.do?page=11
				//11 12 13 14 15 16 17 18 19 20
				
				
				
				String pagebar = "";
				
				pagebar += "<nav class=\"pagebar\">";
				pagebar += "<ul class=\"pagination\">";
				
				//이전 10페이지
				if ( n == 1) {
					
				pagebar += "<li class='disabled'>";
				pagebar += "<a href=\"#\" aria-label=\"Previous\">";
				pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
				pagebar += "</a>";
				pagebar += "</li>";

				} else {
					
				pagebar += "<li>";
				pagebar += String.format("<a href=\"/soccer/player/playerStatus.do?page=%d\" aria-label=\"Previous\">", n - 1 );
				pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
				pagebar += "</a>";
				pagebar += "</li>";
				}
				
				
				//for (int i=1; i<=totalPage; i++) {
				while (!(loop > blockSize || n > totalPage)) {
					//페이지 번호
					if (n == nowPage) {
						pagebar += "<li class='active'>";
						pagebar += String.format("<a href=\"#!\">%d</a>", n);
						pagebar += "</li>";
					} else {			
						pagebar += "<li>";
						pagebar += String.format("<a href=\"/soccer/player/playerStatus.do?page=%d\">%d</a>", n, n);
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
					pagebar += String.format("<a href=\"/soccer/player/playerStatus.do?page=%d\" aria-label=\"Next\">", n);
					pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
					pagebar += "</a>";
					pagebar += "</li>";
				}
				
				pagebar += "</ul>";
				pagebar += "</nav>";
				
				
				//2.
				request.setAttribute("list", list);
				request.setAttribute("search", search);
				request.setAttribute("sort", sort);
				
				request.setAttribute("page", page);
				request.setAttribute("totalCount", totalCount);
				request.setAttribute("totalPage", totalPage);
				
				request.setAttribute("pagebar", pagebar);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/player/playerStatus.jsp");
				dispatcher.forward(request, response);
				
			}
	
}

