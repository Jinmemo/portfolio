// 함수 execDaumPostcode 정의
function execDaumPostcode() {
    // daum.Postcode 객체 생성 및 초기화
    new daum.Postcode({
        // 주소 검색 완료 후 실행될 콜백 함수 정의
        oncomplete: function(data) {
            // 주소 및 참고항목을 저장할 변수 초기화
            var addr = '';
            var extraAddr = '';

            // 사용자가 도로명 주소를 선택했을 경우
            if (data.userSelectedType === 'R') {
                addr = data.roadAddress; // 도로명 주소 저장
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress; // 지번 주소 저장
            }

            // 사용자가 도로명 주소를 선택한 경우에만 추가 정보 처리
            if (data.userSelectedType === 'R') {
                // 법정동명이 있고, 동/로/가로 끝나는 경우 extraAddr에 추가
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }

                // 건물명이 있고, 아파트일 경우 extraAddr에 추가
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
            }

            // 우편번호와 주소 정보를 해당 필드에 입력
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;

            // 참고항목이 있을 경우 해당 필드에 입력하고 보이게 함, 없을 경우 감추기
            if (extraAddr !== '') {
                document.getElementById("extraAddress").value = extraAddr;
                document.getElementById("extraAddress").style.display = 'block'; // 참고항목 보이기
            } else {
                document.getElementById("extraAddress").style.display = 'none'; // 참고항목 감추기
            }

            // 상세주소 필드로 커서 이동
            document.getElementById("detailAddress").focus();
        }
    }).open(); // 우편번호 검색 팝업 열기
}
