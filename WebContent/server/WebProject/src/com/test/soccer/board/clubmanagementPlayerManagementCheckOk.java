package com.test.soccer.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.soccer.member.AjaxDAO;

@WebServlet("/board/clubmanagementPlayerManagementCheckok.do")
public class clubmanagementPlayerManagementCheckOk extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String text = req.getParameter("text");
		String entry_seq = req.getParameter("entry_seq");
		
		AjaxDAO dao = new AjaxDAO();
		
		CommentDTO dto = new CommentDTO();
		dto.setText(text);
		dto.setEntry_seq(entry_seq);
		
		int result = dao.addtext(dto);
		
		PrintWriter write = resp.getWriter();
		
		write.print(result);
		
		write.close();
	}

}
