package com.koreait;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FollowServlet
 */
public class FollowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		int useridx = (int) session.getAttribute("idx");
		int followingid = Integer.parseInt(request.getParameter("followingid"));
		ContentDAO dao = new ContentDAO();
		dao.editFollowing(useridx, followingid);
	}

}
