package com.test.soccer.broadcast;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/textbroadcasting.do")
public class TextBroadcasting extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기
		//어떤 팀들이 경기를 하는지 팀들에 대한 데이터
		String leagueGame_seq = req.getParameter("leagueGame_seq");
		
		
		//2. 위임하기
		BroadcastDAO dao = new BroadcastDAO();
		BroadcastDTO dto = new BroadcastDTO();
		
		ArrayList<BroadcastDTO> broadCastList = dao.broadCastList(leagueGame_seq);
		
		req.setAttribute("broadCastList", broadCastList);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/broadcast/textbroadcasting.jsp");
		dispatcher.forward(req, resp);
	}
}
