<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.*"%>
<%@page import="com.model.MemberDTO"%>
<%MemberDTO info = (MemberDTO)session.getAttribute("info");%>

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
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>īī���� �����ϱ�</title>
<link rel="stylesheet" type="text/css" href="./css/style.css" />
</head>
<body>


<div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0d6200f830525610ecb443d0c987a479"></script>
	<div id="map" style="width: 100%; height: 350px;"></div>
	<script>
<%String email = info.getM_email();%>		
<%PlaceDAO dao = new PlaceDAO();%>

//������ ������ �����ڽ�
<%ArrayList<String> course = dao.course(email);
String[] courses = (course.get(0)).split("-");
int[] course_final = new int[courses.length];

for (int i = 0; i < courses.length; i++) {
	course_final[i] = Integer.parseInt(courses[i]);
}

//��õ ������
ArrayList<String> suggestion = dao.suggestion(email);

String[] suggestions = (suggestion.get(0)).split("-");
int[] suggestion_final = new int[suggestions.length];

for (int i = 0; i < suggestions.length; i++) {
	suggestion_final[i] = Integer.parseInt(suggestions[i]);
}%>

var mapContainer = document.getElementById('map'), 
	mapOption = { 
    center: new kakao.maps.LatLng(33.376267229828514, 126.54129240670694),
    level: 10 // ������ Ȯ�� ����
};

var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
 
//��Ŀ�� ǥ���� ��ġ�� ������ ������ �ִ� ��ü �迭�Դϴ� 
var positions = [
	
	<%for (int i = 0; i < course_final.length; i++) {%>
	
	<%String[] locate = dao.locate(course_final[i]);
	String a = locate[0]; // ����̸�
	String b = locate[1]; // �̹���url
	String c = locate[2]; // ���url
	String d = locate[3]; // ���tag
	String e = locate[4]; // x��ǥ
	String f = locate[5]; // y��ǥ

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
	
	 // ��Ŀ �̹����� �̹��� ũ�� �Դϴ�
    var imageSize = new kakao.maps.Size(35, 35); 
    
    // ��Ŀ �̹����� �����մϴ�    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // ��Ŀ�� �����մϴ�
    var marker = new kakao.maps.Marker({
        map: map, // ��Ŀ�� ǥ���� ����
        position: positions[i].latlng, // ��Ŀ�� ��ġ
        image : markerImage // ��Ŀ �̹��� 
    });

    // ��Ŀ�� ǥ���� ���������츦 �����մϴ� 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // ���������쿡 ǥ���� ����
    });

    // ��Ŀ�� mouseover �̺�Ʈ�� mouseout �̺�Ʈ�� ����մϴ�
    // �̺�Ʈ �����ʷδ� Ŭ������ ����� ����մϴ� 
    // for������ Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

// ���������츦 ǥ���ϴ� Ŭ������ ����� �Լ��Դϴ� 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// ���������츦 �ݴ� Ŭ������ ����� �Լ��Դϴ� 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}
</script>

				</div>
			</div>
			<div class="kakao_share"><a href="javascript:;" id="kakao-link-btn"><b>īī�������� �� ������ �����ϱ�</b><img src="./img/kakao.png" /></a></div>
			
			
			
			
			
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
  //<![CDATA[
    // // ����� ���� JavaScript Ű�� ������ �ּ���.
    Kakao.init('0d6200f830525610ecb443d0c987a479');
    // // īī����ũ ��ư�� �����մϴ�. ó�� �ѹ��� ȣ���ϸ� �˴ϴ�.
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
      content: {
        title: document.title,
        description: 'ģ������ NUBIDA �����ϱ�',
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
</body>
</html>