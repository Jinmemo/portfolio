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

<!--브라우저 스타일 초기화-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
<!--Google Fonts - 나눔고딕-->
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap"
	rel="stylesheet" />
<!--Google Material Icons-->
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

<!-- css -->
<link rel="stylesheet" href="./source/style/css/ensun.css/basicTool.css">
<link rel="stylesheet" href="./source/style/css/jin.css/commonboardlistview.css">
</head>
<body>

	<jsp:include page="../../common/header.jsp" />

	<div class="container">

		<div class="mainthema">
			<h1>공지사항 게시판</h1>
		</div>
		<c:if test="${not empty loginUser.memberId}">
			<div class="write-area">
				<a href="noticeform.bo"><button class="writeButton">글작성</button></a>
			</div>
		</c:if>
		

		<div class="listarea">
			<table class="list-area">
				<thead class="list-area_thead">
					<tr>
						<th width="200">글번호</th>
						<th width="400">제목</th>
						<th width="200">작성자</th>
						<th width="200">조회수</th>
						<th width="200">작성일</th>
					</tr>
				</thead>
				<tbody class="list-area_tbody">
					<c:forEach var="b" items="${noticeList}">
						<tr onclick='location.href = "noticedetail.bo?bno=${b.boardNo}"'>
							<td>${b.boardNo }</td>
							<td>${b.boardTitle }</td>
							<td>${b.memberId }</td>
							<td>${b.count }</td>
							<td>${b.createDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="bottom-area">

			<div class="paging-area">
				<c:if test="${pi.currentPage ne 1 }">
					<a href="${url}?currentPage=${pi.currentPage-1 }"><img src="./source/style/img/jinimg/free-icon-back-7587081.png"></a>
				</c:if>

				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
					<a href="${url}?currentPage=${p }">[${p}]</a>
				</c:forEach>

				<c:if test="${pi.currentPage ne pi.maxPage }">
					<a href="${url}?currentPage=${pi.currentPage+1 }"><img src="./source/style/img/jinimg/free-icon-next-7587130.png"></a>
				</c:if>

				<div class="common-paging-area" id="paging-area">
					<c:url
						value="${empty condition ? 'noticelist.bo' : 'noticeBoardSearch.bo' }"
						var="url">
						<!--condition 값이 비어있다면 list.bo- 기본페이지 , search.bo- 검색 시 페이지 -->
						<c:param name='condition' value='${condition }' />
						<c:param name='keyword' value='${keyword }' />
					</c:url>
				</div>
			</div>


			<div class="search-area">
				<form action="boardSearch.bo" method="get">
					<input type="hidden" name="currentPage" value="1" /> <select
						name="condition">
						<!-- 						<option value="writer">작성자</option> -->
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select> <input type="text" name="keyword" id="keyword" value=""
						placeholder="검색할 내용을 입력해주세요.">
					<button id="searchbtn">검색</button>
				</form>
			</div>

		</div>
		</div>

	<!--FOOTER-->
   <footer style = "bottom : -300px; width : 100%" >
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
  </footer>
 
 
		<script>
	$(function(){
		// 검색하고 페이지 이동 시 selected속성 추가하기 위한 것
		const condition = '${condition}'; // 'writer', 'title', 'content'
		
		if(condition){ //condition 값이 있으면 option 선택되게 속성 적용 
			$("#search-area option[value=${condition}]").attr("selected",true); 
		}
	</script>
</body>
</html>