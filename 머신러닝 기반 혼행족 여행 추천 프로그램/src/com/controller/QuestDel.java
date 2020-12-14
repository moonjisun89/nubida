package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberDTO;
import com.model.QuestDAO;

@WebServlet("/QuestDel")
public class QuestDel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("111");
		String num = request.getParameter("num");
		
		QuestDAO dao = new QuestDAO();
		int cnt = dao.delete(num);

		if (cnt > 0) {
			System.out.println("삭제 성공");

		} else {
			System.out.println("삭제실패");
		}

		response.sendRedirect("mypage2.jsp");

	}

}
