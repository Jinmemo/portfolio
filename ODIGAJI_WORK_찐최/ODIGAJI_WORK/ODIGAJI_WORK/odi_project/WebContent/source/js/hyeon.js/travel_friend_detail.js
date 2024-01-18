$(document).ready(function() {

	// 비밀댓글 여부 클릭 이벤트
    $('#unlockButton').on('click', function() {
        $(this).hide();
        $('#lockButton').show();
    });

    $('#lockButton').on('click', function() {
        $(this).hide();
        $('#unlockButton').show();
    });
    
    
    // 동행 신청, 해제 여부 클릭 이벤트
    $('.btn-accompany').on('click', function() {
	    $(this).hide();
	    $('.btn-noaccompany').show();
	    alert("동행신청이 완료되었습니다. 동행 수락 대기중입니다.");
    });

    $('.btn-noaccompany').on('click', function() {
        $(this).hide();
        $('.btn-accompany').show();
        alert("동행 취소되었습니다.");
    });
    
    

    
})