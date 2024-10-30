<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="resources/css/calendar.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<style>

		/*전체 페이지에 스크롤 없애는 법*/
		html, body {
			overflow: hidden; /* 스크롤 숨기기 */
			height: 100%; /* 페이지 전체 높이를 설정 */
			margin: 0; /* 기본 마진 제거 */
			background-color: rgba(40, 43, 52, 1);
		}


		#calendar_related {
			width: 500px;
			height: 800px;
			margin-left: 4px;
			float : left;
		}



		.calendar {
			width: 412px;
			height: 580px;
			margin-top: -15px;
			background-color: #282b34;
		}

		.journal_write_button {
			width: 412px;
			height: 30px;
			margin-top: 30px;
			background-color: rgba(4, 129, 135, 1);
			padding-top: 20px;
			padding-bottom: 41px;
			text-align: center;
			border-radius: 5px;
		}

		#schedule {
			width: 475px;
			height: 680px;
			overflow-y: scroll;
			overflow-x: hidden;
			margin: -925px  -414px 9px 0px;
			float : right;
		}

		.crew_schedule_title { /*만약 크루 일정 없으면 display = none*/
			width: 500px;
			height: 30px;
			padding-bottom: 38px;
			padding-top: 17px;
			padding-left: 17px;
			border-radius: 5px 5px 0px 0px;
			background-color: rgba(40, 43, 52, 1);
			font-weight: bold;
			/*글자 굵기*/
		}

		.crew_schedule_content { /*만약 크루 일정 없으면 append x*/
			width: 500px;
			height: 100px;
			margin-top: 5px;
			margin-bottom: 10px;
			border-radius: 5px;
			/*top - bottom, right-left*/
			background-color: rgba(40, 43, 52, 1);
		}

		.contents{
			margin: 32px -28px;
		}

		.journal {
			margin: 20px 0px 360px 0px;
		}

		.journal_content {
			border-radius: 5px 5px 0px 0px;
			width: 500px;
			height: 150px;
			background-color: rgba(40, 43, 52, 1);
			margin: 10px 0px;
		}

		.journal_datetime {
			display: flex;
			flex-direction: row;
			padding: 10px 10px;
			font-weight: bold; /*굵은 글씨*/
			padding: 15px 21px;
		}

		.journal_time{
			margin-left: 9px;
			margin-top: 2px;
		}


		.journal_date{
			margin-top: 2px;
		}

		.journal_start_end {
			display: flex;
			flex-direction: row;
			margin-left: 159px;
		}

		.journal_start, .journal_end {
			background-color: rgba(54, 57, 64, 1);
			border-radius: 5px;
			padding: 5px 5px;
			margin:0px 5px;;
		}

		.crew_tag {
			background-color: rgb(255, 140, 0);
			border-radius: 5px;
			padding: 5px 5px;
		}

		.individual_tag {
			background-color: rgba(4, 129, 135, 1);
			border-radius: 5px;
			padding: 5px 5px;
			margin : 0px 6px 0px -19px;
		}

		.journal_content{
			margin: 3px 0px 384px 0px;
		}
		.journal_text {
			margin: 10px 10px;
			width: 430px;
			/*긴 단어가 영역 넘어가면 줄 바꿈되도록 하기*/
			word-wrap: break-word;
		}

		.journal_image {
			width: 500px;
			height: 419px;
			background-color: lightgray;
		}

		.crew_schedule_content {
			padding: 10px;
		}

		.crew_schedule_time {
			padding: 5px;
		}

		.crew_schedule_content_detail {
			display: flex;
			flex-direction: row;
			margin: 20px;
		}

		.circle {
			color: rgb(255, 140, 0);
		}

		.crew_name {
			font-weight: bold;
		}

		.crew_schedule_text {
			color: lightgray;
		}


		.fc .fc-event {
			position: unset;
		}

		.type-one {
			background-color: #5bc5bb; /* 제목이 '1'인 경우의 배경색 */
			color: white; /* 텍스트 색상 */
		}

		.type-two {
			background-color: orange; /* 제목이 '2'인 경우의 배경색 */
			color: black; /* 텍스트 색상 */
		}

		.fc-daygrid-day-events{
			display: flex;
			margin : -10px 11px 9px 17px;
			bottom: 10px;
		}

		.fc .fc-daygrid-day-top {
			display: block;
			text-align: center;
			position: relative;
		}

		#top{
			display: flex;
		}
		.crew_place{
			margin-left: 250px;
			margin-top: 6px;
			color : orange;
			display: flex;
		}

		.place_icon{
			margin-right: 5px;
		}

	</style>

</head>

<body>
<div class="container">
	<c:import url="layout/leftnav_1.jsp"></c:import>
	<!-- 운동일지는 nav1로, mbti만 nav5로 -->
	<div class="contents">
		<p>Hello, FitMATE!</p>
		<div id="calendar_related">


			<div class="contents">

				<!-- 달력 -->
				<div class="calendar">
					<div class="title_calendar">
						<p>일정 보기</p>
						<div id="date"></div>
						<button class="writebtn mainbtn minbtn">일정 작성</button>
					</div>
					<div id="calendar"></div>
				</div>


				<div class="journal_write_button" onclick="write_go()">일지 작성하기</div>

			</div>



			<div id="schedule">
				<div class="crew_schedule">
					<div class="crew_schedule_title">크루 일정</div>

					<div class="crew_schedule_content">
						<div id = "top">
							<div class="crew_schedule_time">09:20-06:00</div><div class = "crew_place"><div class = "place_icon"><i class="bi bi-geo-alt-fill"></i></div><div class = "crew_place_name">헬스장 이름</div></div>
						</div>
						<div class="crew_schedule_content_detail">
							<div class="circle">●</div>
							&nbsp;&nbsp;&nbsp;
							<div class="crew_name">${crew_name}</div>
							&nbsp;&nbsp;&nbsp;
							<div class="crew_schedule_text">모임장소에서 하체 운동</div>
						</div>
					</div>
				</div>

				<div id = "journal_total">
			<%--	<div class="journal">
					<div class="journal_content">
						<div class="journal_datetime">
							<div class="journal_date">2024-10-14</div>
							&nbsp;&nbsp;&nbsp;
							<!--<div class="journal_time">09:20</div>-->
							<div class="journal_start_end">
								<div class="crew_tag">크루</div>
								&nbsp;&nbsp;&nbsp;
								<div class="journal_start">시작 시간</div>
								&nbsp;&nbsp;&nbsp;
								<div class="journal_end">끝난 시간</div>
							</div>
						</div>
						<div class="journal_text">내 그대를 생각함은 항상 그대가 앉아 있는 배경에서 해가 지고
							바람이 부는 일처럼 사소한 일일 것이나</div>

						<div class="journal_image"></div>
					</div>

				</div>--%>
			<%--	<div class="journal">
					<div class="journal_content">
						<div class="journal_datetime">
							<div class="journal_date">2024-10-14</div>
							&nbsp;&nbsp;&nbsp;
							<div class="journal_time">09:20</div>
							<div class="journal_start_end">
								<div class="individual_tag">개인</div>
								&nbsp;&nbsp;&nbsp;
								<div class="journal_start">시작 시간</div>
								&nbsp;&nbsp;&nbsp;
								<div class="journal_end">끝난 시간</div>
							</div>
						</div>
						<div class="journal_text">내 그대를 생각함은 항상 그대가 앉아 있는 배경에서 해가 지고
							바람이 부는 일처럼 사소한 일일 것이나</div>

						<div class="journal_image"></div>
					</div>
				</div>--%>
			</div>

			</div>
		</div>




	</div>

	<c:import url="layout/modal.jsp"></c:import>
</body>
<script src="resources/js/common.js"></script>
<!-- 달력 JS (필수 파일입니다.) -->
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.15/index.global.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/interaction@6.1.15/index.global.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.15/index.global.min.js'></script>
<script src="resources/js/calendar.js"></script>


<script>
	document.addEventListener('DOMContentLoaded', function() {
		let event_create = []; // 이벤트 배열 초기화


		// 1. 캘린더 - 이벤트 날짜 가져오기 (개인 일정)
		$.ajax({
			type: 'GET',
			url: 'get_totalevents.ajax',
			//서비스 단에서 개인 일지 일정 + 크루 일정 따로 가져오기
			data: {},
			dataType: 'JSON',
			success: function(event_day) {
				console.log('event_day:', event_day);
				console.log('개인 일지:', event_day.date);
				console.log('크루 일정:', event_day.crew_events);


				// (개인일정 이벤트 만들기) AJAX 응답에서 날짜를 반복 -> 이벤트 객체 생성
				for (var dates of event_day.date) {
					let event_Object = {
						start: dates.date,
						title: '1' // 개인 일정
					};
					event_create.push(event_Object); // 이벤트 배열에 추가
				}

				console.log('개인일정만 추가 event_create:', event_create); // 최종 이벤트 배열 확인


				//(크루 일정 이벤트 만들기)
				for(var crew_event of event_day.crew_events){
					let event_Object = {
						start :	crew_event.plan_date,
						title : '2' //크루 일정
					};
					event_create.push(event_Object);
				}

				console.log('전체 일정 추가 event_create:', event_create); // 최종 이벤트 배열 확인



				// 캘린더 설정
				var calendarEl = document.getElementById('calendar');
				var calendar = new FullCalendar.Calendar(calendarEl, {
					initialView: 'dayGridMonth',
					aspectRatio: 1.1,
					headerToolbar: {
						start: 'title',
						center: '',
						end: 'prev next'
					},
					events: event_create
				});
				calendar.render(); // 캘린더 렌더링 후 css를 해야하는 이유 : 랜더링-> 실제 코드를 적용하는 것 -> 랜더링 전 css 하면 .fc-event 요소들이 DOM에 존재하지 않기 때문에 CSS를 적용할 수 없음
				change_css();
			},
			error: function(xhr, status, error) {
				console.error('AJAX 오류:', status, error);
			}

		});


		//오늘 날짜
		date = $('#date').html();

		console.log('오늘 날짜:', date);

		//처음에 실행할 때 캘린더 안에 있는 날짜 기반으로 journal 띄우기
		$.ajax({
			type : 'GET',
			url : '/journal_get.ajax',
			data : {'date' : date},
			dataType : 'JSON',
			success : function(journal){
				console.log('journal 가져오기 성공:',journal);
				draw_journal(journal);
			},
			error : function(e){
				console.log(e);
			}
		});



		//처음 실행할 때 캘린더 안에 있는 날짜 기반으로 크루 일정 띄우기


	});

	function change_css(){
		const events = document.querySelectorAll('.fc-event'); //.fc-event 요소들 모두 가져오기
		// 이벤트 forEach로 분리
		events.forEach(function (event) { //events 분리

			const title = event.getElementsByClassName('fc-event-title')[0].textContent; // events에서 title만 가져오기

			// 제목에 따라 다른 클래스 추가 -> 1 = 일지 2 = 크루
			if (title === '1') {
				event.classList.add('type-one'); // 클래스 추가
			} else if (title === '2') {
				event.classList.add('type-two'); // 클래스 추가
				//type-one과 type-two의 css 바꿔주기
			}
		});
	}

	// 날짜 뽑아오기
	var date;

	$('#calendar').on('click','td[aria-labelledby]',function(evt){
			date = $(this).attr('data-date');
			console.log('캘린더로부터 뽑아온 date : {}' + date);
			$('#date').html(date);

			//뽑은 날짜 기반으로 개인 일정 가져오기
			get_journal(date);

			//뽑은 날짜 기반으로 크루 일정 가져오기
			get_crewdate(date);
	});


	//날짜 뽑아오기 수정하기 전
	/*$('td[aria-labelledby]').each(function(event){

		this.addEventListener('click',function(evt){

			date = $(this).attr('data-date');

			console.log('캘린더로부터 뽑아온 date : {}' + date);

			$('#date').html(date);

			//get_crewdate(date);

			get_journal(date);

		});
	});*/

	function get_crewdate(date){
		//date 매개변수로 전달해서 내용 가져오기
		//가져올 내용 - plan_start, plan_end, crew_name,plan_subject,


	}




	function get_journal(date){
		$.ajax({
			type: 'GET',
			url: 'journal_get.ajax',
			data: {'date': date},
			dataType: 'JSON',
			success: function (journal) {
				console.log(journal);
				draw_journal(journal);


			},
			error : function (e){
				console.log(e);
			}
		});
	}

	function draw_journal(journal){
		var keySet = Object.keys(journal.content);
		console.log('journal.length :', keySet.length);
		var content ='';
		for (var key of keySet) {
			if (keySet.length > 0) { //만약 key의 길이가 0보다 크면
				console.log('값 있음');

				console.log('key:{}', key);
				console.log('value:{}', journal.content[key]);
				var j_data = journal.content[key];

				//time에서 초 잘라내기
				var start_time = j_data['time(journal_start)'].toString();
				var s_time = start_time.substring(0, 5);
				console.log('start_time:',start_time);

				console.log('s_time:', s_time);

				var end_time = j_data['time(journal_end)'].toString();
				console.log('end_time:',end_time);

				var e_time = end_time.substring(0, 5);
				console.log('e_time:', e_time);



				content += '<div class="journal_content"><div class="journal_datetime"><div class="journal_date">';
				content += j_data['date'] + '</div><div class="journal_time">';
				content += e_time + '</div>';
				content += '<div class="journal_start_end">';
				if (j_data['journal_cate'] == 1) {
					content += '<div class="individual_tag">개인</div>';
				} else if (j_data['journal_cate'] == 2) {
					content += '<div class="crew_tag">크루</div>';
				}


				content += '<div class="journal_start">' + s_time + '</div>';
				content += '<div class="journal_end">' + e_time + '</div> </div></div>';
				content += '<div class="journal_text">' + j_data['journal_content'] + '</div>'

				/*if(j_data['journal']) 사진 나중에 추가하기*/
				content += '<div class="journal_image"></div></div>';

			}
		}
		console.log('content: ', content);
		$('#journal_total').html(content);
	}

	function write_go(){
		location.href = "schedule_write.go";
	}



</script>
</html>