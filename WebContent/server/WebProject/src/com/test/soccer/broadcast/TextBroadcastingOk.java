package com.test.soccer.broadcast;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.coyote.http11.Http11AprProtocol;

@WebServlet("/broadcast/textbroadcastingok.do")
public class TextBroadcastingOk extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//data: {"leaguegame_seq":${leaguegame_seq}, "playerEntry_seq":playerEntry_seq,"broadcastact_seq":broadcastact_seq,"time":tT},
		
		/*
		$.ajax({
        	type: "GET",
			url: "/soccer/broadcast/textbroadcastingok.do",
			data: {"leaguegame_seq":${leaguegame_seq}, "playerEntry_seq":playerEntry_seq,"broadcastact_seq":broadcastact_seq,"time":tT},						
			dataType: "text",
			success: function(result) {
				broadcastact_seq="";
				playerEntry_seq="";
				tT="";
				$("#contentBox").css({ "border": "2px solid RGB(238,238,238)", "box-shadow": "" });
	            $("#contentInfo").remove();
	            $(".contentInfo2").remove();
	            $(".contentInfo3").remove();
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
			
        }) 
		 */
		
		String leagueGame_seq=req.getParameter("leaguegame_seq");
		String playerEntry_seq=req.getParameter("playerEntry_seq");
		String broadcastAct_seq=req.getParameter("broadcastact_seq");
		String time=req.getParameter("time");
		
		BroadcastDTO1 dto=new BroadcastDTO1();
		dto.setLeagueGame_seq(leagueGame_seq);
		dto.setPlayerEntry_seq(playerEntry_seq);
		dto.setBroadcastAct_seq(broadcastAct_seq);
		dto.setTime(time);
		
		BroadCastDAO2 dao=new BroadCastDAO2();
		int result=dao.updateTextBroadcast(dto);
		PrintWriter writer=resp.getWriter();
		
		writer.print(result);
		writer.close();
	}//doget
}//ok
