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
				<h2 class="title" name="name">크루이름<span>정보 수정하기</span></h2>
				<!-- //제목 -->
			
				<!-- 폼 -->
                <form action="crew_create_rewrite.do" method="post">
           			<input type="hidden" name="crew_id" value="${crew_id}">
           			<!-- board_idx 벨류값 맞춰주기  value="1" >> 테스트용 -->
           			<input type="hidden" name="board_idx" value="${board_idx}">
           		<!-- <input type="hidden" name="name" value="크루이름"> -->
                
                    <!-- 둘로 나뉜 셀렉트박스 / 버튼 -->
                    <div class="list">
                        <h3 class="capt">주로 운동하는 지역</h3>
                        
                        <!-- flex 박스 설정 -->
                        <div class="btn_flex">
                        
                        	<!-- 너비 설정 -->
                        	<!-- 너비는 width10p ~ width90p 범위 내에서 적용 가능 -->
                        	<!-- 단위: 10p (예: width20p, width80p 가능) -->
                            <div class="width50p">
                                <select class="narrow" name="region_idx">
                                <!-- 옵션 아작스로 지역상위정보 리스트 가져오기  -->
                                    <option value="서울">서울</option>
                                </select>
                            </div>
                            <div class="width50p">
                                <select class="narrow" name="regions_idx">
                                <!-- 옵션 아작스로 지역하위정보 리스트 가져오기  -->
                                    <option value="1">강남구</option>
                                    <option value="2">강동구</option>
                                    <option value="3">강서구</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <!-- //둘로 나뉜 셀렉트박스 / 버튼 -->
                    
                    <!-- 버튼이 붙은 입력창 -->
                    <div class="list">
                        <h3 class="capt">모임취지</h3>  
                        <!-- flex-narrow 박스 설정 -->
                        	<!-- 너비 설정 -->
                          <p> <textarea id="content" maxlength="1000" class="full pass" name="content" /></textarea></p>
                          <div class="character-count" id="charCount">0 / 1000자</div>
                    </div>
               
                    <!-- 제출 버튼 -->
                    <div class="list">
                        <input type="submit" class="full mainbtn" value="수정하기" />
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
</html>