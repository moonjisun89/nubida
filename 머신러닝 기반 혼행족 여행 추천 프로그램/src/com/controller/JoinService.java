package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;

import com.model.MemberDAO;
import com.model.MemberDTO;

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String m_name = request.getParameter("m_name");
		String m_email = request.getParameter("m_email");
		String m_pw = request.getParameter("m_pw");
		String m_tel = request.getParameter("m_tel");
		String rank = request.getParameter("rank");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String store = request.getParameter("store");
		String type = request.getParameter("type");

		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO(m_name, m_email, m_pw, m_tel, rank, age, gender, store, type);
		int cnt = dao.join(dto);

		if (cnt > 0) {
			HttpSession session = request.getSession();
			System.out.println("회원가입성공");

		} else {
			System.out.println("회원가입실패;");
			System.out.println(m_name);
			System.out.println(m_email);
			System.out.println(m_pw);
			System.out.println(m_tel);
			System.out.println(rank);
			System.out.println(age);
			System.out.println(gender);
			System.out.println(store);
			System.out.println(type);
		}
		response.sendRedirect("index.jsp");
	}

}