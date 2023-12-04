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
   href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<title>Insert title here</title>
<style type="text/css">
.searchResult{
   cursor: pointer;
}

nav{
   font-size: 1.5em;
}

.alarm {
        width: 20px;
        height: 20px;
        border: 1px solid red;
        background-color: red;
        border-radius: 50%;
        text-align: center;
        float: right;
        z-index: -1;
        margin-right: 30px;
    }
    
   .note-num {
    position: absolute;
    top: -2px;
    right: -7px;
    z-index: 3;
    height: 20px;
    width: 20px;
    line-height: 20px;
    text-align: center;
    background-color: red;
    border-radius: 15px;
    display: inline-block;
    padding:1px;
    color: white;
    font-size: 15px;
}

#notification {
    /* background-image: url('../images/notification.svg'); */
    position: relative;
}

.b_mo{
	position: absolute;
	top: 5vh;
	right: 8vw;
}

.qwe{
	position: absolute;
	top: 2vh;
	right: -15vw;
}
.qwe1{
	position: absolute;
	top: 2vh;
	right: 10vw;
}


</style>
<script type="text/javascript">

	var ws2;
	
	//웹소켓 오픈(메시지 알림)
	function wsOpen2(){
		ws2 = new WebSocket("ws://" + location.host + "/chating");
		wsEvt2();
	}
	
	function wsEvt2(){
		ws2.onopen = function(data) {
			//소켓이 열리면 초기화 세팅하기
			getMsgAlarm();
		}
	
		//메시지 잘 들어왔을 때 실행하는 내용
		ws2.onmessage = function(data){
			getMsgAlarm(); //메시지 개수 확인->알림표시
		}
	}
	
	function getMsgAlarm(){
		
		var user_id = "${sessionScope.myid}";
		   
		   if(user_id!="guest"){
			   $.ajax({
				   type:"get",
				   dataType:"json",
				   url:"/message/totalAlarm",
				   data:{"user_id":user_id},
				   success:function(res){
					   
					   if(res>0){//알림이 있을 경우
							$(".note-num").text(res);
					   		$(".note-num").show();
					   }
					   
				   }
			   });
		   }
		
		
	}
	

   $(function(){
	   
	   wsOpen2(); //웹소켓 열기
	   
	   $(".note-num").hide();
	   
	   getMsgAlarm();
	   
	   
	   
      $("#search").keyup(function(){
         
         var search=$(this).val();
         //alert(search);
         
         $.ajax({
            type:"get",
            dataType:"json",
            url:"/search/result",
            data:{"search":search},
            success:function(res){
               var s="";
               
               $.each(res,function(i,dto){
                  s+="<b onclick='selectSearch()' class='searchResult'style='font-size: 15pt;'>"+dto+"</b><br>"
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
         alert("이벤트 감지");
      });
      
      
      
   });
   
   <!--사용자 정의함수-->
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

</head>
<body>


   <!-- Navigation-->
   <nav class="navbar navbar-expand-lg navbar-light">
      <div class="container px-4 px-lg-3">
         <a class="navbar-brand" href="/"> <img alt=""
            src="../img/icon.PNG" style="width: 20vh;">
         </a>
         <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
               <li class="nav-item"><a class="nav-link active"
                  aria-current="page" href="/">Home</a></li>
               <li class="nav-item"><a class="nav-link" href="about">About</a></li>
               <li class="nav-item dropdown"><a
                  class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
                  role="button" data-bs-toggle="dropdown" aria-expanded="false">Fleamarket</a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                     <li><a class="dropdown-item" href="/list">All Products</a></li>
                     <li><hr class="dropdown-divider" /></li>
                     <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                     <li><a class="dropdown-item" href="/">New Arrivals</a></li>
                  </ul></li>
            </ul>
            <div style="justify-content: space-between;">
            <c:if test="${sessionScope.loginok==null}">
            <button type="button" class="btn btn-outline-primary" onclick="location.href='../loginform'">로그인</button>
            </c:if>
            
            <c:if test="${sessionScope.loginok!=null}">
            <img alt="" src="../img/loginprofile.png" width="50vw" height="50vh" align="left" style="border-radius:30px;"/>
            <b>${sessionScope.myname}님이 로그인중입니다</b>
            <button type="button" class="btn btn-outline-primary" onclick="location.href='../logoutprocess'">로그아웃</button>
            </c:if>
            
            
            
             
            <!-- 마이페이지 -->
            <c:if test="${sessionScope.loginok!=null }">
               <input type="button" value="마이페이지" onclick="location.href='../mypage?u_id=${sessionScope.myid}'" class="btn btn-outline-primary">
            </c:if>

            <!-- 검색창 -->
            <div class="input-group w-25">
              
              <c:choose>
               <c:when test="${sessionScope.myid == null}">
                  <input type="hidden" value="${sessionScope.myid = 'guest'}">
                  <i class="bi bi-search" onclick="location.href='/search?s_id=${sessionScope.myid}'" style="cursor: pointer;"></i>
               </c:when>
               
               <c:when test="${sessionScope.myid != null}">
                  <i class="bi bi-search" onclick="location.href='/search?s_id=${sessionScope.myid}'" style="cursor: pointer;"></i>
                  <!-- 채팅방 , /message/getMessageList?user_id=${sessionScope.myid}-->
                  <div>
                  
                     <i class="bi bi-bell" id="notification" style="cursor: pointer;" onclick="location.href='/goChattingRoom'"><span id="note-num"></span></i>
                     
                  </div>
               </c:when>
               <c:otherwise>
               <p>와 호스기 보소</p>
               </c:otherwise>
               </c:choose>
                  
            </div>

         </div>
         
      </div>

      <div id="result"></div>   
   </div>
   </nav>
         
</body>
</html>