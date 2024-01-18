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
            <a href="#" class="tab active id" >아이디 찾기</a>
        </div>
        
        
		<form action="${pageContext.request.contextPath}/idfind.me"method="post">
			<!-- 아이디 찾기 컨텐츠 -->
			<%
				if (idfind == null) {
			%>
			<div id="idContent" class="content active">
				<div class="form-group">
					<label for="name">이름</label> <input type="text" id="memberName"
						name="memberName">
				</div>
				<div class="form-group">
					<label for="email">이메일 주소</label> <input type="email" id="email"
						name="email">
				</div>
				<div class="form-group">
					<label for="verificationCode">핸드폰 번호</label> <input type="text"
						id="phone" name="phone">
					<button type="submit">다음</button>
				</div>
			</div>
			<%
				} else {
			%>
			<div id="idResultSection" class="content active">
				<label for="memberId">찾으시는 아이디</label> <input type="text"
					id="memberId" name="memberId" value="<%=idfind.getMemberId()%>"
					readonly style="font-weight: bold;">
				<!-- 로그인 페이지로 이동 버튼 추가 -->
				<button type="button" onclick="redirectToLoginPage()">로그인페이지로 이동</button>
			</div>
			<!-- JavaScript 코드 추가 -->
			<script>
				function redirectToLoginPage() {
					// 로그인 페이지로 이동
					window.location.href = '${pageContext.request.contextPath}/login.me';
				}
			</script>
			<%
				}
			%>
		</form>


		

	</main>

	<!-- 푸터 영역 -->
	<footer>
		<p>&copy;푸터</p>
	</footer>

</body>

</html>