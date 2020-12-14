package com.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDTO;
import com.model.PlaceDAO;


@WebServlet("/PeriodUpdate")
public class PeriodUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

					request.setCharacterEncoding("utf-8");
					HttpSession session = request.getSession();
					MemberDTO info = (MemberDTO)session.getAttribute("info");
					String email = info.getM_email();
					System.out.println(email);
					String period = request.getParameter("period");
					System.out.println(period);
					PlaceDAO dao = new PlaceDAO();
					dao.period_update(email, period);
					System.out.println(URLEncoder.encode(email));
					response.sendRedirect("http://localhost:9000/?id="+URLEncoder.encode(email)+"");
	}

}
