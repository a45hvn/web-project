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
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		
		
		
		
		
		
	RequestDispatcher dispatcher = req.getRequestDispatcher("WEB-INF/views/broadcast/textbroadcastingschedule.jsp");
	dispatcher.forward(req, resp);
	}
	
}
