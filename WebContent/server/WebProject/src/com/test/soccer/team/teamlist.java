package com.test.soccer.team;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/team/teamlist.do")
public class teamlist extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//DB갔다오자
		TeamlistDAO dao=new TeamlistDAO();
		ArrayList<TeamlistDTO> list= dao.list();
		
		RequestDispatcher dispatcher= req.getRequestDispatcher("/WEB-INF/views/team/teamlist.jsp");
		 dispatcher.forward(req, resp);
	}//doget
	
}//teamlist
