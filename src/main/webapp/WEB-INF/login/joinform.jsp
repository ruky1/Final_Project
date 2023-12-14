<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style>
.bottom-border{
border-width: 0 0 1px;
}
.passcheck{
color: red;
}
</style>
<script type="text/javascript">
$(function(){
    var checkedbox=false;
    var passwords =false;
    
	//필수약관 누를시
	$("#checkbox1").click(function(){
        if ($(this).prop("checked")) {
        	checkedbox = true;
        	if(passwords) { 
            	
            	//색깔변경
                $("#btnjoin").css("background-color", "gray");
                //체크되면 버튼을 활성화
                $("#btnjoin").prop("disabled", false);
            }
        } else {
        	checkedbox=false;
        		//색변경
            	$("#btnjoin").css("background-color", "lightgray");
                // 체크 해제되면 버튼 비활성화
                   $("#btnjoin").prop("disabled", true);
            
            
        }
    });
    
 // u_pass 입력란 값이 변경될 때마다 호출되는 이벤트 처리
    $("#u_pass").on('input', function() {
        // 비밀번호 입력 값 가져오기
        var password = $(this).val();

        // 비밀번호가 특수문자, 알파벳, 숫자를 각각 1개 이상 포함하는지 검사
        var regex = /^(?=.*[!@#$%^&*(),.?":{}|<>])(?=.*[a-zA-Z])(?=.*\d).{8,16}$/;
    	
        // 비밀번호 길이가 8자 미만인지 체크
        var isLengthShort = password.length < 8;
        
        
        // 비밀번호 길이가 16자를 초과하는지 확인
        var isLengthLong = password.length > 16;
        
         

        if (!isLengthShort && regex.test(password) && !isLengthLong) {
            // 조건에 맞으면 메시지를 양식맞음으로 변경
            $(".passcheck").html("양식과 일치합니다").css("color", "green");
            passwords=true;
            if(checkedbox) { 
            	
            	//색깔변경
                $("#btnjoin").css("background-color", "gray");
                //체크되면 버튼을 활성화
                $("#btnjoin").prop("disabled", false);
            }
         
        } else {
        	passwords=false;
        		
        	//색변경
            	$("#btnjoin").css("background-color", "lightgray");
                // 체크 해제되면 버튼 비활성화
                   $("#btnjoin").prop("disabled", true);
            
            // 조건에 맞지 않으면 메시지를 양식틀림으로 변경
            if (isLengthShort) {
            	
                $(".passcheck").html("비밀번호는 8자 이상이어야 합니다.").css("color", "red");
            } else if (isLengthLong) {
            	
                $(".passcheck").html("비밀번호는 16자를 초과할 수 없습니다.").css("color", "red");
            } else {
            	
                $(".passcheck").html("비밀번호는 특수문자, 알파벳, 숫자가 각각 1개 이상 포함되어야 하며 8자에서 16자 사이여야 합니다.").css("color", "red");
            }
        }
    });
 	

    //잇는거 재가입안되게
    <c:if test="${not empty error}">
        alert("${error}");
    </c:if>
    
   
    
});


//폼 제출 전 체크 함수
	function check() {

		return true; // 조건에 맞으면 제출 허용
	}
</script>
</head>
<body>
 <!-- onsubmit return 값이 false면 안넘겨줌 -->
	<div style="margin:100px 500px; width: 40vw; height:100vh;"  >
		<form action="join" method="post" enctype="multipart/form-data" onsubmit="return check()">
			<h1>회원가입</h1>
			<br>
			<!--  u_id , u_name ,u_email, u_pass, u_writerdate , u_final_logindate -->
			 <div>
			 <h5>Id</h5>
			 	<div>
			 	<input type="text" name="u_id" placeholder="id를 입력해주세요" required="required" class="bottom-border" style="width:40vw; height:4vh;">
			 	</div>
			 </div>
			 
			 <br><br>
			 
			 <div>
			 <h5>Pass</h5>
			 	<div>
			 	<input type="password" name="u_pass" id="u_pass" placeholder="영문,숫자,특수문자 조합 8~16자" required="required" class="bottom-border" style="width:40vw; height:4vh;">
			 	</div>
			 </div>
			 <p class="passcheck"></p>
			 
			 <br>
			 
			 <div>
			 <h5>Name</h5>
			 	<div>
			 	<input type="text" name="u_name" placeholder="이름을 입력해주세요" required="required" class="bottom-border" style="width:40vw; height:4vh;">
			 	</div>
			 </div>
			 
			 <br><br>
			 
			 <div>
			 <h5>Email</h5>
			 	<div>
			 	<input type="text" name="u_email" placeholder="예)example@gmail.com" required="required" class="bottom-border" style="width:40vw; height:4vh;">
			 	</div>
			 </div>
			 
			 <br><br>
			 
			 <div>
			 <h5>HP</h5>
			 	<div>
			 		<input type="text" name="u_hp" placeholder="예)010123456789" required="required" class="bottom-border" style="width:40vw; height:4vh;">
			 	</div>
			 </div>
			 
			 <br><br>
			 
			 <div>
			 	<label>
			 	<input type="checkbox" id="checkbox1">
			 	<span>[필수] 만 14세 이상이며 모두 동의합니다.</span>
			 	</label>
			 	
			 </div>
			 
			 
			 <br>
			 
			 <div>
			 	<label>
			 	<input type="checkbox" id="checkbox2">
			 	<span>[선택] 광고성 정보 수신에 모두 동의합니다.</span>
			 	</label>
			 	
			 </div>
			 
			 <br>
			 
			 <button type="submit" id="btnjoin" style="align:center; width:40vw; height:10vh; 
			 border-radius: 30px; border: 0px; font-size: 20pt; color: white; background-color: lightgray" disabled="disabled">
			 가입하기
			 </button>
			 
			 <br><br>
			 
			 
			 
			 
			 
		</form>
	</div>
</body>
</html>