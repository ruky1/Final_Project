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
<link href="../../css/admin_login.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>

<form action="adminPage_action" method="post" style="margin: 100px 100px;">
<div class="materialContainer">


   <div class="box">

      <div class="title">LOGIN</div>

      <div class="input">
         
         <input type="text" class="form-control" name="a_id" required="required" autofocus="autofocus"
			placeholder="Username" value="${sessionScope.saveok==null?'':sessionScope.myid }">
         <span class="spin"></span>
      </div>

      <div class="input">
         
         <input type="password" class="form-control" name="a_pass" placeholder="Password">
         <span class="spin"></span>
      </div>

      <div class="button login" align="center">
         <button type="submit" class="btn btn-outline-secondary"><span>GO</span> <i class="fa fa-check"></i></button>
      </div>
		

   </div>


   </div>

</form>
</body>
</html>