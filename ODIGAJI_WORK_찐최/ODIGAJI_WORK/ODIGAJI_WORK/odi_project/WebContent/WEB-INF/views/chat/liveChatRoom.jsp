<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="odi_project.chat.model.vo.Chat, odi_project.chat.model.vo.ChatRoom, java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	List<Chat> chatList = (List<Chat>) session.getAttribute("chatList");
// 	List<Message> msgList = (List<Message>) session.getAttribute("msgList");

// Add more properties as needed
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 파비콘 -->
<link rel="shortcut icon" href="./images/tomorrow1.gif">
<title>Odigaji</title>

<!--브라우저 스타일 초기화-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap"
	rel="stylesheet" />
<!--Google Material Icons-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<!-- sidebar open/close Icon -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- login icon -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- my page icon -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<!-- heart icon -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- chat icon -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- chat group icon -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!-- css -->
<link rel="stylesheet"
	href="./source/style/css/ejun.css/liveChatRoom.css">
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<!--HEADER-->
	<jsp:include page="../common/header.jsp" />


	<!--LEFT SIDEBAR 채팅창-->
	<div class="inner">
		<div class="left-sidebar"></div>
	</div>

	<!-- main chat 채팅방 목록 -->



	<div class="inner"></div>


	<div class="page-name">실시간 채팅</div>



	<div class='outer'
		style="margin-left: 20%; margin-right: 20%; height: 500px;">
		<br>
		<h1 align="center">채팅</h1>
		<br>

		<div id="msgContainer">
			<input name="chatKey" id="chatKey" value='${chatKey}'>
			<input type='hidden' name="memberId" id="sender" size="10" value="${loginUser.memberId}"> 
			<input type="text" id="msg" placeholder="전송할 메세지">
			<button onclick="sendMsg()" type="submit">전송</button>
		</div>
		<div>
		<c:forEach var="msgList" items="${msgList}">
			<p>${msgList.memberId}</p>
			<p>${msgList.content}</p>		
		</c:forEach>
		</div>

	</div>

	<script>
		// 웹소켓 서버에 연결하기
		// WebSocket객체 생성하기  192.168.30.169 //cmd 창에 ipconfig 치면 나옴

		const socketAddress = "ws://192.168.130.10:8081<%=request.getContextPath()%>/chatting.do"; 
		let socket = new WebSocket(socketAddress);
		socket.onopen = function(e){
			console.log("웹 소켓 접속 성공");
		}
		
		socket.onmessage = function(e){
			console.log('메세지 수신됨' , e);
			
			const msg = JSON.parse(e.data); //jsonobject로 전달된 메세지 파싱
			if(msg["memberId"] == '${loginUser.memberId}'){
				$("#msgContainer").append($("<p>").text("["+msg["memberId"]+"]" + msg["content"]).css("text-align","right"))
			}else{
				$("#msgContainer").append($("<p>").text("["+msg["memberId"]+"]" + msg["content"]).css("text-align","left"))
			}
		}
		
		socket.onclose = function(e){
			setTimeout(function(){
				socket = new WebSocket(socketAddress);
			}, 1000);
		}
		const sendMsg = () => {
			const msg = {
				content : $("#msg").val(),
				memberId : '${loginUser.memberId}',
				chatKey : '${chatKey}'
			}
			socket.send(	JSON.stringify(msg)		); 
		}
		
		
	</script>




	<!--FOOTER-->
	<footer>
		<div class="inner">
			<div class="items">
				<div class="item">
					<!--회사 설명-->
					<p>회사 설명</p>
					<p>asdsad</p>
					<p>asdad</p>
				</div>
				<div class="item">
					<!--회사 정보-->
					<p>회사 정보</p>
					<p>asda</p>
					<p>sadsadasdsada</p>
				</div>
				<div class="item">
					<p>근무 시간 정보</p>
					<!--근무시간 정보-->
					<p>sada</p>
					<p>adssad</p>
					<p>asdsad</p>
				</div>
			</div>


		</div>
	</footer>
</body>
</html>