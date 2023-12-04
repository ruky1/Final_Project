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
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.5.0/kakao.min.js"
  integrity="sha384-kYPsUbBPlktXsY6/oNHSUDZoTX6+YI51f63jCPEIPFP09ttByAdxd2mEjKuhdqn4" crossorigin="anonymous"></script>
  <script>
	Kakao.init('815178a1004a30c81fbcd7151ba42d6b');
</script>
<title>Insert title here</title>
</head>
<body>
	<!-- Section-->
	<section class="py-3">
		<div class="container px-4 px-lg-5 mt-5">
			<!-- 출력방식 설정 -->
			<div class="sort">
				<div class="sort_insert">
					<c:if test="${sessionScope.loginok!=null }">
					 <a href="/form">
						<button style="color: black" class="write"><img src="../../img/writePost.png" style="width: 20px;">글쓰기</button>
					</a>
					</c:if>
				</div>
				<div class="sort_list">
					 <a href="/list">
						<button style="color: black" class="write">모든상품</button>
					</a>
				</div>			
			</div>
			
			
			<br>
			<div id="cardType" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">     	
		     	<c:forEach var="dto" items="${list }">
		     	<div class="col mb-5">
		     		<div class="card h-100">
		     			<div class="card-img">
			                <c:if test="${dto.j_imageurl != 'no' }">
			     				<c:forTokens var="pho" items="${dto.j_imageurl }" delims="," begin="0" end="0">
			                		<img class="card-img-top" src="../img/${pho }" alt="..." />
			                	</c:forTokens>
			                </c:if> 
			                <c:if test="${dto.j_imageurl == 'no' }">
		                		<img class="card-img-top" src="../img/noimage.png" alt="..." />
			                </c:if>
		                </div> 
		                <div class="card-body p-4">
			            	<div class="text-center">
			            		<h5 class="fw-bolder">${dto.j_title}</h5>
			            		<fmt:formatNumber value="${dto.j_price}" type="currency"/>
							</div>
						</div>
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">	
								<a class="btn btn-outline-dark mt-auto" href="/sangpum/detail?num=${dto.j_sangid }">View
									options</a>
							</div>
						</div>
					</div>
				</div>			
		     	</c:forEach>
	     	</div>
     		<br><br><br>
			<div class="kakao_inquiry_main">
				<div id="add-channel-button"></div>
				<div id="chat-channel-button"></div>
			</div>
		</div>
	</section>
</body>
<script>
  Kakao.Channel.createAddChannelButton({
    container: '#add-channel-button',
    channelPublicId: '_BpxgxjG',
  });
  Kakao.Channel.createChatButton({
	    container: '#chat-channel-button',
	    channelPublicId: '_BpxgxjG',
	  });

  
  
  //카카오로그인
	const urlParams = new URL(location.href).searchParams;
	const code = urlParams.get('code');
	//console.log(code)
	
	$.ajax({
	type : "POST"
    , url : 'https://kauth.kakao.com/oauth/token'
    , data : {
        grant_type : 'authorization_code',
        client_id : '815178a1004a30c81fbcd7151ba42d6b',
        redirect_uri : 'http://localhost:8949',
        code : code
    }
    , contentType:'application/x-www-form-urlencoded;charset=utf-8'
    , dataType: null
    , success : function(response) {
        Kakao.Auth.setAccessToken(response.access_token);
        requestUserInfo();
        
    }
    ,error : function(jqXHR, error) {

    }
});


function requestUserInfo() {
Kakao.API.request({
  url: '/v2/user/me',
})
  .then(function(res) {
	 
    //console.log(JSON.stringify(res));
    //alert(JSON.stringify(res.id);
    //alert(JSON.stringify(res.kakao_account.phone_number));
   
    // 이름과 이메일에서 큰따옴표 제거
   var u_id=JSON.stringify(res.id);
   var u_name = res.kakao_account.name.replace(/"/g, '');
   var u_email = res.kakao_account.email.replace(/"/g, '');
   var u_hp = res.kakao_account.phone_number.replace(/"/g, '');
    
    $.ajax({
    	type:"post",
    	dataType:"html",
    	url:"/join",
    	data:{"u_email" :u_email,
    	"u_id": "카카오"+u_id,
    	"u_name" :u_name,
    	"u_hp":u_hp,
    	"u_pass": "0",
    	
    	},
    	success:function(res){
    	refreshMemList();
    	console.log("성공");
    	
    	},
    	fail:function(){
    		console.log("실패");
    	}
    	
    })
    
  })
  .catch(function(err) {
    alert(
      'failed to request user information: ' + JSON.stringify(err)
    );
  });
}

function refreshMemList(){
	location.reload();
}



</script>
</html>