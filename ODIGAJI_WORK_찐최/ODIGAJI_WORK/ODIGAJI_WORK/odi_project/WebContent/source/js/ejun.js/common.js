new Swiper('.promotion .swiper-container', {
  // direction: 'horizontal', // 수평 슬라이드
  autoplay: { // 자동 재생 여부
    delay: 5000 // 5초마다 슬라이드 바뀜
  
  },
  loop: true, // 반복 재생 여부
  slidesPerView: 1, // 한 번에 보여줄 슬라이드 개수
  spaceBetween: 0, // 슬라이드 사이 여백
  centeredSlides: true, // 1번 슬라이드가 가운데 보이기
  pagination: { // 페이지 번호 사용 여부
    el: '.promotion .swiper-pagination', // 페이지 번호 요소 선택자
    clickable: true // 사용자의 페이지 번호 요소 제어 가능 여부
  },
  navigation: { // 슬라이드 이전/다음 버튼 사용 여부
    prevEl: '.promotion .swiper-prev', // 이전 버튼 선택자
    nextEl: '.promotion .swiper-next' // 다음 버튼 선택자
  }
})



/* 여행 추천 사이드바 닫기 */

function right_sidebar_close(){
  
  if(document.querySelector(".inner #right-sidebar").style.display=="none"){
    document.querySelector(".inner #right-sidebar").style.display="block"

  }else
    document.querySelector('.inner #right-sidebar').style.display="none"
}

new Swiper('.tomorrow-suggestion .swiper-container', {
  // direction: 'horizontal', // 수평 슬라이드
  autoplay: false, //자동재생 off
  loop: true, // 반복 재생 여부
  slidesPerView: 4, // 한 번에 보여줄 슬라이드 개수
  spaceBetween: 0, // 슬라이드 사이 여백
  centeredSlides: false, // 1번 슬라이드가 가운데 보이기
  pagination: { // 페이지 번호 사용 여부
    el: '.tomorrow-suggestion .swiper-pagination', // 페이지 번호 요소 선택자
    clickable: true // 사용자의 페이지 번호 요소 제어 가능 여부
  },
  navigation: { // 슬라이드 이전/다음 버튼 사용 여부
    prevEl: '.tomorrow-suggestion .swiper-prev', // 이전 버튼 선택자
    nextEl: '.tomorrow-suggestion .swiper-next' // 다음 버튼 선택자
  }
})

new Swiper('.hot5-suggestion .swiper-container', {
  // direction: 'horizontal', // 수평 슬라이드
  autoplay: false, //자동재생 off
  loop: true, // 반복 재생 여부
  slidesPerView: 4, // 한 번에 보여줄 슬라이드 개수
  spaceBetween: 0, // 슬라이드 사이 여백
  centeredSlides: false, // 1번 슬라이드가 가운데 보이기
  pagination: { // 페이지 번호 사용 여부
    el: '.hot5-suggestion .swiper-pagination', // 페이지 번호 요소 선택자
    clickable: true // 사용자의 페이지 번호 요소 제어 가능 여부
  },
  navigation: { // 슬라이드 이전/다음 버튼 사용 여부
    prevEl: '.hot5-suggestion .swiper-prev', // 이전 버튼 선택자
    nextEl: '.hot5-suggestion .swiper-next' // 다음 버튼 선택자
  }
})



