<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="odi_project.member.model.vo.Member"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%
	Member idfind = (Member) session.getAttribute("idfind");
%> 
   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="./source/style/css/gun.css/login.css">
    <link rel="stylesheet" href="./source/style/css/gun.css/mypage.css">
    <script src="./source/js/loginjs/iogin.js"></script> 
</head>
<body>

	<jsp:include page="../../common/header.jsp" />

    <div class="welcome-text">
        <h3>오디가지</h3>
        <hr>
        <h3>반갑습니다. 로그인 하고 더 큰 혜택을 즐기세요!</h3>
    </div>
    <!-- 서버랑 post로 통신하고 /login-->

    <form action="${pageContext.request.contextPath}/login.me" method="post">

        <div class="login-container">
            <div class="login-form">
 
                <!-- 아이디 입력창 및 이미지 -->
                <div class="login-input-container">
                    <img src="./source/style/img/loginimg/login.png" alt="로그인 이미지">
                    <!-- username으로 값 받기-->
                    <input type="text" id="memberId" name="memberId" class="login-input" placeholder="아이디">
                </div>

                <br>
                <!-- 비밀번호 입력창 및 이미지 -->
                <div class="login-input-container">
                    <img src="./source/style/img/loginimg/pass.png" alt="비밀번호 이미지">
                    <!-- password으로 값 받기-->
                    <input type="password" id="memberPwd" name="memberPwd" class="login-input" placeholder="비밀번호">
                </div>
                <br>
                <!-- 로그인 버튼 -->
                <button class="login-btn" type="submit">로그인</button>
                <br>
                <br>
                <!-- 아이디찾기, 비밀번호 찾기, 회원가입 링크 -->
                <div class="link-container">
                    <button type="submit" class="link" id="btn_2" name="buttonType" value="singup">회원가입</button>
                    <button type="submit" class="link" id="btn_2" name="buttonType" value="idfind">아이디찾기</button>
                    <button type="submit" class="link" id="btn_2" name="buttonType" value="passwordfind">비밀번호찾기</button>
                </div>
            </div>
        </div>
    </form>
    
    <c:if test="${not empty alertMsg}">
        <script>
            alert('${alertMsg}');
        </script>
    </c:if>

</body>

</html>