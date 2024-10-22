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
				<h2 class="title">게시글 신고<span>게시글 신고 화면입니다.</span></h2>
				<!-- //제목 -->
			
				<!-- 폼 -->
                <form action="crew_create.do" method="post">
           			<input type="hidden" name="crew_id" value="member01">
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
                        <button onclick="selectReason(this)" class="mainbtn">취소하기</button>
                        <button onclick="selectReason(this)" class="mainbtn">신고하기</button>
                    </div>
                    <!-- //제출 버튼 -->
                   
                    
                </form>
				<!-- //폼 -->
			
				<!-- 모달 (경고창, 확인창) -->
			
				
			</div>
		</div>
		<c:import url="layout/modal.jsp"></c:import>
	</body>
	<script src="resources/js/common.js">
		var show = 1;
		
		reportCall(show);
	
	function reportCall(result){
	$.ajax({
		type:'GET',
		url:'crew_report.ajax',
		data:{
					
		},
		datatype:'JSON',
		success:function(data){
			console.log(data);
			if (data.reportlist) {
                drawList(data.reportlist);
            } else {
                console.error("보고서 리스트가 없습니다.");
            }
		},
		error:function(e){
			console.log(e);
		}
	});
	}
	 	
	 function drawList(reportlist) {
			var content ='';
			reportlist.forEach(function(report,idx){ 
				 content += '<button onclick="selectReason(this)" class="mainbtn" data-idx="' + report.reportr_idx + '">신고 사유: ' + report.reportr_con + '</button>';
			});
			$('#report').html(content);
		}
	 
	</script>
</html>