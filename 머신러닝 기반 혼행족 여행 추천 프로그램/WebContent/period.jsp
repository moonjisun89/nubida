<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./inc/header.jsp" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.model.*"%>
<% 
	String email = info.getM_email();		
	PlaceDAO dao = new PlaceDAO();
%>    

<div id="sub_contents" class="sc_top">
	<div class="sub_content">
		<div class="sub_title">여행기간 선택하기</div>
		<div class="page">
			<!-- 내용 들어갈 곳 -->
			<ul class="wd_icon">
			     <li><img src="./img/wd_icon1.png" width="100%" /></li>
			     <li><img src="./img/wd_icon2.png" width="100%" /></li>
			     <li><img src="./img/wd_icon3.png" width="100%" /></li>
			     <li><img src="./img/wd_icon4.png" width="100%" /></li>
			     <li><img src="./img/wd_icon5.png" width="100%" /></li>
			     <li><img src="./img/wd_icon6.png" width="100%" /></li>
			     <li><img src="./img/wd_icon7.png" width="100%" /></li>
			     <li><img src="./img/wd_icon8.png" width="100%" /></li>
		    </ul>
			
			<div class="plan_sct">
				<form id="sub1" method = "post" action="PeriodUpdate">
					<select name = "period">
						<option>일정을 선택해주세요.</option>
						<option value="0">당일치기</option>
						<option value="1">1박 2일</option>
						<option value="2">2박 3일</option>
						<option value="3">3박 4일</option>
						<option value="4">4박 5일</option>
						<option value="5">5박 6일</option>
					</select><input type="submit" value="일정선택하기" onclick="return confirm('일정을 선택하시겠습니까?')">
				</form>
			</div>
			<%
			ArrayList<String> suggestion = dao.suggestion(email);
			String[] suggestions = (suggestion.get(0)).split("-");
			int[] suggestion_final = new int[suggestions.length];

			for (int i = 0; i < suggestions.length; i++) {
				suggestion_final[i] = Integer.parseInt(suggestions[i]);
			}
			%>
			<%
				String[] suggest_list = new String[suggestions.length];

			for (int i = 0; i < suggestion_final.length; i++) {
				String[] suggestion_locate = dao.locate(suggestion_final[i]);
				String a = suggestion_locate[0];
				suggest_list[i] = a;
			}
			%>
			<div class="plan_chc">
				 <form id="sub2" method = "post" action="CourseUpdate">
         <div class="plan_chc">
            <%for(int i=0;i<suggest_list.length;i++){ %>
               <div class="check_w vesi">
               <input id="<%=i%>" type="checkbox" name="selected" value="<%=suggest_list[i] %>">
               <label for="<%=i%>"><%=suggest_list[i] %></label>
               <div class="ck"></div>
               </div>
            <%} %>
         </div>
         <div class="chcBtn"><input type="submit" value="코스선택하기" onclick="return confirm('코스를 선택하시겠습니까?')"></div>
      </form>
			</div>
			
		
			
			<!-- 내용 들어갈 곳 -->
		</div>
	</div>
</div>




<%@ include file="./inc/footer.jsp" %>