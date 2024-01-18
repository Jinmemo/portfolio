<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 파비콘 -->
<link rel="shortcut icon" href="./images/tomorrow1.gif">
<title>맛집&카페 페이지</title>

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

<!--  favorite icon -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!-- eye icon -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- css -->
<!-- basic css -->
<link rel="stylesheet" href="./source/style/css/ensun.css/basicTool.css">
<link rel="stylesheet" href="./source/style/css/ensun.css/detaildcview.css">

<!--Swiper-->
<link rel="stylesheet"
	href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>


</head>
<body>

 <jsp:include page="../../common/header.jsp" />


	<!-- 썸네일 -->
	<%-- <div class="mainbanner">
			<img src="${dc.thumbNail}" class="mainbanner">
		</div> --%>



<!--		<div class="maintheme">
			<a href="tfview.bo">
				<h1>여행지 & 축제</h1>
			</a>
		</div> -->

	<!-- 글 내용 -->
	<div class="container">

		<div class="mainbody">
			<!-- 식당 이름 -->
			<div class="maintheme">
				<a href="dcview.bo">
					<h1>＜ 맛집&카페</h1>
				</a>
			</div>

			<div class="title-area">
				<h1 class="maintitle">${dc.dinnerName}</h1>
				<h3 class="editDate">수정일 : ${dc.editDate}</h3>
			</div>

			<!-- 찜, 조회수 -->
			<div class="like_box">
				<button>
					<span class="material-symbols-outlined"> favorite </span> 
					<span class="count"> 5 </span>
				</button>
				<span class="material-symbols-outlined"> visibility </span> 
				<span class="count"> ${dc.reCount } </span>
			</div>

			<!-- 영업시간 -->
			<div class="timer-area">
				<span> 영업중 </span>
			</div>

			<div class="schedule">
				<c:choose>
					<c:when test="${dc.dinnerStartTime eq null }">
						<span> 상시영업 </span>
					</c:when>
					<c:otherwise>
						<span> 영업시간 : ${dc.dinnerStartTime} ~ ${dc.dinnerEndTime} </span>
					</c:otherwise>
				</c:choose>
			</div>

			<!-- 스와이프 이미지 -->
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<c:forEach var="image" items="${dc.dinnerImg }">
						<div class="swiper-slide">
							<img src="${image }">
						</div>
					</c:forEach>
				</div>
				<div class="swiper-button-next" id="swiper-button-next"></div>
				<div class="swiper-button-prev" id="swiper-button-prev"></div>
				<div class="swiper-pagination"></div>
			</div>

			<!--글내용  -->
			<div class="dc_content">
				<p>${dc.dinnerContent}</p>
			</div>


			<div class="editDateB"> 수정일 : ${dc.editDate}</div>
			<div class="inquiry">
				<p class="inquiryToggle">콘텐츠 등록 및 수정 문의</p>
				<span> ∨ </span>
			</div>
			<div class="inquiryNumber" style="display: none;">
				<p>ㆍ 오디가지 마케팅팀 : 010-1234-1234</p>
			</div>
			
			<div class="odicha">
				<img src=https://www.odii.kr/smarttour_web/resources/images/main/txt_search_ko.gif>
			</div>

			<!-- 검색 -->
			<form action="dcsearch.bo" method="get">
				<div class="head-keyword" id="search-area">
					<input type="text" name="keyword" id="keyword" placeholder="가고 싶은 식당 입력" value='${keyword }'> 
					<select class="head-category" id="head-category" name="condition">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select> <label for="keyword" id="search-label">
						<button>
							<img src="./source/style/img/jinimg/image 10.png" class="searchbutton">
						</button>
					</label>
				</div>
			</form>


		</div>
	</div>


	<!--FOOTER-->
<!-- 	<footer class="footer">
		<div class="inner">
			<div class="items">
				<div class="item">
					회사 설명
					<p>회사 설명</p>
					<p>asdsad</p>
					<p>asdad</p>
				</div>
				<div class="item">
					회사 정보
					<p>회사 정보</p>
					<p>asda</p>
					<p>sadsadasdsada</p>
				</div>
				<div class="item">
					<p>근무 시간 정보</p>
					근무시간 정보
					<p>sada</p>
					<p>adssad</p>
					<p>asdsad</p>
				</div>
			</div>
		</div>
	</footer> 
 -->
</body>


<script>
	//스와이프 이미지
	new Swiper('.swiper-container', {
		autoplay : false, // 자동재생 off
		slidesPerView : 3, // 보여질 슬라이드 수
		spaceBetween : 18, // 슬라이드 간 간격
		centeredSlides : false, // 1번 슬라이드가 가운데 보이기
		loop : true, // 무한 루프
		scrollbar : {
			el : '.swiper-scrollbar',
			hide : false, // 스크롤바 숨김 여부
		},
		pagination : { // 페이지 번호 사용 여부
			el : '.swiper-pagination',
			clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부
		},
		navigation : { // 슬라이드 이전/다음 버튼 사용 여부
			prevEl : '.swiper-button-prev', // 이전 버튼 선택자
			nextEl : '.swiper-button-next' // 다음 버튼 선택자
		}
	});

	// 콘텐츠 등록 및 수정문의 부분 토글이벤트
	$(".inquiry").click(function() {
		$(this).next("div").slideToggle(500);
	});
	
</script>


</html>