<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FitMATE</title>
	
		<!-- CSS 파일 첨부시 하단 경로를 참고하세요. -->
		<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
	
		<!-- J-Query 3.7.1 -->
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	</head>
	<body>
		<div class="container">
			<c:import url="layout/leftnav_1.jsp"></c:import>
			
			<!-- 내용은 contents 안에 작성하세요. -->
			<div class="contents"></div>
			
		</div>
		<c:import url="layout/modal.jsp"></c:import>
	</body>
	
	<!-- JS 파일 첨부시 하단 경로를 참고하세요. -->
	<script src="resources/js/common.js"></script>

</html>