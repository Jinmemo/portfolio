$(document).ready(function () {

    // 참여중인 채팅방 클릭시 보이도록
    $('.chatRoom-partic').click(function () {
      $('.chat-rooms').show();
      $('.accompany-rooms').hide();
    });

    // 동행 수락 대기 버튼 클릭시 보이도록
    $('.chatRoomCount-accompany').click(function () {
      $('.chat-rooms').hide();
      $('.accompany-rooms').show();
    });


    // 참여중인 채팅방, 동행 수락 대기 수량 count

    // 초기 카운트 업데이트
    updateChatRoomCount();
    updateAccompanyRoomCount();

    // ... (기존의 코드)

    // "취소" 버튼 클릭 이벤트 처리
    $('.cancel-button').click(function () {
      // 해당 .accompany 엘리먼트 제거
      $(this).closest('.accompany').remove();
      // 제거 후 카운트 업데이트
      updateChatRoomCount();
      updateAccompanyRoomCount();
    });

    // 채팅방 카운트 업데이트 함수
    function updateChatRoomCount() {
        // 채팅방 개수 가져오기
        var chatRoomCount = $('.chat-rooms .chat-room').length;

        // UI에서 카운트 업데이트
        $('.chat-room-count').text(chatRoomCount);
    }

    // 동행 수락 대기 카운트 업데이트 함수
    function updateAccompanyRoomCount() {
        // 동행 수락 대기방 개수 가져오기
        var accompanyRoomCount = $('.accompany-rooms .accompany').length;

        // UI에서 카운트 업데이트
        $('.accompany-room-count').text(accompanyRoomCount);
    }

});