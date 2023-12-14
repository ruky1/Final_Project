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
<script type="text/javascript">
	$(function(){
		//하트누르면 1증가 및 db에 좋아요 여부 저장
	    $(document).on ("click","i.interest", function(event){
	    	var currentColor = $(this).css("color");
	    	

	    	var num = $(this).attr('num');
	    	
	    	//var i_id = $("#myid").val();
	    	
	    	var interest = $(this);
			var i_id = $("#i_id").val();

	    	if (currentColor === "rgb(255, 0, 0)") {
	             // 현재 색상이 빨간색인 경우 검은색으로 변경합니다.
	             $(this).css("color", "black");
	             $.ajax({
	               type: "get",
	               dataType:"html",
	               url: "/interest/delete",
	               data: {"i_id":i_id, "i_sangpum":num},
	               success: function(data) {
	                console.log("좋아요취소");
	               }
	             });
	             
	             $.ajax({
	             	   type:"get",
	             	   dataType:"json",
	             	   url:"/sangpum/minusInterest",
	             	   data:{"num":num},
	             	   success:function(res){
	             		  interest.text(res.mInterest);
	             		       		   
	             	   }
	                });
	             
	             
	         }
	    });
	});
</script>
<style type="text/css">
	#alllikesangpum{
		padding: 50px 50px 50px 50px;
	}
	.likesangpum{
		display: inline-block;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	.sangpuminfo{
		display: inline-block;
		width: 200px;
		height: 130px;
		padding-left: 10px;
	}
</style>
</head>
<body>

	<div id="alllikesangpum">
		<h2>관심상품</h2>
		<hr>
		<input type="hidden" value="${sessionScope.myid }" id="i_id">
		<c:if test="${likescnt == 0}">
			<b>등록된 상품이 없습니다.</b>
		</c:if>
		<c:forEach var="dto" items="${list }" varStatus="i">
			<div class="likesangpum">
				<img src="../img/${dto.sangimg }" style="width: 130px; height: 130px; cursor: pointer;" 
				onclick="location.href='/sangpum/detail?num=${dto.j_sangid}'">
				<div class="sangpuminfo">
					<b>${dto.j_title }</b><br>
					<fmt:formatNumber value="${dto.j_price }" type="currency"/><br>
					<i class="bi bi-heart-fill interest" style="color:red" num="${dto.j_sangid}">${dto.j_interest }</i>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>