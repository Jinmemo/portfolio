document.addEventListener("DOMContentLoaded", function () {
    var profileImageInput = document.getElementById("profileImage");
    var profilePreview = document.getElementById("profilePreview");
    var largeProfilePreviewContainer = document.getElementById("largeProfilePreviewContainer");
    var largeProfilePreview = document.getElementById("largeProfilePreview");

    var profileImageLabel = document.getElementById("profileImageLabel");
    var btn2 = document.getElementById("btn_2");

    // 파일 업로드 input을 숨겨둠
    profileImageInput.style.display = "none";

    // 레이블을 클릭하면 동그라미 큰 이미지로 확대해서 보여줌
    profileImageLabel.addEventListener("click", function () {
        if (profilePreview.src) {
            largeProfilePreview.src = profilePreview.src;
            largeProfilePreviewContainer.style.display = "flex";
        }
    });

    // 동그라미 큰 이미지를 클릭하면 닫기
    largeProfilePreviewContainer.addEventListener("click", function () {
        largeProfilePreviewContainer.style.display = "none";
    });

    // 프로필 등록 버튼을 누를 시에도 파일 업로드 input 클릭
    btn2.addEventListener("click", function () {
        profileImageInput.click();
    });

    // 파일 업로드 input에 변화가 있을 때 이벤트 처리
    profileImageInput.addEventListener("change", function (event) {
        var file = event.target.files[0];

        if (file) {
            var reader = new FileReader();

            reader.onload = function (e) {
                // 이미지 미리보기 엘리먼트에 파일 내용을 설정하여 이미지 출력
                profilePreview.src = e.target.result;
            };

            reader.readAsDataURL(file);

            // 파일 업로드 input을 초기화
            profileImageInput.value = null;
        }
    });
});