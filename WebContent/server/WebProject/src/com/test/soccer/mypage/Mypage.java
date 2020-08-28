package com.test.soccer.mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.soccer.member.MemberDTO;

@WebServlet("/mypage/mypage.do")
public class Mypage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//세션 얻어오기
		HttpSession session = req.getSession();
		String seq = (String) session.getAttribute("seq");
		String id = (String) session.getAttribute("id");
		String name = (String) session.getAttribute("name");
		String pic = (String) session.getAttribute("pic");

		// 작업 위임 
		
		MypageDAO dao = new MypageDAO();
		MypageDTO dto = new MypageDTO();
		
		DmDTO dto2 = new DmDTO();
		LeagueDTO dto3 = new LeagueDTO();
		
		ArrayList<MypageDTO> list = dao.list(seq);
		ArrayList<DmDTO> dmlist = dao.dmlist(seq);
		ArrayList<LeagueDTO> leaguelist = dao.leaguelist(seq);
	
		
		
		
		//데이터 반환하기
		req.setAttribute("list", list);
		req.setAttribute("dmlist", dmlist);
		req.setAttribute("seq", seq);
		req.setAttribute("leaguelist", leaguelist);
		System.out.println(list);
		System.out.println(dmlist);
		System.out.println(leaguelist);
		
		
	RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp");
	dispatcher.forward(req, resp);
	
	}
}
