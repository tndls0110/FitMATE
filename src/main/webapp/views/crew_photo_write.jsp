<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FitMATE</title>
		<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<style>
		#contentInput {
        height: 300px; /* 원하는 높이 설정 */
        resize: none; /* 사용자가 크기를 조절할 수 없도록 설정 (선택 사항) */
    }
         #charCount {
            font-weight: bold; /* 글자 수 강조 */
            margin-top: 5px; /* 위쪽 여백 */
        }
		</style>
	</head>
	<body>
		<div class="container">
			<c:import url="layout/leftnav_1.jsp"></c:import>
			
			
			<!-- 넓은 화면으로 작성할 시 class="contents" -->
			<!-- 좁은 화면으로 작성할 시 class="contents narrow" -->
			<div class="contents narrow">
				
				<!-- 크루 생성자 id  value에 로그인 세션값 넣어주기 -->
				
				<!-- 제목 -->
				<h2 class="title">크루이름<span>크루사진게시글 작성 화면입니다.</span></h2>
				<!-- //제목 -->
			
				<!-- 폼 -->
                <form action="crew_photo_write.do" method="post" enctype="multipart/form-data">       		
           			<!-- 로그인세션아이디 가져오기 작성자 구분, 크루장 구분 할때 이용 <input type="hidden" id="sessionId" value="${sessionScope.sessionId}"> -->
                	<input type="hidden" id="sessionId" value="${sessionScope.loginId}">
                	 <!-- 작성자 id 넣기 세션아이디넣기 <input type="hidden" id="board_id" name="board_id" value="${board_id}"> -->
                	 <input type="hidden" id="board_id" name="board_id" value="${sessionScope.loginId}">
                	 <!-- 나중에 크루 idx 넣기 모델값으로 넣어주기 <input type="hidden" id="crew_idx" name="crew_idx" value="${crew_idx}"> -->
                	 <input type="hidden" id="crew_idx" name="crew_idx" value="${crew_idx}">
                	 <!-- 나중에 크루장 id 넣기 모델값으로 넣어주기 <input type="hidden" id="crew_id" name="crew_id" value="${crew_id}"> -->
   					<input type="hidden" id="crew_id" name="crew_id" value="${crew_id}">
                    <!-- 경고 -->                     
                    <!-- 통과 -->
                    <div class="list">
                        <h3 class="capt">사진파일선택 <span class="required">(필수)</span></h3>
        
                      </div>  
             			<div class="list">
             			<input type="file" name="file" onchange="readFile(this)"/>
             			<div id="img_list" class="list">
             				<img id="preview" style="display: none; max-width: 300px; margin-top: 10px;" alt="미리보기 이미지"/>
             			</div>
             			</div> 
                    <!-- 버튼이 붙은 입력창 -->
                    <div class="list">
                        <h3 class="capt">게시글내용</h3>
                        
                        <!-- flex-narrow 박스 설정 -->
                        	<!-- 너비 설정 -->
                         <p><textarea  class="full pass" name="subject" id="contentInput" /></textarea></p>
                            <div>
		                        <span id="charCount">0/1000</span>
		                          <div id="warning" style="display: none; color: red;">1000자를 초과할 수 없습니다!</div>
                           	</div>
                    </div>
               
                    <!-- 제출 버튼 -->
                    <div class="list">
                    	<button class="mainbtn full flex_right"id="submitButton" disabled>작성하기</button>
                     <!--   <input type="submit" class="full mainbtn" id="submitButton" disabled value="작성하기" />-->
                    </div>
                    <!-- //제출 버튼 -->
                    
                    
                </form>
				<!-- //폼 -->
			
				<!-- 모달 (경고창, 확인창) -->
			
				
			</div>
		</div>
		<c:import url="layout/modal.jsp"></c:import>
	</body>
	
	<script>	
	$(document).ready(function() {
	  //  const crew_idx = $('#crew_idx').val(); // hidden input의 값 가져오기

	    const contentInput = $('#contentInput');
	    const charCount = $('#charCount');
	    const warning = $('#warning');
	    const submitButton = $('#submitButton');
	    
	    $('#contentInput').on('input', function() {
	    	 const maxLength = 1000;
	         let currentLength = $(this).val().length;
	        
	         console.log(currentLength);
	         // 글자 수 체크
	         if (currentLength > maxLength) {
	             warning.show(); // 경고 메시지 표시
	             
	          //   alert('1000자를 초과할 수 없습니다!'); // 경고창 표시
	             submitButton.prop('disabled', true); // 작성하기 버튼 비활성화
	         } else {
	             warning.hide(); // 경고 메시지 숨기기
	             submitButton.prop('disabled', currentLength === 0); // 글자가 없으면 버튼 비활성화
	         }

	         // 카운트 업데이트
	         charCount.text(currentLength + '/' + maxLength);
	    });
	
	    
	});
	
	
	// 파일 미리보기
	function readFile(input) {
		
	    if (input.files && input.files[0]) {
	        const reader = new FileReader();
	        
	        reader.onload = function(e) {
	            const preview = document.getElementById('preview');
	            preview.src = e.target.result; // 파일의 내용을 이미지 src로 설정
	            preview.style.display = 'block'; // 이미지 보이기
	        };
	        
	        reader.readAsDataURL(input.files[0]); // 파일을 Data URL로 읽기
	    }
	}
	 
	</script>
	<script src="resources/js/common.js"></script>
</html>