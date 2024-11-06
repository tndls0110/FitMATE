<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="leftnav">
	<div class="brand"><span>Fit</span>MATE</div>
	<div class="profile">
		<div class="leftnav_profImg"></div>
		<p class="leftnav_nick"></p>
		<p><button onclick="location.href='member_logout.do'" class="mainbtn minbtn">로그아웃</button></p>
	</div>
	<ul class="menu noDesc">
		<li>
			<a href="schedule.go">운동 일지</a>
		</li>
		<li>
			<a href="crew_search">크루 검색</a>
		</li>
		<li class="active">
			<a href="mycrew">내 크루</a>
		</li>
		<li>
			<a href="member_profile.go">마이 페이지</a>
		</li>
		<li>
			<a href="alarm.go"><i class="bi bi-person-walking"></i></a>
			<div class="notify_new"></div>
		</li>
	</ul>
</div>
<script src="resources/js/member_leftnav.js"></script>

<script>
	window.onload = function (){
		//setInterval로 알림이 있는 지 function 실행
		check_if_login();
	}

	function check_if_login(){
		$.ajax({
			type : 'get',
			url : 'check_if_login.ajax',
			data :{},
			dataType : 'JSON',
			success : function (data){
				if(data.exists == 'exist'){


					setInterval(check_unreadAlarm,6000); //6초마다 알림 확인..
				}
			},error : function (e){}
		})
	}

	function check_unreadAlarm(){
		$.ajax({
			type : 'get',
			url : 'check_unreadAlarm.ajax',
			data :{},
			dataType : 'JSON',
			success : function (data){
				if(data.exists == 'exist'){
					$('.notify_new').css({'visibility' : 'visible'});
				}else if(data.exists == 'none'){
					$('.notify_new').css({'visibility' : 'hidden'});
				}
			},error : function (e){}
		})
	}
</script>