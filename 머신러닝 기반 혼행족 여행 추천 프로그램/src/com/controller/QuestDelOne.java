package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.QuestDAO;


@WebServlet("/QuestDelOne")
public class QuestDelOne extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("갔냐?");
		String content = request.getParameter("q_content");
		
		QuestDAO dao = new QuestDAO();
		
		int cnt = dao.deleteOne(content);
		
		if(cnt > 0) {
			System.out.println("퀘스트삭제 성공");
		} else {
			System.out.println("퀘스트삭제 실패");
		}
		
		response.sendRedirect("index.jsp");
		
	}

}
