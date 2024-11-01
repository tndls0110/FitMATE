<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header">
	<c:if test="${sessionScope.loginIdx != null}">
		<p>
			<span class="admin_name"></span>님, 오늘도 열일하세요~ ^-^
			<button onclick="location.href='admin_logout.do'" class="mainbtn minbtn">로그아웃</button>
		</p>
	</c:if>
</div>
<script src="resources/js/admin_header.js"></script>