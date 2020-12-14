package com.controller;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberDTO;

@WebServlet("/MemberType")
public class MemberType extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		/* 자바스크립트에서 태그 불러오는 부분 ────────────────────────────────────────────────────────────────*/
		String data = request.getParameter("data");
		String[] saveItem = data.split(",");
		String lastTag = "";
		for (int i=0; i<saveItem.length; i++) {
			lastTag = saveItem[i];
		}
		System.out.println(lastTag+" <-- 마지막태그");
		/*─────────────────────────────────────────────────────────────────────────────────────────*/

		
		String mountain = request.getParameter("mountain");
		String beach = request.getParameter("beach");
		String town = request.getParameter("town");
		String exotic = request.getParameter("exotic");
		String healing = request.getParameter("healing");
		String activity = request.getParameter("activity");
		String hotspot = request.getParameter("hotspot");
		String bererage = request.getParameter("bererage");
		String food = request.getParameter("food");
		String history = request.getParameter("history");
		String walkbicycle = request.getParameter("walkbicycle");
		String drivebike = request.getParameter("drivebike");
		String play = request.getParameter("play");
		String shopping = request.getParameter("shopping");
		String pet = request.getParameter("pet");
		String festival = request.getParameter("festival");
		String m_email = info.getM_email();


		MemberDTO dto = new MemberDTO(m_email, mountain, beach, town, exotic, healing, activity, hotspot, bererage, food, history, walkbicycle, drivebike, play, shopping, pet, festival);
		MemberDAO dao = new MemberDAO();

		int cnt = 0;
		switch(lastTag) {
			case "산" :
				cnt = dao.typeMountain(dto);
				if (cnt > 0) {
					session.setAttribute("info", info);
					System.out.println(lastTag + " <-- 특성업로드성공");
				} else {
					System.out.println("특성업로드실패;");
				}				
				break;
			case "바다" :
				cnt = dao.typeBeach(dto);
				if (cnt > 0) {
					session.setAttribute("info", info);
					System.out.println(lastTag + " <-- 특성업로드성공");
				} else {
					System.out.println("특성업로드실패;");
				}		
				break;
			case "번화가" :
				cnt = dao.typeTown(dto);
				if (cnt > 0) {
					session.setAttribute("info", info);
					System.out.println(lastTag + " <-- 특성업로드성공");
				} else {
					System.out.println("특성업로드실패;");
				}		
				break;
			case "이색적인" :
				cnt = dao.typeExotic(dto);
				if (cnt > 0) {
					session.setAttribute("info", info);
					System.out.println(lastTag + " <-- 특성업로드성공");
				} else {
					System.out.println("특성업로드실패;");
				}		
				break;
			case "힐링" :
				cnt = dao.typeHealing(dto);
				if (cnt > 0) {
					session.setAttribute("info", info);
					System.out.println(lastTag + " <-- 특성업로드성공");
				} else {
					System.out.println("특성업로드실패;");
				}		
				break;
			case "활동" :
				cnt = dao.typeActivity(dto);
				if (cnt > 0) {
					session.setAttribute("info", info);
					System.out.println(lastTag + " <-- 특성업로드성공");
				} else {
					System.out.println("특성업로드실패;");
				}		
				break;
			case "핫스팟" :
				cnt = dao.typeHotspot(dto);
				if (cnt > 0) {
					session.setAttribute("info", info);
					System.out.println(lastTag + " <-- 특성업로드성공");
				} else {
					System.out.println("특성업로드실패;");
				}		
				break;
			case "카페" :
				cnt = dao.typeBeverage(dto);
				if (cnt > 0) {
					session.setAttribute("info", info);
					System.out.println(lastTag + " <-- 특성업로드성공");
				} else {
					System.out.println("특성업로드실패;");
				}		
				break;
			case "맛집" :
				cnt = dao.typeFood(dto);
				if (cnt > 0) {
					session.setAttribute("info", info);
					System.out.println(lastTag + " <-- 특성업로드성공");
				} else {
					System.out.println("특성업로드실패;");
				}		
				break;
			case "역사" :
				cnt = dao.typeHistory(dto);
				if (cnt > 0) {
					session.setAttribute("info", info);
					System.out.println(lastTag + " <-- 특성업로드성공");
				} else {
					System.out.println("특성업로드실패;");
				}		
				break;
			case "산책" :
				cnt = dao.typeWalkbicycle(dto);
				if (cnt > 0) {
					session.setAttribute("info", info);
					System.out.println(lastTag + " <-- 특성업로드성공");
				} else {
					System.out.println("특성업로드실패;");
				}		
				break;
			case "드라이브" :
				cnt = dao.typeDrivebike(dto);
				if (cnt > 0) {
					session.setAttribute("info", info);
					System.out.println(lastTag + " <-- 특성업로드성공");
				} else {
					System.out.println("특성업로드실패;");
				}		
				break;
			case "체험" :
				cnt = dao.typePlay(dto);
				if (cnt > 0) {
					session.setAttribute("info", info);
					System.out.println(lastTag + " <-- 특성업로드성공");
				} else {
					System.out.println("특성업로드실패;");
				}		
				break;
			case "쇼핑" :
				cnt = dao.typeShopping(dto);
				if (cnt > 0) {
					session.setAttribute("info", info);
					System.out.println(lastTag + " <-- 특성업로드성공");
				} else {
					System.out.println("특성업로드실패;");
				}		
				break;
			case "반려동물" :
				cnt = dao.typePet(dto);
				if (cnt > 0) {
					session.setAttribute("info", info);
					System.out.println(lastTag + " <-- 특성업로드성공");
				} else {
					System.out.println("특성업로드실패;");
				}		
				break;
			case "축제" :
				cnt = dao.typeFestival(dto);
				if (cnt > 0) {
					session.setAttribute("info", info);
					System.out.println(lastTag + " <-- 특성업로드성공");
				} else {
					System.out.println("특성업로드실패;");
				}	
				break;	
		}
		response.sendRedirect("mypage.jsp");


		
//		for(String item : saveItem) {
//			System.out.println(item);
//		}
	}
}
