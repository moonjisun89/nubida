<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./inc/header.jsp" %>




<div id="sub_contents" class="sc_top">
	<div class="sub_content">


		<div class="sub_title">회원탈퇴</div>
		<div id="login">
			<div class="login_w">
			
				<form action="JoinDelete" method="post">
					<input type="text" class="lg_ip" placeholder="이메일" name="m_email" />
					<input type="password" class="lg_ip" placeholder="비밀번호" name="m_pw" />
					<input type="submit" value="회원탈퇴" class="login_btn" />
				</form>

			</div>
		</div>



	</div>
</div>




<%@ include file="./inc/footer.jsp" %>