<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>일정 만들기</title>
<style>
#plan{position:relative;float:left;width:100%;text-align:center;}
.plan_w{position:relative;float:left;width:76%;padding:10px 12%;background:#eee;margin-bottom:2px;}
.plan_w strong{float:left;width:90px;line-height:32px;font-weight:300;font-size:14px;text-align:left;}
.plan_w select.psc{float:left;width:220px;height:32px;line-height:100%;font-size:13px;font-weight:300;padding:0 8px;border:1px solid #ccc;margin-right:30px;}
.calendar{position:relative;float:left;margin-right:30px;}
.calendar input{float:left;width:170px;height:30px;line-height:100%;font-size:13px;font-weight:300;padding-left:12px;border:1px solid #ccc;}
img.ui-datepicker-trigger{float:left;width:32px;height:32px;background:#ccc;}
input.plan_btn{display:inline-block;width:180px;height:50px;font-size:20px;font-weight:500;text-align:center;color:#fff;border:none;background:#0277bc;cursor:pointer;margin-top:30px;}

</style>
</head>
<body>


<link rel="stylesheet" type="text/css" href="./css/jquery-ui.css">
<script src="./js/jquery-1.12.4.js"></script>
<script src="./js/jquery-ui.js"></script>
<script src="./js/datepicker-ko.js"></script>
<script type="text/javascript">
	$(function(){
		$("#date2").datepicker({
			showOn: "both",
			buttonImage: "img/plan_calendar.png",
			buttonImageOnly: true,
			buttonText: "Select date"
		});
		
		$("#date3").datepicker({
			showOn: "both",
			buttonImage: "img/plan_calendar.png",
			buttonImageOnly: true,
			buttonText: "Select date"
		});
	});
</script>


<!-- name값의 date2, date3를 servlet으로 보낸 후 DB의 일정 table에 넣음 -->
<!-- 날짜 입력받을때 현재 로그인 된 사용자의 N_NUM을 받아서 N_MEMBER TABLE의 N_NUM을 조회해서 저장함 -->
<form>
	<div id="plan">
		<div class="plan_w">
			<div class="calendar"><strong>출발일 선택</strong><input type="text" name="date2" id="date2" placeholder="출발일 선택" size="12" /></div>
			<div class="calendar"><strong>도착일 선택</strong><input type="text" name="date3" id="date3" placeholder="도착일 선택" size="12" /></div>
		</div>
		<div class="plan_w">
			<strong>출발지 선택</strong>
			<select class="psc">
				<option>출발지 1</option>
				<option>출발지 2</option>
				<option>출발지 3</option>
			</select>
			<strong>도착지 선택</strong>
			<select class="psc">
				<option>출발지 1</option>
				<option>출발지 2</option>
				<option>출발지 3</option>
			</select>
		</div>
		<div class="plan_w">
			<strong>추천 숙소</strong>
			<select class="psc">
				<option>숙소 1</option>
				<option>숙소 2</option>
				<option>숙소 3</option>
			</select>
			<strong>전체 숙소</strong>
			<select class="psc">
				<option>숙소 1</option>
				<option>숙소 2</option>
				<option>숙소 3</option>
			</select>
		</div>
		<input type="submit" value="일정 만들기" class="plan_btn" />
	</div>
</form>



</body>
</html>