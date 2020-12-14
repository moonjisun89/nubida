<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./inc/header.jsp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.*"%>

<%
	MemberDAO dao2 = new MemberDAO();
	String exp = dao2.expcheck(info.getM_email());
%>

<%
	MemberDTO info1 = (MemberDTO)session.getAttribute("info");

	int level = Integer.parseInt(info1.getExperience());
	String level_icon = "";
	if(level>=0 && level<100){
		level = 1;
		level_icon = "level1";
	} else if(level>=100 && level<300) {
		level = 2;
		level_icon = "level2";
	}  else if(level>=300 && level<500) {
		level = 3;
		level_icon = "level3";
	}  else if(level>=500 && level<700) {
		level = 4;
		level_icon = "level4";
	} else {
		level = 5;
		level_icon = "level5";
	}
%>
<script>
    function plan(){
        var url = "plan.jsp";
        var name = "popup test";
        var option = "width=500, height=400, top=100, left=200, location=no"
        window.open(url, name, option);
    }
</script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
  //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('0d6200f830525610ecb443d0c987a479');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
      content: {
        title: document.title,
        description: '친구에게 NUBIDA 공유하기',
        imageUrl: document.images[0].src,
        link: {
          webUrl: document.location.href,
          mobileWebUrl: document.location.href
        }
      },
      social: {
        likeCount: 286,
        commentCount: 45,
        sharedCount: 845
      },
      buttons: [
        {
          title: 'Open!',
          link: {
            mobileWebUrl: document.location.href,
            webUrl: document.location.href
          }
        }  
      ]
    });
  //]]>
</script>

<div id="sub_contents" class="sc_top">
	<div class="sub_content">
		<div class="sub_title">마이페이지</div>
		<div class="adm_tab">
			<ul>
				<li><a href="mypage.jsp" class="on">여행 정보</a></li>
				<li><a href="modify.jsp">정보수정</a></li>
			</ul>
		</div>

		<div id="mp_top">
			<div class="mp_medal">
				<img src="./img/<%=level_icon%>.png" />
			</div>
			<div class="mp_info">
				<ul>
					<li><b>나의 레벨</b><p><%= level %></p></li>
					<li><b>퀘스트 경험치</b><p><%=exp%></p></li>
					<li><b>나의 여행</b><span>ing...</span></li>
					<li><b>나의 리뷰</b><a href="review.jsp" target="_blank"><p>0</p></a></li>
				</ul>
			</div>
		</div>

		<div class="page">
			<!-- 내용 들어갈 곳 -->

			<div class="mp_box">
				<h4 class="i1"><%=info.getM_name()%>님의 여행정보
				</h4>
				
				<!-- p>여행정보가 없습니다.</p-->
				<div>
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0d6200f830525610ecb443d0c987a479"></script>
					<div id="map" style="width: 100%; height: 350px;"></div>
              		<div class="kakao_share"><a href="newMap.jsp" onclick="window.open(this.href, '_blank', 'width=600, height=460'); return false"><b>카카오톡 공유하기</b><img src="./img/kakao.png" width="100px" /></a></div>					
					
					
					<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
					<script>
<%String email = info.getM_email();%>		
<%PlaceDAO dao = new PlaceDAO();%>

//개인이 설정한 여행코스
<%ArrayList<String> course = dao.course(email);
String[] courses = (course.get(0)).split("-");
int[] course_final = new int[courses.length];

for (int i = 0; i < courses.length; i++) {
	course_final[i] = Integer.parseInt(courses[i]);
}

//추천 여행지
ArrayList<String> suggestion = dao.suggestion(email);

String[] suggestions = (suggestion.get(0)).split("-");
int[] suggestion_final = new int[suggestions.length];

for (int i = 0; i < suggestions.length; i++) {
	suggestion_final[i] = Integer.parseInt(suggestions[i]);
}%>


var mapContainer = document.getElementById('map'), 
	mapOption = { 
    center: new kakao.maps.LatLng(33.376267229828514, 126.54129240670694),
    level: 10 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
	
	<%for (int i = 0; i < course_final.length; i++) {%>
	
	<%String[] locate = dao.locate(course_final[i]);
	String a = locate[0]; // 장소이름
	String b = locate[1]; // 이미지url
	String c = locate[2]; // 장소url
	String d = locate[3]; // 장소tag
	String e = locate[4]; // x좌표
	String f = locate[5]; // y좌표

	if (i != course_final.length - 1) {%> 
		{	
	        content: '<div><%=a%></div>', 
	        latlng: new kakao.maps.LatLng(<%=Double.parseDouble(e)%>,<%=Double.parseDouble(f)%>)
	    },
    <%} else {%>
		{
			content: '<div><%=locate[0]%></div>',
			latlng: new kakao.maps.LatLng(<%=Double.parseDouble(locate[4])%>,<%=Double.parseDouble(locate[5])%>)	
		}
	<%}
}%>
];	

var imageSrc = "https://i.imgur.com/TOQp5TM.png"; 


for (var i = 0; i < positions.length; i ++) {
	
	 // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(35, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커의 위치
        image : markerImage // 마커 이미지 
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}
</script>

				</div>
				<div class="mp_course">
					<ul>
						<%
							for (int i = 0; i < course_final.length; i++) {
							String[] course_locate = dao.locate(course_final[i]);
							String a = course_locate[0];
							String b = course_locate[1];
							String c = course_locate[2];
							String d = course_locate[3];
							String e = course_locate[4];
						%>
						<li><a href="<%=c%>" target="_blank"><div class="img">
									<img src="<%=b%>" />
								</div></a>
						<p><%=a%></p></li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
					<%String [] suggest_list = new String[suggestions.length];
					
							for (int i = 0; i < suggestion_final.length; i++) {
							String[] suggestion_locate = dao.locate(suggestion_final[i]);
							String a = suggestion_locate[0];
							suggest_list[i] = a;
						}
					request.setCharacterEncoding("utf-8"); 
					session.setAttribute("suggest_list",suggest_list); %>
					
			<div class="mp_box">
				<h4 class="i2">내 추천 여행지</h4>
				<form method="post" action="period.jsp">
					<div class="mp_choice" ><input type="submit" value="일정선택하기" onclick="return confirm('일정을 선택하시겠습니까?')"></div>
				</form>				
				<div class="trip_list">
					<ul>
						<%
							for (int i = 0; i < suggestion_final.length; i++) {
							String[] suggestion_locate = dao.locate(suggestion_final[i]);
							String a = suggestion_locate[0];
							String b = suggestion_locate[1];
							String c = suggestion_locate[2];
							String d = suggestion_locate[3];
						%>
						<li><a href="<%=c%>" target="_blank"><div class="img">
									<img src="<%=b%>" alt="" width="100%" />
								</div></a> <b><%=a%></b>
							<div class="tag">
								<i><%=d%></i>
							</div></li>
						<%
							}
						%>
					</ul>

				</div>
			</div>



			<!-- 내용 들어갈 곳 -->
		</div>
	</div>
</div>




<jsp:include page="./inc/footer.jsp" />