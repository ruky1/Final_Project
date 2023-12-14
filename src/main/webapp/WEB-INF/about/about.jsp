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

	#about_menu{
		position: absolute;
		width: 20%;
		margin-left: 5%;
		
	
	}
	#about_main{
		margin-left: 10%;
		
	}
</style>
</head>
<body>
<div id="about_menu">
    <h1><b>고객센터</b></h1>
    <a onclick="fun()">공지사항</a>
    <br>
    자주 묻는 질문
</div>
<div id="about_main">
<jsp:include page="notice.jsp" />
    <c:if test="${someCondition}" var="showNotice">
        <c:choose>
            <c:when test="${showNotice}">
                <jsp:include page="notice.jsp" />
            </c:when>
            <c:otherwise>
                <!-- 다른 처리를 추가하거나 생략할 내용 -->
            </c:otherwise>
        </c:choose>
    </c:if>
</div>

<script type="text/javascript">
    function fun() {
        
    }
</script>
</body>
</html>