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

@WebServlet("/board/clubmanagementEntrylistDrawupRecommend.do")
public class clubmanagementEntrylistDrawupRecommend extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//1.
		
		
		//팀번호
		String team_seq = req.getParameter("team_seq");
		
		AjaxDAO dao = new AjaxDAO();
		
		formationDTO dto2 = new formationDTO();		
		dto2.setTeam_seq(team_seq);
		
		
		ArrayList<formationDTO> entry = dao.entryList(dto2);
		
		
		req.setAttribute("entry", entry);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/clubmanagementEntrylistDrawupRecommend.jsp");
		dispatcher.forward(req, resp);
		
	}

}