package com.test.ground;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;import sun.misc.GC.LatencyRequest;

@WebServlet("/ground/map_view.do")
public class Map_view extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		
		GroundDAO dao = new GroundDAO();
		
		GroundDTO dto2 = new GroundDTO();
		dto2.setName(name);//이름 받아오기
		
		GroundDTO dto = dao.getloc(dto2);
		
		req.setAttribute("dto",dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ground/map_view.jsp");
		dispatcher.forward(req, resp);
	}
	
}
