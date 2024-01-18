<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   %>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <!-- 파비콘 -->
  <link rel="shortcut icon" href="./images/tomorrow1.gif">
  <title>Odigaji</title>

  <!--브라우저 스타일 초기화-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />
  <!--Google Material Icons-->
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
  <!-- sidebar open/close Icon -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <!-- login icon -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <!-- my page icon -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
  <!-- heart icon -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <!-- chat icon -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

  <!-- css -->
  <link rel="stylesheet" href="./source/style/css/ensun.css/basicTool.css">
  <link rel="stylesheet" href="./source/style/css/hyeon.css/boardForm.css">
  <link rel="stylesheet" href="./source/style/css/hyeon.css/travelFriendForm.css">
  
  <!-- jquery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="./source/js/hyeon.js/board.js"></script>
  <script src="./source/js/hyeon.js/travel_friendForm.js"></script>

</head>
<body>
  <jsp:include page="../../common/header.jsp" />

    <!--LEFT SIDEBAR 채팅창-->
    <div class="inner">
        <div class="left-sidebar"></div>
    </div>

    <main>
        <div class="outer">
            <br>
            <span class="general-board-title">동행 게시판 작성</span>
            
            <form action="friendUpdate.bo" method="post" class="board-content">
                
                <!-- 카테고리, 제목, 내용, 첨부파일 넘겨주어야 함(사용자가 선택하거나 입력해야하는 것) -->
                <!-- 회원번호 → input type hidden으로 넘길예정 (사용자가 자기 회원번호를 입력하는 것은 이상하니까) -->
                <input type="hidden" name="memberId" value="${loginUser.memberId}">
                <input type="hidden" name="fboardNo" value="${tfc.fboardNo }">
	
                <table class="general-board-content">
                    <tr>
                        <th>카테고리</th>
                        <td>
                            <select name="category">
                                <!-- DB에 저장되어있는 category_no는 value에 저장 -->
								<c:forEach var="category" items="${list}">
                    				<option value="${category.categoryNo}" <c:if test="${tfc.friendCategory eq category.categoryNo}"> selected </c:if>>${category.categoryName}</option>
                				</c:forEach>
                            </select>
                        </td>
                    </tr>
                    
 
                    <tr>
					
                        <th>제목</th>
                        <td><input type="text" name="title" required placeholder="제목을 입력하세요." value="${tfc.friendTitle }"></td>
                    </tr>
                    <tr>
                        <div>
                            <th class="write-content">내용</th>
                            <td>
                                <textarea name="content" id="content" rows="20" cols="80" maxlength="200" oninput="calc()" required
                                placeholder="내용을 입력하세요.">${tfc.friendContent}</textarea><br>
                                <input id="character-count-warning" class="character-count-warning" value="0" type="number" readonly ></input>
                                <span class="character-count-warning">/ 200</span>
                            </td>
                        </div>
                    </tr>
                    <tr>
                        <th>날짜 선택</th>
                        <td>
                            <input type="date" id="startDate1" name="startDate" placeholder="시작 날짜" value="${tfc.friendStartDate}" required>
                             - 
                            <input type="date" id="endDate1" name="endDate" placeholder="종료 날짜" value="${tfc.friendEndDate}" required>
                        </td>
                    </tr>
                    <tr>
                        <th class="age-title">선호하는 <br> 나이대 선택</th>
                        
                        <td class="age-list">
                            <div class="radio-container" >
                                <label><input type="radio" name="travel-age" id="age20" value="20대만"><sapn class="custom-radio">20대만</sapn></label>
                                <label><input type="radio" name="travel-age" id="age30" value="30대만"><sapn class="custom-radio">30대만</sapn></label>
                                <label><input type="radio" name="travel-age" id="age40" value="40대만"><sapn class="custom-radio">40대만</sapn></label>
                                <label><input type="radio" name="travel-age" id="age50" value="50대만"><sapn class="custom-radio">50대 이상</sapn></label>
                                <label><input type="radio" name="travel-age" id="상관없음" value="모든 연령"><sapn class="custom-radio">모든 연령</sapn></label>
                            </div>
                            
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>도시 선택</th>
                        <td>
                            <select name="city">
                                <option value="default">도시를 선택</option>
                                <option value="서울">서울</option>
                                <option value="경기도">경기도</option>
                                <option value="인천">인천</option>
                                <option value="강원도">강원도</option>
                                <option value="충청북도">충청북도</option>
                                <option value="충청남도">충청남도</option>
                                <option value="세종">세종</option>
                                <option value="대전">대전</option>
                                <option value="제주">제주</option>
                                <option value="경상북도">경상북도</option>
                                <option value="경상남도">경상남도</option>
                                <option value="대구">대구</option>
                                <option value="울산">울산</option>
                                <option value="부산">부산</option>
                                <option value="전라북도">전라북도</option>
                                <option value="전라남도">전라남도</option>
                                <option value="광주">광주</option>
                            </select>
                        </td>
                    </tr>
                </table>
                
                <br>
                

                
                <div class="board-button">
                    <button type="submit">수정</button>
                    <button type="button" class="back">취소</button> <!-- 취소 버튼 누를 경우 이전 페이지로 이동하도록 설정.-->
                </div>
                
                
            </form>
        </div>
    </main>











  <!--FOOTER-->

    <!-- <footer>
        <div class="inner">
        <div class="items">
            <div class="item">
            <p>회사 설명</p>
            <p>asdsad</p>
            <p>asdad</p>
            </div>
            <div class="item"> 
            <p>회사 정보</p>
            <p>asda</p>
            <p>sadsadasdsada</p>
            </div>
            <div class="item">
            <p>근무 시간 정보</p> 
            <p>sada</p>
            <p>adssad</p>
            <p>asdsad</p>
            </div>
        </div>
        </div>
    </footer> -->
    
    <script>
    	// 라디오 태그 미리 선택되어 있도록 설정
	    $(document).ready(function(){
	        // tfc.preAgeGroup 값 가져오기
	        var preAgeGroup = "${tfc.preAgeGroup}";
	
	        // 가져온 값에 해당하는 라디오 버튼을 선택합니다.
	        if (preAgeGroup === "20대만") {
	            $("#age20").prop("checked", true);
	        } else if (preAgeGroup === "30대만") {
	            $("#age30").prop("checked", true);
	        } else if (preAgeGroup === "40대만") {
	            $("#age40").prop("checked", true);
	        } else if (preAgeGroup === "50대만") {
	            $("#age50").prop("checked", true);
	        } else if (preAgeGroup === "모든 연령") {
	            $("#상관없음").prop("checked", true);
	        }
	    });
    	
        // 도시 미리 선택되어 있도록 설정
        var friendAddress = "${tfc.friendAddress}";

        // 가져온 값에 해당하는 도시 선택 옵션을 선택합니다.
        $("select[name='city']").val(friendAddress);
</script>

  
</body>
</html>