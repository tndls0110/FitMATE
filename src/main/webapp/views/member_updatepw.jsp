<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FitMATE</title>
		<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/member_join.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/member_update.css">
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	</head>
	<body>
		<div class="container">
			<c:import url="layout/leftnav_1.jsp"></c:import>
			<div class="contents narrow">
				<h2 class="title">비밀번호 수정하기</h2>
				<form action="member_update.do" method="post">
					<div class="list">
						<h3 class="capt">아이디 <span class="required">(변경 불가)</span></h3>
						<p class="statics">${list.user_id}</p>
					</div>
					<div class="list">
						<h3 class="capt">비밀번호 <span class="required">(필수)</span></h3>
						<div class="btn_flex narrow">
							<div class="width70p">
								<input type="password" class="full flex_left" name="pw" value="${list.pw}" readonly />
							</div>
							<div class="width30p">
								<button class="mainbtn full flex_right">변경하기</button>
							</div>
						</div>
					</div>
					<div class="list">
						<button type="button" class="full mainbtn" onclick="update()">수정하기</button>
					</div>
				</form>
			</div>
		</div>
		<c:import url="layout/modal.jsp"></c:import>
	</body>
	<script src="resources/js/common.js"></script>
	<script src="resources/js/member_update.js"></script>
</html>