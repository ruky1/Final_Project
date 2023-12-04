<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css'>

<script src='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js'></script>

<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

<link href="/messagejscss/emoji_jk.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/messagejscss/emoji_jk.js"></script>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>

<!--채팅 css -->
<style type="text/css">
body{
    background-color: #f4f7f6;
    margin-top:20px;
}
.card {
    background: #fff;
    transition: .5s;
    border: 0;
    margin-bottom: 30px;
    border-radius: .55rem;
    position: relative;
    width: 100%;
    box-shadow: 0 1px 2px 0 rgb(0 0 0 / 10%);
}
.chat-app .people-list {
    width: 280px;
    position: absolute;
    left: 0;
    top: 0;
    padding: 20px;
    z-index: 7;
    
    height: 510px;
    overflow: auto;
}

.chat-app .chat {
    margin-left: 280px;
    border-left: 1px solid #eaeaea;
}

.people-list {
    -moz-transition: .5s;
    -o-transition: .5s;
    -webkit-transition: .5s;
    transition: .5s;
}

.people-list .chat-list li {
    padding: 10px 15px;
    list-style: none;
    border-radius: 3px;
}

.people-list .chat-list li:hover {
    background: #efefef;
    cursor: pointer;
}

.people-list .chat-list li.active {
    background: #efefef;
}

.people-list .chat-list li .name {
    font-size: 15px;
}

.people-list .chat-list img {
    width: 45px;
    border-radius: 50%;
}

.people-list img {
    float: left;
    border-radius: 50%;
}

.people-list .about {
    float: left;
    padding-left: 8px;
}

.people-list .status {
    color: #999;
    font-size: 13px;
}

.chat .chat-header {
    padding: 15px 20px;
    border-bottom: 2px solid #f4f7f6;
}

.chat .chat-header img {
    float: left;
    border-radius: 40px;
    width: 40px;
}

.chat .chat-header .chat-about {
    float: left;
    padding-left: 10px;
}

.chat .chat-history {
    padding: 20px;
    border-bottom: 2px solid #fff;
    
    height: 400px;
    overflow: auto;
}

.chat .chat-history ul {
    padding: 0;
}

.chat .chat-history ul li {
    list-style: none;
    margin-bottom: 30px;
}

.chat .chat-history ul li:last-child {
    margin-bottom: 0px;
}

.chat .chat-history .message-data {
    margin-bottom: 15px;
}

.chat .chat-history .message-data img {
    border-radius: 40px;
    width: 40px;
}

.chat .chat-history .message-data-time {
    color: #434651;
    padding-left: 6px;
}

.chat .chat-history .message {
    color: #444;
    padding: 18px 20px;
    line-height: 26px;
    font-size: 16px;
    border-radius: 7px;
    display: inline-block;
    position: relative;
}

.chat .chat-history .message:after {
    bottom: 100%;
    left: 7%;
    border: solid transparent;
    content: " ";
    height: 0;
    width: 0;
    position: absolute;
    pointer-events: none;
    border-bottom-color: #fff;
    border-width: 10px;
    margin-left: -10px;
}

.chat .chat-history .my-message {
    background: #efefef;
}

.chat .chat-history .my-message:after {
    bottom: 100%;
    left: 30px;
    border: solid transparent;
    content: " ";
    height: 0;
    width: 0;
    position: absolute;
    pointer-events: none;
    border-bottom-color: #efefef;
    border-width: 10px;
    margin-left: -10px;
}

.chat .chat-history .other-message {
    background: #e8f1f3;
    text-align: right;
}

.chat .chat-history .other-message:after {
    border-bottom-color: #e8f1f3;
    left: 93%;
}

.chat .chat-message {
    padding: 20px;
}

.online,
.offline,
.me {
    margin-right: 2px;
    font-size: 8px;
    vertical-align: middle;
}

.online {
    color: #86c541;
}

.offline {
    color: #e47297;
}

.me {
    color: #1d8ecd;
}

.float-right {
    float: right;
}

.clearfix:after {
    visibility: hidden;
    display: block;
    font-size: 0;
    content: " ";
    clear: both;
    height: 0;
}

@media only screen and (max-width: 767px) {
    .chat-app .people-list {
        height: 465px;
        width: 100%;
        overflow-x: auto;
        background: #fff;
        left: -400px;
        display: none;
    }
    .chat-app .people-list.open {
        left: 0;
    }
    .chat-app .chat {
        margin: 0;
    }
    .chat-app .chat .chat-header {
        border-radius: 0.55rem 0.55rem 0 0;
    }
    .chat-app .chat-history {
        height: 300px;
        overflow-x: auto;
    }
}

@media only screen and (min-width: 768px) and (max-width: 992px) {
    .chat-app .chat-list {
        height: 650px;
        overflow-x: auto;
    }
    .chat-app .chat-history {
        height: 600px;
        overflow-x: auto;
    }
}

@media only screen and (min-device-width: 768px) and (max-device-width: 1024px) and (orientation: landscape) and (-webkit-min-device-pixel-ratio: 1) {
    .chat-app .chat-list {
        height: 480px;
        overflow-x: auto;
    }
    .chat-app .chat-history {
        height: calc(100vh - 350px);
        overflow-x: auto;
    }
}

.messagefilepreview {
      position: inherit;
      background: white;
      box-shadow: 0px 0px 10px lightgray;
      border-bottom: 1px solid lightgray;
      width: 100%;
      height: 100px;
      display: inline-flex;
      align-items: center;
      bottom: 0;
      margin-bottom: 55px;
      z-index: 5p;
      /* display: none; */
   }
   
   .messagefilepreview div {
      height: 75px;
      margin: 0 auto;
      margin-left: 15px;
      display: inline-flex;
      align-items: flex-end;
   }
   
   .messagefilepreview img {
      height: 75px;
   }
   
   .messagefilepreview span {
      cursor: pointer;
   }
   #sendBtn{
      cursor: pointer; 
   }
   
   .messagefooter {
   background: white;
   width: 95%;
   position: inherit;
   bottom: 0;
   display: inline-flex;
   align-items: center;
   padding-left: 10px;
}

.chatuploadicon {
   cursor: pointer;
}

#chatShow img{
   height: 75px;
}

 .alarm {
        width: 20px;
        height: 20px;
        border: 1px solid red;
        background-color: red;
        border-radius: 50%;
        text-align: center;
        margin-left:3px;
        color: white;
        font: 15px;
    }
    
#iamportPayment {
	cursor: pointer;
}

#tossPayment {
	border-radius: 30px;
	cursor: pointer;
}

</style>
<script type="text/javascript">
$(function(){
   
   $(".messagefilepreview").hide();
   
   //비회원 채팅 클릭시 로그인폼으로 이동
   if("${sangidx}"!=0){
      if("${sangpum.member_id}"=="${sessionScope.myid}"){
         alert("상품 판매 채팅방으로 이동합니다.");
      }
   }
   
   wsOpen();//웹소켓 오픈
   
   
   getChattingRooms("${sessionScope.myid}","${sangidx}");
   
   
   //사진 업로드
   $(".chatuploadicon").click(function() {
      $(".chatupload input").trigger("click");
   })

   //사진 선택 <--여기서부터~!
   $("#msgfileupload").change(function(event) {
      var input=event.target;
      
      //미리보기 띄우기
      if (input.files && input.files[0]) {
         var reader = new FileReader();
         reader.onload = function(e) {
            $(".messagefilepreview").show();
            var out="<div><img src='"+e.target.result+"'>";
            out+="<span class='bi bi-file-x fileselcancel'></div>"
            $(".messagefilepreview").html(out);
         };
         reader.readAsDataURL(input.files[0]);
      } else {
         out="";
      }
   });
   
   //사진 선택 취소
   $(document).on("click",".fileselcancel",function(){
      $(".messagefilepreview").hide();
      $("#msgfileupload").val(null);
   });
   
   
   /*$(document).on("click","#iamportPayment",function(){ 
      kakaopay(); //버튼 클릭하면 호출 
    });

   $(document).on("click","#tossPayment",function(){
      tosspay();
   });*/
   
});

//사용자 정의함수

   var room_num=0;
   var other="";

   //로그인한 사용자가 들어있는 채팅방 모두 불러오기, 종모양 눌렀을 경우
   function getChattingRooms(user_id,sangidx,scrollPos) {
         
         $.ajax({
            type:"get",
            dataType:"json",
            url:"/message/getMessageList",
            data:{"user_id":user_id, "sangidx":sangidx},
            success:function(res){
               var roomList="";
               
               $.each(res, function(i,ele){
                  
                  var alarm="";
                  
                  if(user_id==ele.sender_id){
                     other=ele.receiver_id
                  }else{
                     other=ele.sender_id
                  }

                  if(ele.mess_alarmCnt>0){
                     alarm="<div id='alarm' class='alarm'>"+ele.mess_alarmCnt+"</div>";
                  }
                  
                  roomList+="<li class='clearfix' onclick='getChatting("+ele.room_num+", \""+other+"\")'>";
                  roomList+="<img src='../img/"+ele.sang_img+"' alt='avatar'>";
                  roomList+="<div class='about'>";
                  roomList+="<div class='name'>"+other+alarm+"</div>";
                  roomList+="<div class='status'>"+ele.recent_mess+"</div>";
                  roomList+="</div></li>";                
               })
               
               $("#chattingrooms").html(roomList);
               
               if (scrollPos == null) {
                  setTimeout(function(){
                     $(".people-list").scrollTop(scrollPos);//스크롤 가장 위로                  
                  },300)
               } else {
                  setTimeout(function(){
                     $(".people-list").scrollTop($(".people-list").prop('scrollHeight'));   
                  },300)
               }
               
            }
            
         });
      
   }
   


   //상대방과 하던 채팅 가져오기
   function getChatting(roomNum, otherID, scrollPos){
      
      room_num=roomNum;
      other=otherID;
      
      if(room_num==0){
         return;
      }
      
      //채팅방을 클릭하는 순간 현재 user가 receiver인경우 알림을 읽음
      $.ajax({
         type:"get",
         dataType:"html",
         url:"/message/alarmRead",
         data:{"room_num":room_num},
         success:function(){
            //alert("message read update!");
         }
      });
      
      //chat profile가져오기
      $.ajax({
         type:"get",
         dataType:"json",
         url:"/message/chatProfile",
         data:{"room_num":room_num},
         success:function(res){
               
               var profile=""
            
               profile+="<img src='../img/"+res.j_imageurl+"' alt='avatar'>";
               profile+="<div class='chat-about'>";
               profile+="<h6 class='m-b-0'>"+other+"<br><small style='color: gray;''>"+res.j_title +"</small></h6>";
               profile+="<div style='float: right;'>";
               profile+="<img src='../img/kakaopay.png' style='width: 70px; height: 30px' id='iamportPayment' onclick='kakaopay("+res.j_sangid+")'>";
               profile+="<img src='../img/toss.png' style='width: 70px; height: 30px' id='tossPayment' onclick='tosspay("+res.j_sangid+")'>";
               profile+="</div>";
               profile+="</div>";
               
               $("#profile").html(profile);
               
            }
      
            
         });
      
      //chatting가져오기
      $.ajax({
         type:"get",
         dataType:"json",
         url:"/message/chatting",
         data:{"room_num":room_num},
         success:function(res){
            
            var chatContent="";
            var messCheck="";
            
            chatContent+="<ul class='m-b-0'>";
            $.each(res, function(i,ele){
               
               if(ele.mess_readCnt==1){
                  messCheck="안읽음";
               }
               
               //내가 채팅을 보낼 때(오른쪽)
               if(ele.sender_id=="${sessionScope.myid}"){
                  //alert(ele.mess_readCnt);
                  chatContent+="<li class='clearfix'>";
                  chatContent+="<div class='message-data text-right'>";
                  chatContent+="<span class='message-data-time'>"+ele.mess_time+"</span>";
                  chatContent+="</div>";
                  chatContent+="<div class='message other-message float-right'>"+ele.mess_content+"</div>";
                  chatContent+="</li>";
               }else{//상대 일때
                  chatContent+="<li class='clearfix'>";
                  chatContent+="<div class='message-data'>";
                  chatContent+="<span class='message-data-time'><small style='color: gray;'>"+messCheck+"</small>&nbsp;&nbsp;"+ele.mess_time+"</span>";
                  chatContent+="</div>";
                  chatContent+="<div class='message my-message'>"+ele.mess_content+"</div>";
                  chatContent+="</li>";
               }
            });
            chatContent+="</ul>";
            
            $("#chatShow").html(chatContent);
            
            if (scrollPos == null) {
               setTimeout(function(){
                  $(".chat-history").scrollTop($(".chat-history").prop('scrollHeight'));
               },300)
               //$(".chatlist").scrollTop($(".chatlist")[0].scrollHeight); //스크롤 맨 아래로 내리기   
            } else {
               setTimeout(function(){
                  $(".chat-history").scrollTop(scrollPos);
               },300)
            }
            
            
         }
      });
      
      
   };
   


   
   //웹소켓 오픈
   function wsOpen() {

      ws = new WebSocket("ws://" + location.host + "/chating");
      wsEvt();
   }

   function wsEvt() {
      ws.onopen = function(data) {
         //소켓이 열리면 초기화 세팅하기
         
         //getChattingRooms("${sessionScope.myid}","${sangidx}");
         
      }
      
      //getChatting(room_num, other);

      //메시지 잘 들어왔을 때 실행하는 내용
      ws.onmessage = function(data) {
         var msg = data.data;
         var msgJson = JSON.parse(msg);
         
         getChatting(room_num, other);
         getChattingRooms("${sessionScope.myid}","${sangidx}");//멤버 리스트 다시 불러오기
         
      }

      //채팅 입력창에서 엔터 누르면 채팅 보내짐
      $("#chatting").keyup(function(e) {
         if (e.keyCode == 13) { //enter press
            if ($("#chatting").val() != '') {
               send();
               /* getChattingRooms("${sessionScope.myid}","${sangidx}");
               getChatting(room_num, other); */      
            }
         }
      });
   }

   //메시지 보내면 동작하는 코드
   function send() {
      
      var msg = $("#chatting").val();
      var mynum = "${sessionScope.myid}";
      
      //채팅방이 지정되지 않을 때
      if(room_num==0){
         alert("채팅방을 선택해 주세요.");
      }else{

         
         //만약 사진을 선택하지 않았다면
         if(!$("#msgfileupload").val()){
            //글만 작성 했을 떄
            if(msg!=""){
               ws.send(JSON.stringify({
                  "room_num" : room_num,
                  "msg" : msg,
                  "mynum" : mynum,
                  "receiver" : other,
                  "type" : "chat"
               }));
               
               
            }
            else{//아무것도 작성하지 않을 때
               alert("메시지를 입력해 주세요.");
            }
         
            
         }else{
            //사진부터 업로드...
            var form=new FormData();
            form.append("upload",$("#msgfileupload")[0].files[0]); //선택한 1개만 추가
            
            $.ajax({
               type:"post",
               dataType:"json",
               url:"/message/fileupload",
               processData:false,
               contentType:false,
               data:form,
               success:function(res){
                  
                  ws.send(JSON.stringify({
                     "room_num" : room_num,
                     "msg" : res.upload,
                     "mynum" : mynum,
                     "receiver" : other,
                     "type" : "img"
                  }));

                  $(".messagefilepreview").hide();
                  $("#msgfileupload").val(null);
               }
            });
            
            //메시지도 적었다면 한 번 더 전송
            if(msg!=""){
               ws.send(JSON.stringify({
                  "room_num" : room_num,
                  "msg" : msg,
                  "mynum" : mynum,
                  "receiver" : other,
                  "type" : "chat"
               }));
            }
         }
         
         //현재 user가 receiver인경우 알림을 읽음
         $.ajax({
            type:"get",
            dataType:"html",
            url:"/message/alarmRead",
            data:{"room_num":room_num},
            success:function(){
               //alert("message read update!");
            }
         });
      

         $("#chatting").val("");
         
         getChatting(room_num, other);
         getChattingRooms("${sessionScope.myid}","${sangidx}");

         
      }
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
   
   
   
   
   function kakaopay(j_sangid) {
	   
	   //var j_sangid = $(this).attr("sangidx");
	  // alert(j_sangid);
	   
	   $.ajax({
           type:"post",
           dataType:"json",
           url:"/message/sangpuminfo",
           data:{"sangidx":j_sangid},
           success:function(dto){
              
              const randomString = generateRandomString(8);
              IMP.init('imp78057427');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
              IMP.request_pay({// param
                  pg: "kakaopay.TC0ONETIME", //pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
                  pay_method: "card", //지불 방법
                  merchant_uid: randomString, //"iamport_test_id", //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
                  name: dto.j_title,//"도서", //결제창에 노출될 상품명
                  amount: dto.j_price //금액
                  //j_sangid: "${dto.j_sangid}",
                  //u_id: "${sessionScope.myid}"
                  //buyer_email : "${sessionScope.myemail}", 
                  //buyer_name : "${sessionScope.myname}",
                  //buyer_tel : "${sessionScope.myhp}"
              }, function (rsp) { // callback
                  if (rsp.success) {
                     
                    var p_method = "kakaopay";
                    //var j_sangid = dto.j_sangid;
                    var u_id = "${sessionScope.myid}";
                     
                     
                      alert("구매가 완료되었습니다");
                      //alert(j_sangid);
                      
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
        });
	   
      
       
    }
   
   function tosspay(j_sangid) {
	   
	   //alert(j_sangid);
	   
	    $.ajax({
           type:"post",
           dataType:"json",
           url:"/message/sangpuminfo",
           data:{"sangidx":j_sangid},
           success:function(dto){
        	   
        	   const randomString = generateRandomString(8);
        	      //토스페이
        	      IMP.init("imp78057427");//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
        	       IMP.request_pay({
        	        pg : "tosspay",
        	        pay_method : "card",
        	        merchant_uid: randomString, // 상점에서 관리하는 주문 번호
        	        name : dto.j_title,
        	        amount : dto.j_price
        	        //buyer_email : "${sessionScope.myemail}",
        	        //buyer_name : "${sessionScope.myname}",
        	        //buyer_tel : '010-1234-5678',
        	        //buyer_addr : '서울특별시 강남구 삼성동',
        	        //buyer_postcode : '123-456'
        	    }, function(rsp) {
        	        if ( rsp.success ) {
        	           
        	           var p_method = "tosspay";
        	          //var j_sangid = "${dto.j_sangid}";
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
           });
	   
   }


</script>
</head>
<body>
<%-- <input type="hidden" id="room_num" value="${room_num}"> --%>

<div class="container">
<div class="row clearfix">
    <div class="col-lg-12">
        <div class="card chat-app">
            <div id="plist" class="people-list">
                <!-- <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-search"></i></span>
                    </div>
                    <input type="text" class="form-control" placeholder="Search...">
                </div> -->
                <ul class="list-unstyled chat-list mt-2 mb-0">

                <!-- 채팅방 리스트 -->
                <div id="chattingrooms">
                   
                   <div class="chatrooms"></div>
                   
                </div>
                
                </ul>
               </div>
            
            
            <!-- getChatting구간 -->
            <div class="chat">
                <div class="chat-header clearfix">
                    <div class="row">
                        <div class="col-lg-6">
                               <div id="profile"></div>
                        </div>
                    </div>
                </div>

                <!-- 채팅 보이는 구간 -->
                <div class="chat-history">


                   <div id="chatShow"></div>
                </div>

                <div class="chat-message clearfix">
                    <div class="input-group mb-0">
                    
                    <!-- 사진업로드시 미리보기 -->
                    <div class="messagefilepreview" style="display: none;"></div>
                    
                       <div class="messagefooter">
                     <!-- 이모지 시작-->
                     <div class="chatemoji">
                        <img class="emoji_pickup" id="emoji_pickup_before"
                           src="/messagejscss/img/emoji/1f642.png"> <img
                           class="emoji_pickup" id="emoji_pickup_after"
                           src="/messagejscss/img/emoji/1f600.png">
         
                        <div id="emoji_popup">
                           <!-- emoji popup div start -->
                           <div id="people">
                              <h5>People</h5>
                           </div>
                           <span class="emoji_list" id="&#x1F601;">&#x1F601;</span> <span
                              class="emoji_list" id="&#x1F602;">&#x1F602;</span> <span
                              class="emoji_list" id="&#x1F603;">&#x1F603;</span> <span
                              class="emoji_list" id="&#x1F604;">&#x1F604;</span> <span
                              class="emoji_list" id="&#x1F605;">&#x1F605;</span> <span
                              class="emoji_list" id="&#x1F606;">&#x1F606;</span> <span
                              class="emoji_list" id="&#x1F609;">&#x1F609;</span> <span
                              class="emoji_list" id="&#x1F60A;">&#x1F60A;</span> <span
                              class="emoji_list" id="&#x1F60B;">&#x1F60B;</span> <span
                              class="emoji_list" id="&#x1F60C;">&#x1F60C;</span> <span
                              class="emoji_list" id="&#x1F60D;">&#x1F60D;</span> <span
                              class="emoji_list" id="&#x1F60F;">&#x1F60F;</span> <span
                              class="emoji_list" id="&#x1F612;">&#x1F612;</span> <span
                              class="emoji_list" id="&#x1F613;">&#x1F613;</span> <span
                              class="emoji_list" id="&#x1F614;">&#x1F614;</span> <span
                              class="emoji_list" id="&#x1F616;">&#x1F616;</span> <span
                              class="emoji_list" id="&#x1F618;">&#x1F618;</span> <span
                              class="emoji_list" id="&#x1F61A;">&#x1F61A;</span> <span
                              class="emoji_list" id="&#x1F61C;">&#x1F61C;</span> <span
                              class="emoji_list" id="&#x1F61D;">&#x1F61D;</span> <span
                              class="emoji_list" id="&#x1F61E;">&#x1F61E;</span> <span
                              class="emoji_list" id="&#x1F620;">&#x1F620;</span> <span
                              class="emoji_list" id="&#x1F621;">&#x1F621;</span> <span
                              class="emoji_list" id="&#x1F622;">&#x1F622;</span> <span
                              class="emoji_list" id="&#x1F623;">&#x1F623;</span> <span
                              class="emoji_list" id="&#x1F624;">&#x1F624;</span> <span
                              class="emoji_list" id="&#x1F625;">&#x1F625;</span> <span
                              class="emoji_list" id="&#x1F628;">&#x1F628;</span> <span
                              class="emoji_list" id="&#x1F629;">&#x1F629;</span> <span
                              class="emoji_list" id="&#x1F62A;">&#x1F62A;</span> <span
                              class="emoji_list" id="&#x1F62B;">&#x1F62B;</span> <span
                              class="emoji_list" id="&#x1F62D;">&#x1F62D;</span> <span
                              class="emoji_list" id="&#x1F630;">&#x1F630;</span> <span
                              class="emoji_list" id="&#x1F631;">&#x1F631;</span> <span
                              class="emoji_list" id="&#x1F632;">&#x1F632;</span> <span
                              class="emoji_list" id="&#x1F633;">&#x1F633;</span> <span
                              class="emoji_list" id="&#x1F635;">&#x1F635;</span> <span
                              class="emoji_list" id="&#x1F637;">&#x1F637;</span>
                           <!-- emoji popup div end -->
                        </div>
                     </div>
                     <!-- 이모지 끝 -->
               <div class="input-group mb-0">   
                  <!-- 채팅입력 -->                
                        <input type="text" class="form-control" id="chatting" placeholder="메시지 입력">
                        
                        <!-- 전송버튼-->
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-send" onclick="send()" id="sendBtn"></i></span>
                        </div>
                        <!-- 사진버튼 -->
                  <div class="input-group-prepend">
                     <span class="input-group-text">
                        <div class="chatupload">
                           <input type="file" accept="image/jpeg,.png,.gif" id="msgfileupload" style="display: none;"> 
                              <i class="bi bi-image chatuploadicon" ></i>
                        </div>
                     </span>
                  </div>
                  
                  </div>
                     
                  </div>
      
                  
               </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>