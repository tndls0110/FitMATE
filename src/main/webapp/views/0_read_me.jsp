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
			
				<!-- 제목 -->
				<h2 class="title">회원가입<span>회원가입 화면입니다.</span></h2>
				<!-- //제목 -->
			
				<!-- 폼 -->
                <form action="#" method="post">
                
                	<!-- 기본 입력창 -->
                	<!-- class="full": width=100% -->
                    <div class="list">
                        <h3 class="capt">아이디 <span class="required">(필수)</span></h3>
                        <p><input type="text" class="full" name="id" /></p>
                    </div>
                    <!-- //기본 입력창 -->
                    
                    <!-- 경고 -->
                    <div class="list">
                        <h3 class="capt">비밀번호 <span class="required">(필수)</span></h3>
                        <p><input type="password" class="full" name="pw" /></p>
                        <p class="confirm"><input type="password" class="full caution" name="pwconfirm" /></p>
                        <h3 class="msg caution">비밀번호와 비밀번호 확인 값은 동일해야 합니다.</h3>
                    </div>
                    
                    <!-- 통과 -->
                    <div class="list">
                        <h3 class="capt">닉네임 <span class="required">(필수)</span></h3>
                        <p><input type="text" class="full pass" name="nickname" /></p>
                        <h3 class="msg pass">사용할 수 있는 아이디입니다.</h3>
                    </div>
                    <!-- //통과 -->
                    
                    <!-- 둘로 나뉜 셀렉트박스 / 버튼 -->
                    <div class="list">
                        <h3 class="capt">주로 운동하는 지역</h3>
                        
                        <!-- flex 박스 설정 -->
                        <div class="btn_flex">
                        
                        	<!-- 너비 설정 -->
                        	<!-- 너비는 width10p ~ width90p 범위 내에서 적용 가능 -->
                        	<!-- 단위: 10p (예: width20p, width80p 가능) -->
                            <div class="width50p">
                                <select class="narrow" name="county1">
                                    <option value="서울">서울</option>
                                </select>
                            </div>
                            <div class="width50p">
                                <select class="narrow" name="county2">
                                    <option value="강남구">강남구</option>
                                    <option value="강동구">강동구</option>
                                    <option value="강서구">강서구</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <!-- //둘로 나뉜 셀렉트박스 / 버튼 -->
                    
                    <!-- 버튼이 붙은 입력창 -->
                    <div class="list">
                        <h3 class="capt">비밀번호</h3>
                        
                        <!-- flex-narrow 박스 설정 -->
                        <div class="btn_flex narrow">
                        
                        	<!-- 너비 설정 -->
                            <div class="width70p">
                                <input type="password" class="full flex_left" name="pw" value="${password}" readonly />
                            </div>
                            <div class="width30p">
                                <button class="mainbtn full flex_right">변경하기</button>
                            </div>
                        </div>
                    </div>
                    <!-- //버튼이 붙은 입력창 -->
                    
                    <!-- 버튼 설정 -->
                    <!-- class="full": width=100% -->
                    <!-- class="minbtn": 작은 버튼 -->
                    
                    <!-- class="mainbtn": 녹색 버튼 -->
                    <!-- class="subbtn": 흰색 버튼 -->
                    <!-- class="textbtn": 텍스트 버튼 -->
                    
                    <!-- 제출 버튼 -->
                    <div class="list">
                        <input type="submit" class="full mainbtn" value="회원 가입" />
                    </div>
                    <!-- //제출 버튼 -->
                    
                    <!-- 보조 버튼 -->
                    <div class="list">
                        <input type="submit" class="full subbtn" value="로그인" />
                    </div>
                    <!-- //보조 버튼 -->
                    
                    <!-- 텍스트 버튼 -->
                    <div class="list">
                        <input type="submit" class="full textbtn" value="관리자 로그인" />
                    </div>
                    <!-- //텍스트 버튼 -->
                    
                    <!-- 버튼 크기 최대 -->
                    <!-- [input type="submit"]에도 동일하게 적용 가능 -->
                    <div class="list">
                        <button class="mainbtn full">큰 버튼</button>
                    </div>
                    <!-- //버튼 크기 최대 -->
                    
                    <!-- 버튼 크기 일반 -->
                    <!-- [input type="submit"]에도 동일하게 적용 가능 -->
                    <div class="list">
                        <button class="mainbtn">중간 크기 버튼</button>
                    </div>
                    <!-- //버튼 크기 일반 -->
                    
                    <!-- 버튼 크기 최소 -->
                    <!-- [input type="submit"]에는 적용 불가 -->
                    <div class="list">
                        <button class="mainbtn minbtn">작은 버튼</button>
                    </div>
                    <!-- //버튼 크기 최소 -->
                    
                </form>
				<!-- //폼 -->
			
				<!-- 모달 (경고창, 확인창) -->
				<button type="button" onclick="modal.showAlert('message')" class="mainbtn full">
					경고창		<!-- message: 경고창에 띄울 메시지 -->
				</button>
				<button type="button" onclick="modal.showConfirm('message', 'addr')" class="mainbtn full">
					확인창		<!-- addr: 확인 버튼을 누르면 이동할 경로 -->
				</button>
				<!-- //모달 (경고창, 확인창) -->
				
			</div>
		</div>
		<c:import url="layout/modal.jsp"></c:import>
	</body>
	<script src="resources/js/common.js"></script>
</html>