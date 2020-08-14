package com.test.soccer.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/BulletinBoardContent.do")
public class BulletinBoardContent extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기
		//2. DB 작업
		//3. 결과 반환
		
		
		//1.
		//게시물 번호 받아오기
		String seq = req.getParameter("seq");
		
		
		//2.
		BoardDAO dao = new BoardDAO();
		
		
		
		//BoardDTO dto2 = new BoardDTO();
			
		
		BoardDTO dto = dao.content(seq);
		
		
		
		
		
		
		
		//댓글
		//ArrayList<CommentDTO> clist = dao.listComment(seq);
		
		
		req.setAttribute("dto", dto);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/BulletinBoardContent.jsp");
		dispatcher.forward(req, resp);
		
	}

}
