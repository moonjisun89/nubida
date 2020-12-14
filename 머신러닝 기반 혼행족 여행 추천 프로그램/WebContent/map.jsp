<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�������� �Դϴ�.</title>
<link rel="stylesheet" type="text/css" href="./css/style.css" />
</head>
<body>



<a href="javascript:;" id="kakao-link-btn"><img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_small.png" width="100px" />īī���� �����ϱ�</a>
<div id="map" style="width:100%;height:350px;"></div>




<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c484563ce26d8f401a17e2ffd109c1d6"></script><!-- �ڹٽ�ũ��Ʈ KEY �Է� -->
<script>
	var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
		mapOption = { 
			center: new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
			level: 3 // ������ Ȯ�� ����
		};

	var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
	 
	// ��Ŀ�� ǥ���� ��ġ�� ������ ������ �ִ� ��ü �迭�Դϴ� 
	var positions = [
		{
			content: '<div>īī��</div>', 
			latlng: new kakao.maps.LatLng(33.450705, 126.570677)
		},
		{
			content: '<div>���¿���</div>', 
			latlng: new kakao.maps.LatLng(33.450936, 126.569477)
		},
		{
			content: '<div>�Թ�</div>', 
			latlng: new kakao.maps.LatLng(33.450879, 126.569940)
		},
		{
			content: '<div>�ٸ�����</div>',
			latlng: new kakao.maps.LatLng(33.451393, 126.570738)
		}
	];

	for (var i = 0; i < positions.length; i ++) {
		// ��Ŀ�� �����մϴ�
		var marker = new kakao.maps.Marker({
			map: map, // ��Ŀ�� ǥ���� ����
			position: positions[i].latlng // ��Ŀ�� ��ġ
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

	for (var i = 0; i < positions.length; i ++) {
		// ��Ŀ�� �����մϴ�
		var marker = new kakao.maps.Marker({
			map: map, // ��Ŀ�� ǥ���� ����
			position: positions[i].latlng // ��Ŀ�� ��ġ
		});

		// ��Ŀ�� ǥ���� ���������츦 �����մϴ� 
		var infowindow = new kakao.maps.InfoWindow({
			content: positions[i].content // ���������쿡 ǥ���� ����
		});

		// ��Ŀ�� �̺�Ʈ�� ����ϴ� �Լ� ����� ��� ȣ���Ͽ� Ŭ������ ����ϴ�
		// Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�
		(function(marker, infowindow) {
			// ��Ŀ�� mouseover �̺�Ʈ�� ����ϰ� ���콺 ���� �� ���������츦 ǥ���մϴ� 
			kakao.maps.event.addListener(marker, 'mouseover', function() {
				infowindow.open(map, marker);
			});

			// ��Ŀ�� mouseout �̺�Ʈ�� ����ϰ� ���콺 �ƿ� �� ���������츦 �ݽ��ϴ�
			kakao.maps.event.addListener(marker, 'mouseout', function() {
				infowindow.close();
			});
		})(marker, infowindow);
	}
</script>




<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
  //<![CDATA[
    // // ����� ���� JavaScript Ű�� ������ �ּ���.
    Kakao.init('c484563ce26d8f401a17e2ffd109c1d6');
    // // īī����ũ ��ư�� �����մϴ�. ó�� �ѹ��� ȣ���ϸ� �˴ϴ�.
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
      content: {
        title: document.title,
        /*description: '����, �ַ� �ؽ��±�',*/
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
          title: '������ �������� �̵��մϴ�.',
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