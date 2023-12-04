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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style>
#iamportPayment {
	cursor: pointer;
}

#tossPayment {
	border-radius: 30px;
	cursor: pointer;
}
</style>
<title>Insert title here</title>
<script type="text/javascript">
	
	//댓글
$(function(){
	
		list();

		
		$("#btnansweradd").click(function(){
			
			var num = $("#num").val();
			var name = "${sessionScope.myname}";
			var myid = "${sessionScope.myid}";
			var content = $("#content").val();
			
			//alert(name)
			
			if(content.length==0){
				alert("댓글을 입력해 주세요");
				return;
			} 
			//alert(myid)
			$.ajax({
				type:"post",
				url:"/answer/ainsert",
				dataType:"html",
				data:{"num":num, "content":content, "name":name, "myid":myid},
				success:function(){
					//alert("insert완료")
					
					list();
					$("#content").val("");
				}
			});
		});

	
	//댓글 삭제
	$(document).on("click","i.del", function(event){
		var idx = $(this).attr("idx");
		//alert(idx);
		
		$.ajax({
			type:"get",
			url:"/answer/adelete",
			dataType:"html",
			data:{"idx":idx},
			success:function(res){
				//alert("성공");
				list();
			}
		})
	});
	
	//댓글 수정창 띄우기
	$(document).on("click","i.mod", function(){
		idx = $(this).attr("idx");
		//alert(idx)
		
		$.ajax({
			type:"get",
			dataType:"json",
			url:"/answer/adata",
			data:{"idx":idx},
			success:function(res){
				//alert(res.content)
				$("#ucontent").val(res.content);
			}
		});
		
		$("#aUpdateModal").modal("show");
	});
	
	//댓글 수정
	$(document).on("click","#btnupdate", function(){
		var content = $("#ucontent").val();
		
		$.ajax({
			type:"post",
			dataType:"html",
			url:"/answer/aupdate",
			data:{"idx":idx, "content":content},
			success:function(res){
				$("#aUpdateModal").modal("hide");
				list();
			}
		});
		
	});
	
	
	 $("#content").keypress(function(e){
	        //검색어 입력 후 엔터키 입력하면 등록버튼 클릭
	        if(e.keyCode && e.keyCode == 13){
	           $("#btnansweradd").trigger("click");
	           return false;
	        }

	     });

	
	//$("#createRoomBtn").click(function(){
	/* $("#createRoomBtn").click(function(){
		var sangidx = $(this).attr("sangIdx");
		//alert(sangidx); //상품idx가져와서 채팅room생성
		
		$.ajax({
			type:"post",
			url:"/createRoom",
			data:{"sangidx":sangidx},
			dataType:"html",
			success:function(res){
				if(res==0){
					alert("자신이 판매하는 상품은 구매할 수 없습니다.");
					//location.href="/goChattingRoom?room_num="+0+"&sangidx="+sangidx;
					location.href="/goSellerRooms?sangidx="+sangidx;
				}else{
					//location.href="/goChattingRoom?room_num="+res+"&sangidx="+sangidx;
					location.href="/goChattingRoom?sangidx="+sangidx;
				}				
			}
		}) 
		
	})*/
	

	
		$("#iamportPayment").click(function(){ 
			kakaopay(); //버튼 클릭하면 호출 
        });
	
		$("#tossPayment").click(function(){
			tosspay();
		});
		
		

		
		
	});
	
//댓글 리스트	
function list(){
	
	var num = $("#num").val();
	var loginok = "${sessionScope.loginok}";
	var myid = "${sessionScope.myid}";
	
	$.ajax({
		type:"get",
		url:"/answer/alist",
		dataType:"json",
		data:{"num":num},
		success:function(res){
			$("span.acount").text(res.length);

			var s = "";

			$.each(res,function(i,dto){
				s+="<b>" +dto.name+"</b>: " + dto.content;
				s+="<span class='day' style='margin-left:15px'>" + dto.writeday + "</span>";
				if(loginok!=null&&myid==dto.myid){
					s+= '<i class="bi bi-pencil-square mod" style="cursor:pointer" idx="'+dto.idx+'"></i><i class="bi bi-trash3-fill del" style="cursor:pointer" idx="'+dto.idx+'"></i>';
				}
				s+="<br>";
			})
			
			
			
			$("div.alist").html(s);
		}
	});
} 
	//채팅방으로 이동
	function goChatting(sangidx) {
		//alert(sangidx);
		location.href="/goChattingRoom?sangidx="+sangidx;
	}
	
	
	//버튼 클릭하면 실행
    function kakaopay() {
				
    	const randomString = generateRandomString(8);
        IMP.init('imp78057427');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
        IMP.request_pay({// param
            pg: "kakaopay.TC0ONETIME", //pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
            pay_method: "card", //지불 방법
            merchant_uid: randomString, //"iamport_test_id", //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
            name: "${dto.j_title}",//"도서", //결제창에 노출될 상품명
            amount: "${dto.j_price}", //금액
            //j_sangid: "${dto.j_sangid}",
            //u_id: "${sessionScope.myid}"
            //buyer_email : "${sessionScope.myemail}", 
            //buyer_name : "${sessionScope.myname}",
            //buyer_tel : "${sessionScope.myhp}"
        }, function (rsp) { // callback
            if (rsp.success) {
            	
        		var p_method = "kakaopay";
        		var j_sangid = "${dto.j_sangid}";
        		var u_id = "${sessionScope.myid}";
            	
            	
                alert("구매가 완료되었습니다");
                //alert(j_sangid)
                $.ajax({
        			type:"post",
        			url:"/purchase/insert",
        			data:{"p_method":p_method, "j_sangid":j_sangid, "u_id":u_id},
        			dataType:"html",
        			success:function(res){
        				//alert("등록 성공");		
        			}
        		});
                
            } else {
                alert("구매에 실패하였습니다\n 코드("+rsp.error_code+") / 메세지(" + rsp.error_msg + ")");
            }
        });
    }
	
	function tosspay() {
		const randomString = generateRandomString(8);
		//토스페이
		IMP.init("imp78057427");//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
    	IMP.request_pay({
        pg : "tosspay",
        pay_method : "card",
        merchant_uid: randomString, // 상점에서 관리하는 주문 번호
        name : "${dto.j_title}",
        amount : "${dto.j_price}"
        //buyer_email : "${sessionScope.myemail}",
        //buyer_name : "${sessionScope.myname}",
        //buyer_tel : '010-1234-5678',
        //buyer_addr : '서울특별시 강남구 삼성동',
        //buyer_postcode : '123-456'
    }, function(rsp) {
        if ( rsp.success ) {
        	
        	var p_method = "tosspay";
    		var j_sangid = "${dto.j_sangid}";
    		var u_id = "${sessionScope.myid}";
    		
    		alert("구매가 완료되었습니다");
            //alert(j_sangid)
            $.ajax({
    			type:"post",
    			url:"/purchase/insert",
    			data:{"p_method":p_method, "j_sangid":j_sangid, "u_id":u_id},
    			dataType:"html",
    			success:function(res){
    				//alert("등록 성공");		
    			}
    		});
        	
        	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
        	jQuery.ajax({
        		url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
        		type: 'POST',
        		dataType: 'json',
        		data: {
    	    		imp_uid : rsp.imp_uid
    	    		//기타 필요한 데이터가 있으면 추가 전달
        		}
        	}).done(function(data) {
        		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
        		if ( everythings_fine ) {
        			var msg = '결제가 완료되었습니다.';
        			msg += '\n고유ID : ' + rsp.imp_uid;
        			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
        			msg += '\결제 금액 : ' + rsp.paid_amount;
        			msg += '카드 승인번호 : ' + rsp.apply_num;
        			
        			alert(msg);
        			
        		} else {
        			//[3] 아직 제대로 결제가 되지 않았습니다.
        			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
        		}
        	});
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            
            alert(msg);
        }
    });
	}
	
 // 길이 8의 랜덤 문자열 생성
    function generateRandomString(length) {
        const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        let result = '';

        for (let i = 0; i < length; i++) {
          const randomIndex = Math.floor(Math.random() * characters.length);
          result += characters.charAt(randomIndex);
        }

        return result;
      }
</script>
</head>
<body>
	<div id="carouselExampleIndicators"
		class="carousel slide w-50 container">
		<div class="carousel-indicators">
			<c:forEach var="pho" items="${dto.j_imageurl}" varStatus="loopStatus">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="${loopStatus.index}"
					class="${loopStatus.first ? 'active' : ''}"
					aria-current="${loopStatus.first ? 'true' : 'false'}"
					aria-label="Slide ${loopStatus.index + 1}"></button>
			</c:forEach>
		</div>


		<div class="carousel-inner rounded">
			<c:forEach var="pho" items="${dto.j_imageurl}" varStatus="loopStatus">
				<div class="carousel-item${loopStatus.first ? ' active' : ''}">
					<c:if test="${dto.sellcomplete == 1 }">
						<img src="../img/sellcomplete.png" style="z-index: 1; position: absolute; opacity: 0.7;" class="d-block w-100 h-100">
						<img src="../img/${pho}" alt="..." style="opacity: 0.4;" class="d-block w-100 h-100">
					</c:if>
					<c:if test="${dto.sellcomplete == 0 }">
						<img src="../img/${pho}" alt="..." class="d-block w-100 h-100">
					</c:if>
					
				</div>
			</c:forEach>
		</div>


		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="space-between container w-50 h-25">
		<div style="display: flex;">
			<div id="article-profile-image">
				<img alt="달달이"
					src="https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-c649f052a34ebc4eee35048815d8e4f73061bf74552558bb70e07133f25524f9.png">
			</div>
			<div id="article-profile-left">
				<div id="nickname">${dto.member_id }</div>
				<div id="region-name">${dto.j_addr }</div>
			</div>


			<div style="margin-left: auto; margin-top: 5vh;">
				<c:if
					test="${sessionScope.loginok!=null and sessionScope.myid==dto.member_id}">
					<button type="button" class="btn btn-dark"
						onclick="location.href='../sangupdateform?num=${dto.j_sangid}'">수정</button>
				</c:if>
				<c:if
					test="${sessionScope.loginok!=null and sessionScope.myid==dto.member_id }">
					<button type="button" class="btn btn-dark"
						onclick="location.href='../delete?num=${dto.j_sangid}'">삭제</button>
				</c:if>
				<c:if test="${dto.sellcomplete == 1 }">
					<button class="btn btn-dark" id="createRoomBtn"
					sangIdx="${dto.j_sangid }" onclick="goChatting(${dto.j_sangid})" disabled="disabled">채팅</button>
				</c:if>
				<c:if test="${dto.sellcomplete == 0 }">
					<button class="btn btn-dark" id="createRoomBtn"
					sangIdx="${dto.j_sangid }" onclick="goChatting(${dto.j_sangid})">채팅</button>
				</c:if>
			</div>
		</div>
		<div id="article-profile-right">

			<!-- <dl id="temperature-wrap">				
				<dt>매너온도</dt>
				<dd class="text-color-03 ">
					37.2 <span>°C</span>
				</dd>
			</dl>
			<div class="meters">
				<div class=" bar bar-color-03" style="width: 37%;"></div>
			</div>
			<div class=" face face-03"></div> -->
		</div>
		<hr>

		<div>
			<b>
			${dto.j_title } 
			<c:if test="${dto.sellcomplete == 1 }">
				<b style="color: red;">[판매완료]</b>
			</c:if>
			</b><br> 
			<small class="text-secondary">${dto.j_category }</small><br>
			<b><fmt:formatNumber value="${dto.j_price }" type="currency"/></b><br><br>
			<div>
				<p>
					${dto.j_explanation }
				</p>
			</div>
			<div>
				<small class="text-secondary">관심 ${dto.j_interest } 채팅 ${roomCnt}
					조회 ${dto.j_readcount }</small> <img src="../img/kakaopay.png"
					style="width: 70px; height: 30px" id="iamportPayment"> <img
					alt="" src="../img/toss.png" style="width: 70px; height: 30px"
					id="tossPayment">
			</div>
			<br> <b>댓글: <span class="acount"></span></b>
			<div class="alist"></div>

			<input type="hidden" id="num" value="${dto.j_sangid }">

			<c:if test="${sessionScope.loginok!=null }">
				<div class="aform">
					<div class="d-inline-flex">
						<input type="text" class="form-control" style="width: 500px"
							placeholder="댓글을 입력하세요" id="content">
						<button type="button" class="btn btn-dark" id="btnansweradd">등록</button>
					</div>
				</div>
			</c:if>
			<hr>
		</div>

	</div>





	<!-- 댓글 수정 modal창 -->
	<!-- The Modal -->
	<div class="modal" id="aUpdateModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">댓글 수정</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<input type="text" id="ucontent" class="form-control">
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-dark" id="btnupdate">수정</button>
					<button type="button" class="btn btn-dark"
						data-bs-dismiss="modal">닫기</button>
				</div>

			</div>
		</div>
	</div>

</body>
</html>