/*시간표시 함수*/
    // 버튼 요소 가져오기
    var printTimeButton = document.getElementById('printTimeButton');

    // 현재 시간을 프린트하는 함수
    function printCurrentTime() {
        var currentTimeElement = document.getElementById('currentTime');

        // 현재 시간 가져오기
        var currentTime = new Date();
        var hours = currentTime.getHours();
        var minutes = currentTime.getMinutes();
        var seconds = currentTime.getSeconds();

        // 시, 분, 초를 이용하여 시간 문자열 생성
        var timeString = hours + ':' + (minutes < 10 ? '0' : '') + minutes + ':' + (seconds < 10 ? '0' : '') + seconds;

        // 시간 문자열을 화면에 출력
        currentTimeElement.innerHTML = timeString + '기준';
    }

    // 버튼 클릭 이벤트에 함수 연결
    printTimeButton.addEventListener('click', printCurrentTime);