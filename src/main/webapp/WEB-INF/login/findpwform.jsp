<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<!-- 비밀번호 찾기 페이지에서의 JavaScript 코드 추가 -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<title>Insert title here</title>
</head>
<style>
.bottom-border{
border-width: 0 0 1px;
}
</style>
<script>
$(document).ready(function () {
    $(".divotp").hide();

    // "인증번호받기" 버튼 클릭 시 호출되는 함수
    $("#getotp").click(function () {
        // 입력된 ID와 HP 값 가져오기
        var userId = $("#u_id").val();
        var userHp = $("#u_hp").val();

        // Ajax를 사용하여 서버에 정보 전송 및 응답 받기
        $.ajax({
            type: "POST",
            url: "/checkuserinfo", // 서버에서 정보 확인하는 URL로 변경해야 함
            data: {
                "u_id": userId,
                "u_hp": userHp,
            },
            dataType: "html",
            success: function (response) {
            	//alert("11");
                // 서버에서의 응답에 따라 인증 번호 입력란 보이기/숨기기
                if (response === "match") {
                    $(".divotp").show();
                } else {
                    $(".divotp").hide();
                }
            }
        });
    });
});
</script>
<body>
<div style="margin:100px 500px; width: 40vw; height:100vh;"  >
	<!-- 아이디, 이름, 메일, 전화번호 입력받기 -->
	<div>
		<form action="findpw" method="post" enctype="multipart/form-data">
		
			<h1>비밀번호 찾기</h1>
			<br>
			 <div>
			 <h5>Id</h5>
			 	<div>
			 	<input type="text" name="u_id" id="u_id" placeholder="id를 입력해주세요" required="required" class="bottom-border" style="width:40vw; height:4vh;">
			 	</div>
			 </div>
			 
			 <br><br>
			 
			 <div>
			 <h5>HP</h5>
			 	<div>
			 		<input type="text" name="u_hp" id="u_hp" placeholder="예)010123456789" required="required" class="bottom-border" style="width:40vw; height:4vh;">
			 	</div>
			 	<button type="button" id="getotp" class="btn btn-primary">인증번호받기</button>
			 </div>
			 
			 <br><br>
				
				<!-- 비밀번호 찾기 페이지의 폼에 인증 번호 입력란 추가 -->
				<div class="divotp">
					<h5>인증 번호</h5>
					<div>
						<input type="text" name="otp" placeholder="인증 번호를 입력하세요"
							required="required" class="bottom-border"
							style="width: 40vw; height: 4vh;">
					</div>
				</div>
				
				<br><br>



			<button type="submit" id="btnfindpw" style="align:center; width:40vw; height:10vh; 
			 border-radius: 30px; border: 0px; font-size: 20pt; color: white; background-color: lightgray">
			 비밀번호 찾기
			 </button>
			 
			 <br><br>
			 
			 
			 
			 
			 
		</form>
	</div>
</div>
</body>
</html>