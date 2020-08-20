package com.test.soccer.analysis;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.soccer.member.MemberDAO;
import com.test.soccer.member.MemberDTO;


@WebServlet("/analysis/teamAnalysis.do")
public class TeamAnalysis extends HttpServlet{
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberDAO dao = new MemberDAO();
		
		MemberDTO dto = dao.getData();
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/analysis/teamAnalysis.jsp");
		
		dispatcher.forward(req, resp);	
	}
	
}

