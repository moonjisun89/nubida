<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./inc/header.jsp" %>




<div id="sub_contents" class="sc_top">
	<div class="sub_content">
		<div class="sub_title">마이페이지</div>
		<div class="adm_tab">
			<ul>
				<li><a href="mypage.jsp">여행 정보</a></li>
				<li><a href="modify.jsp" class="on">정보수정</a></li>
			</ul>
		</div>
		<div class="page">
			<!-- 내용 들어갈 곳 -->



			<form action="JoinUpdate" method="post">
				<div class="tbl">
					<table>
						<tr>
							<th>회원구분</th>
							<td>
								<div class="radio_btn">
									<p><input type="radio" class="rd_ip" name="rank" value="0">일반회원</p>
									<p><input type="radio" class="rd_ip" name="rank" value="1">사업자회원</p>
								</div>
							</td>
						</tr> 
						<tr>
							<th>이름</th>
							<td><%= info.getM_name() %></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><%= info.getM_email() %></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" class="ip01" name="m_pw"></td>
						</tr>
						<tr>
							<th>휴대폰번호</th>
							<td>
								<input type="text" class="ip01" name="m_tel"><br />
								<span>휴대폰번호는 "-" 없이 작성해주세요.</span>
							</td>
						</tr>
						<tr>
							<th>성별</th>
							<td>
								<div class="radio_btn">
									<p><input type="radio" class="rd_ip" name="gender" value="0">여성</p>
									<p><input type="radio" class="rd_ip" name="gender" value="1">남성</p>
								</div>
							</td>
						</tr>
						<tr>
							<th>나이</th>
							<td><input type="text" class="ip02" name="age"><b>세</b></td>
						</tr>
					</table>
					
					<h4>추가정보</h4>
					<strong>아래의 추가정보는 사업자인 분들만 작성해주세요.</strong>
					<table>
						<tr>
							<th>상호명</th>
							<td><input type="text" class="ip01" name="store"></td>
						</tr>	
						<tr>
							<th>업종</th>
							<td><input type="text" class="ip01" name="type"></td>
						</tr>
					</table>
				</div>
	
	
				<div class="btn_w">
					<input type="button" value="회원탈퇴" class="btn2" onClick="location.href='delete.jsp'"/>
					<input type="submit" value="수정하기" class="btn" />
				</div>
			</form>
			

			
			<!-- 내용 들어갈 곳 -->
		</div>
	</div>
</div>




<jsp:include page="./inc/footer.jsp"/>