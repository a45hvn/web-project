package com.test.soccer.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/BulletinBoardContent.do")
public class BulletinBoardContent extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기
		//2. DB 작업
		//3. 결과 반환
		
		//세션 얻어오기
		HttpSession session = req.getSession();
		
		//1.		
		String seq = req.getParameter("seq");						//게시판 번호
		String search = req.getParameter("search");					//검색어
		String page = req.getParameter("page");						//페이지
		String selectKeyword = req.getParameter("selectKeyword");	//검색방
		String selectrow = req.getParameter("selectrow");			//검색 출력 갯수
		
		//2.
		BoardDAO dao = new BoardDAO();
		
		
		
		BoardDTO dto2 = new BoardDTO();			
		dto2.setSeq(seq);
		dto2.setMember_seq((String)session.getAttribute("seq"));
		
		//내용
		BoardDTO dto = dao.content(dto2);
		
		//a. 개행 문자 처리
		String content = dto.getContent();
		content = content.replace("\r\n", "<br>");
		dto.setContent(content);
		
		//b. 검색어 부각시키기
		if(search != null && search != "") {
						
			content = content.replace(search, "<span style='font-weight:bold; color:tomato;'>"+ search + "</span>");
			dto.setContent(content);
			
		}
		
	
		//내용 보내기
		req.setAttribute("dto", dto);
		req.setAttribute("search", search);
		req.setAttribute("page", page);
		req.setAttribute("selectKeyword", selectKeyword);
		req.setAttribute("selectrow", selectrow);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/BulletinBoardContent.jsp");
		dispatcher.forward(req, resp);
		
	}

}
