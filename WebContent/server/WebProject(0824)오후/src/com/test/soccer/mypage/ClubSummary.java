package com.test.soccer.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/clubsummary.do")
public class ClubSummary extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	
	RequestDispatcher dispatcher = req.getRequestDispatcher("WEB-INF/views/mypage/clubsummary.jsp");
	dispatcher.forward(req, resp);
	
	}
	
}
