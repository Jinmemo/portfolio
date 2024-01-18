<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<header>

    <link rel="stylesheet" href="./source/style/css/gun.css/mypage.css">
</header>
<body>
	
    <!-- 회원탈퇴 Modal -->
    <div class="modal" id="deleteForm">
        <div class="modal-dialog">
          <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title"></h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body" align="center">
              <b>탈퇴 후 복구가 불가능합니다. <br>정말로 탈퇴하시겠습니까?</b><br><br>
              
              <form action="${pageContext.request.contextPath}/delete.me" method="post">
                        
                        <label for="memberPwd">비밀번호</label>
                        <input type="password" id="memberPwd" name="memberPwd" required>
                      
                  <br>
                  <hr>
                  
                  <button type="submit" id="btn-3" class="">탈퇴하기</button>
              </form>
              </div>
          </div>
        </div>
      </div>
    
</body>
</html>