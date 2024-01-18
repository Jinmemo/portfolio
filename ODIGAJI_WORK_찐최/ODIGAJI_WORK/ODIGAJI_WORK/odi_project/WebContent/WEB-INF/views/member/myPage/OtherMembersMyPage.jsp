<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>

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
   <!--HEADER-->
  <jsp:include page="../../common/header.jsp" />

<main>
   		 <div class="mypage"><a href="#">${fwList[0].memberName }님의 마이페이지</a></div>

  
    <section class="profileSection">   <!-- form -->
          <article class="profile">
              <div class="profile-image-div">
                  <img class="profile-image" src="https://m.pixelstore.kr/web/upload/jwgimg_m/right_category_bt.png" alt="프로필 이미지">
                  <!-- <img class="profile-image" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA2MDJfMzEg%2FMDAxNjg1Njk5NTYyNzcy.RC_mRT62FiirdFE7UEZrvDDlhyH-jXweMjgW-OqJx7Ig.t2HOJUoxkufwGej2HpJtF13TtfP0_o8DjNHEdybusAog.JPEG.itsallaboutsia%2FIMG_9643.JPG&type=sc960_832" 
                  alt="프로필 이미지">-->
              </div>
              
              <ul class="profile-ul">
              	  <li name="name"> 이름 : ${fwList[0].memberName} </li>
              	  <c:choose>
              	  	<c:when test="${fwList[0].gender eq 'M'}">
              	  		<li name="gender"> 성별 : 남자 </li>
              	  	</c:when>
              	  	<c:otherwise>
            	  		<li name="gender"> 성별 : 여자 </li> 
              	  	</c:otherwise>
              	  </c:choose>
					
				  <!-- 생년월일 계산 -->
                  <c:set var="birthYear" value="${fwList[0].memberNo.substring(0,2)}" />
				  <c:set var="birthMonth" value="${fwList[0].memberNo.substring(2,4)}" />
				  <c:set var="birthDay" value="${fwList[0].memberNo.substring(4,6)}" />
				
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
              	 ${fwList[0].aboutMe}
              </p>
          </article>
    </section>
  
</main>





    
</body>
</html>