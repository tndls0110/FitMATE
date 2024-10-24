<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FitMATE</title>
		<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/member_join.css" />
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	</head>
	<body>
		<div class="container">
			<c:import url="layout/leftnav_5.jsp"></c:import>
			<div class="contents narrow">
				<h2 class="title">비밀번호 수정하기</h2>
				<form action="member_updatepw.do" method="post">
					<div class="list">
						<h3 class="capt">기존 비밀번호</h3>
						<p><input type="text" class="full" name="oldpw" maxlength="20" /></p>
						<h3 class="msg msg_oldpw hide"></h3>
					</div>
					<div class="list">
						<h3 class="capt">새 비밀번호</h3>
						<p><input type="text" class="full" name="pw" maxlength="20" /></p>
						<p class="confirm"><input type="text" class="full" name="pwconfirm" maxlength="20" /></p>
						<h3 class="msg msg_pw hide"></h3>
					</div>
					<div class="list">
						<button type="button" class="full mainbtn" onclick="updatepw()">수정하기</button>
					</div>
				</form>
			</div>
		</div>
		<c:import url="layout/modal.jsp"></c:import>
	</body>
	<script src="resources/js/common.js"></script>
	<script src="resources/js/member_updatepw.js"></script>
</html>