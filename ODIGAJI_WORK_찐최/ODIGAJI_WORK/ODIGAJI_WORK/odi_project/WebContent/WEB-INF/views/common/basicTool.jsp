<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
  <link rel="stylesheet" href="./source/style/css/ejun.css/basicTool.css">
  <!-- jquery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
  <!--HEADER-->
  <header>
    <div class="inner">
      <a href="/" class="logo">
        <img src="<%= request.getContextPath() %>/source/style/img/index_img/odigaji_logo.png" alt="ODIGAJI" />
      </a>
      <div class="sub-menu"> <!-- 로그인 마이페이지 찜 채팅-->
        <ul class="menu">
          <li>
            <a href="/signin/index.html"><span class="material-symbols-outlined">login</span>로그인</a>
          </li>
          <li>
            <a href="javascript:void(0)"><span class="material-symbols-outlined">
              person</span>마이페이지</a>
          </li>
          <li>
            <a href="javascript:void(0)"><span class="material-symbols-outlined">
              favorite</span>찜</a>
          </li>
          <li>
            <a href="./liveChat.html"><span class="material-symbols-outlined">
              chat</span>채팅</a>
          </li>
        </ul>
      </div>
      <ul class="main-menu"> <!-- 여행지&축제 맛집&카페 게시판-->                        <!--html 변경 부분-->
        <li class="item">
          <div class="item__name">여행지&축제</div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                <li>
                  <h4>지역</h4>
                  <ul>
                    <li>
                    <a href="<%= request.getContextPath() %>/tfview?region=서울경기도">서울&경기</a>
                    </li>
                    <li>
                    <a href="<%= request.getContextPath() %>/tfview?region=전라도">전라도</a>
                    </li>
                    <li><a href="<%= request.getContextPath() %>/tfview?region=경상도">경상도</a></li>
                  </ul>
                </li>
                <li>
                  <ul>
                    <li><a href="<%= request.getContextPath() %>/tfview?region=충청도">충청도</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfview?region=강원도">강원도</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfview?region=제주도">제주도</a></li>
                  </ul>
                </li>
                <li>
                 <h4>계절</h4>
                  <ul>
                    <li><a href="<%= request.getContextPath() %>/tfview?season=봄">봄</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfview?season=여름">여름</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfview?season=가을">가을</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfview?season=겨울">겨울</a></li>
                  </ul>
                </li>
                <li>
                  <h4>테마</h4>
                  <ul>
                    <li><a href="<%= request.getContextPath() %>/tfview?thema=생태">생태</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfview?thema=전통">전통</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfview?thema=공연퍼레이드">공연퍼레이드</a></li>
                    <li><a href="<%= request.getContextPath() %>/tfview?thema=놀이공원">놀이공원</a></li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </li>
        <li class="item">
          <div class="item__name">맛집&카페</div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                <li>
                  <h4>지역</h4>
                  <ul>
                    <li>
                    <a href="<%= request.getContextPath() %>/tfview?region=서울경기도">서울&경기</a>
                    </li>
                    <li>
                    <a href="<%= request.getContextPath() %>/tfview?region=전라도">전라도</a>
                    </li>
                    <li><a href="<%= request.getContextPath() %>/tfview?region=경상도">경상도</a></li>
                  </ul>
                </li>
                <li>
                  <ul>
                    <li><a href="<%= request.getContextPath() %>/dcview?region=충청도">충청도</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcview?region=강원도">강원도</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcview?region=제주도">제주도</a></li>
                  </ul>
                </li>
                <li>
                  <h4>맛집</h4>
                  <ul>
                    <li><a href="<%= request.getContextPath() %>/dcview?foodfeature=일식">일식</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcview?foodfeature=양식">양식</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcview?foodfeature=중식">중식</a></li>
                  </ul>
                </li>
                <li>
                  <ul>
                    <li><a href="<%= request.getContextPath() %>/dcview?foodfeature=한식">한식</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcview?foodfeature=분식">분식</a></li>
                    <li><a href="<%= request.getContextPath() %>/dcview?foodfeature=기타">기타</a></li>
                  </ul>
                </li>
                <li>
                  <h4>카페</h4>
                  <ul><li><a href="<%= request.getContextPath() %>/dcview?cafe=카페">Coffee shop</a></li></li></ul>
                </li>
              </ul>
            </div>
          </div>
        </li>
        <li class="item">
          <div class="item__name">게시판</div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                <li>
                  <h4>게시판</h4>
                  <ul>
                     <li> <a href="<%= request.getContextPath() %>/friendBoard.bo">동행게시판</a></li>
                    <li><a href="<%= request.getContextPath() %>/.bo">공지사항</a></li>
                    <li><a href="<%= request.getContextPath() %>/.bo">자유게시판</a></li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </li>
      </ul>                                                                             <!--html 변경 부분-->
    </div>
  </header>

  <!--LEFT SIDEBAR 채팅창-->
  <div class="inner">
    <div class="left-sidebar"></div>
  </div>













  <!--FOOTER-->

<!--     <footer> -->
<!--       <div class="inner"> -->
<!--         <div class="items"> -->
<!--           <div class="item"> 회사 설명 -->
<!--             <p>회사 설명</p> -->
<!--             <p>asdsad</p> -->
<!--             <p>asdad</p> -->
<!--           </div> -->
<!--           <div class="item"> 회사 정보 -->
<!--             <p>회사 정보</p> -->
<!--             <p>asda</p> -->
<!--             <p>sadsadasdsada</p> -->
<!--           </div> -->
<!--           <div class="item"> -->
<!--             <p>근무 시간 정보</p> 근무시간 정보 -->
<!--             <p>sada</p> -->
<!--             <p>adssad</p> -->
<!--             <p>asdsad</p> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </footer> -->

  
</body>
</html>