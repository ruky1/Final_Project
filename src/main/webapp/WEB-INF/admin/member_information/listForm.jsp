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
<h3>잠금회원 목록</h3>
  <table class="table">
                
                <tr align="center" class="table-warning">
                    <th>num</th>
                    <th>id</th>
                    <th>name</th>
                    <th>email</th>
                    <th>pass</th>
                    <th>Lock</th>
                </tr>
                
                
                <c:forEach var="ldto" items="${list }" varStatus="i">
                <tr align="center">
                    <td>${i.count }</td>
                    <td>${ldto.u_id }</td>
                    <td>${ldto.u_name }</td>
                    <td>${ldto.u_email }</td>
                    <td>${ldto.u_pass }</td>
                  	
					<td align="center">
					
					
					<button type="button" class="btn btn-outline-warning" onclick="location.href='../failreset?u_id=${ldto.u_id}'">잠금해제</button>
					</td>
                </tr>
                </c:forEach>
               
            </table>
            
  
	
</body>
</html>