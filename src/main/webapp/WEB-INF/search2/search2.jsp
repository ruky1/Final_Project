<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=
   Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
   $(function(){
      $("#search").keyup(function(e){
         
         var search=$(this).val();
         //alert(search);
         
         //검색창에 검색어 입력시 다른 div hide
         if($("#search").val() != ""){
       	  $("#recent").hide();
       	  $("#bestsearchword").hide();
         }
         else{
       	  $("#recent").show();
       	  $("#bestsearchword").show();
         }
         
         $.ajax({
            type:"get",
            dataType:"json",
            url:"/search/result",
            data:{"search":search},
            success:function(res){
               var s="";
               
               $.each(res,function(i,dto){
                   s+="<div class='eachdiv'>"
                   s+="<b onclick='selectSearch()' class='searchResult'>"+dto+"</b><br>"
                   s+="</div>"
                });
               
               if(search==""){
                  $("#result").html("");
               }
               else{
                  $("#result").html(s);
               }
            }
         });
      });

      $("#search").keypress(function(e){
         //검색어 입력 후 엔터키 입력하면 조회버튼 클릭
         if(e.keyCode && e.keyCode == 13){
            $("#btnsearch").trigger("click");
            return false;
         }
         //엔터키 막기
         if(e.keyCode && e.keyCode == 13){
              e.preventDefault();
         }
      });
      
      $("#btnsearch").click(function(){
         //alert("이벤트 감지");
         var searchword=$("#search").val();
         var s_id=$("#btnsearch").val();
         
          

         location.href="search/main?search="+searchword+"&s_id="+s_id

      });
      
      //최근 검색어 삭제
      $(".recentdelete").click(function(){
    	 var s_num = $(".searchsavenum").val();
    	 
    	 $.ajax({
    		 type:"get",
             dataType:"html",
             url:"/search/delete",
             data:{"s_num":s_num},
             success:function(){
            	 //alert("성공!");
            	 location.reload();
             }
    	 });
      });
      
      //최근 검색어 모두 삭제
      $("#allrecentdelete").click(function(){
    	 var s_id = $("#btnsearch").val();
    	 //alert(s_id);
    	 
    	 $.ajax({
    		 type:"get",
             dataType:"html",
             url:"/search/alldelete",
             data:{"s_id":s_id},
             success:function(){
            	//alert("성공!");
            	location.reload();
             }
    	 });
      });
      
   });
   
	// 방향키 이벤트
   var selectedIndex = -1; // 초기 선택 인덱스
     document.addEventListener('keydown', function(event) {
        switch(event.key) {
           case 'ArrowUp':
              // 위쪽 방향키 눌렸을 때의 동작
              if (selectedIndex > 0) {
                 // 이전 선택 취소
                 $(".searchResult:eq(" + selectedIndex + ")").css("background-color", "white");
                 // 현재 선택
                 selectedIndex--;
                 $(".searchResult:eq(" + selectedIndex + ")").css("background-color", "lightgray");
              }
              break;
           case 'ArrowDown':
              // 아래쪽 방향키 눌렸을 때의 동작
              if (selectedIndex < $(".searchResult").length - 1) {
                 // 이전 선택 취소
                 $(".searchResult:eq(" + selectedIndex + ")").css("background-color", "white");
                 // 현재 선택
                 selectedIndex++;
                 $(".searchResult:eq(" + selectedIndex + ")").css("background-color", "lightgray");
              }
              break;
        }
     });
   
   
   function selectSearch() {
       $(document).on("click","b.searchResult",function(event){
          var s=$(this).html();
          //alert(s);
          
          $("#search").val(s);
          $("#result").html("");
       });
    }
   
   $(document).on("mouseover",".searchResult", function(event){
      $(this).css("background-color", "lightgray");
   });
   
   $(document).on("mouseout",".searchResult", function(event){
      $(this).css("background-color", "white");
   }); 
   
</script>
<style type="text/css">
.searchResult{
   cursor: pointer;
   font-size: 13pt;
   margin-bottom: 10px;
}
#result{
	margin-left: 25%;
	margin-top: 9%;
}
.recentsearch{
	display: inline-block;
	width: auto;
	height: auto;
	border: 1px solid lightgray;
	border-radius: 30px;
	font-size: 13px;
	text-align: center;
	padding: 6px 9px 6px 9px;
}
.bestsearch{
	cursor: pointer;
	width: 200px;
	margin: 10px 0px 10px 0px; 
}
#bestdiv1{
	width: 400px;
}
#bestdiv2{
	width: 400px;
}
#best{
	width: 1000px;
	display: inline-flex;
}
#allsearch{
	position: absolute;
	left: 25%;
	top: 22%;
}
#searchdiv{
	position: absolute;
	border-bottom: 3px solid black;
	left: 25%;
	top: 12%;
	padding-bottom: 5px;
}
#search{
	border: 0px;
}
#search::placeholder{
	font-size: 17pt;
	color: #BDBDBD;
}
.recentdelete{
	cursor: pointer;
}
.recentsearch a{
	text-decoration: none;
	color: gray;
}
#best a{
	text-decoration: none;
	color: black;
}
#allrecentdelete{
	text-decoration: none;
	color: gray;
}
.exit{
	position: absolute;
	left: 97%;
	bottom: 94%;
	font-size: 15pt;
	color: gray;
	cursor: pointer;
}
</style>
</head>
<body>

	<i class="bi bi-x-lg exit" onclick="history.back()"></i>
	
	<div id="mainsearch">
	<div class="input-group w-50" id="searchdiv">
      <input type="search" class="form-control rounded" placeholder="상품을 입력하세요" aria-label="Search" aria-describedby="search-addon"
       id="search" autocomplete="off"/>
      <input type="hidden" id="btnsearch" class="btn btn-dark" value="${sessionScope.myid }">
    </div>
    <div id="result"></div>
</div>
   
    <div id="allsearch">
	    <div id="recent">
		    <b>최근 검색어</b>&nbsp;
		    <span style="text-decoration: underline; font-size: 13px;">
		    	<a href="search/alldelete?s_id=${sessionScope.myid }" id="allrecentdelete">지우기</a>
		    </span><br>
		    <c:forEach var="dto" items="${list }" varStatus="i">
		    		<input type="hidden" class="searchsavenum" value=${dto.s_num }>
		    		<div class="recentsearch">
			    		<a href="search/main?search=${dto.s_searchword }&s_id=${sessionScope.myid }">${dto.s_searchword }</a>
			    		<i class="bi bi-x recentdelete" style="color: #BDBDBD;"></i>
		    		</div>
		    </c:forEach>
	    </div>
	    <br>
	    <div id="bestsearchword">
	    	<b>인기 검색어</b><br>
	    	<div id="best">
		    	<div id="bestdiv1">
			    	<c:forEach var="title" items="${title }" varStatus="i">
			    		<c:if test="${i.count <= 10}">
			    			<div class="bestsearch"><b style="font-size: 15px;">${i.count}</b>
			    				<a href="search/main?search=${title }&s_id=${sessionScope.myid }">
			    					<span style="font-size: 14px;">${title }</span>
			    				</a>
			    			</div>
			    		</c:if>
			    	</c:forEach>
		    	</div>
		    	<div id="bestdiv2">
			    	<c:forEach var="title" items="${title }" varStatus="i">
			    		<c:if test="${i.count > 10}">
			    			<div class="bestsearch"><b style="font-size: 15px;">${i.count}</b>
			    				<a href="search/main?search=${title }&s_id=${sessionScope.myid }">
			    					<span style="font-size: 14px;">${title }</span>
			    				</a>
			    			</div>
			    		</c:if>
			    	</c:forEach>
		    	</div>
	    	</div>
	    </div>
    </div>

</body>
</html>