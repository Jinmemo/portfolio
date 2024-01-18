<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <!-- 파비콘 -->
  <link rel="shortcut icon" href="./images/tomorrow1.gif">
  <title>Odigaji</title>

  <!--브라우저 스타일 초기화-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />
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

  <!-- css -->
  <link rel="stylesheet" href="./source/style/css/ensun.css/basicTool.css">
  <link rel="stylesheet" href="./source/style/css/hyeon.css/travel_friend.css"> 
  <link rel="stylesheet" href="./source/style/css/hyeon.css/travel_friend_modal.css">
  
  <!-- Font Awesome CDN을 추가 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

  <!-- jquery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="./source/js/hyeon.js/travel_friend.js"></script>
  <script src="./source/js/hyeon.js/travel_friend_madal.js"></script>
 
</head>

<body>
  <!--HEADER-->
  <jsp:include page="../../common/header.jsp" />




  <!-- 동행 게시판 -->
  <main class="main">
    <span class="travel-friend-main">동행 게시판</span>
    <div class="travel-friend-title">
      <span style="font-size: 25px;">오디가지</span>
      <img class="travel-friend-icon" src="./source/style/img/travel_friend_img/free-icon-travel.png">
      <!-- 로그인 한 회원만 보이도록 설정 예정 -->
      	<c:choose>
			<c:when test="${loginUser eq null}">	
			</c:when>
			<c:otherwise>
			    <div class="writing"><a href="travelFriendForm.bo">게시글 작성</a></div>
			</c:otherwise>
		</c:choose>
    </div>
	<c:choose>
		<c:when test="${loginUser eq null}">	
			<span>익명님, </span>
		</c:when>
		<c:otherwise>
		    <span>${loginUser.memberName}님, </span>
		</c:otherwise>
	</c:choose>

    <span>어디로 여행가세요?</span>
    <form class="travel-friend-search search sticky" action="friendSearch.bo" method="get" name="keyword" value="${keyword}">

      <img class="icon-search" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
      <input class="search-bar" type="text" placeholder="도시나 키워드를 입력하세요.">
      <input class="search-button" type="submit" value="검색">
      <input class="search-entire" type="submit" value="전체보기">
	  <img class="icon-light" src="./source/style/img/travel_friend_img/icon-lightning.png"  id="tooltip-lightning">
      
      <img class="icon-addlist" src="./source/style/img/travel_friend_img/icon-addlist.png" id="openModal">

    </form>


    <!-- 모달 -->
    <form  action="friendSearchModal.bo" method="get" id="myModal" class="modal">
      <div class="modal-content">
    <!-- 모달 내용 -->
        <span class="close" id="closeModal">&times;</span>
        <div class="tip">
          <span><b>Tip!</b></span><br><br>
          <span>설정한 지역, 날짜, 카테고리를 포함하는 동행글만 보여요<br>
          </span>
        </div>
        <div class="friend-category">
          <span>카테고리</span><br>
          <select id="categorySelect" name="category">
          	<option value="선택안함">선택안함</option>
            <option value="F1">맛집/카페</option>
            <option value="F2">여행/축제</option>
            <option value="F3">술/친목</option>
            <option value="F4">전시회/공연</option>
            <option value="F5">기타</option>
          </select>
        </div>
        <div class="friend-city">
          <span>도시를 선택하세요</span><br>
<!--           <input type="text" name="city" id="cityInput" class="friend-city-input" placeholder="검색하고 싶은 도시를 입력하세요"> -->
		  <select id="cityInput" name="city" class="friend-city-input">
		    <option value="선택안함">선택안함</option>
            <option value="서울">서울</option>
            <option value="경기도">경기도</option>
            <option value="인천">인천</option>
            <option value="강원도">강원도</option>
            <option value="충청북도">충청북도</option>
            <option value="충청남도">충청남도</option>
            <option value="세종">세종</option>
            <option value="대전">대전</option>
            <option value="제주">제주</option>
            <option value="경상북도">경상북도</option>
            <option value="경상남도">경상남도</option>
            <option value="대구">대구</option>
            <option value="울산">울산</option>
            <option value="부산">부산</option>
            <option value="전라북도">전라북도</option>
            <option value="전라남도">전라남도</option>
            <option value="광주">광주</option>
          </select>
        </div>
          <!-- 날짜 선택 부분 -->
        <div class="friend-calendar">
          <span>검색할 날짜를 선택하세요</span><br>
          <!-- 시작 날짜 선택 -->
          <div class="datepicker">
            <input type="date" name="startDate" id="startDate" placeholder="시작 날짜">
          </div>
          <span>-</span>
          <!-- 종료 날짜 선택 -->
          <div class="datepicker">
            <input type="date" name="endDate" id="endDate" placeholder="종료 날짜">
          </div>
        </div>
        <article>
          <input type="button" class="resetFilters" value="필터 해제" onclick="resetFilters()" >
          <input id="search-button" type="submit" value="설정">
        </article>
      </div>
    </form>


    <form class="friend-list-container" action="friendSearch.bo" method="get">
    	
    	<c:forEach var="f" items="${list}">
    	
	   	  <div class="friend-list" onclick='location.href="friendDetail.bo?fboardNo=${f.fboardNo}"'>
	        <c:choose>
			    <c:when test="${f.preAgeGroup ne '모든 연령'}">
			        <div class="friend-header">${f.preAgeGroup}</div>
			    </c:when>
			    <c:otherwise>
			    	<div class="friend-header"></div>
			        <!-- "모든 연령"인 경우 아무것도 표시하지 않음 -->
			    </c:otherwise>
			</c:choose>
	        <div>
	          <img class="list-img" src="./source/style/img/travel_friend_img/location.png">
	          <span>${f.friendAddress}</span>

	        </div>
	        <span>${f.friendTitle} </span><br>
	        <div>
	          <span class="icon-calendar"></span>
	          <span class="claendar-list">${f.friendStartDate}</span>
	          <span>~</span> 
	          <span id="endDate">${f.friendEndDate}</span><br>
	        </div>
	        <span class="friend-content">${f.friendContent}</span>
	      </div>
	      
      	</c:forEach>
      	
    </form>
    

  </main>
  
  
  
  <!--FOOTER-->
  <footer style = "bottom : -600;" >
    <div class="inner">
      <div class="items">
        <div class="item"> <!--회사 설명-->
          <p>오디가지</p>
          <p>(주)오디가지 대표이사: 오딩이</p>
          <p>대표전화 : 1544-9970</p>
          <p>FAX : 02-599-3111</p>

        </div>
        <div class="item"> <!--회사 정보-->
          <p>회사 정보</p>
          <p>주소: 서울특별시 강남구 테헤란로10길 9 그랑프리 빌딩</p>
          <p>사업자등록번호: 851-87-00622</p>
          <p>호스팅 업체: (주)KH정보교육원</p>
        </div>
        <div class="item">
          <p>상담시간 안내</p> <!--근무시간 정보-->
          <p>평일 09:00 - 18:00 </p>
          <p>(토/일요일 및 공휴일 휴무)</p>
          <p></p>
        </div>
      </div>
    </div>
  </footer>
  
  
  
 
  
</body>
</html>