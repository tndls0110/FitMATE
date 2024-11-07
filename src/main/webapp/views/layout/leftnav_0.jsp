<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="leftnav">
	<div class="brand"><span>Fit</span>MATE</div>
	<div class="profile">
		<div class="leftnav_profImg hide"></div>
		<p class="leftnav_nick hide"></p>
		<p><button onclick="location.href='member_logout.do'" class="mainbtn minbtn hide">로그아웃</button></p>
	</div>
	<ul class="menu noDesc">
		<li class="active">
			<a href="schedule.go">운동 일지</a> <!-- 운동일지 클릭하면 나오게-->
		</li>
		<li>
			<a href="crew_search">크루 검색</a>
		</li>
		<li>
			<a href="mycrew">내 크루</a>
		</li>
		<li>
			<a href="member_profile.go">마이 페이지</a>
		</li>
		<li>
			<a href="alarm.go"><i class="bi bi-person-walking"></i></a>
			<div class="hide notify_new"></div>
		</li>
	</ul>
</div>
<script src="resources/js/member_leftnav.js"></script>
<script>
	window.onload = function (){
		//setInterval로 알림이 있는 지 function 실행
		check_unreadAlarm();
		setInterval(check_unreadAlarm,6000); //6초마다 알림 확인..
	}


	function check_unreadAlarm(){
		$.ajax({
			type : 'get',
			url : 'check_unreadAlarm.ajax',
			data :{},
			dataType : 'JSON',
			success : function (data){
				if(data.exists == 'exist'){
					var notify = document.querySelector('.leftnav .hide');
					notify.classList.remove('hide');
				}
			},error : function (e){}
		})
	}
</script>