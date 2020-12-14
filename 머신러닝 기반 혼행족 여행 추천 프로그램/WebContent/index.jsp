<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./inc/header.jsp" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.model.*"%>
<% 
	PlaceDAO dao = new PlaceDAO();
	ArrayList<String> mlocate = dao.main_locate();
%>    

<div id="video">
	<div class="main_ment">
		<b class="typing-txt">내 취향대로 추천해주는 <span>누비다.</span></b>
		<b class="typing"></b> 
      <script id="rendered-js" >
		var typingBool = false;
		var typingIdx = 0;
		var typingTxt = $(".typing-txt").text(); // 타이핑될 텍스트를 가져온다 
		typingTxt = typingTxt.split(""); // 한글자씩 자른다. 
		if (typingBool == false) {// 타이핑이 진행되지 않았다면 
		  typingBool = true;
		
		  var tyInt = setInterval(typing, 100); // 반복동작 
		}
		
		function typing() {
		  if (typingIdx < typingTxt.length) {// 타이핑될 텍스트 길이만큼 반복 
		    $(".typing").append(typingTxt[typingIdx]); // 한글자씩 이어준다. 
		    typingIdx++;
		  } else {
		    clearInterval(tyInt); //끝나면 반복종료 
		  }
		}
    </script>

  
		
		<p>여행은 가고싶은데 어디로 떠나야 할지 고민되시나요?<br />지금 바로 누비다를 통해 여행을 떠나보세요.</p>
		<div class="main_btn">
			<a href="favorite.jsp" class="mbtn1">내 여행 취향은?</a>
			<a href="list.jsp" class="mbtn2">추천여행 보기</a>
		</div>
	</div>
	<div class="video-background">
		<div id="video-img"><img src="./img/main3.jpg" /></div>
	    <div class="video-foreground">
			<!-- iframe width="100%" height="100%" src="https://www.youtube.com/embed/Rqf2yIeT_Yw?autoplay=1;amp;start=15;amp;mute=1;amp;loop=1;start=10" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe-->
			<iframe src="https://player.vimeo.com/video/70513736?autoplay=1&loop=1&title=0&background=1&byline=0&portrait=0" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>
	    </div>
	</div>
</div>


<div id="contents">
	<div class="icon_bar">
		<ul>
		<%int k=0;%>
		<%for(int i=0; i<8; i++){%>
			<li><a href="<%=mlocate.get(k+2)%>" target="_blank"><img src="./img/icon_list<%= i %>.png" alt="" width="100%"/><p><%=mlocate.get(k)%></p></a></li>
			<%k+=4;%>
		<%} %>
		</ul>
	</div>


	 <div class="wrap">
		<div id="performance">
			<div class="arrow_rolling">
				<div class="layout">
					<ul class="main-banner">
					<%int j=0;%>
					<%for(int i=0;i<20;i++){%>
						<li><a href="<%=mlocate.get(j+2)%>" target="_blank"><img src="<%=mlocate.get(j+1)%>" alt="" width="100%"/></a>
							<b><%=mlocate.get(j)%></b>
							<div class="tag"><i><%=mlocate.get(j+3)%></i></div>
						</li>
					<%j+=4;%>
					<%} %>
					</ul>
				</div>
			</div>
		</div>
	</div>
 	

	<div id="banner">
		<div class="banner_w">
			<div class="bn1"><a href="https://www.visitjeju.net/kr/detail/list?menuId=DOM_000001718001000000&cate1cd=cate0000000002&isCate1=y&cate2cd=cate0000000009#p1&region2cd&pageSize=6&sortListType=reviewcnt&viewType=thumb#" target="_blank"><h5>#자연</h5><img src="./img/img_list1.jpg" /><p>비자림은 세계적인 비자나무 숲 중 하나로 최소 500년부터 최대 900년의 수명을 가진 비자나무로 이루어져 있다.</p></a></div>
			<div class="bn2"><a href="https://www.visitjeju.net/kr/detail/list?menuId=DOM_000001718001000000&cate1cd=cate0000000002&isCate1=y&cate2cd=cate0000000010#p1&region2cd&pageSize=6&sortListType=reviewcnt&viewType=thumb##" target="_blank"><h5>#문화</h5><img src="./img/img_list2.jpg" /></a></div>
			<div class="bn2"><a href="https://www.visitjeju.net/kr/detail/list?menuId=DOM_000001718001000000&cate1cd=cate0000000002&isCate1=y&cate2cd=cate0000000011#p1&region2cd&pageSize=6&sortListType=reviewcnt&viewType=thumb###" target="_blank"><h5>#체험</h5><img src="./img/img_list4.jpg" /></a></div>
			<div class="bn2"><a href="https://www.visitjeju.net/kr/detail/list?menuId=DOM_000001718001000000&cate1cd=cate0000000002&isCate1=y&cate2cd=cate0000001251#p1&region2cd&pageSize=6&sortListType=reviewcnt&viewType=thumb####" target="_blank"><h5>#테마</h5><img src="./img/img_list3.jpg" /></a></div>
			<div class="bn2"><a href="https://www.visitjeju.net/kr/detail/list?menuId=DOM_000001718001000000&cate1cd=cate0000000002&isCate1=y&cate2cd=cate0000001257#p1&region2cd&pageSize=6&sortListType=reviewcnt&viewType=thumb#####" target="_blank"><h5>#섬</h5><img src="./img/img_list5.jpg" /></a></div>
			<div class="bn2"><a href="https://www.visitjeju.net/kr/detail/list?menuId=DOM_000001718001000000&cate1cd=cate0000000002&isCate1=y&cate2cd=cate0000001320#p1&region2cd&pageSize=6&sortListType=reviewcnt&viewType=thumb######" target="_blank"><h5>#트래킹</h5><img src="./img/img_list6.jpg" /></a></div>
			<div class="bn2"><a href="https://www.visitjeju.net/kr/detail/list?menuId=DOM_000001718001000000&cate1cd=cate0000000002&isCate1=y&cate2cd=cate0000001372#p1&region2cd&pageSize=6&sortListType=reviewcnt&viewType=thumb#######" target="_blank"><h5>#포토존</h5><img src="./img/img_list1.jpg" /></a></div>
			<div class="bn2"><a href="https://www.visitjeju.net/kr/detail/list?menuId=DOM_000001718001000000&cate1cd=cate0000000002&isCate1=y&cate2cd=cate0000001372#p1&region2cd&pageSize=6&sortListType=reviewcnt&viewType=thumb#########" target="_blank"><h5>#사찰</h5><img src="./img/img_list4.jpg" /></a></div>
			<div class="bn2"><a href="https://www.visitjeju.net/kr/detail/list?menuId=DOM_000001718001000000&cate1cd=cate0000000002&isCate1=y&cate2cd=cate0000001384#p1&region2cd&pageSize=6&sortListType=reviewcnt&viewType=thumb##########" target="_blank"><h5>#웰빙</h5><img src="./img/img_list3.jpg" /></a></div>
		</div>
	</div>

	<div id="trip_banner">
		<div class="w1200">
			<div class="trip_bn1">
				<h4>여행리뷰</h4>
				<ul class="review_list">
					<li><a href="http://15.164.252.2/question/detail/7/" target="_blank"><img src="./img/img_list3.jpg" alt="" /><div class="rv_w"><b>돈까스말고 ○○ 먹으...</b><p>코로나19 확산 속에서도 건재한 근황을 보여주고 있는 제주도 돈까스 맛집 '연돈'...</p></div></a></li>
					<li><a href="http://15.164.252.2/question/detail/6/" target="_blank"><img src="./img/img_list1.jpg" alt="" /><div class="rv_w"><b>뚱이가 꼭 가보고 싶은...</b><p>모슬포항 인근에 위치한 와토카페. 가파도나 마라도로 가는 배를 타러 모슬포항...</p></div></a></li>
					<li><a href="http://15.164.252.2/question/detail/5/" target="_blank"><img src="./img/img_list4.jpg" alt="" /><div class="rv_w"><b>애월 돌크림빵, 현무...</b><p>애월 기념품? 애월 돌크림빵, 현무암 하카롱(제주 마카롱) 등...</p></div></a></li>
					<li><a href="http://15.164.252.2/question/detail/4/" target="_blank"><img src="./img/img_list5.jpg" alt="" /><div class="rv_w"><b>제주도에서 갈치는 먹...</b><p>갈치가 많이 잡히는 9~10월부터 맛이들기 시작하는 갈치는 겨울이되면 그 맛이...</p></div></a></li>
					<li><a href="http://15.164.252.2/question/detail/1/" target="_blank"><img src="./img/img_list6.jpg" alt="" /><div class="rv_w"><b>제주여행 2박3일 먹부...</b><p>친구들과 제주도여행에서의 즐거움 중 하나는 역시 다양하고 맛나는 제주 음식들...</p></div></a></li>
					<li><a href="http://15.164.252.2/question/detail/8/" target="_blank"><img src="./img/img_list2.jpg" alt="" /><div class="rv_w"><b>4박5일 제주 여행일지</b><p>꼭 봐야할 여행지 때문에 여행기간이 다소 길어졌습니다.  이번 여행은 제주도에서...</p></div></a></li>
				</ul>
				<a href="" class="more">MORE +</a>
			</div>
			<div class="trip_bn2">
				<h4>공지사항</h4>
				<ul class="board_list">
					<li><a href="">제주여행지킴이 서비스 일시 중단 안내</a><span>2020-09-28</span></li>
					<li><a href="">코로나 19 확산 차단을 위한 마스크 착용 의무화 행정조치계획 고시</a><span>2020-09-12</span></li>
					<li><a href="">[여행정보변동] 도내 공공시설 35곳 시범개방 안내(6.18~)</a><span>2020-08-28</span></li>
					<li><a href="">[긴급알림] 제주특별자치도 무사증입국불허국가 및 체류지역확대허가 국가</a><span>2020-07-30</span></li>
					<li><a href="">한라산 탐방예약제(성판악, 관음사 코스) 시범실시 안내</a><span>2020-07-22</span></li>
					<li><a href="">누비다 서버 점검 및 업데이트</a><span>2020-06-07</span></li>
					<li><a href="">개인정보 처리방침 개정알림</a><span>2020-05-31</span></li>
					<li><a href="">2019년 상반기 제주특별자치도 우수관광사업체 공모</a><span>2020-03-01</span></li>
					<li><a href="">누비다 업체등록 안내</a><span>2020-01-20</span></li>
					<li><a href="">제주여행지킴이 서비스 실시 안내</a><span>2020-01-16</span></li>
				</ul>
				<a href="" class="more">MORE +</a>
			</div>
		</div>
	</div>

	<div id="main_info">
	</div>
</div>



<%@ include file="./inc/footer.jsp" %>
