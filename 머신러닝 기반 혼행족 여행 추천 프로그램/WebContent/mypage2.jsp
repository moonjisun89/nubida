<%@page import="com.model.QuestDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.model.QuestDTO" %>
<%@page import="com.model.MemberDTO" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./inc/header.jsp" %>
<script type="text/javascript">
function move(){   
	q = confirm("퀘스트를 삭제 하시겠습니까?");
    if(q){
  	  alert("퀘스트 삭제가 완료되었습니다.");
   }
}
</script>
<script>
    function modify(){
        var url = "questModify.jsp";
        var name = "popup test";
        var option = "width=500, height=500, top=100, left=200, location=no"
        window.open(url, name, option);
    }
</script>


	<%
	
		ArrayList<QuestDTO> list = null;
		
		QuestDAO dao = new QuestDAO();
		
		if(info != null){
			list =dao.select(info.getType());
		}
	
	%>

<div id="sub_contents" class="sc_top">
	<div class="sub_content">
		<div class="sub_title">사업자 회원 마이페이지</div>
		<div class="page">
			<!-- 내용 들어갈 곳 -->


			<div class="mp_box">
				<h4 style="padding:0;border:0;">퀘스트관리</h4><a href="modify.jsp" class="mp_top_btn">정보수정</a>
				<div class="admin_tbl">
					<table>
						<tr>
							<th>No</th>
							<th>업종</th>
							<th>퀘스트 내용</th>
							<th>퀘스트 점수</th>
							<th width="100"></th>
						</tr>
						<%if(list != null) {%>
						<%for(int i=0; i<list.size(); i++){ %>
						<tr>
							<td><%=i+1 %></td>
							<td><%=list.get(i).getQ_kinds() %></td>
							<td><%=list.get(i).getQ_content() %></td>
							<td><%=list.get(i).getQ_point() %></td>
							<td><a href="QuestDel?num=<%= list.get(i).getQ_num()%>" onclick="move();">삭제</a></td>
						</tr>
						<%} }%>
						
					</table>
				</div>
			</div>
		
			<div class="mp_box">
				<h4 style="padding:0;border:0;">문의하기</h4>	
				<form class="gform" method="POST" data-email="nubida1@naver.com" action="https://script.google.com/macros/s/AKfycbw4Vz72nxga7vtk2VHJJNwN5P5aZDqlX96nJuBqAQ/exec">
					<div class="tbl2">
						<table>
							<tr>
								<th>이름</th>
								<td><input type="text" id="name" name="이름" class="ip01" maxlength="10"></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="text" class="ip01" id="email" name="이메일" maxlength="100"></td>
							</tr>
							<tr>
								<th>연락처</th>
								<td><input type="text" class="ip01" id="honeypot" name="연락처" maxlength="11"></td>
							</tr>
							<tr>
								<th>퀘스트 신청 내용</th>
								<td><textarea cols="10" id="message" name="퀘스트내용" placeholder="퀘스트내용을 입력해주세요."﻿﻿></textarea></td>
							</tr>
						</table>
					</div>
					
					<div style="display: none" class="thankyou_message">
						<h2>감사합니다. 퀘스트 신청이 완료되었습니다!</h2>
					</div>

					<div class="btn_w">
						<input type="submit" value=" 문의하기 " class="btn" >
					</div>
				</form>
			</div>
<!-- Ajax 스크립트 -->
<script data-cfasync="false" type="text/javascript"
src="https://cdn.rawgit.com/dwyl/html-form-send-email-via-google-script-without-server/master/form-submission-handler.js"></script>



			<!-- 내용 들어갈 곳 -->
		</div>
	</div>
</div>




<jsp:include page="./inc/footer.jsp"/>