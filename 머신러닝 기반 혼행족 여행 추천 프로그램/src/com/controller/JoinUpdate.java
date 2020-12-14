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


@WebServlet("/JoinUpdate")
public class JoinUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		String m_pw = request.getParameter("m_pw");
		String m_tel = request.getParameter("m_tel");
		String rank = request.getParameter("rank");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String store = request.getParameter("store");
		String type = request.getParameter("type");
		String m_email = info.getM_email();
		
		MemberDAO dao = new MemberDAO(request, session);
		MemberDTO dto = new MemberDTO(m_email, m_pw, m_tel, rank, age, gender, store, type);
		
		int cnt = dao.update(dto);
		
		System.out.println(cnt);
		System.out.println(m_email);
		
		if (cnt > 0) {
			System.out.println("회원정보 수정 성공!");
			session.setAttribute("info", info);
		} else {
			System.out.println("회원정보 수정 실패");
		}
		response.sendRedirect("index.jsp");
	
	}
}