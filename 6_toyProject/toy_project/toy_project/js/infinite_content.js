$(document).ready(function () {
    // 초기 페이지 번호
    let page = 1;

    // 스크롤 이벤트 감지
    $(window).scroll(function () {
        // 스크롤이 맨 아래에 도달했을 때
        if ($(window).scrollTop() + $(window).height() == $(document).height()) {
            // 새로운 콘텐츠를 가져와서 출력
            loadMoreContent(page);
            page++;
        }
    });

    // 새로운 콘텐츠를 가져오는 함수
    function loadMoreContent(page) {
        for (let i = 1; i <= 50; i++) {
            $('.content').append('<div class="item">' + (page * 5 + i) + '</div>');
        }
    }
});