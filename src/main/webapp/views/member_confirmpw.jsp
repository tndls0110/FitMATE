<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FitMATE</title>
		<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script>
			var state = '${state}';
			var msg = '${msg}';
		</script>
	</head>
	<body>
		<div class="container">
			<c:import url="layout/leftnav_5.jsp"></c:import>
			<div class="contents narrow">
				<h2 class="title">비밀번호 확인</h2>
                <form action="member_confirmpw.do" method="post">
                    <div class="list">
                        <h3 class="capt">비밀번호</h3>
                        <p><input type="password" class="full" name="pw" value="${pw}" /></p>
                        <h3 class="msg caution checkpw hide">비밀번호를 확인하세요.</h3>
                    </div>
					<div class="list">
						<input type="submit" class="full mainbtn" value="확인" />
					</div>
                </form>
			</div>
		</div>
		<c:import url="layout/modal.jsp"></c:import>
	</body>
	<script src="resources/js/common.js"></script>
	<script src="resources/js/member_login.js"></script>
</html>