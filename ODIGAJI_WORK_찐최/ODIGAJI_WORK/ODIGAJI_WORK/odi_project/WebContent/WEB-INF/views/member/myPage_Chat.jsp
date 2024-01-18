<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지_채팅방</title>

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
    <link rel="stylesheet" href="./css/basictool.css">
    <!-- wishlist css -->
    <link rel="stylesheet" href="./css/myPage_Chat.css">

    <!--Google Fonts - 나눔고딕-->
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />

    <!-- Delete icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="./js/myPage_Chat.js"></script>

  </head>


<body>
  <!--HEADER-->
  <header>
    <div class="inner">
      <a href="/" class="logo">
        <img src="./images/odigaji_logo.png" alt="ODIGAJI" />
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
            <a href="javascript:void(0)"><span class="material-symbols-outlined">
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
                    <li>서울&경기</li>
                    <li>전라도</li>
                    <li>경상도</li>
                  </ul>
                </li>
                <li>
                  <ul>
                    <li>충청도</li>
                    <li>강원도</li>
                    <li>제주도</li>
                  </ul>
                </li>
                <li>
                 <h4>계절</h4>
                  <ul>
                    <li>봄</li>
                    <li>여름</li>
                    <li>가을</li>
                    <li>겨울</li>
                  </ul>
                </li>
                <li>
                  <h4>테마</h4>
                  <ul>
                    <li>생태</li>
                    <li>전통</li>
                    <li>공연퍼레이드</li>
                    <li>놀이공원</li>
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
                    <li>서울&경기</li>
                    <li>전라도</li>
                    <li>경상도</li>
                  </ul>
                </li>
                <li>
                  <ul>
                    <li>충청도</li>
                    <li>강원도</li>
                    <li>제주도</li>
                  </ul>
                </li>
                <li>
                  <h4>맛집</h4>
                  <ul>
                    <li>일식</li>
                    <li>양식</li>
                    <li>중식</li>
                  </ul>
                </li>
                <li>
                  <ul>
                    <li>한식</li>
                    <li>분식</li>
                    <li>기타</li>
                  </ul>
                </li>
                <li>
                  <h4>카페</h4>
                  <ul><li>Coffee shop</li></ul>
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
                    <li>동행 게시판</li>
                    <li>공지사항 게시판</li>
                    <li>자유 게시판</li>
                  </ul>
                </li>  
              </ul>
            </div>
          </div>
        </li>
      </ul>                                                                             <!--html 변경 부분-->
    </div>
  </header>


<main>
  <div class="mypage"><a href="#">마이페이지</a></div>
    <section class="profileSection">   <!-- form -->
          <article class="profile">
              <div class="profile-image-div">
                  <img class="profile-image" src="https://m.pixelstore.kr/web/upload/jwgimg_m/right_category_bt.png" alt="프로필 이미지">
                  <!-- <img class="profile-image" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA2MDJfMzEg%2FMDAxNjg1Njk5NTYyNzcy.RC_mRT62FiirdFE7UEZrvDDlhyH-jXweMjgW-OqJx7Ig.t2HOJUoxkufwGej2HpJtF13TtfP0_o8DjNHEdybusAog.JPEG.itsallaboutsia%2FIMG_9643.JPG&type=sc960_832" 
                  alt="프로필 이미지">-->
              </div>
              <ul class="profile-ul">
                  <li name="gender"> 성별 : 남자 </li>
                  <li name="age"> 나이 : 25 </li>
                  <li name="address"> 지역 : 서울 </li>
              </ul>
          </article>
          <article> 
              <p class="introduction">안녕하세요. 홍길동입니다. 
                  프로그래밍을 공부하고 있고, 여행을 좋아합니다.
                  잘 부탁드립니다!
              </p>
          </article>
    </section>

    <section class="chatRoomSection">
        <hr>
        <subject class="chatRoomSection-content">
          <div class="chatRoomCount">
            <label><input type="radio" name="myPageChatAccompany" class="chatRoom-partic" checked onclick="toggleChatRooms(true)"><sapn class="custom-radio">참여중인 채팅방
            <div class="chat-room-count">0</div></label>
            
          </div>
          <div class="chatRoomCount">
            <label><input type="radio" name="myPageChatAccompany" class="chatRoomCount-accompany" onclick="toggleChatRooms(false)"><sapn class="custom-radio">동행 수락 대기
            <div class="accompany-room-count">0</div></sapn></sapn></label>
          </div>
        </subject>
        <hr>
        <article class="chat-rooms" >
          <div class="chat-room">
              <div>5명 참여 중</div> 
              <div>여수 밤바다 보러가실 분?</div>
              <div class="chatNew">NEW</div>
          </div>
          <div class="chat-room">
              <div>3명 참여 중</div>
              <div>힘들다</div>
              <div class="chatNew">NEW</div>
          </div>
          <div class="chat-room">
              <div>10명 참여 중</div>
              <div>아무나 환영</div>
              <div class="chatNew">NEW</div>
          </div>
        </article>
        <article class="accompany-rooms" hidden>
          <div class="accompany" id="member1">
       
              <img class="profile-image-accompany" src="https://cdn-icons-png.flaticon.com/128/149/149071.png" alt="프로필 이미지">
              <div>이고래</div> 

            <div class="accompany-button">
              <input type="button" value="수락"></input>
              <input type="button" value="취소" class="cancel-button"></input>
            </div>
          </div>
          <div class="accompany" d="member2">
       
            <img class="profile-image-accompany" src="https://cdn-icons-png.flaticon.com/128/149/149071.png" alt="프로필 이미지">
            <div>이고래</div> 

          <div class="accompany-button">
            <input type="button" value="수락"></input>
            <input type="button" value="취소" class="cancel-button"></input>
          </div>
        </div>
        </article>
    </section>
</main>

  <!--FOOTER-->
  <footer>
    <div class="inner">
        <div class="items">
        <div class="item"> <!--회사 설명-->
            <p>회사 설명</p>
            <p>asdsad</p>
            <p>asdad</p>
        </div>
        <div class="item"> <!--회사 정보-->
            <p>회사 정보</p>
            <p>asda</p>
            <p>sadsadasdsada</p>
        </div>
        <div class="item">
            <p>근무 시간 정보</p> <!--근무시간 정보-->
            <p>sada</p>
            <p>adssad</p>
            <p>asdsad</p>
        </div>
        </div>
    </div>
  </footer>


    
</body>
</html>