// 페이지의 스크롤 위치를 맨 위로 이동시키는 함수
// function scrollToTop() {
    // 부드러운 스크롤 효과를 주려면 window.scrollTo 대신에 아래와 같이 사용할 수 있습니다.
    // window.scrollTo({ top: 0, behavior: 'smooth' });
    // window.scrollTo(0, 0); .
  // }
  
  // 스크롤 위치가 일정 이상 내려갔을 때 버튼을 보여주는 기능
  // window.onscroll = function() {
  //   const scrollBtn = document.getElementById("scrollBtn");
  //   if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
  //     scrollBtn.style.display = "block";
  //   } else {
  //     scrollBtn.style.display = "none";
  //   }
  // };


  $(document).ready(function() {
    $(window).scroll(function() {
        if ($(this).scrollTop() > 500) {
            $('#topButton').fadeIn();
        } else {
            $('#topButton').fadeOut();
        }
    });
    $("#topButtonImg").click(function() {
        $('html, body').animate({scrollTop:0}, '300');
    });
});




  