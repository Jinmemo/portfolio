<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="odi_project.member.model.vo.Member, odi_project.chat.model.vo.Chat, java.util.List" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%
	Member loginUser = (Member) request.getAttribute("loginUser");
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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />
  <!--Google Material Icons-->
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
  <!-- sidebar open/close Icon -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <!-- login icon -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <!-- my page icon -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
  <!-- heart icon -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <!-- chat icon -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <!-- chat group icon -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

  <!-- css -->
    <link rel="stylesheet" href="./source/style/css/ejun.css/liveChat.css">
      <script src="./source/js/ejun.js/liveChat.js"></script>
  <script defer ></script>
  <!-- jquery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <!-- js -->
  <script defer src="js/liveChat.js"></script>
</head>
<body>

	<!--HEADER-->
	<jsp:include page="../common/header.jsp" />



	<!--LEFT SIDEBAR 채팅창-->
	<div class="inner">
		<div class="left-sidebar"></div>
	</div>



	<!-- main chat 채팅방 목록 -->
	<div class="inner">
		<div class="page-name">실시간 채팅</div>
		<div class="main-chat-area">

			<div>
			<c:forEach var="chat" items="${chatList}">
				<div class="chat-room" name="chatKey"
					onclick="openLiveChatRoom(${chat.chatKey}, '${chat.chatName}', '${chat.memberName}')">
					<span class="material-symbols-outlined">group</span>
					<div class="chat-room-name" name="chatName">${chat.chatName}</div>
					<div class="new" name="memberName" style="display: block;">${chat.memberName}</div>
				</div>
			</c:forEach>
			</div>
			
			<form action="${pageContext.request.contextPath}/ChatInfo"
				method="post" id='chatForm'>
				<input type="hidden" name='chatKey' value=""> <input
					type="hidden" name='chatName' value=""> <input
					type="hidden" name='memberName' value="">
			</form>

			<script>
	function openLiveChatRoom(chatKey, chatName, memberName) {
        // AJAX를 통해 서버로 해당 채팅의 정보를 요청
        
        [...document.querySelector("#chatForm").children].forEach((e)=> {
        	if(e.name == 'chatKey') e.value = chatKey
        	else if(e.name == 'chatName')  e.value = chatName
        	else if(e.name == 'memberName') e.value = memberName
        })
        document.querySelector("#chatForm").submit();        
    }
    // 스크롤 동작을 변경하지 않고 추가된 채팅방이 보일 수 있도록 마지막 채팅방으로 이동
    function scrollToLastChat() {
      var mainChatArea = document.getElementById('main-chat');
      var lastChat = mainChatArea.lastElementChild;
      lastChat.scrollIntoView({ behavior: "smooth", block: "end" });
    }
    // DOMContentLoaded 이벤트 발생 시 새로운 채팅방으로 이동
    document.addEventListener('DOMContentLoaded', scrollToLastChat);
	</script>

		</div>
		<!-- main-chat-area -->
	</div>
	<!-- inner -->
  	
  	
	<div class="inner"><button class="create-chat-room" type="button" id="create-chat-room" onclick="createChatRoom()"> 채팅방 생성 </button></div>
	
	
  	<div class="inner">
  		<form action="${pageContext.request.contextPath}/chat.me" method="post">
    	<div class="create-chat-box" style="display:none;" id="create-chat-box">
      	<p>채팅방 이름</p>
      	<input type="text" id="chatName" name="chatName">
      	<button class="create-chat" name="" type="submit" id="create-chat">생성</button>
      	<button class="cancel" name="" id="cancel" onclick="  ">취소</button>
      	</div>
      	</form>
    </div> 																			<!-- create-chat-box -->
    
  
                                                                              










  <!--FOOTER-->
  <footer>
    <div class="inner">
      <div class="items">
        <div class="item"> <!--회사 설명-->
          <p>회사 설명</p>
          <p>asdsad</p>
          <p>asdad</p>
        </div>
        <div class="item"> <!--회사 정보-->
          <p>회사 정보</p>
          <p>asda</p>
          <p>sadsadasdsada</p>
        </div>
        <div class="item">
          <p>근무 시간 정보</p> <!--근무시간 정보-->
          <p>sada</p>
          <p>adssad</p>
          <p>asdsad</p>
        </div>
      </div>
    

    </div>
  </footer>
</body>
</html>