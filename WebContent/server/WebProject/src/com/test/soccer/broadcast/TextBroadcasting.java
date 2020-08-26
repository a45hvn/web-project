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
		String seq = req.getParameter("seq");//리그게임시퀀스(글번호)
		String homeTeam_seq = req.getParameter("homeTeam_seq");//홈팀시퀀스
		String awayTeam_seq = req.getParameter("awayTeam_seq");//어웨이팀 시퀀스
		String league_seq = req.getParameter("league_seq");//리그 시퀀스
		
		//2. 위임하기(번호들 전달하고 값 반환받기)
		BroadcastDAO dao = new BroadcastDAO();
		BroadcastDTO dto2 = new BroadcastDTO();
		
		dto2.setSeq(seq);
		dto2.setHomeTeam_seq(homeTeam_seq);
		dto2.setAwayTeam_seq(awayTeam_seq);
		dto2.setLeague_seq(league_seq);
		
		BroadcastDTO dto = dao.getBroadcast(dto2);
		https://jquery.com/ArrayList<BroadcastDTO> broadCastList = dao.teamList();
		
		
		
		
		
		
		
//		ArrayList<BroadcastDTO> broadCastList = dao.broadCastList(leagueGame_seq);
//		req.setAttribute("broadCastList", broadCastList);
		
		
		//3. dao에서 반환받은 게시물 데이터를 출력하기 위해 jsp에 값을 넘겨준다.
		req.setAttribute("dto", dto);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/broadcast/textbroadcasting.jsp");
		dispatcher.forward(req, resp);
	}
}
