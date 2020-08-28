package com.test.soccer.broadcast;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/broadcast/textbroadcasting.do")
public class TextBroadcasting extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//접속자의 세션을 확인하고 관리자면 수정이 가능하다
		HttpSession session=req.getSession();
		
		//팀번호와 리그번호, 리그게임번호를 가져온다.-> 아니면 팀엔트리의 팀번호를 가져온다
		GameDTO team1=new GameDTO();
		GameDTO team2=new GameDTO();
		
		String teamname1=req.getParameter("hometeam");
		String teamname2=req.getParameter("awayteam");
		String league_seq=req.getParameter("league");
		String leaguegame_seq=req.getParameter("seq");
		
		teamname1="나슬";
		teamname2="알섬";
		league_seq="1";
		leaguegame_seq="1";
		
		team1.setTeamname(teamname1);
		team1.setLeague_seq(league_seq);
		team1.setLeaguegame_seq(leaguegame_seq);

		team2.setTeamname(teamname2);
		team2.setLeague_seq(league_seq);
		team2.setLeaguegame_seq(leaguegame_seq);
		
		BroadCastDAO2 dao=new BroadCastDAO2();
		
		
		//팀번호와 리그번호를 넘겨주면서 선수 정보를 가져온다.
		ArrayList<PlayerInformationDTO> playerInfo1=dao.getPlayerInfo(team1);
		ArrayList<PlayerInformationDTO> playerInfo2=dao.getPlayerInfo(team2);

		//문자중계 결과를 가져온다.
		ArrayList<textBroadCastDTO> textBroadCast=dao.getTextBroadCast(leaguegame_seq);
		
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
