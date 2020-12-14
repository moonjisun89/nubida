<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>회원탈퇴 확인</title>
<style>
#check_wrap{position:relative;float:left;width:90%;padding:5%;}
#check_wrap h4{margin:0;padding:0;float:left;width:100%;line-height:100%;font-size:28px;font-weight:600;color:#444;padding-bottom:15px;margin-bottom:30px;border-bottom:1px solid #ccc;}
#check_wrap p{float:left;width:100%;line-height:22px;font-size:13px;}
#checkForm{position:relative;float:left;width:100%;margin-bottom:30px;}
input.chk_ip{float:left;width:70%;height:36px;line-height:100%;font-size:14px;padding-left:2%;color:#333;box-sizing:border-box;border:1px solid #ccc;}
input.chk_btn{float:left;width:30%;height:36px;line-height:100%;font-size:14px;text-align:center;color:#fff;background:#555;box-sizing:border-box;border:none;}

</style>
</head>
<body>




<div id="check_wrap">
    <h4>회원탈퇴</h4>
    <div id="chk">
    	
   		<p>아래의 비밀번호를 입력후 탈퇴버튼을 누르면 탈퇴가 완료됩니다.</p>
        <form action="JoinDelete" id="checkForm">
            <input type="text" name="m_email" placeholder="비밀번호입력" onclick="this.value='';" class="chk_ip" />
            <input type="submit" value="회원탈퇴" class="chk_btn" />
        </form>

    </div>
</div>



<script type="text/javascript">
	var httpRequest = null;
	
	// httpRequest 객체 생성
	function getXMLHttpRequest(){
	    var httpRequest = null;
	
	    if(window.ActiveXObject){
	        try{
	            httpRequest = new ActiveXObject("Msxml2.XMLHTTP");    
	        } catch(e) {
	            try{
	                httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
	            } catch (e2) { httpRequest = null; }
	        }
	    }
	    else if(window.XMLHttpRequest){
	        httpRequest = new window.XMLHttpRequest();
	    }
	    return httpRequest;    
	}

	// 이메일 작성 후 중복버튼 눌렀을때 입력받은 값 불러와서 창 띄우기
	function pValue() {
		document.getElementById("m_email").value = opener.document.userInfo.m_email.value;
	}
	
    // 사용하기 클릭 시 부모창으로 값 전달 
    function sendCheckValue(){
        // 회원가입 화면의 m_email input에 값을 전달
        opener.document.userInfo.m_email.value = document.getElementById("m_email").value;
        
        if (opener != null) {
            opener.chkForm = null;
            self.close();
        }    
    }
    
    function emailCheck(){

   	 	// m_email 미작성 시 경고창
        var m_email = document.getElementById("m_email").value;
        if (!m_email) {
            alert("이메일을 입력하지 않았습니다.");
            return false;
        } else {
            var param="m_email="+m_email
            
       	 	// httpRequest 사용시 필수 코드
            httpRequest = getXMLHttpRequest();
            httpRequest.onreadystatechange = callback;
            httpRequest.open("POST", "JoinCheck", true);    
            httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
            httpRequest.send(param);
        }
    }
    
    function callback(){
        if(httpRequest.readyState == 4){
            // 결과값을 가져온다.
            var resultText = httpRequest.responseText;
            
        	// JoinCheck.java의 if문의 결과를 가져옴.
            if(resultText == 1){
                document.getElementById("cancelBtn").style.visibility='hidden';				// 취소 버튼
                document.getElementById("useBtn").style.visibility='visible';				// 사용하기 버튼
                document.getElementById("msg").innerHTML = "사용할 수 있는 이메일주소 입니다.";
            } else if (resultText == 0){ 
                document.getElementById("cancelBtn").style.visibility='visible'; 			// 취소 버튼
                document.getElementById("useBtn").style.visibility='hidden'; 				// 사용하기 버튼
                document.getElementById("msg").innerHTML = "이미 사용중인 이메일주소 입니다.";
            }
        }
    }
</script>
</body>
</html>