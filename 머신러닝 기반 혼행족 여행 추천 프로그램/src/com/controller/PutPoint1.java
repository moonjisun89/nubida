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


@WebServlet("/PutPoint1")
public class PutPoint1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
	    MemberDTO info = (MemberDTO)session.getAttribute("info");
	    
	    MemberDAO dao = new MemberDAO();
	    int cnt = dao.putpoint2(info.getM_email());
	    
	    if(cnt >0) {
	    	System.out.println("퀘스트 완료(25점)");
	    }else {
	    	System.out.println("퀘스트 완료 실패!");
	    }
	    
	    response.sendRedirect("index.jsp");
	}

}
