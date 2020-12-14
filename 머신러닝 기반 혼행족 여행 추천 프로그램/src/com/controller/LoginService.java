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

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      String m_name = request.getParameter("m_name");
      String m_email = request.getParameter("m_email");
      String m_pw = request.getParameter("m_pw");
      String rank = request.getParameter("ranks");
      String type = request.getParameter("type");
      String experience = request.getParameter("experience");

      MemberDAO dao = new MemberDAO();
      MemberDTO dto = new MemberDTO(m_name, m_email, m_pw, rank, type, experience);
      MemberDTO info = dao.login(dto);
      
      if (info != null) {
         System.out.println("로그인 성공!");
         HttpSession session = request.getSession();
         session.setAttribute("info", info);
      } else {
         System.out.println("로그인 실패!");
      }
      response.sendRedirect("index.jsp");

   }
}