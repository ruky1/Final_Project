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

	<h3>회원목록</h3>
	<table class="table">
		<tr class="table-danger">
		<th>번호</th><th>이름</th><th >아이디</th><th>이메일</th><th>마지막로그인</th><th>등록일</th><th>수정/삭제</th>
		</tr>
		<c:forEach var="u_dto" items="${list }" varStatus="i">
                <tr>
                    <td>${i.count }</td>
                    <td> ${u_dto.u_name }</td>
                    <%-- <jsp:include page="user_detail.jsp">
						<jsp:param value="${u_dto.u_id }" name="u_id"/>
						<jsp:param value="${u_dto.u_pass }" name="u_pass"/>
					</jsp:include> --%>
                    <td>${u_dto.u_id }</td>
                    <td>${u_dto.u_email }</td>
                    <td><fmt:formatDate value="${u_dto.u_writerdate }" pattern="yyyy-MM-dd HH:mm"/></td>
                    <td><fmt:formatDate value="${u_dto.u_final_logindate }" pattern="yyyy-MM-dd HH:mm"/></td>
                    <td align="center">
					<jsp:include page="user_correction.jsp">
						<jsp:param value="${n_dto.n_num }" name="num"/>
					</jsp:include>
						<c:choose>
						    <c:when test="${a_write eq 2}">
						        <button type="button" class="u_del btn btn-outline-danger" num="${u_dto.u_id}">삭제</button>
						    </c:when>
						    <c:otherwise>
						        <!-- ${a_write}가 2와 같지 않은 경우에 실행할 내용 -->
						        <!-- 예를 들어 다른 버튼 또는 메시지를 표시할 수 있습니다. -->
						        <h>권한이없습니다</h>
						    </c:otherwise>
						</c:choose>
					</td>
                </tr>
                </c:forEach>
	</table>
	<script type="text/javascript">
	
	$(".u_del").click(function(){
		var num=$(this).attr("num");
		 var isConfirmed = confirm("삭제하시겠습니까?");
		if(isConfirmed){
			location.href="user_delete?num="+num;
		}
		
	});
</script>
</body>
</html>