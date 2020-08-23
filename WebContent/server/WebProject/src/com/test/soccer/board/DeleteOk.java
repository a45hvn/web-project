package com.test.soccer.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/deleteok.do")
public class DeleteOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		String seq = req.getParameter("seq");
		
		BoardDAO dao = new BoardDAO();
		
		int result = 0;
		
		HttpSession session = req.getSession();
		
		BoardDTO dto2 = new BoardDTO();
		dto2.setSeq(seq);									//삭제할 글 번호
		dto2.setId((String)session.getAttribute("id"));		//로그인한 아이디
		
		if(dao.isOwner(dto2)) {
			result = dao.delete(seq);
		} else {
			result = 2;
		}
		
		
		//3.
				if (result == 1) {
					
					//삭제 성공
					resp.sendRedirect("/soccer/board/communityFreeBulletinBoard.do");
					
				} else if (result == 0) {
					//삭제 실패
					PrintWriter writer = resp.getWriter();
					writer.print("<html>");
					writer.print("<body>");
					writer.print("<script>");
					writer.print("alert('failed'); history.back();");
					writer.print("</script>");
					writer.print("</body>");
					writer.print("</html>");
					writer.close();		
				} else if (result == 2) {
					//삭제 실패(글쓴이 X)
					resp.setCharacterEncoding("UTF-8");//			
					PrintWriter writer = resp.getWriter();
					writer.print("<html>");
					writer.print("<head>");//
					writer.print("<meta charset='UTF-8'>");//
					writer.print("</head>");//
					writer.print("<body>");
					writer.print("<script>");
					writer.print("alert('글쓴이만 삭제 가능합니다.'); history.back();");
					writer.print("</script>");
					writer.print("</body>");
					writer.print("</html>");
					writer.close();		
				}
		
	}
	
}
