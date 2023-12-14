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
</head>
<body>
	<h3>판매중 상품</h3>
	<table class="table">
		<tr class="table-info">
		<th>번호</th><th>제목</th><th>아이디</th><th>이름</th><th>가격</th><th>카테고리</th><th>등록일</th>
		</tr>
		<c:forEach var="j_dto" items="${list }" varStatus="i">
                <tr>
                   <td>${i.count }</td>
                    <td> ${j_dto.j_title }</td>
                    <td>${j_dto.member_id }</td>
                    <td>${j_dto.member_name }</td>
                    <td>${j_dto.j_price }</td>
                    <td>${j_dto.j_category }</td>
                    <td><fmt:formatDate value="${j_dto.j_postdate }" pattern="yyyy-MM-dd HH:mm"/></td>
                    
                </tr>
                </c:forEach>
	</table>
</body>
</html>