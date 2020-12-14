package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDTO;
import com.model.PlaceDAO;


@WebServlet("/CourseUpdate")
public class CourseUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		String email = info.getM_email();
		PlaceDAO dao = new PlaceDAO();
		//코스초기화기능 
		dao.course_reset(email);
		//코스 리스트 - 추가기능 / 
		String [] select_course = request.getParameterValues("selected");
		if(select_course!=null) {
		for (int i = 0; i < select_course.length; i++) {
			String p_num=dao.get_p_num(select_course[i]);
			dao.course_update(email, p_num);
		}
		}
		response.sendRedirect("http://localhost:8087/newbida/mypage.jsp");

	}

}
