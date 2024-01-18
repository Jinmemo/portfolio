<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="odi_project.member.model.vo.Member, odi_project.board.model.vo.*" %>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동행 게시판</title>

    <!-- 파비콘 -->
    <link rel="shortcut icon" href="./images/tomorrow1.gif">

    <!--브라우저 스타일 초기화-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
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

    <!-- Travel Luggage And Bags icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- keyboard_backspace icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- lock icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- location_on icon  -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- calendar_month icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- Person icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />


    <!-- css -->
      <link rel="stylesheet" href="./source/style/css/ensun.css/basicTool.css">
      <link rel="stylesheet" href="./source/style/css/hyeon.css/travel_friend_detail.css">
    

	<!-- jQuery -->
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

  	<!-- JS -->  
	 <script src="./source/js/hyeon.js/travel_friend_detail.js"></script>
    <!--Google Fonts - 나눔고딕-->
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />

    <!-- Delete icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>


<body>
   <!--HEADER-->
  <jsp:include page="../../common/header.jsp" />

  <main id="main">


    <div class="friendPage"><a href="#">동행게시판</a></div>
	
	
	    <!-- 글제목 -->
	    <section class="title">
	      <span class="material-symbols-outlined"> travel_luggage_and_bags </span><!-- 여행가방아이콘 -->
			<p>${tfc.friendTitle}</p>
	    </section>
	
	    <!-- 글내용 -->
	    <section class="contentSection">
	
	      <div class="content">
			<p class="content-inner">
				${tfc.friendContent}
			</p>
			<p class="content-inner">
			</p>
	      </div>
	
	      <div class="content-outer">
	
	        <div class="information">
	          <p class="content-title">♥ 자세한 여행 정보</p>
	          <div class="infor-inline">
		          <img src="./source/style/img/travel_friend_img/category.png">
					<span class="content-info">${tfc.categoryName}</span>
					<span hidden name="fboardNo" class="content-info">${tfc.fboardNo}</span>
					<span hidden name="friendTitle" class="content-info">${tfc.friendTitle}</span>
					
	          </div>
			  <div class="infor-inline">
			  
				  <img src="./source/style/img/travel_friend_img/location.png">
		          <span class="content-info">${tfc.friendAddress}</span>
			  </div>
			  
			  <div class="infor-inline"> 
			  
				  <img src="./source/style/img/travel_friend_img/icon-calendar.png">
		          <span class="content-info"><fmt:formatDate value="${tfc.friendStartDate}" pattern="yy.MM.dd"/> ~ <fmt:formatDate value="${tfc.friendEndDate}" pattern="yy.MM.dd"/></span>
	          </div>
	          
	          <div class="infor-inline">
	          	  <img src="./source/style/img/travel_friend_img/preage.png">
					<span class="content-info">${tfc.preAgeGroup}</span>
	          </div>
	        </div>
	        
	        <div class="companion">
	          <p class="content-title">♥ 함께하는 동행</p>

	          <div class="infor-inline"> 
				  <img src="./source/style/img/travel_friend_img/profile.png">
					<span class="content-info">${tfc.memberName}</span>
					 <c:forEach var="fwList" items="${fw}">
					 	<img src="./source/style/img/travel_friend_img/profile.png">
		          		<span class="content-info">${fwList.memberName}</span>
					 </c:forEach>
	          </div>
	        </div>
	
	      </div>
   
			<c:choose>
				<c:when test="${loginUser.memberId eq tfc.memberId && loginUser ne null}">	
					<span class="infor-button">
			      	 <a href="friendUpdate.bo?fboardNo=${f.fboardNo}"><button type="button" class="btn btn-outline-secondary">수정</button></a>
			      	 <a href="friendDelete.bo?fboardNo=${f.fboardNo}"><button type="button" class="btn btn-outline-secondary">삭제</button></a>
	      		   </span>
				</c:when>
				<c:when test="${loginUser ne null}">
				<br>
					<span class="infor-acButton">
						<button type="button" id="btn-accompany" class="btn-accompany">동행 신청하기</button>
						<button type="button" id="btn-noaccompany" class="btn-noaccompany" style="display: none">동행 취소하기</button>
					</span>
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose>

	
	       
	    </section>

	    <!-- 댓글 -->
	    <section class="reply">
		  <c:choose>
		  	<c:when test="${loginUser eq null}">
		  		<div>
		        	<input style="width:1120px;"type="text" placeholder="로그인 후 이용해주세요." readonly>
	      		</div>
		  	</c:when>
		  	<c:otherwise>
			  <div>
	        		<input type="text" id="replyContent" placeholder="댓글 내용을 입력하세요.">
	        		<button type="button" id="friend-reply-btn">댓글등록</button>
	      	  </div>
	      	  <div class="secret-Button infor-inline-secret" id="unlockButton">
	      	    <img src="./source/style/img/travel_friend_img/icon-lock.png">
		        <span>비밀댓글 설정하기</span>
		      </div>
		      
		      <div class="secret-Button infor-inline-secret" id="lockButton" style="display: none;">
		        <img src="./source/style/img/travel_friend_img/icon-unlock.png">
		        <span>비밀댓글 해제하기</span>
		      </div>
			</c:otherwise>
		  </c:choose>
	      <!-- 댓글 등록 -->
			
			
			
			<!-- 댓글 수정 모달 창 -->
		  	<div id="updateModal" class="modal">
				<div class="modal-content" style="width:700px;">
					<span class="close">&times;</span>
					<h2>댓글 수정</h2>
					<form id="updateForm" action="friendReplyUpdate.bo" method="post" name="updateFriendForm">
						<input type="hidden" name="fboardNo" value="${tfc.fboardNo }">
						<input type="hidden" name="replyNo" id="replyNoInput" value="replyNo">
						<textarea name="replyContent" id="replyContentTextarea" rows="4" cols="50"></textarea>
						<br> <input type="submit" value="수정">
					</form>
				</div>
			</div>
			

		  

	
	      <!-- 댓글 표시 -->
	      
	      <div class="reply-comments">
	      	<c:set var="list" value="${tfc.list}" />
	      	
	        <table>
	        	<span>댓글(${list.size()})</span>
	        	
	    		<c:choose>
	    			<c:when test="${list.size() ne 0}">
			        	<thead>
				          <tr class="reply-read">
				            <th>작성자</th>
				            <th>댓글 내용</th>
				            <th>작성 날짜</th>
							<th>-</th>
				          </tr>
				        </thead>
				        <tbody>
				        <c:forEach var="reply" items="${list}">
				        	<c:url var="updateUrl" value="/friendReplyUpdate.bo" />
				        	<c:choose>
				        		<c:when test="${reply.secretReply ne 'Y'}">
						        	<tr>
						        		<td>${reply.memberName}</td>
						        		<td class="replyContent-nosceret">${reply.replyContent}</td>
						        		<td>${reply.createDate }</td>	
					        			<c:if test="${loginUser.memberId eq reply.memberId}">
							        		<td>
						            			<button type="button" value="update" class="replyUpDe update" data-reply-no="${reply.replyNo}" data-reply-content="${reply.replyContent}">수정</button>
												<button type="button" class="replyUpDe delete" data-reply-no="${reply.replyNo}">삭제</button>	            
						            		</td>	   
						            	</c:if>
						        	</tr>
						        </c:when>
				        		<c:when test="${reply.secretReply eq 'Y' }">
				        			<c:choose>
				        				<c:when test="${tfc.memberId eq loginUser.memberId }">
							        	  	<tr>
								        		<td>${reply.memberName}</td>
								        		<div class="sceret-reply">
								        			<td>
								        				<img class="sceret-reply-img" src="./source/style/img/travel_friend_img/icon-lock.png">${reply.replyContent}
								        			</td>
								        		</div>
								        		<td>${reply.createDate }</td>	
							        			<c:if test="${loginUser.memberId eq reply.memberId}">
									        		<td>
								            			<button type="button" value="update" class="replyUpDe update" data-reply-no="${reply.replyNo}" data-reply-content="${reply.replyContent}">수정</button>
														<button type="button" class="replyUpDe delete" data-reply-no="${reply.replyNo}"">삭제</button>	            
								            		</td>	   
								            	</c:if>  		
							        		</tr>
						        		</c:when>
						        		<c:when test="${reply.memberId eq loginUser.memberId }">
						        			<tr>
								        		<td>${reply.memberName}</td>
								       			<div class="sceret-reply">
								        			<td>
								        				<img class="sceret-reply-img" src="./source/style/img/travel_friend_img/icon-lock.png">${reply.replyContent}
								        			</td>
								        		</div>
								        		<td>${reply.createDate }</td>	
							        			<c:if test="${loginUser.memberId eq reply.memberId}">
									        		<td>
								            			<button type="button" value="update" class="replyUpDe update" data-reply-no="${reply.replyNo}" data-reply-content="${reply.replyContent}">수정</button>
														<button type="button" class="replyUpDe delete" data-reply-no="${reply.replyNo}"">삭제</button>	            
								            		</td>	   
								            	</c:if>  		
							        		</tr>
						        		</c:when>
				        				<c:otherwise>
						        			<tr>
								        		<td>${reply.memberName}</td>
								       			<div class="sceret-reply">
								        			<td>
								        				<img class="sceret-reply-img" src="./source/style/img/travel_friend_img/icon-lock.png">비밀댓글입니다.
								        			</td>
								        		</div>
								        		<td>${reply.createDate }</td>	
							        			<c:if test="${loginUser.memberId eq reply.memberId}">
									        		<td>
														<button type="button" value="update" class="replyUpDe update" data-reply-no="${reply.replyNo}" data-reply-content="${reply.replyContent}">수정</button>
														<button type="button" class="replyUpDe delete" data-reply-no="${reply.replyNo}">삭제</button>	            
								            		</td>	   
								            	</c:if>  		
							        		</tr>
				        				</c:otherwise>
				        			</c:choose>
				        		</c:when>
				        	</c:choose>

				        </c:forEach>
				        </tbody>
		        	</c:when>
		        	<c:otherwise>
		        	</c:otherwise>
		        </c:choose>
	      </table>
	    </div>
	    
	  </section>

</main>





<script>
// 댓글 추가 Ajax 
$(document).ready(function() {

    function submitComment() {
        var replyContent = $('#replyContent').val();
     // disply:none일때 false를 반환
        var secretReply = ($('#unlockButton').is(':visible')) ? 'N' : 'Y';
        var fboardNo = $('.content-info[name="fboardNo"]').text();

        $.ajax({
            type: 'POST',
            url: 'friendInsert.re',
            data: {
                replyContent: replyContent,
                secretReply: secretReply,
                fboardNo: fboardNo
            },
            success: function(result) {
                if (result > 0) {
                    $('#replyContent').val(""); // 댓글등록 클릭하면 빈칸으로 되도록 설정
                    alert("댓글 추가가 완료되었습니다.");
                    location.reload(true);
                }
            },
            error: function(error) {
                console.error('비동기 통신 실패');
            }
        });
    }

    // 댓글 등록 버튼 눌렀을 때 이벤트
    $('#friend-reply-btn').on('click', function() {
        submitComment();
    });

    // 엔터키 눌렀을 때 이벤트
    $('#replyContent').on('keydown', function(event) {
        if (event.which === 13) {
            submitComment();
            event.preventDefault();
        }
    });
    
    // 동행 신청하기 버튼 클릭 이벤트 처리
    $("#btn-accompany").click(function () {
    	var fboardNo = $('.content-info[name="fboardNo"]').text();
    	var friendTitle = $('.content-info[name="friendTitle"]').text();
    	
    	
        $.ajax({
            type: 'POST', 
            url: 'accompany.bo', 
            data: {
            	fboardNo: fboardNo,
            	friendTitle : friendTitle,
            	memberId : '${loginUser.memberId}',
            	memberName : '${loginUser.memberName}',
            	memberNo : '${loginUser.memberNo.substring(0, 8)}',
            	aboutMe : '${loginUser.aboutMe}',
            	status : "Y",
            	gender : '${loginUser.gender}'
            },
            success: function (result) {
                if (result > 0) {
                    console.log("동행 신청 성공:", result);
                    $('#btn-accompany').hide();
                    $('#btn-noaccompany').show();
                }
            },
            error: function (error) {
                console.error("동행 신청 오류:", error);
            }
        });
    });
    
    
    // 동행 취소하기 버튼 클릭 이벤트 처리
    $("#btn-noaccompany").click(function () {
    	var fboardNo = $('.content-info[name="fboardNo"]').text();
    	var friendTitle = $('.content-info[name="friendTitle"]').text();
    	
        $.ajax({
            type: 'POST', 
            url: 'accompany.bo', 
            data: {
            	fboardNo: fboardNo,
            	friendTitle : friendTitle,
            	memberId : '${loginUser.memberId}',
            	memberName : '${loginUser.memberName}',
            	memberNo : '${loginUser.memberNo.substring(0, 8)}',
            	aboutMe : '${loginUser.aboutMe}',
            	status : "N",
            	gender : '${loginUser.gender}'
            },
            success: function (result) {
                if (result > 0) {
                    console.log("동행 취소 성공:", result);
                    $('#btn-accompany').show();
                    $('#btn-noaccompany').hide();
                    
                }
            },
            error: function (error) {
                console.error("동행 취소 오류:", error);
            }
        });
    });
    
    // 동행게시판 동행 수락/취소 버튼 세션 유지 
    function checkCompanionStatus() {
        var fboardNo = $('.content-info[name="fboardNo"]').text();

        $.ajax({
            type: 'POST',
            url: 'CheckCompanion.bo', 
            data: {
                fboardNo: fboardNo,
                memberId: '${loginUser.memberId}'
            },
            success: function (status) {
                if (status === 'Y') {
                    $('#btn-accompany').hide();
                    $('#btn-noaccompany').show();
                } else {
                    $('#btn-accompany').show();
                    $('#btn-noaccompany').hide();
                }
            },
            error: function (error) {
                console.error('Error checking companionship status:', error);
            }
        });
    }

    checkCompanionStatus();
    
    
    // 댓글 모달 보이게
    $(document).on('click', '.replyUpDe.update', function() {
        var replyNo = $(this).data('reply-no');
        var replyContent = $(this).data('reply-content');

        $('#replyNoInput').val(replyNo);
        $('#replyContentTextarea').val(replyContent);

        $('#updateModal').show();
    });
	

    // 댓글 모달 숨기기
    $('.modal').on('click', '.close', function() {
    	$('#updateModal').hide();
    });

	
    // 댓글 삭제 버튼 클릭 이벤트 처리
    $('.replyUpDe.delete').on('click', function() {
        var replyNo = $(this).data('reply-no');

        var confirmDelete = confirm('댓글을 삭제하시겠습니까?');
        
        if (confirmDelete) {
	        $.ajax({
	            type: 'POST',
	            url: 'friendReplyDelete.bo',
	            data: {
	                replyNo: replyNo,
	                fboardNo: '${tfc.fboardNo}'
	            },
	            success: function(result) {
	                if (result > 0) {
	                    location.reload(true);  // 페이지 새로고침
	                } else {
	                    location.reload(true);
	                }
	            },
	            error: function(error) {
	                console.error('비동기 통신 실패');
	            }
	        });
        }
    });
});


</script>
    
</body>
</html>