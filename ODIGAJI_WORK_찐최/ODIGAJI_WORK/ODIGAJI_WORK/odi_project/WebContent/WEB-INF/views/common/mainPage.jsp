<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,
    odi_project.common.model.vo.Image,
    odi_project.member.model.vo.Member,
    odi_project.common.model.dao.ImageDAO,
    odi_project.common.model.dao.RandomDAO,
    org.apache.ibatis.session.SqlSession,
    javax.servlet.http.HttpServletRequest" 
    
%>

<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
	String logoutMessage = (String) session.getAttribute("logoutMessage");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
  <!--Google Fonts   -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
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
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

  
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
          <div class="item__name"><a href="tfview.bo"> 여행지&축제 </a></div>
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
  
  
  
  <!-- TOP SECTION (프로모션 스와이퍼)-->
    <div class="inner">
      <div class="promotion">
        <div class="text1">낭만이 가득한 <br>겨울 여행으로 떠나요</div>
        <div class="text2">마음의 온도를 높이는<br>겨울 여행지 추천!</div>
        <div class="swiper-container">
        
          <div class="swiper-wrapper">
          
            <div class="swiper-slide">
              <img src="<%= request.getContextPath() %>/image/promotion/마음의온도.gif" alt="" /> <!-- 스와이퍼 이미지 넣는곳, 광고 넣는 곳-->
              <a href="javascript:void(0)"></a>
            </div>
            <div class="swiper-slide">
              <img src="<%= request.getContextPath() %>/image/promotion/광고6.png" alt="" /> <!-- 스와이퍼 이미지 넣는곳, 광고 넣는 곳-->
              <a href="javascript:void(0)"></a>
            </div>
            <div class="swiper-slide">
              <img src="<%= request.getContextPath() %>/image/promotion/광고5.png" alt="" /> <!-- 스와이퍼 이미지 넣는곳, 광고 넣는 곳-->
              <a href="javascript:void(0)"></a>
            </div>
            <div class="swiper-slide">
              <img src="<%= request.getContextPath() %>/image/promotion/광고1.png" alt="" /> <!-- 스와이퍼 이미지 넣는곳, 광고 넣는 곳-->
              <a href="javascript:void(0)"></a>
            </div>
  
            <div class="swiper-slide">
              
              <a href="https://www.youtube.com/watch?v=RgPwRpybL4s"><img src="<%= request.getContextPath() %>/image/promotion/광고4.png" alt="" /> <!-- 스와이퍼 이미지 넣는곳, 광고 넣는 곳--></a>
            </div>
          </div>
          
        </div>


        <div class="swiper-prev">
          <span class="material-icons">arrow_back</span>
        </div>
        <div class="swiper-next">
          <span class="material-icons">arrow_forward</span>
        </div>
        
        
      </div>
      
    </div>
    
    
    
    <div class="inner">
    	<div class="line1"></div>
    </div>
    
    
    
    
    
  <!--LEFT SIDEBAR 채팅창-->
<!--   <div class="left-sidebar"></div> -->
  
  
<!-- 2024-01-09 수정 -->  
  <!--RIGHT SIDEBARA 회원별 여행지 추천-->

<div class="inner">
<!--     <button type="button" class="material-symbols-outlined 	arrowdrop" onclick="right_sidebar_close()" style="display: block"> -->
<!--         arrow_drop_up -->
<!--     </button> -->

    <div class="right-sidebar" id="right-sidebar">
			<div class="suggestion">
				<%
					Image randomImageByMemberAddress = (Image) request.getAttribute("randomByMemberAddress");

				if (randomImageByMemberAddress != null && randomImageByMemberAddress.getImage() != null && loginUser != null) {
				%>5 <a
					href="tfDetailView.bo?travelNo=<%=randomImageByMemberAddress.getTravelNo()%>"><img
					src="<%=randomImageByMemberAddress.getImage()%>
            	"
					alt="Random Image"
					style="min-width: 100%; max-width :  100%; max-height: 150%; min-height: 150%; border-radius: 25px;"></a>
				<span
					style="text-align: center; display: block; position: absolute; z-index: 3; font-size: 20px; bottom: -130px; color: #8474a1; letter-spacing: 2px;">
<!-- 					가나다라 마바사 아자차카 파타하 -->
					<%=randomImageByMemberAddress.getTravelName()%>
					</span>
			</div>
			<div class="by"
				style="position: absolute; bottom: 0px; border-radius: 25px; box-sizing: cover; height: 120px; width: 100%;  z-index: 2;">
				<div
					style="margin-right : 10px; width: 260px; height: 75%; background-color: #fff; position: absolute; margin-top: 35px;  border-radius: 15px;
					text-align:center;">
					
					<span style="margin-right : 22px; display:block; margin-top	: 40px; font-size: 17px;">즐기기 좋은 계절<br></span>
					<span style="margin-right : 22px; font-size : 15px;"> - <%=randomImageByMemberAddress.getSeason()%></span>
				<%-- 	<span style="display:block; margin-top: 10px; font-size: 17px; ">여행지 주소<br></span>
					<span style="font-size : 15px;"> - <%=randomImageByMemberAddress.getTravelAddress()%></span> --%>
				</div>

			</div>
			<p>회원별 추천 여행</p>
			<%
				} else {
			%>
                <img src="<%=request.getContextPath() + "/image/tfimage/사진이없습니다.jpg"%>" alt="" style="min-width: 100%; max-height:140%; min-height:140%; border-radius:25px;  ">
                <p style="width:250px; display:block;  margin-top:270px; margin-left: 17px;">로그인하신 회원님만 사용할 수 있습니다</p>
            <%
            	}
            %>

    </div>
</div>
<!-- 2024-01-09 수정 -->
  


	<!-- MIDDLE SECTION 오늘의 여행지 추천 -->
	<div class="inner">
	    <div class="tomorrow-suggestion">
	        <div class="text3">오늘의 여행지 추천!</div>
	        <div class="swiper-container" id="tomorrowSwiper">
	            <div class="swiper-wrapper">
	                <!-- 이미지 리스트 가져오기 -->
	                <%
	                List<Image> randomImages = (List<Image>) request.getAttribute("imageRandomAddress");
	                if (randomImages != null && !randomImages.isEmpty()) { // randomImages가 null인가
	                    for (Image image : randomImages) {
	                %>
	                        <div class="swiper-slide">
	                            <%
	                            if (image != null && image.getImage() != null) { // image가 null인가
	                            %>	
	                            	<a href="tfDetailView.bo?travelNo=<%=image.getTravelNo()%>"><img src="<%=image.getImage() %>" alt="Travel Image" /></a>
									<span class="getTravelNameSpan"><%=image.getTravelName() %></span>	                            	
<%-- 	                            	<a href=""><img src="<%= request.getContextPath() + image.getImage() %>" alt="Travel Image" /></a> --%>
	                            <%
	                            } else {
	                            %>
	                                <img src="<%= request.getContextPath() + "/source/image/img2.png" %>" alt="Default Image" />
	                            <%
	                            }
	                            %>
	                        </div>
	                <%
	                        }
	                    } else {
	                %>
	                        <!-- 이미지가 없을 때 대체 내용 -->
	                        <div class="swiper-slide">
	                            <img src="<%= request.getContextPath() + "/source/image/img3png" %>" alt="Default Travel Image" />
	                        </div>
	                <%
	                    }
	                %>
	            </div>
	        </div>
	    </div>
	</div>
    </div>
    
    <div class="inner">
    	<div class="line2"></div>
    </div>
    
    
    
	<!-- BOTTOM SECTION 20~30대 HOT 여행지 TOP-->
	<div class="inner">
	    <div class="hot5-suggestion">
	        <div class="text3" style="width: 229px; color : #56128d;">HOT 여행지 Top 4</div>
	        <div class="swiper-container" id="hot5Swiper">
	            <div class="swiper-wrapper">
	                <%
	                    List<Image> imageAddress = (List<Image>) request.getAttribute("imageAddress");
	                    if (imageAddress != null && !imageAddress.isEmpty()) {
	                        for (Image image : imageAddress) {
	                %>
	                            <div class="swiper-slide">
	                                <%
	                                if (image != null && image.getImage() != null) {
	                                %>	
	                           			<a href="tfDetailView.bo?travelNo=<%=image.getTravelNo()%>"><img src="<%= image.getImage() %>" alt="Travel Image" /></a>
										<span class="getTravelNameSpan"><%=image.getTravelName() %></span>	  
<%-- 	                           			<a href=""><img src="<%= request.getContextPath() + image.getImage() %>" alt="Travel Image" /></a> --%>
	                                    
	                                <%
	                                } else {
	                                %>
	                                    <!-- 이미지가 null이거나 이미지 주소가 null일 때 대체 내용 -->
	                                    <img src="<%= request.getContextPath() + "/source/image/img2.png" %>" alt="Default Travel Image" />
	                                <%
	                                }
	                                %>
	                            </div>
	                <%
	                        }
	                    } else {
	                %>
	                        <!-- 이미지가 없을 때 대체 내용 -->
	                        <div class="swiper-slide">
	                            <img src="<%= request.getContextPath() + "/source/image/img3png" %>" alt="Default Travel Image" />
	                        </div>
	                <%
	                    }
	                %>
	            </div>
	        </div>
	    </div>
	</div>
	    
    
  <!--FOOTER-->
  <footer>
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
  
  
  <!--TO TOP BUTTON-->
  <div id="to-top">
    <a href="#"><div class="material-icons">arrow_upward</div></a>
  </div>
</body>
</html>