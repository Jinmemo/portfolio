$(document).ready(function() {
        // 모달 날짜 선택
    $("#startDate1, #endDate1").change(function() {
        var startDate = new Date($("#startDate1").val());
        var endDate = new Date($("#endDate1").val());

        if (endDate < startDate) {
            alert("종료 날짜는 시작 날짜 이후로 설정해야 합니다.");
            $("#endDate1").val(""); // 종료 날짜 초기화
        }
    });
    
	

    // 폼 제출 전에 나이대 또는 도시 선택 여부를 확인
	function checkForm() {
	  // 선택된 나이대와 도시를 가져옴
	  var selectedAge = $("input[name='travel-age']:checked").val();
	  var selectedCity = $("select[name='city']").val();
	
	  if (selectedAge === undefined || selectedAge === "") {
	    alert("선호하는 연령대를 선택해주세요.");
	    return false;
	  } else if (selectedCity === "default") {
	    alert("도시를 선택해주세요.");
	    return false;
	  } else {
	    // 나이대 또는 도시 중 하나라도 선택되었다면 폼을 제출
	    console.log("폼이 정상적으로 제출되었습니다."); // 콘솔에 로그 출력
	  	return true;
	  }
	}
	
	// 폼 제출 이벤트에 checkForm 함수 연결
    $("form").submit(function (event) {
        if (!checkForm()) {
            event.preventDefault(); // 폼 제출을 막음
        }
    });

    
    // 취소버튼 클릭시 뒤로 페이지 이동
    $(".back").click(function () {
      // 브라우저의 이전 페이지로 이동
      window.history.back();
    });
    
    
});
