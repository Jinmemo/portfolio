<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="odi_project.member.model.vo.Member"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	Member loginUser = (Member) request.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<!-- 메타 태그 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 페이지 제목 -->
<title>마이페이지</title>
<link rel="stylesheet" href="./source/style/css/gun.css/mypage.css">
<link rel="stylesheet" href="./source/style/css/gun.css/singup.css">
<!-- jquery -->
<script type="text/javascript" src="/js/jquery-1.11.3.min.js"></script>
<script src="source/js/loginjs/address.js"></script>
<!-- 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="source/js/loginjs/singup.js"></script>
    
</head>
<body>

	<!-- 헤더 -->
	<header>
		<h1>회원 수정페이지</h1>
	</header>

	<br>
	<br>

	<!-- 회원가입 폼 -->
	<form action="${pageContext.request.contextPath}/update.me" id="idCheck" method="post">

		<!-- 이름 입력 부분 -->
		<label for="memberName">이름</label> 
		<input type="text" id="memberName" name="memberName" value="<%=loginUser.getMemberName()%>"  style="font-weight: bold;">

		<!-- 휴대폰 입력 부분 -->
		<label for="phone">휴대폰</label> 
		<input type="tel" id="phone" name="phone" value="<%=loginUser.getPhone()%>"  style="font-weight: bold;">

		 <!-- 이메일 입력 부분 -->
        <label for="ssn">이메일</label>
        <div id="emailContainer">
            <input type="text" id="emailPrefix" name="emailPrefix" value="${fn:split(loginUser.email, '@')[0]}" placeholder="이메일 앞 부분" style="font-weight: bold;">
            <!-- @ 기호 표시 -->
            <span id="atSymbol">@</span>
            <!-- 이메일 도메인 입력란 -->
            <input type="text" id="emailSuffix" name="emailSuffix" value="${fn:split(loginUser.email, '@')[1]}" placeholder="도메인"  style="font-weight: bold;">
        </div>

		<!-- 주소 입력 부분 -->
		<label for="address">주소</label> <br> 
        <input type="text" id="postcode" name="postcode" placeholder="우편번호" value="${fn:split(loginUser.address, ',')[0]}"  style="font-weight: bold;">
        <button id="openAddressPopup" type="button"  onclick="execDaumPostcode()" value="우편번호 찾기">우편번호 찾기</button>
		<input type="text" id="address" name="address" value="${fn:split(loginUser.address, ',')[1]}" style="font-weight: bold;"><br>
		<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" value="${fn:split(loginUser.address, ',')[2]}"  style="font-weight: bold;"><br> 
		<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목" value="${fn:split(loginUser.address, ',')[3]}" style="font-weight: bold;">


		<!-- 자기소개 입력 부분 -->
		<label for="introduction">자기소개</label>
		<textarea id="aboutMe" name="aboutMe"  style="font-weight: bold;"><%=loginUser.getAboutMe()%></textarea>

		<!-- 가입하기 버튼 -->
		<div class="link-container">
		
			<button type="submit" class="link" id="btn_2" name="buttonType" value="memberdelete">수정하기</button>
		</div>


		<!-- 회원정보 수정 눌러야만 마이페이지에서 수정할 수 있게 개발,
             채팅방 가면 누르면 채팅방 htm 이동,
            회원탈퇴 누르면 db에서 삭제 시키고 alert 띄우고 메인페이지 이동   -->
		<br>
	</form>
	<br>
	<br>

	<!-- 푸터 -->
	<footer>
		<p>&copy;</p>
	</footer>

</body>

</html>