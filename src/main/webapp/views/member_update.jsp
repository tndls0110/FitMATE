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
				<h2 class="title">정보 수정하기</h2>
				<form action="member_update.do" method="post" enctype="multipart/form-data">
					<div class="list">
						<h3 class="capt">아이디 <span class="required">(변경 불가)</span></h3>
						<p class="statics">${list.user_id}</p>
						<input type="hidden" name="user_id" value="${list.user_id}" />
					</div>
					<div class="list">
						<h3 class="capt">비밀번호 <span class="required">(필수)</span></h3>
						<div class="btn_flex narrow">
							<div class="width70p">
								<input type="password" class="full flex_left" name="pw" value="${list.pw}" maxlength="20" readonly />
							</div>
							<div class="width30p">
								<button type="button" onclick="location.href='member_updatepw.go'" class="mainbtn full flex_right">변경하기</button>
							</div>
						</div>
					</div>
					<div class="list">
						<h3 class="capt">닉네임 <span class="required">(필수)</span></h3>
						<p><input type="text" class="full" name="nick" value="${list.nick}" maxlength="20" /></p>
						<h3 class="msg pass pass_nick hide">사용할 수 있는 닉네임입니다.</h3>
						<h3 class="msg caution check_nick hide">이미 사용중인 닉네임입니다. 다른 닉네임을 입력하세요.</h3>
						<h3 class="msg caution npass_nick hide">닉네임 중복체크 통과는 필수 항목입니다.</h3>
						<h3 class="msg caution fill_nick hide">닉네임은 필수 항목입니다.</h3>
					</div>
					<div class="list">
						<h3 class="capt">이름 <span class="required">(필수)</span></h3>
						<p><input type="text" class="full" name="name" value="${list.name}" maxlength="20" /></p>
						<h3 class="msg caution fill_name hide">이름은 필수 항목입니다.</h3>
					</div>
					<div class="list">
						<h3 class="capt">이메일 <span class="required">(필수)</span></h3>
						<p><input type="text" class="full" name="email" value="${list.email}" maxlength="20" /></p>
						<h3 class="msg caution fill_email hide">이메일은 필수 항목입니다.</h3>
					</div>
					<div class="list">
						<h3 class="capt">생년월일 <span class="required">(필수)</span></h3>
						<p><input type="date" class="full" name="birthday" value="${list.birthday}" /></p>
						<h3 class="msg caution fill_birth hide">생년월일은 필수 항목입니다.</h3>
					</div>
					<div class="list">
						<h3 class="capt">프로필</h3>
						<p>
							<div class="img_preview">
								<c:if test="${list.profile == ''}">
									<div>
										<i class="bi bi-person-circle"></i>
									</div>
								</c:if>
								<c:if test="${list.profile != ''}">
									<div style="background-image: url('/photo/${list.profile}');"></div>
								</c:if>
							</div>
						</p>
						<c:if test="${list.profile == ''}">
							<p><input type="file" class="full" name="profile" onchange="readFile(this)" multiple /></p>
						</c:if>
						<c:if test="${list.profile != ''}">
							<div class="btn_flex narrow">
								<div class="width80p">
									<input type="file" class="full flex_left" name="profile" onchange="readFile(this)" multiple />
								</div>
								<div class="width20p">
									<button type="button" onclick="initProfile()" class="subbtn full flex_right">삭제</button>
								</div>
							</div>
						</c:if>
					</div>
					<div class="list">
						<h3 class="capt">상태 메시지</h3>
						<p><textarea class="full" name="status" rows="3" maxlength="1000" onkeyup="drawLength(this)">${list.status}</textarea></p>
						<div class="showLength">
							<h3 class="capt"><span>0</span>/1,000</h3>
						</div>
					</div>
					<div class="list">
						<h3 class="capt">주로 운동하는 지역</h3>
						<div class="btn_flex">
							<div class="width50p">
								<select class="narrow" name="region1" onchange="onOptionChange(event)">
									<c:forEach items="${region}" var="region">
										<c:if test="${region.region_idx == list.region_idx}">
											<option value="${region.region_idx}" selected>${region.region_name}</option>
										</c:if>
										<c:if test="${region.region_idx != list.region_idx}">
											<option value="${region.region_idx}">${region.region_name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<div class="width50p">
								<select class="narrow" name="region2">
									<c:forEach items="${region2}" var="region">
										<c:if test="${region.regions_idx == list.regions_idx}">
											<option value="${region.regions_idx}" selected>${region.regions_name}</option>
										</c:if>
										<c:if test="${region.regions_idx != list.regions_idx}">
											<option value="${region.regions_idx}">${region.regions_name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="list">
						<button type="button" class="full mainbtn" onclick="update()">수정하기</button>
					</div>
				</form>
				<div class="list">
					<button onclick="location.href='member_profile.go'" class="full subbtn">돌아가기</button>
				</div>
			</div>
		</div>
		<c:import url="layout/modal.jsp"></c:import>
	</body>
	<script src="resources/js/common.js"></script>
	<script src="resources/js/member_update.js"></script>
	<script>
		var msg = '${msg}';
		var ori_nick = '${list.nick}';
	</script>
</html>