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

		/* 오른쪽 크루일정 위치 ? */
		#calendar_related {
			width: 500px;
			height: 800px;
			margin-left: 4px;
			float : left;
		}

		.calendar .writebtn {
		    position: absolute;
		    top: 60px; /* 원하는 위치 조정 */
		    right: 16px; /* 오른쪽 여백 */
		    cursor: pointer; 
		}

		.calendar {
			width: 400px;
			height: 550px;
			margin-top: -50px;
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




	.custom_modal_container {
	/* 커스텀 모달 */
    width: 600px; 
    min-height: 500px;
     max-height: 80vh; 
    background-color: #282b34; 
    border-radius: 10px; 
    padding: 20px; /* 패딩 추가 */
    color: #e9ecef; /* 텍스트 색상 변경 */
     overflow-y: auto;
    
      z-index: 999;
       justify-content: center; /* 수평 중앙 정렬 */
   
	}
	.custom_modal_background{
    background-color: rgba(255, 255, 255, 0.9); /* 흰색 배경 */
    border-radius: 10px; /* 모서리 둥글게 */
    padding: 2px; /* 패딩 추가 */
    display: flex; /* 중앙 정렬을 위한 flexbox */
    justify-content: center; /* 수평 중앙 정렬 */
    align-items: center; /* 수직 중앙 정렬 */
     
    left: 300; /* 왼쪽에서 0 거리 */
   
    z-index: 998; 
    
	
	}



	</style>

</head>

<body>
<div class="container">
	<c:import url="layout/leftnav_1.jsp"></c:import>
	<!-- 운동일지는 nav1로, mbti만 nav5로 -->
	<div class="contents">
		<p>크루이름 대시보드</p>
		<input type="hidden" id="crew_idx" name="crew_idx" value="6">
		<input type="hidden" id="crew_id" name="crew_id" value="크루장id">
		<input type="hidden" id="user_id" name="user_id" value="member02">
		<div id="calendar_related">

			<div class="contents">

				<!-- 달력 -->
				<div class="calendar">
					<div class="title_calendar">
						<p>크루 일정 보기</p>
						<div id="date" style="font-size: 20px;"></div>
						<button class="writebtn mainbtn minbtn" onclick="crew_plan_write()">일정 작성</button>
					</div>
					<div id="calendar"></div>
				</div>
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
		
			</div>

			</div>
		</div>

</div>


	</div>

<!-- 모달창 -->
<div class="modal" id="scheduleModal">
	<div class="custom_modal_background">
    <div class="modal_container custom_modal_container">
        <div class="modal_header">
            <h3 class="title">일정 상세 보기</h3>
            <button class="btn_close" onclick="closeModal()">닫기</button>
        </div>
        <div class="modal_body" id="modalBody">
        <!-- 선택한 날짜를 기준으로 크루 플랜 값 가져오기 제목,시간,장소,내용,참가인원 -->
  		</div>
        </div>
    </div>
</div>
<!-- 모달창 끝 -->
	<c:import url="layout/modal.jsp"></c:import>
</body>
<script src="resources/js/common.js"></script>
<!-- 달력 JS (필수 파일입니다.) -->
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.15/index.global.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/interaction@6.1.15/index.global.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.15/index.global.min.js'></script>
<script src="resources/js/calendar.js"></script>


<script>
var userId = document.getElementById('user_id').value;

	document.addEventListener('DOMContentLoaded', function() {
		let event_create = []; // 이벤트 배열 초기화


		// 1. 캘린더 - 이벤트 날짜 가져오기 (개인 일정)
		$.ajax({
			type: 'GET',
			url: 'crew_plan_events.ajax',  // 크루 일정 모두 가져오는 ajax 
			data: { crew_idx: $('#crew_idx').val() },
			dataType: 'JSON',
			success: function(event_day) {
				console.log('event_day:', event_day);
				console.log('크루 일정:', event_day.crew_events);

				
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
	}); // document.addEventListener('DOMContentLoaded', function()

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
			}
		});
	} // change_css()

	// 날짜 뽑아오기
	var date;

	$('#calendar').on('click','td[aria-labelledby]',function(evt){
			date = $(this).attr('data-date');
			console.log('캘린더로부터 뽑아온 date : {}' + date);
			$('#date').html(date);

			//뽑은 날짜 기반으로 개인 일정 가져오기
			//	get_journal(date);
			
			// 뽑은 날짜 기반으로 일정 상세보기 모델창 띄우기
			  openModal(date);
			
	}); // $('#calendar').on('click','td[aria-labelledby]',function(evt)

	// 모달 열기 함수
	function openModal(date) {
	    $('#modalBody').html('<p>선택한 날짜: ' + date + '</p>'); // 동적으로 내용 추가
	    $('#scheduleModal').css('display', 'flex'); // 모달 열기
	  	 get_crewplan(date);
	}

	// 모달 닫기 함수
	function closeModal() {
	    $('#scheduleModal').css('display', 'none'); // 모달 닫기
	}
	
	// 크루장 판단하기 
	const isCrewLeader = true;
	
	
	function get_crewplan(date) {
	    $.ajax({
	        url: 'crew_plan_detail.ajax', // API 엔드포인트
	        method: 'GET',
	        data: { 
	            date: date,
	            crew_idx: $('#crew_idx').val()	
	        },
	        success: function(response) {
	            // 기존 내용 초기화
	            $('#modalBody').empty();

	            // 응답 데이터로 모달 내용을 업데이트
	            if (response.status === "success") {
	                const crewPlanDetails = response.crewPlanDetails;
	                if (crewPlanDetails.length === 0) {
	                    $('#modalBody').append('<p>해당 날짜에 일정이 없습니다.</p>');
	                } else {
	                    crewPlanDetails.forEach(function(detail) {
	                        const crewScheduleDTO = detail.crewPlan; // 크루 일정 DTO
	                        const participants = detail.participants; // 참가자 목록
	                        var buttonHtml;
	                        var postform;
	                        // 버튼 체크
	                        if(isCrewLeader){ // 크루장이면 삭제하기버튼
	                        	postform = "/Fitmate/crew_plan_del.do";
	                        	 buttonHtml = '<button type="submit" class="btn_participate">삭제하기</button>';
	                        	console.log(postform);
	                        }else{ // 크루원이면 참가하기 버튼
	                        	postform = "/Fitmate/crew_plan_join.do";
	                        	 buttonHtml = '<button type="submit" class="btn_participate">참가하기</button>';
	                        	 console.log(postform);
	                        }
	                        
	                     	// crewScheduleDTO.plan_start가 '13:00:00' 형식이라고 가정
	                        const timeString = crewScheduleDTO.plan_start; // '13:00:00'
							console.log(timeString);
	                        // ':'를 기준으로 분리
	                        const timeParts = timeString.split(':');

	                        // 시와 분만 가져오기
	                        const hours = timeParts[0];
	                        const minutes = timeParts[1];

	                        // 원하는 형식으로 출력
	                        const formattedTime = hours + ':'  + minutes;
	                        
	                     	// 종료시간이 '15:00:00' 형식이라고 가정
	                        const endTimeString = crewScheduleDTO.plan_end; // '15:00:00'

	                        // ':'를 기준으로 분리
	                        const endTimeParts = endTimeString.split(':');

	                        // 시와 분만 가져오기
	                        const endHours = endTimeParts[0];
	                        const endMinutes = endTimeParts[1];

	                        // 원하는 형식으로 출력
	                        const formattedEndTime = endHours + ':'  + endMinutes;
	                        
	                        // 크루 일정 정보 출력
                            $('#modalBody').append(
                            		
                            		'<div class="schedule-item" data-id="' + crewScheduleDTO.plan_idx + '">' +
                            	    '<form action="' + postform + '" method="POST">' + 
                            	        '<input type="hidden" id="user_id" name="user_id" value="member02">' +
                            	        '<input type="hidden" id="crew_idx" name="crew_idx" value="6">'+
                            	        '<input type="hidden" name="plan_idx" value="' + crewScheduleDTO.plan_idx + '">' + 
                            	        '<h3 class="title">제목 : ' + (crewScheduleDTO.plan_subject || '제목 없음') + '</h3>' +
                            	        '<p><span><i class="bi bi-calendar-check"></i></span><span style="padding-left: 8px;">' + (crewScheduleDTO.plan_date) + '</span></p>' +
                            	        '<p><span><i class="bi bi-clock"></i></span> ' + (formattedTime || '정보 없음') + 
                            	        '<strong> ~</strong> ' + (formattedEndTime || '정보 없음') +
                            	        '<span style="padding-left: 100px;"><i class="bi bi-geo-alt"></i></span>' + 
                            	        '<span style="margin-left: 5px;">' + (crewScheduleDTO.plan_place || '정보 없음') + '</span></p>' +
                            	        '<p><strong>내용:</strong></p>' + 
                            	        '<p>' + (crewScheduleDTO.plan_content || '내용 없음') + '</p>' +
                            	        '<p></p>' +
                            	        '<p class="participants-list"><i class="bi bi-person-check"></i></p>' +
                            	        buttonHtml +
                            	    '</form>' +
                            	    '<hr>' +
                            	    '</div>'
                            	
                            );
	          
	                        // 참가자 목록 추가
	                        if (participants && participants.length > 0) {
							    participants.forEach(function(participant) {
							        $('.schedule-item[data-id="' + crewScheduleDTO.plan_idx + '"] .participants-list').append('<span>' + participant.party_id + '</span>' + '<span>' + participant.profile + '</span>');
							    });
							} else {
							    $('.schedule-item[data-id="' + crewScheduleDTO.plan_idx + '"] .participants-list').append('<span>참가자가 없습니다.</span>');
							}
	                    });
	                }
	            } else {
	                $('#modalBody').append('<p>'+response.message+'</p>');
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error('Error fetching crew plan:', error);
	            $('#modalBody').append('<p>일정을 가져오는 데 문제가 발생했습니다.</p>');
	        }
	    });
	} // function get_crewplan(date)
	
		
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
	} // function draw_journal(journal)
	
	// 크루일정 작성하러 가기
	function crew_plan_write(){
		var crewIdx = $('#crew_idx').val();
		location.href = "crew_schedule_write.go?crew_idx=" + crewIdx;
	}



</script>
</html>