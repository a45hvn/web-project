package com.test.soccer.mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mypage/mypageok.do")
public class MypageOk extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		
//		String type = req.getParameter("type");
//		if (type.equals("1")) {
//			info(req, resp);
//		} else if (type.equals("2")) {
//			dm(req, resp);
//		} else if (type.equals("3")) {
//			game(req, resp);
//		} else if (type.equals("4")) {
//			rank(req, resp);
//		} 	
		
	}

//	private void info(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		
//		
//		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/mypageinfoupdate.jsp");
//		dispatcher.forward(req, resp);
//		
//	}
//	
//	private void dm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/dm.jsp");
//		dispatcher.forward(req, resp);
//		
//	}
//	
//	private void game(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/clubsummary.jsp");
//		dispatcher.forward(req, resp);
//	}
//	private void rank(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/clubsummary.jsp");
//		dispatcher.forward(req, resp);
//	}
//
//

	
}
