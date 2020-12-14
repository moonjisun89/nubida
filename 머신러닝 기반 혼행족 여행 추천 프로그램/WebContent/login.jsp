<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./inc/header.jsp" %>




<div id="sub_contents" class="sc_top">
	<div class="sub_content">
	
	
	
		<div class="sub_title">로그인</div>
		<div id="login">
			<div class="login_w">
			
				<form action="LoginService" method="post">
					<input type="text" class="lg_ip" placeholder="이메일" onclick="this.value='';" name="m_email" />
					<input type="password" class="lg_ip" placeholder="비밀번호" onclick="this.value='';" name="m_pw" />
					<input type="submit" value="로그인" class="login_btn" />
					<div class="login_btm">
						<ul>
							<!--li><a href="">이메일/비밀번호찾기</a></li-->
							<li><a href="index.jsp">메인으로</a></li>
							<li><a href="join.jsp"><span>회원가입</span></a></li>
						</ul>
					</div>
				</form>

			</div>
		</div>



	</div>
</div>




<%@ include file="./inc/footer.jsp" %>