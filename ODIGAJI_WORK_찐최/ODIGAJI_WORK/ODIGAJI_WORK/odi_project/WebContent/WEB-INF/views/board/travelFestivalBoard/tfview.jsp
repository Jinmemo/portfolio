<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="odi_project.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	Member loginUser = (Member) session.getAttribute("loginUser");
%>

<!DOCTYPE html>
<html lang="ko">
<head>

<!--ajax  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 파비콘 -->
<link rel="shortcut icon" href="./images/tomorrow1.gif">
<title>여행지&축제 게시판</title>

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

<!-- menu icon 필터 메뉴-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- expand_more icon 더보기-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- reply icon 초기화 -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- Arrow Upward icon 위로가기버튼 -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<!-- basic css -->
<link rel="stylesheet" href="./source/style/css/ensun.css/basicTool.css">
<!-- tfview css -->
<link rel="stylesheet" href="./source/style/css/ensun.css/tfview.css">

</head>
<body>

	<jsp:include page="../../common/header.jsp" />


	<!-- <div class="filter" id="filter">
                <span>상세필CCCSSR터</span>
                <span class="material-symbols-outlined" class="filterButton"> menu </span>
                <span>초기화</span>
                <span class="material-symbols-outlined"> replay </span>
            </div> -->



	<!--LEFT SIDEBAR 카테고리 & 채팅창-->
	<div class="inner">
		<div class="left-sidebar">
			<!-- 카테고리 -->
			<form id="categoryForm" action="tfCategoryClick.bo" method="post">
				<ul class="category" id="category-area">

					<!-- 계절 카테고리 -->
					<li class="cate-season">
						<div class="categorylist">
							<a href="#" class="categoryTitle">계절</a> <span
								class="material-symbols-outlined"> expand_more </span>
						</div>
						<ul class="season">
							<div class="seasondiv">
								<li><input type="checkbox" name="봄" id="봄"
									class="sidebarcheck"> <label for="봄">봄</label></li>
								<li><input type="checkbox" name="여름" id="여름"
									class="sidebarcheck"> <label for="여름">여름</label></li>
							</div>
							<div class="seasondiv">
								<li><input type="checkbox" name="가을" id="가을"
									class="sidebarcheck"> <label for="가을">가을</label></li>
								<li><input type="checkbox" name="겨울" id="겨울"
									class="sidebarcheck"> <label for="겨울">겨울</label></li>
							</div>
						</ul>
					</li>

					<!-- 테마 카테고리 -->
					<li class="cate-theme">
						<div class="categorylist">
							<a href="#" class="categoryTitle">테마</a> <span
								class="material-symbols-outlined"> expand_more </span>
						</div>
						<ul class="theme">
							<div class="themediv">
								<li><input type="checkbox" name="생태"
									<%="생태".equals(session.getAttribute("selectedThema")) ? "checked" : ""%>
									id="생태" class="sidebarcheck"> <label for="생태">생태</label>
								</li>
								<li><input type="checkbox" name="전통"
									<%="전통".equals(session.getAttribute("selectedThema")) ? "checked" : ""%>
									id="전통" class="sidebarcheck"> <label for="전통">전통</label>
								</li>
							</div>
							<div class="themediv">
								<li><input type="checkbox" name="공연"
									<%="공연퍼레이드".equals(session.getAttribute("selectedThema")) ? "checked" : ""%>
									id="공연" class="sidebarcheck"> <label for="공연">공연</label>
								</li>
								<li><input type="checkbox" name="놀이공원"
									<%="놀이공원".equals(session.getAttribute("selectedThema")) ? "checked" : ""%>
									id="놀이공원" class="sidebarcheck"> <label for="놀이공원">놀이공원</label>
								</li>
							</div>
						</ul>
					</li>
					<!-- 지역 카테고리 -->
					<li class="cate-region ">
						<div class="categorylist">
							<a href="#" class="categoryTitle">지역</a> <span
								class="material-symbols-outlined"> expand_more </span>
						</div>
						<ul class="region">
							<div class="regiondiv">
								<li><input type="checkbox" name="서울"
									<%="서울경기도".equals(session.getAttribute("selectedRegion")) ? "checked" : ""%>
									id="서울" class="sidebarcheck"> <label for="서울">서울</label>
								</li>
								<li><input type="checkbox" name="경기도"
									<%="서울경기도".equals(session.getAttribute("selectedRegion")) ? "checked" : ""%>
									id="경기도" class="sidebarcheck"> <label for="경기도">경기도</label>
								</li>
								<li><input type="checkbox" name="인천"
									<%="인천".equals(session.getAttribute("selectedRegion")) ? "checked" : ""%>
									id="인천" class="sidebarcheck"> <label for="인천">인천</label>
								</li>
								<li><input type="checkbox" name="강원도"
									<%="강원도".equals(session.getAttribute("selectedRegion")) ? "checked" : ""%>
									id="강원도" class="sidebarcheck"> <label for="강원도">강원도</label>
								</li>
								<li><input type="checkbox" name="충청북도"
									<%="충청도".equals(session.getAttribute("selectedRegion")) ? "checked" : ""%>
									id="충청북도" class="sidebarcheck"> <label for="충청북도">충청북도</label>
								</li>
								<li><input type="checkbox" name="충청남도"
									<%="충청도".equals(session.getAttribute("selectedRegion")) ? "checked" : ""%>
									id="충청남도" class="sidebarcheck"> <label for="충청남도">충청남도</label>
								</li>
								<li><input type="checkbox" name="세종"
									<%="세종".equals(session.getAttribute("selectedRegion")) ? "checked" : ""%>
									id="세종" class="sidebarcheck"> <label for="세종">세종</label>
								</li>
								<li><input type="checkbox" name="대전"
									<%="대전".equals(session.getAttribute("selectedRegion")) ? "checked" : ""%>
									id="대전" class="sidebarcheck"> <label for="대전">대전</label>
								</li>
								<li><input type="checkbox" name="제주도"
									<%="제주도".equals(session.getAttribute("selectedRegion")) ? "checked" : ""%>
									id="제주도" class="sidebarcheck"> <label for="제주도">제주도</label>
								</li>
							</div>
							<div class="regiondiv">
								<li><input type="checkbox" name="경상북도"
									<%="경상도".equals(session.getAttribute("selectedRegion")) ? "checked" : ""%>
									id="경상북도" class="sidebarcheck"> <label for="경상북도">경상북도</label>
								</li>
								<li><input type="checkbox" name="경상남도"
									<%="경상도".equals(session.getAttribute("selectedRegion")) ? "checked" : ""%>
									id="경상남도" class="sidebarcheck"> <label for="경상남도">경상남도</label>
								</li>
								<li><input type="checkbox" name="대구"
									<%="대구".equals(session.getAttribute("selectedRegion")) ? "checked" : ""%>
									id="대구" class="sidebarcheck"> <label for="대구">대구</label>
								</li>
								<li><input type="checkbox" name="울산"
									<%="울산".equals(session.getAttribute("selectedRegion")) ? "checked" : ""%>
									id="울산" class="sidebarcheck"> <label for="울산">울산</label>
								</li>
								<li><input type="checkbox" name="부산"
									<%="부산".equals(session.getAttribute("selectedregion")) ? "checked" : ""%>
									id="부산" class="sidebarcheck"> <label for="부산">부산</label>
								</li>
								<li><input type="checkbox" name="전라북도"
									<%="전라도".equals(session.getAttribute("selectedregion")) ? "checked" : ""%>
									id="전라북도" class="sidebarcheck"> <label for="전라북도">전라북도</label>
								</li>
								<li><input type="checkbox" name="전라남도"
									<%="전라도".equals(session.getAttribute("selectedRegion")) ? "checked" : ""%>
									id="전라남도" class="sidebarcheck"> <label for="전라남도">전라남도</label>
								</li>
								<li><input type="checkbox" name="광주"
									<%="광주".equals(session.getAttribute("selectedRegion")) ? "checked" : ""%>
									id="광주" class="sidebarcheck"> <label for="광주">광주</label>
								</li>
							</div>
						</ul>
					</li>
				</ul>
			</form>

			<!-- 라이브채팅 -->
			<!-- <ul class="live-chat"> 
            <div class="categorylist">
                <a href="#" class="categoryTitle">라이브 채팅</a>
                <span class="material-symbols-outlined"> expand_more </span>
            </div>
            <div class="live-chatting" > 
                <p>홍길동 : 안녕디지몬</p>
                <p>홍길동 : 네 꿈을 꾸면서 잠이 들래</p>
                <p>홍길동 : 안녕 디지몬</p>
                <p>장현진 : 친구들 모두 안녕</p>
                <p>이준형 : 안녕 디지몬</p>
                <p>박건욱 : 너와 함께하고 싶어</p>
                <p>류은선 : 안녕 디지몬</p>
                <p>이현영 : 난 너를 찾아갈래</p>
            </div>
        </ul> -->

		</div>
	</div>


	<!-- main 내용 -->
	<main class="container">

		<!-- 메인 타이틀 -->
		<div class="title">
			<a href="tfview.bo" class="title_reset">선택초기화 <span
				class="material-symbols-outlined"> replay </span>
			</a>
			<div class="title_title">
				<p>여행지 & 축제</p>
			</div>
			<!-- 검색 -->
			<form action="tfsearch.bo" method="get">
				<div class="head-keyword" id="search-area">
					<button type="button" class="write_admin">글 작성(관리자용)</button>
					<select class="head-category" id="head-category" name="condition">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select> <label for="keyword" id="search-label">
						<button>
							<img src="./source/style/img/jinimg/image 10.png">
						</button> <input type="text" name="keyword" id="keyword"
						placeholder="키워드를 입력하세요" value='${keyword }'>
					</label>
				</div>
			</form>
		</div>

		<!-- 리스트뷰  -->
		<div class="tf_home">
			<c:choose>
				<c:when test="${empty list }">
					<!-- 리스트가 비었을때 -->
					<div class="emptyList">앗! 아쉽지만 해당하는 여행지&축제가 없어요.</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="tf" items="${list}">
						<div class="tf_item">
							<input type="hidden" name="travelNo" value="${tf.travelNo}" />
							<!-- 게시글번호넘기기-->
							<a href="tfDetailView.bo?travelNo=${tf.travelNo}">
								<div class="thumb_box"
									style="background-color: rgb(244, 244, 244);">
									<picture class="tf_img"> <img src="${tf.thumbNail}" />
									</picture>
									<h1>${tf.travelName}</h1>
								</div>
							</a>
							<!-- 찜 하트  찜하기 / 찜 취소-->
							<img src="./source/style/img/travel_friend_img/icon-heart.png"
								data-travel-no="${tf.travelNo}"
								data-travel-name="${tf.travelName}" 
								class="btn_wish wishilist" onclick="addToWishlist(this)"> 
							<img src="./source/style/img/travel_friend_img/icon-heart-red.png"
								class="btn_wish_red" onclick="removeToWishlist(this)" />
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>

		<!-- 페이징처리 -->
		<div class="tf-paging-area" id="paging-area">
			<%-- 	<c:url value="${empty selectedCategoryIds ? 'tfview.bo' : 'tf' }" var="url">
			</c:url> --%>
			<c:url value="${empty condition ? 'tfview.bo' : 'tfsearch.bo' }"
				var="url">
				<!--condition 값이 비어있다면 list.bo- 기본페이지 , search.bo- 검색 시 페이지 -->
				<c:param name='condition' value='${condition }' />
				<c:param name='keyword' value='${keyword }' />
			</c:url>

			<!--1페이지가 아닐때만 보이게 하기  -->
			<c:if test="${pi.currentPage ne 1 }">
				<a href="${url }&currentPage=${pi.currentPage -1}">
					<button>＜</button>
				</a>
			</c:if>

			<!-- 현재 반복중인 순번  -->
			<c:forEach var='p' begin='${pi.startPage }' end='${pi.endPage }'>
				<a href="${url }&currentPage=${p }">
					<button>${p }</button>
				</a>
			</c:forEach>

			<c:if test="${pi.currentPage ne pi.maxPage }">
				<!--마지막 페이지가 아닐 때 -->
				<a href="${url }&currentPage=${pi.currentPage+1 }">
					<button>＞</button>
				</a>
			</c:if>
		</div>

	</main>


	<!-- 스크롤버튼 -->
	<button class="scrollButton upButton">
		<span class="material-symbols-outlined">arrow_upward</span>
	</button>



	<!--FOOTER-->
	<footer style="bottom: -780px; width: 104%">
		<div class="inner">
			<div class="items">
				<div class="item">
					<!--회사 설명-->
					<p>오디가지</p>
					<p>(주)오디가지 대표이사: 오딩이</p>
					<p>대표전화 : 1544-9970</p>
					<p>FAX : 02-599-3111</p>

				</div>
				<div class="item">
					<!--회사 정보-->
					<p>회사 정보</p>
					<p>주소: 서울특별시 강남구 테헤란로10길 9 그랑프리 빌딩</p>
					<p>사업자등록번호: 851-87-00622</p>
					<p>호스팅 업체: (주)KH정보교육원</p>
				</div>
				<div class="item">
					<p>상담시간 안내</p>
					<!--근무시간 정보-->
					<p>평일 09:00 - 18:00</p>
					<p>(토/일요일 및 공휴일 휴무)</p>
					<p></p>
				</div>
			</div>
		</div>
	</footer>



</body>


<script>

	$(function(){
		
		// 검색하고 페이지 이동 시 검색값 유지
		const condition = '${condition}'; // 'writer', 'title', 'content'
		if(condition){ //condition 값이 있으면 option 선택되게 속성 적용 
			$("#search-area option[value=${condition}]").attr("selected",true); 
		}
		
		// 카테고리 선택 유지
	   	const selectedCategoryIds = '${selectedCategoryIds}'; 
	   	console.log(selectedCategoryIds);
	   	
	   	if (selectedCategoryIds) {
	   	    const idsArray = selectedCategoryIds.split(','); // 선택된 ID들을 배열로 분리
	   	    console.log("idsArray = " , idsArray);
	   	    
	   	    for (const categoryId of idsArray) {
				$("#"+categoryId.trim()).prop('checked', true);
	   	       // $(".sidebarcheck[name=${categoryId}]").prop('checked', true); // 해당 ID를 가진 체크박스 체크
	   	    }
	   	}
	    
	});

	
	//사이드바에서 카태고리 선택 시 - 카테고리 소제목 이름 넘기기
	$(document).on('click', '.sidebarcheck', function() {
	    const checked = $("input:checkbox[class=sidebarcheck]:checked");
	    const categoryIds = [];
	    const categoryForm = $("#categoryForm");
	
	    if (checked.length > 0) {
	        checked.each(function(){
	            const categoryId = this.id;  // 선택되어있는 카테고리 id값
	            categoryIds.push(categoryId); // 배열에 추가
	        });
	
	        // form에 추가된 input 요소 제거 (혹시나 있을 중복 때문)
	        //$("#categoryForm input[name^='categoryIdsMap']").remove();
	
	        // 선택한 카테고리 ID값을 배열로 서블릿에 전송
	        for (const categoryId of categoryIds) {
	            const inputElement = $("<input>").attr("type", "hidden")
	                .attr("name", "categoryIdsMap").val(categoryId);
	            $("#categoryForm").append(inputElement);
	        }

	        $("#categoryForm").submit();
	    } else{
	    	window.location.href='tfview.bo';
	    }
	});

	 
    // 카테고리 제목 누를 때 토글 이벤트 적용
    $(".categorylist").click(function(){

        // 카테고리 토글
        $(this).next().slideToggle(500);

        // 화살표 돌아가게 만들기
        var $arrow = $(this).children("span");
        var rotateButton = $arrow.hasClass("rotate180");

        if(rotateButton){
            $arrow.removeClass("rotate180");
            $arrow.addClass("rotate0");
        }else{
            $arrow.removeClass("rotate0");
            $arrow.addClass("rotate180");
        }

    });

	//스크롤 버튼    
    $(".scrollButton").hover(function(){
        $(this).css('background-color','black');
    } , function(){
        $(this).css('background-color','rgb(138, 101, 138)');
    })
    //위로 올라가기 버튼 클릭 시 맨위로 이동
    $(".upButton").click(function(){
        document.documentElement.scrollTop = 0;
    })

    
    // 찜 하트클릭 이벤트
    $(".btn_wish").click(function(){
    	
    	/* memberId가 '' 가 아닐 때 */
        if('${loginUser.memberId}'){
            $(this).parent().children(".btn_wish").css('display','none');
	        $(this).parent().children(".btn_wish_red").css('display','block');
        } else {
        	alert("찜 기능은 로그인 후 이용가능합니다.");
        }
    })
	//찜 취소
    $(".btn_wish_red").click(function(){
        $(this).parent().children(".btn_wish").css('display','block');
        $(this).parent().children(".btn_wish_red").css('display','none');
    })

    
   	/* 찜하기*/
    function addToWishlist(element) {
		
        if('${loginUser.memberId}'){
	    
	        // data-travel-no 속성을 통해 travelNo를 가져옴
	        const travelNo = element.getAttribute('data-travel-no');
	        const travelName = element.getAttribute('data-travel-name');
	
	        // Ajax를 사용하여 서버에 travelNo를 전송
	        $.post("${pageContext.request.contextPath}/wishlistview.bo", 
	        		{ travelNo: travelNo,  
	        		 travelName: travelName},
	        		function(response) {
	        });
	        alert("찜 목록에 추가되었습니다.");
	    } 
	    
	}
	
	/* 찜취소 */
	function removeToWishlist(element){

        if('${loginUser.memberId}'){
			alert("찜이 취소되었습니다.");
        }
	}
    
    
</script>


</html>