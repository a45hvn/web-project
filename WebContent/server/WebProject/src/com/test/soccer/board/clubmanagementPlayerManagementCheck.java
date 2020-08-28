package com.test.soccer.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.soccer.member.AjaxDAO;

@WebServlet("/board/clubmanagementPlayerManagementCheck.do")
public class clubmanagementPlayerManagementCheck extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String entry_seq = req.getParameter("entry_seq");
		
		AjaxDAO dao = new AjaxDAO();
		
		ArrayList<formationDTO> list = dao.managementList(entry_seq);
		
		ArrayList<formationDTO> log = dao.managementLog(entry_seq);
		
		req.setAttribute("list", list);
		req.setAttribute("log", log);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/clubmanagementPlayerManagementCheck.jsp");
		dispatcher.forward(req, resp);
		
	}

}
