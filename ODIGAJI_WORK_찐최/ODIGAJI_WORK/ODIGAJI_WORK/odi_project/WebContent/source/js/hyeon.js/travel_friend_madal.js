$(document).ready(function() {
// 모달 열기
    $("#openModal").click(function() {
            $("#myModal").fadeIn();
    });

    // 모달 닫기
    $("#closeModal").click(function() {
        $("#myModal").fadeOut();
    });


    // 모달 외부를 클릭하면 닫기
    $(window).click(function(event) {
        var modal = $("#myModal");
        if (event.target === modal[0]) {
          modal.fadeOut();
        }
      });


    // 모달 날짜 선택
    $("#startDate, #endDate").change(function() {
	    var startDate = new Date($("#startDate").val());
	    var endDate = new Date($("#endDate").val());
	
	    if (endDate < startDate) {
	        alert("종료 날짜는 시작 날짜 이후로 설정해야 합니다.");
	        $("#endDate").val(""); // 종료 날짜 초기화
	    }
    });
    




	

});

// 카테고리, 도시 입력, 날짜 초기화
function resetFilters() {
    $("#categorySelect").val($("#categorySelect option:first").val());
    $("#cityInput").val("서울");
    $("#startDate, #endDate").val("");
  }


