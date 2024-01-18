<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  
    import="java.util.List,
	    odi_project.member.model.vo.Member,
	    odi_project.common.model.vo.Image,
	    odi_project.common.model.dao.ImageDAO,
	    odi_project.common.model.dao.RandomDAO,
	    org.apache.ibatis.session.SqlSession,
	    javax.servlet.http.HttpServletRequest,
	     odi_project.member.model.vo.Member" 
      %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
	String logoutMessage = (String) session.getAttribute("logoutMessage");
%>


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- 파비콘 -->
  <link rel="shortcut icon" href="./images/tomorrow1.gif">
  <title>Odigaji</title>
  <!-- <link rel="stylesheet" href="./"> -->
  <!--브라우저 스타일 초기화-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  <!--Google Fonts - 나눔고딕-->
  <link rel="preconnect" href="https://fonts.gstatic.com" />
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
  <!--Swiper-->
  <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
  <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
  <!-- css -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/source/style/css/ejun.css/main.css">
  <!-- <link rel="stylesheet" href="./css/basicTool.css"> -->
  <!-- js -->
  <script defer src="<%= request.getContextPath() %>/source/js/ejun.js/common.js"></script>
  <!-- jquery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
 
 <!--HEADER-->
  <header>
    <div class="inner">
      <a href="mainPage.bo" class="logo">
        <img src="<%= request.getContextPath() %>/source/style/img/index_img/odigaji_logo.png" alt="ODIGAJI" />
      </a>
      <div class="sub-menu"> <!-- 로그인 마이페이지 찜 채팅-->
        <ul class="menu">
          <% if (loginUser == null) { %>
			<form id="Login-form" action="${pageContext.request.contextPath}/login.me" method="post">
	          <li>
	            <a href="${pageContext.request.contextPath}/login.me"><span class="material-symbols-outlined">login</span>로그인</a>
	          </li>
          	</form>
          <%  } else { %>
	          <li>
	            <a href="${pageContext.request.contextPath}/Logout.me"><span class="material-symbols-outlined">logout</span>로그아웃</a>
	          </li>
	          <li>
	            <a href="${pageContext.request.contextPath}/myPage.me"><span class="material-symbols-outlined">
	              person</span>마이페이지</a>
	          </li>
	          <li>
	            <a href="${pageContext.request.contextPath}/wishlistview.bo"><span class="material-symbols-outlined">
	              favorite</span>찜</a>
	          </li>
	          <li>
	            <a href="./chat.me"><span class="material-symbols-outlined">
	              chat</span>채팅</a>
	          </li>
          <% } %>
        </ul>
      </div>
<ul class="main-menu"> <!-- 여행지&축제 맛집&카페 게시판-->                        <!--html 변경 부분-->
        <li class="item">
          <div class="item__name"><a href="tfview.bo">여행지&축제</a></div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                <li>
                  <h4>지역</h4>
                  <ul>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?region=서울" >서울</a> </li>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?region=경기도">경기도</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?region=인천">인천</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?region=강원도">강원도</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?region=충청북도">충청북도</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?region=충청남도">충청남도</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?region=세종">세종</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?region=대전">대전</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?region=제주">제주</a></li>
                  </ul>
                </li>
                <li>
                  <ul>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?region=경상북도">경상북도</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?region=경상남도">경상남도</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?region=대구">대구</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?region=울산">울산</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?region=부산">부산</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?region=전라북도">전라북도</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?region=전라남도">전라남도</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?region=광주">광주</a></li>
                  </ul>
                </li>
                <li>
                 <h4>계절</h4>
                  <ul>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?season=봄">봄</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?season=여름">여름</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?season=가을">가을</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?season=겨울">겨울</a></li>
                  </ul>
                </li>
                <li>
                  <h4>테마</h4>
                  <ul>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?theme=생태">생태</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?theme=전통">전통</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?theme=공연">공연</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfCategoryClick.bo?theme=놀이공원">놀이공원</a></li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </li>
        <li class="item">
          <div class="item__name"><a href="dcview.bo">맛집&카페</a></div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                 <li>
                  <h4>지역</h4>
                  <ul>
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?region=서울" >서울</a> </li>
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?region=경기도">경기도</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?region=인천">인천</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?region=강원도">강원도</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?region=충청북도">충청북도</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?region=충청남도">충청남도</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?region=세종">세종</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?region=대전">대전</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?region=제주">제주</a></li>
                  </ul>
                </li>
                <li>
                  <ul>
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?region=경상북도">경상북도</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?region=경상남도">경상남도</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?region=대구">대구</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?region=울산">울산</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?region=부산">부산</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?region=전라북도">전라북도</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?region=전라남도">전라남도</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?region=광주">광주</a></li>
                  </ul>
                </li>
                <li>
                  <h4>맛집</h4>
                  <ul class="header_dinner">
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?category=일식">일식</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?category=양식">양식</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?category=중식">중식</a></li>
                  </ul>
                </li>
                <li>
                  <ul class="header_dinner">
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?category=한식">한식</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?category=분식">분식</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?category=기타">기타</a></li>
                  </ul>
                </li>
                <li>
                  <h4>카페</h4>
                  <ul><li><a href="<%= request.getContextPath() %>/dcCategoryClick.bo?category=카페">Coffee shop</a></li></li></ul>
                </li>
              </ul>
            </div>
          </div>
        </li>
        <li class="item">
          <div class="item__name"><a>게시판</a></div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                <li>
                  <h4 >게시판</h4>
                  <ul class="header_board">
                     <li><a href="friendSearch.bo">동행게시판</a></li>
                    <li><a href="noticelist.bo">공지사항</a></li>
                    <li><a href="commonlist.bo">자유게시판</a></li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </li>
      </ul>                                                                             <!--html 변경 부분-->
    </div>
  </header>