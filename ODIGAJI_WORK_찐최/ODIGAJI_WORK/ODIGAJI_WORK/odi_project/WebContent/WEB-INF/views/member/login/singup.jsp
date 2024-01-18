<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- 메타 태그 -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 페이지 제목 -->
    <title>회원가입</title>
      <link rel="stylesheet" href="./source/style/css/gun.css/singup.css">
     <!-- jquery -->
     <script type="text/javascript" src="/js/jquery-1.11.3.min.js"></script>
     <script src="source/js/loginjs/address.js"></script>
    <!-- 주소 api -->
     <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
     
     <script src="source/js/loginjs/singup.js"></script> 
     <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    
</head>

<body>

    <!-- 헤더 -->
    <%-- <jsp:include page="../../common/header.jsp" /> --%>

    <header>
        <h1>회원가입</h1>
    </header>

    <br><br>

    <!-- 회원가입 폼 -->
    <form action="${pageContext.request.contextPath}/singup.me" method="post" id="idCheck" > <!-- enctype="multipart/form-data" -->
    <!--    <!-- 프로필 이미지 업로드 부분 -->
    <!-- <label for="profileImageLabel" id="profileImageLabel">
        <img id="profilePreview" alt="">
    </label>
    <br>
    <input type="file" id="memberProfile" name="profileImage" accept="image/*" style="display: none;">

    프로필 등록 버튼
    <button id="btn_2" type="submit">프로필 등록</button>

    동그라미 큰 이미지
    <div id="largeProfilePreviewContainer">
        <img id="largeProfilePreview" alt="프로필 이미지">
    </div> <br> --> 
        
        <!-- 아이디 입력 부분 -->
        <label for="username">아이디</label>
        <input type="text" id="idsize" name="memberId" pattern="[a-zA-Z0-9]+" required style="width: 130px;">
        <button id="openAddressPopup" type="button" onclick="idCheck();">중복 확인</button> <br>
        
		        <script>
			const idCheck = () => {
				
				const $memberId = $("#idCheck input[name=memberId]");
				
				$.ajax({
					url : "idCheck.me",
				data : {memberId : $memberId.val()},
				type : 'post',
				success : function(result){
					if(result === "NNNNN"){
						alert("이미 존재하거나 탈퇴한 회원입니다.");
					memberId.focus();	
					}else if(result === "NNNNE") {
						alert("사용이 불가능한 아이디입니다. a-z , A-Z , 0-9만 사용 가능합니다.");
					$memberId.focus();
					} else {
						if(cofirm("사용가능한 아이디입니다. 사용하시겠습니까?")) {
							
							$memberId.attr("readonly" , true); //확정
						}else {
							$memberId.focus();
						}
					}
				}
				})
			}
		</script>

        <!-- 비밀번호 입력 부분 -->
        <label for="password">비밀번호</label>
        <input type="password" id="memberPwd" name="memberPwd" required>
        
        <!-- 비밀번호 확인 입력 부분 -->
        <label for="confirmPassword">비밀번호 확인</label>
        <input type="password" id="memberPwdCheck" name="memberPwdCheck" required>

        <!-- 이름 입력 부분 -->
        <label for="name">이름</label>
        <input type="text" id="memberName" name="memberName" required>

        <!-- 휴대폰 입력 부분 -->
        <label for="phone">휴대폰</label>
        <input type="tel" id="phone" name="phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="010-1234-5678"
            required>

        <!-- 이메일 입력 부분 -->
        <label for="ssn">이메일</label>
        <div id="emailContainer">
            <input type="text" id="emailPrefix" name="emailPrefix" placeholder="이메일 앞 부분" required>
            <span id="atSymbol">@</span>
            <input type="text" id="emailSuffix" name="emailSuffix" placeholder="도메인" required>
        </div>

        <!-- 주민등록번호 입력 부분 -->
        <label for="ssn">주민등록번호</label>
        <div id="ssnContainer">
            <input type="text" id="ssnPrefix" name="ssnPrefix" placeholder="주민등록번호 앞 6자리" required maxlength="6">
            <span id="hyphen">-</span>
            <input type="password" id="ssnSuffix" name="ssnSuffix" placeholder="뒷자리" required maxlength="7">
        </div>

        <!-- 주소 입력 부분 -->
        <label for="address">주소</label> <br>
        <input type="text" id="postcode" name="postcode" placeholder="우편번호">
        <button id="openAddressPopup" type="button"  onclick="execDaumPostcode()" value="우편번호 찾기">우편번호 찾기</button>
        <input type="text" id="address" name="address" placeholder="주소"><br>
        <input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소"><br>
        <input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목">
        
        <!-- 성별 입력 부분 -->
        <label for="gender">성별</label>
        <input type="text" id="gender" name="gender" placeholder="남자는 M을 여자는 F를 입력하세요" required>

        <!-- 자기소개 입력 부분 -->
        <label for="introduction">자기소개</label>
        <textarea id="aboutMe" name="aboutMe" required></textarea>

        <!-- 가입하기 버튼 -->
        
        <button type="submit" id="btn_1">가입하기</button>
        <br>
    </form>
    <br><br>

    <!-- 푸터 -->
    <footer>
        <p>&copy; 2023 회원가입 서비스</p>
    </footer>

</body>

</html>
