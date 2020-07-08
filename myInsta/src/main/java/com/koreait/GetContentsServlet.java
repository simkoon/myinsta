package com.koreait;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

@WebServlet("/GetContentsServlet")
public class GetContentsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		int useridx = (int) session.getAttribute("idx");

		int start = Integer.parseInt(request.getParameter("start"));
		System.out.println("서블릿스타트:" + start);
		System.out.println(useridx);
		response.getWriter().write(getJSON(start, useridx));

	}

	public String getJSON(int start, int useridx) throws IOException {
		ContentDAO dao = new ContentDAO();
		ObjectMapper mapper = new ObjectMapper();

		ArrayNode result = mapper.createArrayNode();
		List<Content> artList = dao.getContents(start);
		ObjectNode article = mapper.createObjectNode();
		for (int i = 0; i < artList.size(); i++) {
			
			article.put("idx", artList.get(i).getMc_idx());
			article.put("content", artList.get(i).getMc_content());
			article.put("img", artList.get(i).getMc_imageurl());
			article.put("account", artList.get(i).getMc_useridx());
			article.put("like", artList.get(i).getCntLikes());
			article.put("islikeon", dao.getLikeById(artList.get(i).getMc_idx(), useridx));
			article.put("issaveon", dao.getSaveById(artList.get(i).getMc_idx(), useridx));
			article.set("comment", convertList(dao.getComment(artList.get(i).getMc_idx())));
			result.add(article);
			article = mapper.createObjectNode();

		}
		ObjectNode setResult = mapper.createObjectNode();
		setResult.set("result", result);
		String strResult = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(setResult);
		System.out.println(strResult);
		return strResult;
	}


	public ArrayNode convertList(List<CommentDTO> list) throws JsonGenerationException, JsonMappingException, IOException {
		
		ObjectMapper mapper = new ObjectMapper();
		ArrayNode anode = mapper.valueToTree(list);
		
		return anode;
	}
}