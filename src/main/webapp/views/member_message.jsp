<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FitMATE</title>
		<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/member_message.css" />
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script>
			var msg = '${msg}';
			var user = 'member08';
		</script>
	</head>
	<body>
		<div class="container">
			<c:import url="layout/leftnav_2.jsp"></c:import>
			<div class="contents dark">
				<h2 class="title">메시지</h2>
                <div class="message_container">
					<div class="message_list"></div>
					<div class="message_contents_container">
						<div class="message_contents"></div>
						<form action="member_message.do" method="post">
							<input type="hidden" name="group_idx" value="" />
							<div class="btn_flex narrow">
								<div class="width80p">
									<input type="text" name="msg_cont" class="full flex_left" maxlength="1000" />
								</div>
								<div class="width20p">
									<input type="submit" value="send" class="mainbtn full flex_right" />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<c:import url="layout/modal.jsp"></c:import>
	</body>
	<script src="resources/js/common.js"></script>
	<script src="resources/js/member_message.js"></script>
</html>