package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;
import com.model.MemberDTO;


@WebServlet("/JoinCheck")
public class JoinCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String m_email = request.getParameter("m_email");

		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		MemberDTO info = new MemberDTO();

		System.out.println(m_email);
		
		if (m_email != null) {
			System.out.println("11");
			// m_email 값이 있으면 info에 m_email을 담기
			dto.setM_email(m_email);
			System.out.println("22");
			info = dao.check(dto);
		}
		
		
		if (info != null) {
			// 이메일 중복. 사용 불가능
			out.println("0");
			System.out.println("불가능");
		} else {
			// 이메일 사용 가능
			out.println("1");
			System.out.println("가능");
		}
		out.flush();
	}
}