<%@page import="com.model.QuestDAO"%>
<%@page import="com.model.QuestDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.model.MemberDTO"%>
<% 
	MemberDTO info = (MemberDTO)session.getAttribute("info");
	ArrayList<QuestDTO> list2 = null;
	QuestDAO dao1 = new QuestDAO();
	list2 =dao1.selectAll();
%> 
<!DOCTYPE HTML>
<html>
<head>
<title>제주도를 누비다.</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="format-detection" content="telephone=no, address=no, email=no" />

<link rel="stylesheet" type="text/css" href="./css/style.css" />

<script src="./js/jquery.min.js"></script><!-- 기본 jquery -->
<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./js/jquery.bxslider.js"></script>
<script type="text/javascript">
function move1(){
   q = confirm("퀘스트를 완료하시겠습니까?");
   if(q){
      location.href = "PutPoint1";
      alert("퀘스트가 완료되었습니다.");
   }
}
</script>

<script type="text/javascript">
function move2(){
   q = confirm("퀘스트를 완료하시겠습니까?");
   if(q){
      location.href = "PutPoint2";
      alert("퀘스트가 완료되었습니다.");
   }
}
</script>

<script type="text/javascript">
	$( function () {
		var slider = $( ".main-banner" ).bxSlider( {   //사업실적
			auto:'auto',
			autoControls:'true', 
			controls:true,  // 좌우버튼 노출
			speed: 2500,  // 이동 속도를 설정    
			autoDelay:1000, //자동으로 롤링되는 딜레이시간
			moveSlides:1,  //1개씩 이동
			slideWidth: 'auto' //슬라이드 안의 넓이, 숫자로도 가능합니다.
		} );
	});
</script>

</head>
<body>
<%if(info!=null) {%>
	<%if(info.getRank().equals("0")) {%>
<div class="quick_bn">
	<img src="./img/exclamation.png" alt="" />
</div>
<ul class="quest_list" style="display:none">
    <li><span><%=list2.get(1).getQ_point()%></span>   <%=list2.get(2).getQ_content() %><button class="bgray" onclick="move1();">완료</button></li>
    <li><span><%=list2.get(14).getQ_point()%></span>   <%=list2.get(14).getQ_content() %><button class="bred" onclick="move2()">완료</button></li>
    <li><span><%=list2.get(28).getQ_point()%></span>   <%=list2.get(28).getQ_content() %><button class="bgray" onclick="move2()">완료</button></li>
    <li><span><%=list2.get(33).getQ_point()%></span>   <%=list2.get(33).getQ_content() %><button class="bgray" onclick="move2()">완료</button></li>    
</ul>
	<%}} %>
<script>
    $(".quick_bn").click(function(){
        if($(".quest_list").is(":visible")){
            $(".quest_list").slideUp();
        }
        else{
            $(".quest_list").slideDown();
        }
    })
</script>




<div id="header">
	<div id="h_top">
		<div class="w1200">
			<div class="top_cs"><p>카카오 플친</p><b>@NUBIDA</b></div>
				<ul>
			<%if(info != null) {%>
				<%if(info.getRank().equals("0")) {%>
	               <li><a href="mypage.jsp"><span><%= info.getM_name() %>님의 </span>마이페이지</a></li>
	               <li><a href="Logout">로그아웃</a></li>
               <%}else if(info.getRank().equals("1")) {%>
	               <li><a href="mypage2.jsp"><span><%= info.getM_name()%>님의 </span>마이페이지</a></li>
	               <li><a href="Logout">로그아웃</a></li>
               <%} %>
            <%}else{%>
               <li><a href="login.jsp">로그인</a></li>
               <li><a href="join.jsp">회원가입</a></li>
            <%} %>
               <li><a href="review.jsp" target="_blank">여행리뷰</a></li>
			</ul>
		</div>
	</div>
	<header>
		<div onclick="history.back();" class="page_cover"></div><!-- 메뉴 열었을때 뒷배경 -->
		<div class="menu_w">
			<div class="mBtn"></div><!-- 메뉴 열기 -->
			<div id="logo"><a href="./index.jsp">NUBIDA .</a></div>
			<a href="tel:062-000-0000" id="call"></a><!-- 전화걸기 -->
		</div>
		<div id="menu">		
			<div onclick="history.back();" class="mClose"><img src="./img/icon_close.png" alt="" width="100%" /></div><!-- 메뉴 닫기 -->
			<ul>
				<li><a href="list.jsp">추천여행</a>
					<ul>
						<li><a href="list.jsp">걸어서 여행</a></li>
						<li><a href="list.jsp">코스별 여행</a></li>
						<li><a href="list.jsp">자전거 여행</a></li>
					</ul>
				</li>
				<li><a href="list.jsp">관광명소</a>
					<ul>
						<li><a href="list.jsp">지역8경</a></li>
						<li><a href="list.jsp">산/사찰</a></li>
						<li><a href="list.jsp">휴양/레저</a></li>
						<li><a href="list.jsp">기타</a></li>
					</ul>
				</li>
				<li><a href="list.jsp">축제/체험</a>
					<ul>
						<li><a href="list.jsp">축제/행사</a></li>
						<li><a href="list.jsp">체험여행</a></li>
						<li><a href="list.jsp">문화재/역사</a></li>
					</ul>
				</li>
				<li><a href="list.jsp">음식/숙박</a>
					<ul>
						<li><a href="list.jsp">향토음식소개</a></li>
						<li><a href="list.jsp">숙박/민박업소</a></li>
					</ul>
				</li>
				<li><a href="list.jsp">고객센터</a>
					<ul>
						<li><a href="list.jsp">공지사항</a></li>
						<li><a href="list.jsp">제휴문의</a></li>
						<li><a href="list.jsp">자유게시판</a></li>
					</ul>
				</li>
			</ul>
		
		</div>
	</header>
</div>
<script>
	$(".mBtn").click(function() {
	  $("#menu,.page_cover,html").addClass("open");
	  window.location.hash = "#open";
	});

	window.onhashchange = function() {
	  if (location.hash != "#open") {
		$("#menu,.page_cover,html").removeClass("open");
	  }
	};
</script>