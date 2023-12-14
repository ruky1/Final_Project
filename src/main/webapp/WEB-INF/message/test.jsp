<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript" src="/messagejscss/emoji_jk.js"></script>
<script src="https://kit.fontawesome.com/16085d762f.js"
	crossorigin="anonymous"></script>
<link href="/messagejscss/emoji_jk.css" type="text/css" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Stylish&family=Sunflower&display=swap"
	rel="stylesheet">

<style type="text/css">
.messagecontainer {
	width: 100%;
	height: 100%;
}

.messagememberlist {
	width: 350px;
	min-width: 0px;
	height: 100%;
	position: fixed;
	overflow-y: scroll;
	overflow-x: hidden;
}

.messagechatlist {
	height: 100%;
	position: fixed;
	left: 350px;
	overflow-y: hidden;
	overflow-x: hidden;
}

.mmllisttop {
	margin-bottom: 20px;
}

.mmltitle {
	padding: 15px;
	display: inline-flex;
	align-items: center;
	justify-content: space-between;
	font-size: 15pt;
	width: 100%;
}

.mmlbtnbox {
	display: inline-flex;
	margin-bottom: 5px;
}

.mmlbtn {
	width: 35px;
	height: 35px;
	background-color: #F0F2F5;
	border-radius: 100px;
	line-height: 40px;
	text-align: center;
	margin-left: 10px;
	cursor: pointer;
}

.messagesearch {
	margin: 0 auto;
	background-color: #F0F2F5;
	border-radius: 100px;
	width: 95%;
	height: 35px;
	line-height: 35px;
	padding-left: 15px;
}

.messagesearch input {
	height: 90%;
	width: 90%;
	background: none;
	border: none;
	outline: none;
}

.messagememberphoto {
	width: 65px;
	height: 65px;
	overflow: hidden;
	border-radius: 100px;
	text-align: center;
}

.messagememberphoto img {
	height: 100%;
	width: 100%;
	object-fit:cover; /* 상위 div 안에 꽉차게 */
}

/* 채팅했던 멤버 */
.messagmember {
	padding-left: 15px;
	padding: 15px;
	width: 350px;
	position: fixed;
	overflow: auto;
	/*overflow-y: hidden;
	overflow-x: hidden;*/
}

.onemember {
	display: inline-flex;
	width: 98%;
	margin-bottom: 10px;
	cursor: pointer;
	padding: 5px;
}

.messageactive {
	background-color: #DFEFFF;
	border-radius: 5px;
}

.messagememberinfo {
	width: 250px;
	margin-left: 10px;
	margin-top: 10px;
	display: inline-flex;
	flex-direction: column;
}

.membername {
	font-size: 13pt;
	margin-bottom: 5px;
	width: 90%;
	overflow: hidden;
}

.chatdetail {
	width: 95%;
	display: inline-flex;
	justify-content: space-between;
}

.chatdetaildate {
	margin-right: 5px;
}

.chatinfo {
	width: 100%;
	height: 70px;
	background-color: white;
	box-shadow: 5px 2px 3px #F0F2F5;
	display: inline-flex;
	align-items: center;
	font-weight: bold;
	font-size: 12pt;
	position: inherit;
	top: 0;
	margin-top: 80px;
}

.chatinfophoto {
	width: 45px;
	height: 45px;
	overflow: hidden;
	border-radius: 100px;
	margin-left: 15px;
	margin-right: 10px;
	cursor: pointer;
}

.chatinfophoto img {
	height: 45px;
	height: 100%;
	width: 100%;
	object-fit:cover; /* 상위 div 안에 꽉차게 */
}

.chatlist {
	position: fixed;
	margin-top: 70px;
	margin-bottom: 55px;
	overflow-y: scroll;
	overflow-x: hidden;
	display: inline-flex;
	flex-direction: column;
	align-items: center;
}

.messagefooter {
	background: white;
	height: 55px;
	position: inherit;
	bottom: 0;
	display: inline-flex;
	align-items: center;
	padding-left: 10px;
}

.chatinputbox {
	width: 88%;
	height: 35px;
	line-height: 35px;
	background-color: #F0F2F5;
	border-radius: 60px;
	text-align: center;
	margin-left: 10px;
	margin-right: 10px;
}

.chatinputbox input {
	width: 95%;
	background: none;
	border: none;
	outline: none;
}

.chatShow {
	display: inline-flex;
	flex-direction: column;
	width: 98%;
	align-items: center;
}

.messagebubble {
	margin: 10px;
	max-width: 400px;
	overflow: hidden;
	border: none;
}

.messagebubble a{
	text-decoration: none;
}

.messagebubble .bubblecontent{
	padding: 10px 15px 10px 15px;
}

.messagebubble img{
	width: 100%;
	height: 100%;
	object-fit:cover;
	cursor: pointer;
}

.msgright {
	align-self: flex-end;
	display: inline-flex;
	align-items: center;
}

.messageright {
	border-radius: 90px 90px 10px 90px;
}

.messageright .bubblecontent{
	background-color: #3582D3;
	color: white;
}

.messageright .bubblecontent a{
	color: white;
}

.msgleft {
	align-self: flex-start;
	display: inline-flex;
	align-items: center;
}

.messageleft {
	border-radius: 90px 90px 90px 10px;
}

.messageleft .bubblecontent{
	background-color: #F0F2F5;
}

.messageleft .bubblecontent a{
	color: black;
}

.msgdel {
	font-size: 10pt;
	color: gray;
	margin-top: 10%;
	cursor: pointer;
}

.msgtime{
	font-size: 8pt;
}

.msgsubmenu{
	color: gray;
	display: inline-flex;
	flex-direction: column;
	visibility: hidden;
}

.leftreceiverphoto{
	width: 45px;
	height: 45px;
	min-width: 45px;
	min-height: 45px;
	border-radius: 100px;
	overflow: hidden;
}

.leftreceiverphoto img {
	height: 100%;
	width: 100%;
	object-fit:cover; /* 상위 div 안에 꽉차게 */
}

.chatlistinfo {
	display: inline-flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin: 60px 0px 60px 0px;
}

.chatlistinfo div {
	width: 60px;
	height: 60px;
	border-radius: 100px;
	overflow: hidden;
}

.chatlistinfo img {
	height: 100%;
	width: 100%;
	object-fit:cover;
	cursor: pointer;
}

.chatlistinfoname {
	font-weight: bold;
	font-size: 14pt;
	margin-top: 10px;
}

.chatlistinfoid {
	font-size: 13pt;
	margin-top: 5px;
	color: lightgray;
}

.chatupload {
	font-size: 18pt;
	display: flex;
	align-items: center;
}

.chatuploadicon {
	cursor: pointer;
	color: #3582D3;
}

span.msgaddname {
	margin-left: 15px;
}

input.msgaddname {
	margin-left: 10px;
	width: 50%;
	outline: none;
	border: none;
	background: none;
}

div.msgsearchuser {
	position: absolute;
	z-index: 10;
	width: 300px;
	height: 500px;
	overflow: auto;
	box-shadow: 0px 0px 10px lightgray;
	background-color: white;
	display: none;
	flex-direction: column;
}

.msgserachuserone {
	margin-left: 15px;
	width: 250px;
	display: inline-flex;
	align-items: center;
	margin-top: 10px;
	cursor: pointer;
	padding: 3px;
	border-radius: 10px;
}

.msgserachuserone:hover {
	background-color: #DFEFFF;
}

.msgserachuserone span {
	margin-left: 5px;
}

.searchuid {
	color: gray;
	font-size: 8pt;
}

.searchuphoto {
	width: 40px;
	height: 40px;
	border: none;
	border-radius: 100px;
	overflow: hidden;
	text-align: center;
}

.searchuphoto img {
	height: 100%;
	width: 100%;
	object-fit:cover;
}

#sendBtn {
	border: none;
	outline: none;
	background: none;
	font-size: 15pt;
	color: #3582D3;
	margin-right: 5px;
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

.messagefilepreview div{
	height: 75px;
	margin: 0 auto;
	margin-left: 15px;
	display: inline-flex;
	align-items: flex-end;
}

.messagefilepreview img{
	height: 75px;
}

.messagefilepreview span{
	cursor: pointer;
}

.recentchat{
	width: 130px;
	overflow: hidden;
}

.recentchat img{
	height: 80px;
}

.mmiheader{
	display: inline-flex;
	justify-content: space-between;
	width: 95%;
}

.memberlistmenu{
	cursor: pointer;
}

.messgroupdel{
	width: 150px;
	height: 60px;
	background-color: white;
	box-shadow: 0px 0px 3px lightgray;
	position: inherit;
	left: 170px;
	margin-top: -130px;
	z-index: 5;
	line-height: 60px;
	padding-left: 15px;
	border-radius: 10px;
}

.messgroupdelicon{
	width: 120px;
	cursor: pointer;
	font-size: 12pt;
	z-index: 10;
}
</style>
<</head>
<body>
	<div class="messagecontainer">
		<div class="messagememberlist">
			<div class="mmllisttop">
				<div class="mmltitle">
					<span style="font-size: 20pt"><b>채팅</b></span>
					<div class="mmlbtnbox">
						<!-- <div class="mmlbtn">
							<span class="glyphicon glyphicon-option-horizontal"></span>
						</div> -->
						<div class="mmlbtn msgadd">
							<span class="glyphicon glyphicon-edit msgaddicon"></span>
						</div>
					</div>
				</div>
				<div class="messagesearch">
					<span class="glyphicon glyphicon-search"></span> <input type="text"
						placeholder="Messenger 검색">
				</div>
			</div>
			<div class="messagmember">
			</div>
		</div>

		<div class="messagechatlist">
			<div class="chatinfo">
				<c:if test="${recentgroup!=0 }">
					<div class="chatinfophoto" member_num="${otherInfo.user_num }">
						<c:if test="${otherInfo.user_photo==null }">
							<img alt="" src="/image/noimg.png">
						</c:if>
						<c:if test="${otherInfo.user_photo!=null }">
							<img alt="" src="/photo/${otherInfo.user_photo }">
						</c:if>
					</div>
					<span member_id="${otherInfo.user_id }">${otherInfo.user_name }</span>
				</c:if>
			</div>

			<div class="msgsearchuser"></div>

			<div class="chatlist">
				<div class="chatlistinfo">
					<c:if test="${recentgroup!=0 }">
						<div>
							<img alt="상대방 사진" src="">
						</div>
						<span class="chatlistinfoname"></span>
						<span class="chatlistinfoid"></span>
						<p class="chatlistinfofollow"></p>
					</c:if>
				</div>
				<div id="chatShow" class="chatShow">
					<!-- 채팅 보이는 구간 -->
				</div>
			</div>

			<div class="messagefilepreview"></div>

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
				<!-- 사진 올리기 -->
				<div class="chatupload">
					<input type="file" accept="image/jpeg,.png,.gif" id="msgfileupload" 
					style="display: none;"> 
					<i class="fa-regular fa-images chatuploadicon"></i>
				</div>
				<div class="chatinputbox">
					<input type="text" id="chatting" placeholder="채팅 입력"> <input
						type="hidden" id="receivernum" value="${otherinfo.user_num }">
					<input type="hidden" id="chatgroup" value="${recentgroup }">
				</div>
				<button onclick="send()" id="sendBtn">
					<i class="fa-regular fa-paper-plane"></i>
				</button>
			</div>
		</div>
	</div>
</body>
</html>