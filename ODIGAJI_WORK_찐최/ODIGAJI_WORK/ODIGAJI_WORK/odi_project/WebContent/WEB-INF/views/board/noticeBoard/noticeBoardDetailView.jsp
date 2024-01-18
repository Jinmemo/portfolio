<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 파비콘 -->
<link rel="shortcut icon" href="./images/tomorrow1.gif">
<title>Odigaji</title>

<!-- 브라우저 스타일 초기화 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
<!-- Google Fonts - 나눔고딕 -->
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap"
	rel="stylesheet" />
<!-- Google Material Icons -->
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

<!-- CSS -->
<link rel="stylesheet" href="./source/style/css/ensun.css/basicTool.css">
<link rel="stylesheet" href="./source/style/css/jin.css/detailview.css">
<style>
/* 모달 스타일 */
.modal {
	display: none; /* 처음에는 숨겨져 있음 */
	position: fixed; /* 고정 위치 */
	z-index: 1; /* 최상위에 배치 */
	left: 0;
	top: 0;
	width: 100%; /* 전체 너비 */
	height: 100%; /* 전체 높이 */
	overflow: auto; /* 스크롤 가능하게 설정 */
	background-color: rgba(0, 0, 0, 0.5); /* 약간의 투명한 검은색 배경 */
}

/* 모달 내용 */
.modal-content {
	background-color: #fefefe;
	margin: 10% auto; /* 위에서 10% 내리고 가운데 정렬 */
	padding: 20px;
	border: 1px solid #888;
	width: 30%; /* 화면 크기에 따라 조절 가능 */
}

.modal-content textarea {
	resize: none;
	width: 100%;
	height: 100px;
}

/* 닫기 버튼 */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>

<body>
	<jsp:include page="../../common/header.jsp" />
	
	<div class="container">
		<div class="mainthema">
			<h1>공지사항 게시판</h1>
		</div>

		<hr>

		<div class="head">
			<div class="head_title">
				<p class="title">${b.boardTitle}</p>
			</div>
			<div class="headinfo">
				<div class="writer">
					<h5>${b.memberId}</h5>
				</div>
				<div class="createdate">
					<h5>${b.createDate}</h5>
				</div>
				<div class="viewctn">
					<h5>${b.count}</h5>
				</div>
				<c:if test="${b.memberId.equals(loginUser.memberId)}">
					<div class="boardCtrl">
						<form action="noticeUpdateForm.bo" method="get" style="margin-right: 2px;">
							<input type="hidden" name="bno" value="${param.bno }">
							<button>수정</button>
						</form>

						<form action="noticeBoardDelete.bo" method="post">
							<input type="hidden" name="bno" value="${param.bno }">
							<button>삭제</button>
						</form>
					</div>
				</c:if>
			</div>
			<hr>
		</div>

		<div class="middle">
			<div class="content">
				<h6>글내용</h6>
			</div>
			<div class="content_view">
				<p>${b.boardContent}</p>
			</div>
		</div>

		<div class="last">
			<div class="reply">
				<h6>댓글내용</h6>
			</div>
			<div class="reply_view">
				<c:set var="list" value="${b.list}" />
				<table class="replyTable" align="center" border="1">
					<form action="noticeInsertReply.bo" method="post">
						<input type="hidden" name="memberId" value="${loginUser.memberId}">
						<tr>
							<th width="100">댓글작성</th>
							<th width="400" colspan="2"><textarea name="replyContent"></textarea></th>
							<th width="100"><button class="replySubmitButton"
									type="submit">등록</button></th>
						</tr>
						<input type="hidden" name="boardNo" value="${b.boardNo}">
						<c:if test="${not empty loginUser.memberId}">
							<input type="hidden" name="memberId"
								value="${loginUser.memberId}">
						</c:if>
					</form>

					<tr>
						<td>아이디</td>
						<td>댓글내용</td>
						<td width="150">댓글작성일</td>
						<td colspan="2"><b>댓글(${list.size()})</b></td>
					</tr>

					<c:choose>
						<c:when test="${not empty list}">
							<c:forEach var="reply" items="${list}">
								<tr>
									<td>${reply.memberId}</td>
									<td>${reply.replyContent}</td>
									<td>${reply.createDate}</td>
									<td style="display: flex;">
									<c:if test="${reply.memberId.equals(loginUser.memberId)}">
											<div class="updateReply">
												<button class="replyButton" data-reply-no="${reply.replyNo}"
													data-reply-content="${reply.replyContent}"
													onclick="openUpdateModal(this)">수정</button>
											</div>
											<div class="deleteReply">
												<form action="noticeDeleteReply.bo" name="deleteReply"
													method="post">
													<input type="hidden" name="bno" value="${param.bno }">
													<input type="hidden" name="replyNo"
														value="${reply.replyNo}">
													<button type="submit" class="replyButton">삭제</button>
												</form>
											</div>
										</c:if>
										</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4"><b>댓글이 없습니다.</b></td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</div>
	</div>

<!--FOOTER-->
<!--   <footer style = "bottom : -350px; width : 100%" >
    <div class="inner">
      <div class="items">
        <div class="item"> 회사 설명
          <p>오디가지</p>
          <p>(주)오디가지 대표이사: 오딩이</p>
          <p>대표전화 : 1544-9970</p>
          <p>FAX : 02-599-3111</p>

        </div>
        <div class="item"> 회사 정보
          <p>회사 정보</p>
          <p>주소: 서울특별시 강남구 테헤란로10길 9 그랑프리 빌딩</p>
          <p>사업자등록번호: 851-87-00622</p>
          <p>호스팅 업체: (주)KH정보교육원</p>
        </div>
        <div class="item">
          <p>상담시간 안내</p> 근무시간 정보
          <p>평일 09:00 - 18:00 </p>
          <p>(토/일요일 및 공휴일 휴무)</p>
          <p></p>
        </div>
      </div>
    </div>
  </footer> -->

	<script>
		function openUpdateModal(button) {
			var replyNo = button.getAttribute('data-reply-no');
			var replyContent = button.getAttribute('data-reply-content');
			document.getElementById('updateModal').style.display = 'block';
			document.getElementById('replyNoInput').value = replyNo;
			document.getElementById('replyContentTextarea').value = replyContent;
		}

		function closeModal() {
			document.getElementById('updateModal').style.display = 'none';
		}
	</script>

	<!-- 모달 창 위치 수정 -->
	<div id="updateModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<h2>댓글 수정</h2>
			<form action="noticeUpdateReply.bo" method="post" name="updateForm">
				<input type="hidden" name="bno" value="${param.bno }"> <input
					type="hidden" name="replyNo" id="replyNoInput">
				<textarea name="replyContent" id="replyContentTextarea" rows="4"
					cols="50"></textarea>
				<br> <input type="submit" value="수정">
			</form>
		</div>
	</div>
</body>
</html>
