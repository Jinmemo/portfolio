<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <link rel="stylesheet" href="./css/basicTool.css">
    <!-- wishlist css -->
    <link rel="stylesheet" href="./css/wishList.css">

    <!--Google Fonts - 나눔고딕-->
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />
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
        <section> 
            <div class="wish-main">
                <p>나의 찜한 목록 <p>
            </div>
            <div class="wish-main-explain">
                <p>내가 찜한 정보 확인하기 <br> 나의 찜한 목록에서는 찜한 정보를 카테고리별로 살펴볼 수 있습니다.</p>
                <span class="material-symbols-outlined delete" onclick="deleteContent()">delete</span> <!-- 휴지통아이콘 -->
            </div>
            
            <div class="outer">
                <!-- 카테고리 메뉴바 -->
                <div class="categories">
                    <div class="category selected-category"  data-category="all" onclick="showCategory('all')">전체보기</div>
                    <div class="category" data-category="travel" onclick="showCategory('travel')">여행지&축제</div>
                    <div class="category" data-category="restaurant" onclick="showCategory('restaurant')">식당&카페</div>
                    <div class="category" data-category="friend" onclick="showCategory('friend')">동행</div>
                </div>
                
                <img src="" alt="" class="remove">
                <!-- 아이템 -->
                <div class="category-content">
                    <div class="content travel">
                        <div>
                            <span>여행지 1</span>
                            <input type="checkbox" class="checkContent">
                        </div>
                        <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=f68e6f27-1664-431d-8e69-4bfd00b05058&mode=raw" alt="">
                    </div>
                    <div class="content travel">
                        <div>
                            <span>여행지 2</span>
                            <input type="checkbox" class="checkContent">
                        </div>
                        <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=2483c8b6-3e4a-4d16-930b-0eba7d3a4021&mode=raw" alt="">
                    </div>
                    <div class="content travel">
                        <div>
                            <span>여행지 3</span>
                            <input type="checkbox" class="checkContent">
                        </div>
                        <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=0e39da4a-6e54-405d-8758-671f5be1b772&mode=raw" alt="">
                    </div>
                    <div class="content travel">
                        <div>
                            <span>여행지 4</span>
                            <input type="checkbox" class="checkContent">
                        </div>
                        <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=2483c8b6-3e4a-4d16-930b-0eba7d3a4021&mode=raw" alt="">
                    </div>


                    <div class="content restaurant">
                        <div>
                            <span>식당 1</span>
                            <input type="checkbox" class="checkContent">
                        </div>
                        <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=fec064fc-d8da-45ab-a55c-462fdba354d1" alt="">
                    </div>
                    <div class="content restaurant">
                        <div>
                            <span>식당 2</span>
                            <input type="checkbox" class="checkContent">
                        </div>
                        <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=fec064fc-d8da-45ab-a55c-462fdba354d1" alt="">
                    </div>

                    <div class="content friend">
                        <div>
                            <span>동행 1</span>
                            <input type="checkbox" class="checkContent">
                        </div>
                        <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=ecb65334-88e9-4ef3-a908-1802aee7795b" alt="">
                    </div>
                    <div class="content friend">
                        <div>
                            <span>동행 2</span>
                            <input type="checkbox" class="checkContent">
                        </div>
                        <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=ecb65334-88e9-4ef3-a908-1802aee7795b" alt="">
                    </div>
                    <div class="content friend">
                        <div>
                            <span>동행 3</span>
                            <input type="checkbox" class="checkContent">
                        </div>
                        <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=ecb65334-88e9-4ef3-a908-1802aee7795b" alt="">
                    </div>
                    <div class="content friend">
                        <div>
                            <span>동행 4</span>
                            <input type="checkbox" class="checkContent">
                        </div>
                        <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=ecb65334-88e9-4ef3-a908-1802aee7795b" alt="">
                    </div>
                </div>
            </div>
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


    <script>
        function showCategory(categoryId) {

            //전체보기를 눌렀을 때
            if(categoryId == 'all'){ 
                document.querySelectorAll('.content').forEach(function(categoryContent) {
                categoryContent.style.display = 'flex';
            });
            //각 카테고리 눌렀을 때
            }else{
                // 모든 카테고리 숨기기
                document.querySelectorAll('.content').forEach(function(categoryContent) {
                    categoryContent.style.display = 'none';
                });    
                // 클릭한 카테고리 보이기
                document.querySelectorAll('.'+categoryId).forEach(function(categoryContent) {
                    categoryContent.style.display = 'flex';
                });    
            }

           // 선택된 카테고리 표시를 업데이트
            document.querySelectorAll('.category').forEach(function (category) {
                category.classList.remove('selected-category');
            });

            document.querySelector('.category[data-category="' + categoryId + '"]').classList.add('selected-category');
        }

        // 휴지통 클릭 시 삭제  -->> 자바 연결해서 하기
        function deleteContent(){
            document.querySelectorAll('.checkContent:checked').forEach(function (checkedContent) {
                checkedContent.closest('.content').style.display = 'none';
            });
         }
    </script>
    


</body>
</html>