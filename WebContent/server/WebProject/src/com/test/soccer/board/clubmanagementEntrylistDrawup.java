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

import com.test.soccer.member.AjaxDAO;


@WebServlet("/board/clubmanagementEntrylistDrawup.do")
public class clubmanagementEntrylistDrawup extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//1. DB 작업 
		//2. 위치 정보 반환
		HttpSession session = req.getSession();
		String member_seq = session.getAttribute("seq").toString();
		
		//1.
		AjaxDAO dao = new AjaxDAO();
		ArrayList<formationDTO> list = dao.formation(member_seq);
		
		//2.
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/clubmanagementEntrylistDrawup.jsp");
		dispatcher.forward(req, resp);
		
	}

}
