<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.login-area a{
		text-decoration : none;
		color : black;
		font-size : 12px;
	}
	
	.nav-area{
		background : pink;
		color : white;
		height : 50px;
	}
	
	.menu{
		display : table-cell;
		width : 250px;
		height : 50px;
		vertical-align : middle;
		font-size : 20px;
		font-weight: bold;
	}
	
	.menu:hover{
		background : darkgray;
		cursor : pointer;
	}
	
	.outer{
		width : 900px;
		background : pink;
		color : white;
		margin : auto;
		margin-top : 50px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!--자바쿼리-->
</head>
<body>
	<script>
		window.onload=function(){
			const msg = "${alertMsg}"; // "", "로그인실패"
			if(msg){
				alert(msg);
				<c:remove var="alertMsg"/>
			}
		}
		
	</script>
	<h1 align='center'>Welcome to MyBatis</h1>
	<br>
	<div class='login-area' align='right'>
		<c:choose>
			<c:when test="${empty loginUser }">
				<!-- case 1. 로그인 전 -->
				<form action='login.me' method='post'>
					<table>
						<tr>
							<td>아이디</td>
							<td><input type="text" name='userId' required></td>
							<td rowspan='2'><button style='height:50px;'>로그인</button></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="userPwd" required></td>
						</tr>
						<tr>
							<td colspan='3' align='center'>
								<a href="insert.me">회원가입</a> |
								<a href="">ID/비밀번호 찾기</a>
							</td>
						</tr>
					</table>
				</form>
			</c:when>
			<c:otherwise>
			<!-- case2. 로그인 후 -->
				<div>
					<table>
						<tr>
							<td colspan="2">
								<h3>${loginUser.userName}님 환영합니다 ^^</h3>
								<h3>${loginUser.email }</h3>
							</td>
						</tr>
						<tr>
							<td>마이페이지</td>
							<td>로그아웃</td>
						</tr>
					</table>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	
	<br>
	
	<div class="nav-area" align="center">
		<div class="menu">HOME</div>
		<div class="menu" onclick='location.href="chat"'>채팅</div>
		<div class="menu" onclick='location.href="list.bo?currentPage=1"'>게시판</div>
		<div class="menu">etc</div>
	</div>
	
</body>
</html>