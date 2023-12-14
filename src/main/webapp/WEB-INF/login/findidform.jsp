<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
<h1 align="center">아이디 찾기</h1>
<hr>
<br>
<b style="margin-left:650px;">가입시 등록한 정보를 입력하시면 아이디를 알려드립니다</b>
<div style="margin-left: 500px;">
<form action="findid" method="post" enctype="multipart/form-data" onsubmit="return check()">
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
			 
			 <button type="submit" id="btnjoin" style="align:center; width:40vw; height:10vh; 
			 border-radius: 30px; border: 0px; font-size: 20pt; color: white; background-color: lightgray">
			ID찾기
			 </button>
	</form>
</div>
</body>
</html>