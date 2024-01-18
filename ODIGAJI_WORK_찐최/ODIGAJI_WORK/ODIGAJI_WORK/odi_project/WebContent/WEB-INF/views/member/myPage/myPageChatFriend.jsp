<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="odi_project.member.model.vo.Member" %>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	Member loginUser = (Member) request.getAttribute("loginUser");
%>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>

<%
// 	if (loginUser != null) {
// // 		주민등록번호에서 생년월일 추출
// 		String birthYear = loginUser.getMemberNo().substring(0, 2);
// 		int birthMonth = Integer.parseInt(loginUser.getMemberNo().substring(2, 4));
// 		int birthDay = Integer.parseInt(loginUser.getMemberNo().substring(4, 6));
		
// // 		1900년대 생인 경우
// 		if (Integer.parseInt(birthYear) >= 00 && Integer.parseInt(birthYear) <= 24) {
// 		 birthYear = "20" + birthYear;
// 		}
// // 		2000년대 생인 경우
// 		else {
// 		 birthYear = "19" + birthYear;
// 		}
		
// 		int birthYearInt = Integer.parseInt(birthYear);
		
// 		Calendar current = Calendar.getInstance();
// 		int currentYear  = current.get(Calendar.YEAR);
// 		int currentMonth = current.get(Calendar.MONTH) + 1;
// 		int currentDay   = current.get(Calendar.DAY_OF_MONTH);
// 		int age = currentYear - birthYearInt;
// // 		생일 안 지난 경우 -1
// 		if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay) age--;

// 	}

%>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지_채팅방</title>

    <!-- 파비콘 -->
    <link rel="shortcut icon" href="./images/tomorrow1.gif">

    <!--브라우저 스타일 초기화-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
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

    <!-- basic css -->
    <link rel="stylesheet" href="./source/style/css/ensun.css/basicTool.css">
    <!-- wishlist css -->
    <link rel="stylesheet" href="./source/style/css/hyeon.css/myPageChatFriend.css">

    <!--Google Fonts - 나눔고딕-->
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />

    <!-- Delete icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="./source/js/hyeon.js/myPageChatFriend.js"></script>

  </head>


<body>

  <jsp:include page="../../common/header.jsp" />
 

<main>
   		 
   		 
   		 <div class="mypage"><a href="#">마이페이지</a></div>

  
    <section class="profileSection">   <!-- form -->
          <article class="profile">
              <div class="profile-image-div">
                  <img class="profile-image" src="https://m.pixelstore.kr/web/upload/jwgimg_m/right_category_bt.png" alt="프로필 이미지">
                  <!-- <img class="profile-image" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA2MDJfMzEg%2FMDAxNjg1Njk5NTYyNzcy.RC_mRT62FiirdFE7UEZrvDDlhyH-jXweMjgW-OqJx7Ig.t2HOJUoxkufwGej2HpJtF13TtfP0_o8DjNHEdybusAog.JPEG.itsallaboutsia%2FIMG_9643.JPG&type=sc960_832" 
                  alt="프로필 이미지">-->
              </div>
              
              <ul class="profile-ul">
              	  <li name="name"> 이름 : ${loginUser.memberName } </li>
              	  <c:choose>
              	  	<c:when test="${loginUser.gender eq 'M'}">
              	  		<li name="gender"> 성별 : 남자 </li>
              	  	</c:when>
              	  	<c:otherwise>
            	  		<li name="gender"> 성별 : 여자 </li> 
              	  	</c:otherwise>
              	  </c:choose>
					
				  <!-- 생년월일 계산 -->
                  <c:set var="birthYear" value="${loginUser.memberNo.substring(0,2)}" />
				  <c:set var="birthMonth" value="${loginUser.memberNo.substring(2,4)}" />
				  <c:set var="birthDay" value="${loginUser.memberNo.substring(4,6)}" />
				
				  <c:choose>
				    <c:when test="${birthYear ge '00' and birthYear le '24'}">
				        <li name="age"> 생년월일 :  20${birthYear}년 ${birthMonth}월 ${birthDay}일 </li>
				    </c:when>
				    <c:otherwise>
				        <li name="age"> 생년월일 :  19${birthYear}년 ${birthMonth}월 ${birthDay}일 </li>
				    </c:otherwise>
				  </c:choose>
			
				  
                
              </ul>
          </article>
          <article> 
              <p class="introduction">
              	${loginUser.aboutMe }
              </p>
          </article>
    </section>

    <section class="chatRoomSection">
        <hr>
        <subject class="chatRoomSection-content">
          <div class="chatRoomCount">
            <label><input type="radio" name="myPageChatAccompany" class="chatRoom-partic" checked ><span class="custom-radio">참여중인 채팅방
            <div class="chat-room-count">0</div></label></span>
            
          </div>
          <div class="chatRoomCount">
            <label><input type="radio" name="myPageChatAccompany" id="chatRoomCount-accompany" class="chatRoomCount-accompany" ><span class="custom-radio">동행 수락 대기
            <div class="accompany-room-count">0</div></span></label>
          </div>
        </subject>
        <hr>
        <article class="chat-rooms" >
          <div class="chat-room">
              <div>5명 참여 중</div> 
              <div>여수 밤바다 보러가실 분?</div>
              <div class="chatNew">3</div>
          </div>
          <div class="chat-room">
              <div>3명 참여 중</div>
              <div>힘들다</div>
              <div class="chatNew">2</div>
          </div>
          <div class="chat-room">
              <div>10명 참여 중</div>
              <div>아무나 환영</div>
              <div class="chatNew">NEW</div>
          </div>
        </article>
        <article class="accompany-rooms" hidden>
          <c:forEach var="fw" items="${fwList}">
         
		<form action="${pageContext.request.contextPath}/otherMembersMyPage.me" method="post" id="otherMembersForm${fw.withNo}">
         	<input type="hidden" name="memberId" value="${fw.memberId}" />
			<input type="hidden" name="memberName" value="${fw.memberName}" />
			<input type="hidden" name="memberNo" value="${fw.memberNo}" />
			<input type="hidden" name="aboutMe" value="${fw.aboutMe}" />
			<input type="hidden" name="gender" value="${fw.gender}" />
			<div class="accompany" > 
              <img class="profile-image-accompany" src="https://cdn-icons-png.flaticon.com/128/149/149071.png" alt="프로필 이미지">
                    <a href="#" onclick="document.getElementById('otherMembersForm${fw.withNo}').submit();">
                        ${fw.memberName}
                    </a>
			  <div class="friend-content">${fw.friendTitle }</div>
			  
	          
	          <button type="button" class="acceptBtn" id="${fw.withNo}">수락</button>
	          
	          <button type="button" class="cancelBtn" id="${fw.withNo}" >취소</button>
          </div>
          </form>
          </c:forEach>
        </article>
         
    </section>
    
  
</main>



<script>
	$(document).ready(function() {
		// 동행 수락 대기 버튼 클릭시 서버로 전송
// 		$("#chatRoomCount-accompany").click(function(){
// 	        $.ajax({
// 	            type: 'POST',
// 	            url: '${pageContext.request.contextPath}/myPageFriendAcDe.me',
// 	            data: { memberId : '${loginUser.memberId}'}
// 	        	,
// 	            success: function(response) {
// 	                console.log(response);
// 	            },
// 	            error: function(error) {
// 	                console.error(error);
// 	            }
// 	        });
// 	    });
		
		// 수락버튼 클릭시 서버로 전송
	   $('.acceptBtn').on('click', function() {
		   var withNo = $(this).closest('.acceptBtn').attr('id')

	        // 알람 띄우기
	        var confirmation = confirm('동행을 수락하시겠습니까?');
			
	        if (confirmation) {
	            // 확인을 눌렀을 때의 처리
	            $.ajax({
	                type: 'POST',
	                url: '${pageContext.request.contextPath}/myPageAcceptBtn.me',
	                data: {
	                    withNo: withNo
	                },
	                success: function(result) {
	                    console.log(result);
	                    location.reload(true);
	                },
	                error: function(error) {
	                    console.error('비동기 통신 실패');
	                    location.reload(true);
	                }
	            });
	        }
	    });
		
		
		// 취소버튼 클릭시 서블릿 이동
	    $('.cancelBtn').on('click', function() {
	        var withNo = $(this).closest('.cancelBtn').attr('id');
			
	        var confirms = confirm('동행을 취소하시겠습니까?');
	        
	        // 여기서 서블릿으로 이동하는 AJAX 요청을 보냄
	        
	        if (confirms) {
		        $.ajax({
		            type: 'POST',
		            url: '${pageContext.request.contextPath}/deleteMyPageAccept.me',
		            data: {
		                withNo: withNo
		            },
		            success: function(result) {
		                console.log(result);
		                location.reload(true);
		            },
		            error: function(error) {
		                console.error('비동기 통신 실패');
		                location.reload(true);
		            }
		        });
	        }
	    });

	});	
	
		
</script>

    
</body>
</html>