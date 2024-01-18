<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "java.util.Map, java.util.List ,odi_project.member.model.vo.Member,odi_project.board.model.vo.TravelFestival,
    odi_project.board.model.vo.WishListTravel, odi_project.board.model.vo.WishListDinner
    " %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	Member loginUser = (Member) request.getAttribute("loginUser");
	Map<String, Object> selectTravel = (Map<String, Object>) session.getAttribute("selectTravel");
    List<WishListTravel> wishList = (List<WishListTravel>) request.getAttribute("wishList");
    List<WishListDinner> wishdinner = (List<WishListDinner>) request.getAttribute("wishdinner");
    
%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>찜한 목록</title>

    <!-- 파비콘 -->
    <link rel="shortcut icon" href="./images/tomorrow1.gif">

    <!--브라우저 스타일 초기화-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
    <!--Google Material Icons-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <!-- sidebar open/close Icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- login icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- my page icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <!-- heart icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- chat icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

     <!-- basic css -->
    <link rel="stylesheet" href="./source/style/css/ensun.css/basicTool.css">
    <!-- wishlist css -->
    <link rel="stylesheet" href="./source/style/css/ensun.css/wishList.css">
    
    <!--Google Fonts - 나눔고딕-->
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />
</head>

<body>

	<!--header -->
	<jsp:include page="../common/header.jsp" />

	<main>
		<div class="section">
			<div class="wish-main">
				<c:if test="${not empty wishList}">
					<p>"${wishList[0].memberId}"님이 찜한 목록</p>
				</c:if>
			</div>
			
			<div class="wish-main-explain">
				<p>
					내가 찜한 정보 확인하기 <br> 나의 찜한 목록에서는 찜한 정보를 카테고리별로 살펴볼 수 있습니다.
				</p>
				<!-- 찜 삭제 -->
				<form action="wishRemove.bo">
				<button class="wishRemoveButton">
					삭제<span class="material-symbols-outlined delete" onclick="deleteContent()">delete</span>
				</button>
			</div>

			<div class="outer">
				<!-- 카테고리 메뉴바 -->
				<div class="categories">
					<div class="category selected-category" data-category="all" onclick="showCategory('all')">전체보기</div>
					<div class="category" data-category="travel" onclick="showCategory('travel')">여행지&축제</div>
					<div class="category" data-category="restaurant" onclick="showCategory('restaurant')">식당&카페</div>
					<!-- <div class="category" data-category="friend" onclick="showCategory('friend')">동행</div> -->
				</div>

				<img src="" alt="" class="remove">

				<!-- 아이템 -->
				<div class="category-content">
				
					<!-- 찜한 목록이 없을 때 -->
	<%-- 				<c:when test="${empty wishList }">
						<div class="emptyList">찜한 목록이 없습니다.</div>
					</c:when>
					
					<c:otherwise>
					 --%>
						<!-- travel wish 반복 -->
						<c:forEach var="item" items="${wishList}">
							<div class="content travel">
								<div>
									<input type="checkbox" class="checkContent" name="travelWishKeys" value="${item.wishKey }"> <span>${item.travelName}</span>
								</div>
								<img src="${item.travelImg } " alt="여행지 이미지" class="remove">
							</div>
						</c:forEach>
			<%-- 		</c:otherwise> --%>
				
						<!-- 식당  -->
						<c:forEach var="item" items="${wishdinner}">
						<div class="content restaurant">
							<div>
								<input type="checkbox" class="checkContent" name="dinnerWishKeys" value="${item.wishKey }"> <span>${item.dinnerName}</span>
							</div>
							<img src="${item.dinnerImg } " alt="">
						</div>
						</c:forEach>
					</form>	
				</div>


			</div>
		</div>
		</div>
	</main>



	<script>
	
		function showCategory(categoryId) {

			//전체보기 눌렀을 때
			if (categoryId == 'all') {
				document.querySelectorAll('.content').forEach(
					function(categoryContent) { categoryContent.style.display = 'flex'; }
				);
				
			//각 카테고리 눌렀을 때
			} else {
				// 모든 카테고리 숨기기
				document.querySelectorAll('.content').forEach(
					function(categoryContent) { categoryContent.style.display = 'none'; }
				);
				
				// 클릭한 카테고리 보이기
				document.querySelectorAll('.' + categoryId).forEach(
					function(categoryContent) { categoryContent.style.display = 'flex'; }
				);
			}

			// 선택된 카테고리 표시 업데이트
			document.querySelectorAll('.category').forEach(function(category) {
				category.classList.remove('selected-category');
			});

			document.querySelector('.category[data-category="' + categoryId+ '"]').classList.add('selected-category');
		}

		// 휴지통 클릭 시 삭제  -->> 자바 연결해서 하기
		function deleteContent() {
			document.querySelectorAll('.checkContent:checked').forEach(
					
				function(checkedContent) {
					checkedContent.closest('.content').style.display = 'none';
				});
		}
		
		
	</script>



</body>
</html>