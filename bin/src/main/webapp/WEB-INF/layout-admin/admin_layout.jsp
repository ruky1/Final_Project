<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>admin_layout</title>
<<<<<<< HEAD

</head>
<body>




=======
</head>
<body>

>>>>>>> 9cb86d5c2071f06dd7f871fea0f3eb25a6d9f4a3
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

	<div class="admin_layout">
		<div class="main" >
			<tiles:insertAttribute name="main" />
		</div>
<<<<<<< HEAD
		<%-- <div class="menu" >
			<tiles:insertAttribute name="menu" />
		</div> --%>
=======
		<div class="menu" >
			<tiles:insertAttribute name="menu" />
		</div>
>>>>>>> 9cb86d5c2071f06dd7f871fea0f3eb25a6d9f4a3
	</div>

</body>
</html>