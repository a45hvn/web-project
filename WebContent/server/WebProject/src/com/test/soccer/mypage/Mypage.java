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

		//1. 작업 위임 
		
		MypageDAO dao = new MypageDAO();
		MypageDTO dto = new MypageDTO();
		
		
		ArrayList<MypageDTO> list = dao.list(seq);
	
		req.setAttribute("list", list);
		System.out.println(list);
		
	RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp");
	dispatcher.forward(req, resp);
	
	}
}
