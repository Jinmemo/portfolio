<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="odi_project.member.model.vo.Member"%>
<%
	Member idfind = (Member) session.getAttribute("idfind");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디/비밀번호 찾기</title>
<link rel="stylesheet" href="source/style/css/gun.css/idfind.css">
<!-- <script src="js/idfind.js"></script> -->
<script src="source/js/loginjs/idfind.js"></script>
</head>

<body>

	<!-- 헤더 영역 -->
	<jsp:include page="../../common/header.jsp" />

	<br>
	<br>

	<!-- 메인 컨텐츠 영역 -->
	<main>

		<!-- 탭 컨테이너 -->
		<div class="tab-container">
            <a href="#" class="tab password" >비밀번호 찾기</a>
        </div>
        
        <!-- 회원에게 정보 받고, 새 비밀번호 입력 창으로 이동, => passChange.jsp -->
        
		<form action="${pageContext.request.contextPath}/changepwd.me"method="post">
		<!-- 비밀번호 찾기 컨텐츠 -->
		<div id="idContent" class="content active">
    <div class="form-group">
        <label for="password">ID 입력</label> 
        <input type="text" id="memberId" name="memberId">
    </div>
    <div class="form-group">
        <label for="password">이름</label> 
        <input type="text" id="memberName" name="memberName">
    </div>
    <div class="form-group">
        <label for="password">이메일 주소</label>
       <input type="text" id="dobPassword" name="email">
    </div>
    <div class="form-group">
        <button type="submit">다음</button>
    </div>
</div>
			</form>

	</main>

	<!-- 푸터 영역 -->
	<footer>
		<p>&copy;푸터</p>
	</footer>

</body>

</html>