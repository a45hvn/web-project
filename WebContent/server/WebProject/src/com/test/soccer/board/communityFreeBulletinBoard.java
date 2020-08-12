package com.test.soccer.board;

import java.io.IOException;
import java.util.ArrayList;

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
		
		//1.
		BoardDAO dao = new BoardDAO();
		
		//전체 목록 가져오는 애
		ArrayList<BoardDTO> list = dao.list();		
		
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/communityFreeBulletinBoard.jsp");
		dispatcher.forward(req, resp);
		
	}

}