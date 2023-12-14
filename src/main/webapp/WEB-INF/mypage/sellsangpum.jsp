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
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#allsellsangpum{
		padding: 50px 50px 50px 50px;
	}
	.sellsangpum{
		display: inline-block;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	.sangpuminfo{
		display: inline-block;
		width: 200px;
		height: 130px;
		padding-left: 10px;
		padding-top: 50px;
	}
</style>
</head>
<body>

	<div id="allsellsangpum">
		<h2>판매중</h2>
		<hr>
		<input type="hidden" value="${sessionScope.myid }" id="i_id">
		<c:if test="${count == 0}">
			<b>등록된 상품이 없습니다.</b>
		</c:if>
		<c:forEach var="dto" items="${list }" varStatus="i">
			<div class="sellsangpum">
				<img src="../img/${dto.sangimg }" style="width: 130px; height: 130px; cursor: pointer;" 
				onclick="location.href='/sangpum/detail?num=${dto.j_sangid}'">
				<div class="sangpuminfo">
					<b>${dto.j_title }</b><br>
					<fmt:formatNumber value="${dto.j_price }" type="currency"/><br>
					<span>등록일자 : <fmt:formatDate value="${dto.j_postdate }" pattern="yyyy.MM.dd"/></span>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>