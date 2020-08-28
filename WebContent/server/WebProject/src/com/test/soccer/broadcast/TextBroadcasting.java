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
		BroadCastDAO dao = new BroadCastDAO();
		BroadCastDTO dto = new BroadCastDTO();
		
		ArrayList<BroadCastDTO> broadCastList = dao.broadCastList(leagueGame_seq);
		teamname1="나슬";
		teamname2="알섬";
		league_seq="1";
		leaguegame_seq="1";
		
		
		
		
		//단축키 가져온다.
		ArrayList<BroadCastDTO2> bcList=dao.getBcList();
		req.setAttribute("playerInfo1", playerInfo1); // 1팀 선수 정보
		req.setAttribute("playerInfo2", playerInfo2); // 2팀 선수 정보
		req.setAttribute("bcList", bcList);				//단축키 정보
		req.setAttribute("textBroadCast", textBroadCast); //문자중계 정보
		req.setAttribute("leaguegame_seq", leaguegame_seq);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/broadcast/textbroadcasting.jsp");
		dispatcher.forward(req, resp);
	}
}
