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

@WebServlet("/JoinDelete")
public class JoinDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String m_email = request.getParameter("m_email");
		String m_pw = request.getParameter("m_pw");

		HttpSession session = request.getSession();
		
		MemberDAO dao = new MemberDAO(request, session);
		MemberDTO dto = new MemberDTO(m_email, m_pw);
		int cnt = dao.delete(dto);

		if (cnt > 0) {
			session.removeAttribute("info");
			System.out.println("탈퇴 성공");

		} else {
			System.out.println("회원탈퇴 실패");
		}

		response.sendRedirect("index.jsp");
		
	}
}