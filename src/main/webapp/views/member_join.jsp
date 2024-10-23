<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FitMATE</title>
		<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/join.css" />
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	</head>
	<body>
		<div class="container">
			<c:import url="layout/leftnav_1.jsp"></c:import>
			<div class="contents narrow">
				<h2 class="title">회원가입</h2>
				<form action="member_join.do" method="post">
					<div class="list">
						<h3 class="capt">아이디 <span class="required">(필수)</span></h3>
						<p><input type="text" class="full" name="user_id" /></p>
						<h3 class="msg pass pass_id hide">사용할 수 있는 아이디입니다.</h3>
						<h3 class="msg caution check_id hide">이미 사용중인 아이디입니다. 다른 아이디를 입력하세요.</h3>
						<h3 class="msg caution npass_id hide">아이디 중복체크 통과는 필수 항목입니다.</h3>
						<h3 class="msg caution fill_id hide">아이디는 필수 항목입니다.</h3>
					</div>
					<div class="list">
						<h3 class="capt">비밀번호 <span class="required">(필수)</span></h3>
						<p><input type="password" class="full" name="pw" /></p>
						<p class="confirm"><input type="password" class="full" name="pwconfirm" /></p>
						<h3 class="msg caution check_pw hide">비밀번호와 비밀번호 확인 값은 동일해야 합니다.</h3>
						<h3 class="msg caution fill_pw hide">비밀번호는 필수 항목입니다.</h3>
					</div>
					<div class="list">
						<h3 class="capt">닉네임 <span class="required">(필수)</span></h3>
						<p><input type="text" class="full" name="nick" /></p>
						<h3 class="msg pass pass_nick hide">사용할 수 있는 닉네임입니다.</h3>
						<h3 class="msg caution check_nick hide">이미 사용중인 닉네임입니다. 다른 닉네임을 입력하세요.</h3>
						<h3 class="msg caution npass_nick hide">닉네임 중복체크 통과는 필수 항목입니다.</h3>
						<h3 class="msg caution fill_nick hide">닉네임은 필수 항목입니다.</h3>
					</div>
					<div class="list">
						<h3 class="capt">이름 <span class="required">(필수)</span></h3>
						<p><input type="text" class="full" name="name" /></p>
						<h3 class="msg caution fill_name hide">이름은 필수 항목입니다.</h3>
					</div>
					<div class="list">
						<h3 class="capt">이메일 <span class="required">(필수)</span></h3>
						<p><input type="text" class="full" name="email" /></p>
						<h3 class="msg caution fill_email hide">이메일은 필수 항목입니다.</h3>
					</div>
					<div class="list">
						<h3 class="capt">생년월일 <span class="required">(필수)</span></h3>
						<p><input type="date" class="full" name="birthday" /></p>
						<h3 class="msg caution fill_birth hide">생년월일은 필수 항목입니다.</h3>
					</div>
					<div class="list">
						<h3 class="capt">프로필</h3>
						<p><input type="file" class="full" name="profile" onchange="readFile(this)" /></p>
						<div class="img_preview"></div>
					</div>
					<div class="list">
						<h3 class="capt">상태 메시지</h3>
						<p><input type="text" class="full" name="status" /></p>
					</div>
					<div class="list">
						<h3 class="capt">주로 운동하는 지역</h3>
						<div class="btn_flex">
							<div class="width50p">
								<select class="narrow" name="region1" onchange="onOptionChange(event)">
									<c:forEach items="${region}" var="region">
										<option value="${region.region_idx}">${region.region_name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="width50p">
								<select class="narrow" name="region2">
									<c:forEach items="${region2}" var="region">
										<option value="${region.regions_idx}">${region.regions_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="list">
						<button type="button" class="full mainbtn" onclick="join()">회원 가입</button>
					</div>
				</form>
				<div class="list">
					<button onclick="/member_login.go" class="full subbtn">되돌아가기</button>
				</div>
			</div>
		</div>
		<c:import url="layout/modal.jsp"></c:import>
	</body>
	<script src="resources/js/common.js"></script>
	<script src="resources/js/member_join.js"></script>
</html>