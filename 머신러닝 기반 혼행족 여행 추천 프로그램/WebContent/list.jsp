<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./inc/header.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.*"%>

<%
	MemberDTO info1 = (MemberDTO)session.getAttribute("info");
	PlaceDAO dao = new PlaceDAO();
	ArrayList<String> mlocate = dao.main_locate();
%>

<div id="sub_visual"><!-- 서브비주얼 -->
	<div class="sv_txt">추천여행</div>
	<div class="sub_tab">
		<ul>
			<li><a href="" class="on">걸어서 여행</a></li>
			<li><a href="">코스별 여행</a></li>
			<li><a href="">자전거 여행</a></li>
		</ul>
	</div>
</div>
<div id="sub_contents">
	<div class="sub_content">
		<!--div class="sub_title">걸어서 여행</div-->
		<div class="page">
			<!-- 내용 들어갈 곳 -->



			
			<div class="ptitle" style="margin-top:0">이런 여행 어떠세요?</div>
			<div class="tabmenu">
				<ul>
					<li id="tab1" class="btnCon">
						<input type="radio" checked name="tabmenu" id="tabmenu1"><label for="tabmenu1">한라산 영실 단풍산행과 천아계곡 단풍 걷기</label>
						<div class="tabCon" ><img src="./img/main2.jpg" width="100%" /></div>
					</li>
					<li id="tab2" class="btnCon">
						<input type="radio" name="tabmenu" id="tabmenu2"><label for="tabmenu2">한라산 성판악 - 관음사 단풍산행과 차귀도 걷기</label>
						<div class="tabCon" ><img src="./img/main3.jpg" width="100%" /></div>
					</li>    
					<li id="tab3" class="btnCon">
						<input type="radio" name="tabmenu" id="tabmenu3"><label for="tabmenu3">북동부 바다의 아름다운 올레길과 거문오름 걷기</label>
						<div class="tabCon" ><img src="./img/main.jpg" width="100%" /></div>
					</li>
					<li id="tab4" class="btnCon">
						<input type="radio" name="tabmenu" id="tabmenu4"><label for="tabmenu4">금빛으로 반짝이는 백약이오름과 치유의 숲 걷기</label>
						<div class="tabCon" ><img src="./img/main3.jpg" width="100%" /></div>
					</li>
				</ul>
			</div>


			<div class="ptitle">전체 여행 리스트</div>
			<div class="trip_list">
				<ul>
					<%int j=0;%>
					<%for(int i=0;i<20;i++){%>
						<li><a href="<%=mlocate.get(j+2)%>" target="_blank"><div class="img"><img src="<%=mlocate.get(j+1)%>" alt="" width="100%"/></div></a>
							<b><%=mlocate.get(j)%></b>
							<div class="tag"><i><%=mlocate.get(j+3)%></i></div>
						</li>
					<%j+=4;%>
					<%} %>
				</ul>
			</div>



			<!-- 내용 들어갈 곳 -->
		</div>
	</div>
</div>




<%@ include file="./inc/footer.jsp" %>