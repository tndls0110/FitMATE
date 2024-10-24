<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FitMATE</title>
		<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	</head>
	<body>
		<div class="container">
			<c:import url="layout/leftnav_1.jsp"></c:import>
			
			
			<!-- 넓은 화면으로 작성할 시 class="contents" -->
			<!-- 좁은 화면으로 작성할 시 class="contents narrow" -->
			<div class="contents narrow">
				
				<!-- 크루 생성자 id  value에 로그인 세션값 넣어주기 -->
				
				<!-- 제목 -->
				<h2 class="title">크루 생성<span>크루생성 화면입니다.</span></h2>
				<!-- //제목 -->
			
				<!-- 폼 -->
                <form action="crew_create.do" method="post">
                <!-- 작성자 id 넣기 = 세션아이디 넣기 -->
           			<input type="hidden" name="crew_id" value="member01">
                    <!-- 경고 -->                     
                    <!-- 통과 -->
                    <div class="list">
                        <h3 class="capt">크루명 <span class="required">(필수)</span></h3>
        
                      </div>  
             
                    <!-- 버튼이 붙은 입력창 -->
                    <div class="list">
                        <h3 class="capt">모임취지</h3>
                        
                        <!-- flex-narrow 박스 설정 -->
                       
                        
                        	<!-- 너비 설정 -->
                         <p> <textarea id="content" maxlength="1000" class="full pass" name="content" id="subjectInput" /></textarea></p>
                            <div>
		                        <span id="charCount">0/1000</span>
		                        <div id="warning">1000자를 초과할 수 없습니다!</div>  
                           		 </div>
                    </div>
               
                    <!-- 제출 버튼 -->
                    <div class="list">
                        <input type="submit" class="full mainbtn" value="작성하기" />
                    </div>
                    <!-- //제출 버튼 -->
                    
                    
                </form>
				<!-- //폼 -->
			
				<!-- 모달 (경고창, 확인창) -->
			
				
			</div>
		</div>
		<c:import url="layout/modal.jsp"></c:import>
	</body>
	<script src="resources/js/common.js"></script>
	<script>	
	$(document).ready(function() {
	  //  const crew_idx = $('#crew_idx').val(); // hidden input의 값 가져오기

	    const contentInput = $('#contentInput');
	    const charCount = $('#charCount');
	    const warning = $('#warning');
	    const submitButton = $('#submitButton');
	    
	    $('#subjectInput').on('input', function() {
	    	 const maxLength = 1000;
	         let currentLength = $(this).val().length;

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
	 
	</script>
</html>