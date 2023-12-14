<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.bottom-border{
border-width: 0 0 1px;
}
</style>
<script>
$(document).ready(function () {
    

   
    $("#btnsc").click(function () {
        // 입력된 ID와 HP 값 가져오기
        var pass1 = $("#pass1").val();
        var pass2 = $("#pass2").val();
        var u_id=$("#u_id").val();
      

        $.ajax({
            type: "POST",
            url: "/pwupdate", 
            data: {
                "pass1": pass1,
                "pass2": pass2,
                "u_id" :u_id
                
            },
            dataType: "html",
            success: function (res) {
            	if(res=="success"){
            		//alert("성공");
            		location.href="/loginform"
            	}else{
            		alert("실패");
            		
            	}

            }
        });
    });
});
</script>
<body>
<div style="margin:100px 500px; width: 40vw; height:100vh;"  >

<form action="pwupdate" method="post">
	<input type="hidden" id="u_id" name="u_id" value="${u_id }">
	<div>
	<h4>새로운 비밀번호를 입력해주세요</h4>
	<input type="text" id="pass1" name="pass1" placeholder="영문,숫자,특수문자 조합 8~16자" required="required" class="bottom-border" style="width:40vw; height:4vh;">
	</div>
	
	<br><br>
	
	<div>
	<h4>비밀번호 재입력해주세요</h4>
	<input type="text" id="pass2" name="pass2" placeholder="영문,숫자,특수문자 조합 8~16자" required="required" class="bottom-border" style="width:40vw; height:4vh;">
	</div>
	
	<br><br>
	
	<button type="button" id="btnsc" class="btn btn-outline-primary">비밀번호 수정하기</button>
	</form>
</div>
</body>
</html>