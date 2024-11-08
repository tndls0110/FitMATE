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

        <div class="contents narrow">
            <h2 class="title"><a href="crew_main_page.go?crew_idx=${crew_idx}" class="crew-name-link">
				    ${crewname}
				  </a><span>크루사진게시글 작성</span></h2>

            <!-- 폼 -->
            <form action="crew_photo_write.do" method="post" enctype="multipart/form-data" id="photoForm">
                <input type="hidden" id="sessionId" value="${sessionScope.loginId}">
                <input type="hidden" id="board_id" name="board_id" value="${sessionScope.loginId}">
                <input type="hidden" id="crew_idx" name="crew_idx" value="${crew_idx}">
                <input type="hidden" id="crew_id" name="crew_id" value="${crew_id}">

                <!-- 사진파일선택 -->
                <div class="list">
                    <h3 class="capt">사진파일선택 <span class="required">(필수)</span></h3>
                </div>
                <div class="list">
                    <input type="file" name="file" id="fileInput" onchange="readFile(this)" />
                    <div id="img_list" class="list">
                        <img id="preview" style="display: none; max-width: 300px; margin-top: 10px;" alt="미리보기 이미지"/>
                    </div>
                </div>

                <!-- 게시글내용 -->
                <div class="list">
                    <h3 class="capt">게시글내용</h3>
                    <p><textarea class="full pass" name="subject" id="contentInput"></textarea></p>
                    <div>
                        <span id="charCount">0/1000</span>
                        <div id="warning" style="display: none; color: red;">1000자를 초과할 수 없습니다!</div>
                    </div>
                </div>

                <!-- 제출 버튼 -->
                <div class="list">
                    <button type="button" class="mainbtn full flex_right" id="submitButton" disabled>작성하기</button>
                </div>
            </form>

        </div>
    </div>
    <c:import url="layout/modal.jsp"></c:import>
</body>
	
	<script>	
	
	
	$(document).ready(function() {
	    const contentInput = $('#contentInput');
	    const charCount = $('#charCount');
	    const warning = $('#warning');
	    const submitButton = $('#submitButton');
	    const photoForm = $('#photoForm'); // 폼 요소 선택
	    const fileInput = $('#fileInput');
	    const preview = $('#preview');

	    // 글자 수 체크
	    contentInput.on('input', function() {
	        const maxLength = 1000;
	        let currentLength = $(this).val().length;

	        // 글자 수 체크
	        if (currentLength > maxLength) {
	            warning.show(); // 경고 메시지 표시
	            submitButton.prop('disabled', true); // 작성하기 버튼 비활성화
	        } else {
	            warning.hide(); // 경고 메시지 숨기기
	            // 내용이 없으면 버튼 비활성화, 글자 수 제한 초과시 비활성화
	            submitButton.prop('disabled', currentLength === 0 || !isValidForm());
	        }

	        // 카운트 업데이트
	        charCount.text(currentLength + '/' + maxLength);
	    });

	    // 폼 제출 전 검증 처리
	    photoForm.on('submit', function(e) {
	        if (submitButton.prop('disabled')) {
	            e.preventDefault(); // 버튼이 비활성화 되어 있으면 폼 제출 막기
	            alert('사진이 입력되어야 합니다.');
	        }
	    });

	    // 버튼 클릭 시 폼 제출
	    submitButton.on('click', function() {
	        if (!submitButton.prop('disabled')) {
	            photoForm.submit(); // 제출 버튼이 활성화되었을 때만 폼을 제출
	        } else {
	            alert('사진이 입력되어야 합니다.');
	        }
	    });

	    // 파일 미리보기
	     window.readFile = function(input) {
	        if (input.files && input.files[0]) {
	            const reader = new FileReader();

	            reader.onload = function(e) {
	                preview.attr('src', e.target.result); // 파일의 내용을 이미지 src로 설정
	                preview.css('display', 'block'); // 이미지 보이기
	                enableSubmitButton(); // 제출 버튼 활성화
	            };

	            reader.readAsDataURL(input.files[0]); // 파일을 Data URL로 읽기
	        } else {
	            preview.css('display', 'none'); // 파일을 선택하지 않으면 미리보기 숨김
	            disableSubmitButton(); // 제출 버튼 비활성화
	        }
	    }

	    // 작성하기 버튼 활성화/비활성화 처리
	    function enableSubmitButton() {
	        if (preview.css('display') === 'block' && contentInput.val().length <= 1000) {
	            submitButton.prop('disabled', false); // 버튼 활성화
	        } else {
	            submitButton.prop('disabled', true); // 버튼 비활성화
	        }
	    }

	    function disableSubmitButton() {
	        submitButton.prop('disabled', true); // 버튼 비활성화
	    }

	    // 폼이 제출 가능한지 확인
	    function isValidForm() {
	        return preview.css('display') === 'block' && contentInput.val().length > 0;
	    }

	    // 초기 상태 설정
	    enableSubmitButton();
	});
	
	

	</script>
	<script src="resources/js/common.js"></script>
</html>