<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="odi_project.member.model.vo.Member"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디/비밀번호 찾기</title>
<link rel="stylesheet" href="source/style/css/gun.css/idfind.css">
<!-- <script src="js/idfind.js"></script> -->
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

</head>

<body>

	<!-- 헤더 영역 -->
	<header>
		<jsp:include page="../../common/header.jsp" />
	</header>

	<br>
	<br>

	<!-- 메인 컨텐츠 영역 -->
	<main>

		<!-- 탭 컨테이너 -->
		<div class="tab-container">
			<a href="#" class="tab active id" onclick="showContent('id')">새비밀번호
				찾기</a>
		</div>

		<form action="${pageContext.request.contextPath}/recover.me"method="post">
			<!-- 아이디 찾기 컨텐츠 -->
		
			<div id="idContent" class="content active">
				<div class="form-group">
					<label for="password">새 비밀번호 입력</label> 
					<input type="password" id="memberPwd" name="memberPwd">
				</div>
				<div class="form-group">
				  <label for="password">비밀번호 확인</label>
				  <input type="password" id="memberPwdCheck" name="memberPwdCheck">
					</div>
				<div class="form-group">
					<button type="submit">로그인페이지로 이동</button>
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