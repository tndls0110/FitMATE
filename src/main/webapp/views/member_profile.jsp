<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FitMATE</title>
		<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/member_profile.css">
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script>
			var msg = '${msg}';
		</script>
	</head>
	<body>
		<div class="container">
			<c:import url="layout/leftnav_5.jsp"></c:import>
			<div class="contents narrow">
				<h2 class="title">내 프로필 보기</h2>
				<div class="profImg">
					<c:if test="${list.profile == ''}">
						<i class="bi bi-person-circle"></i>
					</c:if>
					<c:if test="${list.profile != ''}">
						<div style="background-image: url('/photo/${list.profile}');"></div>
					</c:if>
				</div>
				<table>
					<colgroup>
						<col width="140px" />
						<col width="260px" />
					</colgroup>
					<tr>
						<th>아이디</th>
						<td>${list.user_id}</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td>${list.nick}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${list.name}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${list.email}</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>${list.birthday}</td>
					</tr>
					<tr>
						<th>상태 메시지</th>
						<td>${list.status}</td>
					</tr>
					<tr>
						<th>주로 운동하는 지역</th>
						<td>${list.region_name} ${list.regions_name}</td>
					</tr>
					<tr>
						<th>헬스 MBTI 결과</th>
						<c:if test="${list.mbtir_name == null}">
							<td class="nombti">
								<p>헬스 mbti 검사 결과가 없습니다.</p>
								<p><button onclick="location.href='mbtiQ.go'" class="subbtn minbtn">검사하기</button></p>
							</td>
						</c:if>
						<c:if test="${list.mbtir_name != null}">
							<td>
								<p>${list.mbtir_name}</p>
								<p><button onclick="location.href='mbtiQ.go'" class="subbtn minbtn">다시 검사하기</button></p>
							</td>
						</c:if>
					</tr>
				</table>
				<div class="list">
					<button type="button" onclick="location.href='member_confirmpw.go'" class="full mainbtn">정보 수정하기</button>
				</div>
			</div>
		</div>
		<c:import url="layout/modal.jsp"></c:import>
	</body>
	<script src="resources/js/common.js"></script>
</html>