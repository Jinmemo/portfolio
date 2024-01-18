// const sildesBox = document.querySelector(".slides-box");
// const sliedWrap = sildesBox.querySelector(".silder-wrap");
// const slideItem = sliedWrap.querySelectorAll(".slide-item");

// let currentIndex = 0; //현재 보이는 이미지
// let sliderCount = sliedWrap.length;  // 이미지 갯수


// //함수를 여러번 반복 사용하기 위해 사용 1000 = 1s
// setInterval(() =>{
//   let nextIndex = (currentIndex +1 )% slideCount; 

//   slideItem[currentIndex].style.opacity = "0";
//   slideItem[nextIndex].style.opacity = "1";

//   currentIndex = nextIndex;
// },1000)
$(document).ready(function () {
  const slideWidth = $('.slide-wrap').outerWidth(true);
  let currentPosition = 0;

  $('.arrow-next').click(function () {
      const maxPosition = $('.trend-block').outerWidth(true) - $('.slides-box').outerWidth();
      currentPosition = Math.min(currentPosition + slideWidth, maxPosition);
      $('.trend-block').css('transform', `translateX(${-currentPosition}px)`);
  });

  $('.arrow-prev').click(function () {
      currentPosition = Math.max(currentPosition - slideWidth, 0);
      $('.trend-block').css('transform', `translateX(${-currentPosition}px)`);
  });
});