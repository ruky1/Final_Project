<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
 <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
 <!-- 
 Expires
 리소스가 validate 하지 않다고 판단할 시간을 설정함
 유효하지 않은 날짜 포맷(0)과 같은 경우 리소스가 만료 되었음을 의미함.
 Ex) Expires: Wed, 21 Oct 2015 07:28:00 GMT
 -->
 <meta http-equiv="Expires" content="0">
 <!-- 
 HTTP 1.0 버전에서 HTTP 1.1의 Cache-Control 헤더와 같은 역할을 함
 Ex) Pragma: no-cache
 -->
 <meta http-equiv="Pragma" content="no-cache">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style type="text/css">
	.main{
		margin-top: 100px;
		margin-left: 350px;
	}
</style>
<title>admin_layout</title>
</head>
<body>
	<%
	
		String a_id=(String)session.getAttribute("a_id");
		String a_name=(String)session.getAttribute("a_name");
		
		if(a_id==null||a_name==null){
	%>
		    <script>
		        // JavaScript를 사용하여 이전 페이지로 리다이렉트
		      
		        	/* history.back(); */
		        	location.href="/fail_a_id";
		       
		    </script>
	<%
		}
	%>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

	<div class="admin_layout">
		<div class="main" >
			<tiles:insertAttribute name="main" />
		</div>
		<div class="menu" >
			<tiles:insertAttribute name="menu" />
		</div>
	</div>
<script type="text/javascript">
	
</script>
</body>
</html>