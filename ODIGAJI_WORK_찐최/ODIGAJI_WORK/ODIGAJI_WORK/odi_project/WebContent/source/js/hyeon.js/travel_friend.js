$(document).ready(function() {
    // 번개 아이콘에 클릭 이벤트 핸들러를 추가
    $(".icon-light").on("click", function() {
        // 일반 번개 아이콘과 노란색 번개 아이콘 사이를 전환합니다.
        toggleIcon($(this), './source/style/img/travel_friend_img/icon-lightning.png', './source/style/img/travel_friend_img/icon-lightning-yellow.png');
    
    });


    // 아이콘을 전환하는 함수
    function toggleIcon(iconElement, regularSrc, alternateSrc) {
        // 현재 아이콘의 소스를 확인합니다.
        if (iconElement.attr("src") === regularSrc) {
            // 일반 아이콘이라면 대체 아이콘으로 전환
            iconElement.attr("src", alternateSrc);
        } else {
            // 대체 아이콘이라면 일반 아이콘으로 전환
            iconElement.attr("src", regularSrc);
        }
    }

	// 검색 버튼 클릭 이벤트 처리
    $('.search-button').click(function(event) {
      event.preventDefault();

      // 검색어 가져오기
      var keyword = $('.search-bar').val();

      // 검색 결과 페이지로 이동 또는 검색 기능 구현
      // 여기서는 검색 결과 페이지로 이동하도록 설정했습니다.
      window.location.href = 'friendSearch.bo?keyword=' + encodeURIComponent(keyword);
    });

    // Enter 키 이벤트 처리
    $('.search-bar').keydown(function(event) {
      if (event.key === 'Enter') {
        // 검색 버튼 클릭 이벤트 실행
        $('.search-button').click();
      }
    });
    
    
    // 번개 아이콘에 클릭 이벤트 따라 지난 날짜 모두 숨김처리
    var isHidden = false; // 초기 상태는 모두 표시되는 상태로 설정

    // 클릭 이벤트 처리
    $('.icon-light').on('click', function () {
      // 클릭된 아이콘에 따라 이미지 경로 가져오기
      var iconSrc = $(this).attr('src');

      // 각 friend-list에 대해 처리
      $('.friend-list').each(function () {
        var endDateText = $(this).find('#endDate').text(); // endDate의 텍스트 가져오기
        var endDate = new Date(endDateText);

        // 아이콘에 따라 상태에 따라 각 요소를 표시하거나 숨김 처리
        if (iconSrc.includes('icon-lightning-yellow.png') && new Date() > endDate) {
          $(this).hide(); // 숨김 처리
        } else {
          $(this).show(); // 보이도록 처리
        }
      });

      // 상태 업데이트
      isHidden = !isHidden;
    });



    

});