$(document).ready(function () {

    // 글자수 세기
    $('#content').on('input', function () {
        var currentLength = $(this).val().length;
        $('#character-count-warning').val(currentLength);
    });
});
