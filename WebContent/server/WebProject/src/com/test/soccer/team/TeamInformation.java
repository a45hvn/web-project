package com.test.soccer.team;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//teamlist에서 팀을 누르면 이곳으로 오지
@WebServlet("/team/teaminformation.do")
public class TeamInformation extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String teamname=req.getParameter("teamname");
		TeamlistDAO dao=new TeamlistDAO();
		
		//팀이름을 넘겨주고 정보들을 받아온다(view team)
		TeamInformationDTO teamInfo=dao.getTeamInformation(teamname);
		
		//팀이름 넘겨주고 선수 정보들을 받아온다.(view player)
		ArrayList<PlayerInformationDTO> playerInfo=new ArrayList<PlayerInformationDTO>();
		playerInfo=dao.getPlayerInformation(teamname);
		
		//팀이름 넘겨주고 팀기록 받아온다.(view teamrecord)

		//선수 총합
		int playerInfoSize=playerInfo.size();
		
		//이제 정보 넘어갑니다.
		req.setAttribute("teamInfo", teamInfo);
		req.setAttribute("playerInfo", playerInfo);
		req.setAttribute("playerInfoSize", playerInfoSize);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/team/teaminformation.jsp");
		dispatcher.forward(req, resp);
		dao.close();
	}//doget
}//teaminformation