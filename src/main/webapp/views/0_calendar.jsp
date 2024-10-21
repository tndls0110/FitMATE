<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FitMATE</title>
		
		<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
		
		<!-- 달력 CSS (필수 파일입니다.) -->
		<link rel="stylesheet" type="text/css" href="resources/css/calendar.css" />
		
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	</head>
	<body>
		<div class="container">
			<c:import url="layout/leftnav_1.jsp"></c:import>
			
			<div class="contents">
			
				<!-- 달력 -->
				<div class="calendar">
                    <div class="title_calendar">
                        <p>일정 보기</p>
                        <div id="date"></div>
						<button class="writebtn mainbtn minbtn">일정 작성</button>
                    </div>
                    <div id="calendar"></div>
                </div>
                <!-- //달력 -->
                
			</div>
			
		</div>
	</body>
	
	<script src="resources/js/common.js"></script>
	
	<!-- 달력 JS (필수 파일입니다.) -->
    <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.15/index.global.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/interaction@6.1.15/index.global.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.15/index.global.min.js'></script>
	<script src="resources/js/calendar.js"></script>
	
</html>