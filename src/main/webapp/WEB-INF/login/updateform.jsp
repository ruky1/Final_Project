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
</style>
</head>
<body>
 <!-- onsubmit return 값이 false면 안넘겨줌 -->
	<div style="margin:100px 500px; width: 40vw; height:100vh;">
		<form action="update" method="post">
			<h1>회원정보수정</h1>
			<br>
			<!--  u_id , u_name ,u_email, u_pass, u_writerdate , u_final_logindate -->
			 <div>
			 <h5>Id</h5>
			 	<div>
			 	<input type="text" name="u_id" class="bottom-border" style="width:40vw; height:4vh;" value="${dto.u_id }" readonly="readonly">
			 	</div>
			 </div>
			 
			 <br><br>
			 
			 <div>
			 <h5>Pass</h5>
			 	<div>
			 	<input type="password" name="u_pass" placeholder="영문,숫자,특수문자 조합 8~16자"
			 	required="required" class="bottom-border" style="width:40vw; height:4vh;" value="${dto.u_pass }">
			 	</div>
			 </div>
			 
			 <br><br>
			 
			 <div>
			 <h5>Name</h5>
			 	<div>
			 	<input type="text" name="u_name" placeholder="이름을 입력해주세요" required="required" class="bottom-border" 
			 	style="width:40vw; height:4vh;" value="${dto.u_name }">
			 	</div>
			 </div>
			 
			 <br><br>
			 
			 <div>
			 <h5>Email</h5>
			 	<div>
			 	<input type="text" name="u_email" placeholder="예)example@gmail.com" required="required" class="bottom-border" 
			 	style="width:40vw; height:4vh;" value="${dto.u_email }">
			 	</div>
			 </div>
			 
			 <br><br>
			 
			 <div>
			 <h5>HP</h5>
			 	<div>
			 		<input type="text" name="u_hp" placeholder="예)010123456789" required="required" class="bottom-border" 
			 		style="width:40vw; height:4vh;" value="${dto.u_hp }">
			 	</div>
			 </div>
			 
			 <br><br>
			 
			 <button type="submit" id="btnjoin" style="align:center; width:40vw; height:10vh; 
			 border-radius: 30px; border: 0px; font-size: 20pt; color: white; background-color: gray">
			 회원정보수정
			 </button>

		</form>
	</div>
</body>
</html>