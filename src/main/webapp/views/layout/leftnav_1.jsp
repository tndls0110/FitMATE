<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="leftnav">
	<div class="brand"><span>Fit</span>MATE</div>
	<div class="profile">
		<i class="bi bi-person-circle" style="font-size: 70px;"></i>
		<p><b>OOO </b>님</p>
		<p><button class="mainbtn minbtn">로그아웃</button></p>
	</div>
	<ul class="menu noDesc">
		<li class="active">
			<a href="schedule.go">운동 일지</a> <!-- 운동일지 클릭하면 나오게-->
		</li>
		<li>
			<a href="crew_search">크루 검색</a>
		</li>
		<li>
			<a href="">내 크루</a>
		</li>
		<li>
			<a href="message">메시지</a>
		</li>
		<li>
			<a href="member_profile.go">마이 페이지</a>
		</li>
		<li>
			<a href=""><i class="bi bi-person-walking"></i></a>
			<div class="notify_new"></div>
		</li>
	</ul>
</div>