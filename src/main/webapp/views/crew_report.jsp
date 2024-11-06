<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FitMATE</title>
		<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	
	<style>
	.mainbtn.selected {
    background-color: #007bff; /* 선택된 버튼의 배경색 */
    color: white; /* 선택된 버튼의 글자색 */
}
.mainbtn.full{
	margin: 5px 0px;
	
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
				<h2 class="title">게시글 신고<span>게시글 신고 화면입니다.</span></h2>
				<!-- //제목 -->
			
				<!-- 폼 -->
                <form action="crew_report.do" method="POST">
                	<!-- 신고자  !! 나중에 세션값 넣기  !! -->
           			<input type="hidden" name="reporter_id" value="${sessionScope.loginId}">
           			<!-- 신고 사유 idx -->
           		<!--	<input type="hidden" name="reportr_idx" id="reportr_idx_input" value="1">-->
           			<input type="hidden" id="reportr_idx_input" name="reportr_idx"  value="">
           			<!-- 신고글 유형 -->
           			<input type="hidden" name="board_type"  value="${board_type}">
           			<!-- 신고글 idx -->
           			<input type="hidden" name="board_idx"  value="${board_idx}">
		           	<!-- 피신고자 id -->		
		           	<input type="hidden" name="reported_id"  value="${reported_id}">
		           	<input type="hidden" name="url"  value="${url}">
           			
                    <!-- 경고 -->                     
                    <!-- 통과 -->
                    <div class="list">
                        <h3 class="capt">게시글 신고하기 </h3>
                    </div>
                    <!-- //통과 -->

                    <!-- 버튼이 붙은 입력창 -->
                    <div class="list" id="report">
                       
                    </div>
               
                    <!-- 제출 버튼 -->
                    <div class="list" >
                        <button type="button" onclick="location.href='http://localhost:8080/Fitmate/'" class="mainbtn">취소하기</button>
                        <button  class="mainbtn">신고하기</button>
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
    var show = 1;

    // 초기 호출
    reportCall(show);

    function reportCall(result) {
        $.ajax({
            type: 'GET',
            url: 'crew_report.ajax',
            data: {}, // 추가 데이터가 필요하다면 여기에 작성
            dataType: 'JSON', // 응답 데이터 형식
            success: function(data) {
                console.log('AJAX 시작');
                console.log(data);
                drawList(data); // 데이터 목록 그리기
            },
            error: function(e) {
                console.log(e); // 오류 발생 시 콘솔에 출력
            }
        });
    }

function drawList(report) {
    var content = '';
    report.forEach(function(item) { 
        // 각 신고 항목에 대해 버튼 생성
        content += '<button type="button" onclick="selectReason(this)" class="mainbtn full" value="' + item.reportr_idx + '">신고 사유: ' + item.reportr_con + '</button><br>';
    });
    $('#report').html(content); // 버튼을 #report 요소에 추가
}

// 선택된 버튼 처리
function selectReason(selectedButton) {
    // 모든 버튼의 상태를 초기화
    $('.mainbtn full').removeClass('selected'); // 선택된 클래스를 제거

    // 선택된 버튼에 클래스 추가
    $(selectedButton).addClass('selected'); // 현재 선택된 버튼에 클래스 추가
	
    	
    
    // 필요한 경우 추가 처리
    console.log('선택된 신고 사유:', $(selectedButton).text());
    var reportr_idx = selectedButton.value;
    
    $('#reportr_idx_input').val(reportr_idx);
    console.log('Reportr idx input value:', $('#reportr_idx_input').val());
}



</script>
	<script src="resources/js/common.js"></script>
</html>