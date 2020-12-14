<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>여행지도 입니다.</title>
<link rel="stylesheet" type="text/css" href="./css/style.css" />
</head>
<body>



<a href="javascript:;" id="kakao-link-btn"><img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_small.png" width="100px" />카카오톡 공유하기</a>
<div id="map" style="width:100%;height:350px;"></div>




<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c484563ce26d8f401a17e2ffd109c1d6"></script><!-- 자바스크립트 KEY 입력 -->
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = { 
			center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	 
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions = [
		{
			content: '<div>카카오</div>', 
			latlng: new kakao.maps.LatLng(33.450705, 126.570677)
		},
		{
			content: '<div>생태연못</div>', 
			latlng: new kakao.maps.LatLng(33.450936, 126.569477)
		},
		{
			content: '<div>텃밭</div>', 
			latlng: new kakao.maps.LatLng(33.450879, 126.569940)
		},
		{
			content: '<div>근린공원</div>',
			latlng: new kakao.maps.LatLng(33.451393, 126.570738)
		}
	];

	for (var i = 0; i < positions.length; i ++) {
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map: map, // 마커를 표시할 지도
			position: positions[i].latlng // 마커의 위치
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

	for (var i = 0; i < positions.length; i ++) {
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map: map, // 마커를 표시할 지도
			position: positions[i].latlng // 마커의 위치
		});

		// 마커에 표시할 인포윈도우를 생성합니다 
		var infowindow = new kakao.maps.InfoWindow({
			content: positions[i].content // 인포윈도우에 표시할 내용
		});

		// 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
		// 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		(function(marker, infowindow) {
			// 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
			kakao.maps.event.addListener(marker, 'mouseover', function() {
				infowindow.open(map, marker);
			});

			// 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
			kakao.maps.event.addListener(marker, 'mouseout', function() {
				infowindow.close();
			});
		})(marker, infowindow);
	}
</script>




<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
  //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('c484563ce26d8f401a17e2ffd109c1d6');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
      content: {
        title: document.title,
        /*description: '내용, 주로 해시태그',*/
        imageUrl: document.images[0].src,
        link: {
          webUrl: document.location.href,
          mobileWebUrl: document.location.href
        }
      },
      /*social: {
        likeCount: 286,
        commentCount: 45,
        sharedCount: 845
      },*/
      buttons: [
        {
          title: '공유한 페이지로 이동합니다.',
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