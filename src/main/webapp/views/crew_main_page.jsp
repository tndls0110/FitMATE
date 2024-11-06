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
			height: 555px;
			margin-left: 4px;
			float : left;
		}

		.calendar .writebtn {
		    position: absolute;
		    top: 40px; /* 원하는 위치 조정 */
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
			height: 550px;
			overflow-y: hidden;
			overflow-x: hidden;
			margin: -960px  -400px 9px 0px;
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
			height: 490px;
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
			background-color: orange; /* 제목이 '1'인 경우의 배경색 */
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

.custom-photolist {
    margin-top: 10px;
    
}

.crew{
	padding: 5px 20px 0;
	margin: 3px 0 15px;
}

.crew_contents{
	
}

.crew_list{
	margin: 15px 0;
}


 
 .custom-table tr {
    border-bottom: 1px solid #ddd; /* 구분선 스타일 */
}
 .custom-table {
            width: 95%;
            border-collapse: collapse;
            
           
            border-radius: 8px;
            overflow: hidden; 
        }

        .custom-table th, .custom-table td {
            
            padding: 12px;
            text-align: left;
             
        }

        .custom-table td {
            background-color: #282b34; 
            
            color: white; 
        }
        
		.custom-table td.title {
            width: 60%; /* 제목 열 70% */
        }

        .custom-table td.author {
            width: 15%; /* 작성자 열 15% */
        }

        .custom-table td.date {
            width: 25%; /* 작성일 열 15% */
        }

	 	.relative-button {
		    position: relative; 
		    left: 290px; 
		    right: 200px;
		    top: 0px;
		}
	
	.writebtn.relative-button,
	.mainbtn.relative-button,
	.minbtn.relative-button {
	    /* 기존 클래스의 스타일을 여기에 추가 */
	    
	}
	
	.profile-list {
    position: relative; /* 부모 요소를 기준으로 위치를 설정 */
    display: inline-block; /* 수평 배치 */
    float: right;
}
	
	.profile-icon {
    display: inline; /* 각 아이콘을 인라인으로 설정 */
    margin-right: -0.5px; /* 아이콘 간의 간격 */
    
}

.profile-img {
    width: 15px; /* 이미지 크기 조정 */
    height: 15px; /* 이미지 크기 조정 */
    border-radius: 50%; /* 동그란 형태 */
    object-fit: cover; /* 비율에 맞게 잘림 */
    border: 1px solid #ddd; /* 선택적으로 테두리 추가 */
}


.contents.crew_contents {
    overflow-y: auto;
    max-height: 200px;
}
	
	.gallery {
            display: flex;
            flex-wrap: wrap;
             justify-content: flex-start; /* 왼쪽 정렬 */
            margin: 0 auto;
            max-width: 800px;
        }
        .gallery-item {
            width: 33%;
            margin: 0px;
        }
		 #loading {
            text-align: center;
            display: none;
        }
        
        .relative-button.notice_btn{
        	position: absolute;
        	top: 0%;
        	right: 0%;
        	width: 7%;
        }
	</style>

</head>

<body>
<div class="container">
	<c:import url="layout/leftnav_1.jsp"></c:import>
	<!-- 운동일지는 nav1로, mbti만 nav5로 -->
	
	<div class="contents crew_contents">
	 
            <p style="display: inline; margin-right: 10px;">${name} 대시보드</p>
           <div id="profileList" class="profile-list" style="display: inline;">
            <!-- 프로필 사진을 여기에 추가 -->
          
            <!-- 추가 프로필 사진 -->
           
        </div> 
		
		<input type="hidden" id="crew_idx" name="crew_idx" value="${crew_idx}">
		<input type="hidden" id="crew_id" name="crew_id" value="${crew_id}">
		<input type="hidden" id="user_id" name="user_id" value="${sessionScope.loginId}">
		<div class="list" style="margin:15px 0;"> <!-- 공지사항 시작 -->
		 <p style="position: relative;">
		 <input type="text" class="full" name="crew_notice" value="" readonly/>
		 <button class="writebtn mainbtn minbtn relative-button notice_btn" onclick="crew_notice_go()" style="position: absolute;
    top: 16px;
    left: 828px;
    width: 60px;">공지 +</button>
		 </p>
		</div> <!-- 공지사항 끝 -->
		
		<div id="calendar_related">
			<div class="contents">
				<!-- 달력 -->
				<div class="calendar">
					<div class="title_calendar crew">
						<p>크루 일정 보기</p>
						<div id="date" style="font-size: 20px; margin: 20px 0 15px"></div>
						<button class="writebtn mainbtn minbtn" onclick="crew_plan_write()" style="z-index: 10;">일정 작성</button>
					</div>
					<div id="calendar"></div>
				</div>
			</div>

			<div id="schedule">
				<div class="crew_schedule">
					<div class="crew_schedule_title">크루 한줄게시글
					<button class="writebtn mainbtn minbtn relative-button" onclick="crew_oneboard_go()" style="z-index: 10;">더보기</button>
					</div>
						
					<div class="crew_schedule_content">
					
						<table id="postTable" class="custom-table">
					           
					            <!-- AJAX로 가져온 한줄 게시글 데이터가 여기 들어갑니다 -->
					       
					    </table>
					</div>
				</div>

			</div>
		
		</div>
		
		<div class="list custom-photolist"> <!-- 사진 시작 -->
		 
		 <p>
		 <div style="position: relative;">
		 <input style="margin-top: 10px;" type="text" class="full" name="photostart" value="사진게시글" readonly/>
		  <button class="writebtn mainbtn minbtn relative-button notice_btn" onclick="crew_photo_go()" style="position: absolute;
    top: 568px;
    left: 803px;
    width: 80px">사진 작성</button>
		 </div>	
		 </p>
		<div class="list custom_photo"> <!-- 사진 넣는 공간 -->
			<div class="gallery" id="gallery">
			</div>
			<div id="loading">로딩 중...</div>
		</div>
		
		</div> <!-- <div class="list custom-photolist"> 사진 끝 -->		

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
// 세션아이디 구분하기
var userId = document.getElementById('user_id').value;
// 크루장 판단하기 
let isCrewLeader = false;
var crewIdx = $('#crew_idx').val();
var crewId =  $('#crew_id').val();
if(userId === crewId){
	isCrewLeader = true;
}else{
	isCrewLeader = false;
}


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
					events: event_create,
					datesSet: function() {
						setTimeout(change_css, 100);
						// 달 변경 시 CSS 풀림 -> 해결 : css 불러오는데 시간이 부족했던 것이 문제였슴.......
						// -> ★ 해결 안됐지만..추가한 거: 달 변경 시 CSS 적용하는 이벤트 추가 -> 달 바뀔 때마다 css 새로 적용 render은 초기에만 하면 되니까.. 앞에 와도 됨
					}
				});
				
				calendar.render(); // 캘린더 렌더링 후 css를 해야하는 이유 : 랜더링-> 실제 코드를 적용하는 것 -> 랜더링 전 css 하면 .fc-event 요소들이 DOM에 존재하지 않기 때문에 CSS를 적용할 수 없음
				change_css();
			},
			error: function(xhr, status, error) {
				console.error('AJAX 오류:', status, error);
			}

		});

		// 2 번째 아작스 한줄게시글 목록 가져오기
		 $.ajax({
		        type: 'GET',
		        url: 'crew_main_oneboard.ajax', // 데이터 가져올 API URL
		        data: { crew_idx: $('#crew_idx').val() },
		        dataType: 'json',
		        success: function(data) {
		            // 받아온 데이터가 배열이라고 가정
		            console.log(data);
		            data.forEach(function(post) {
		            	// 오늘 날짜 가져오기
		                const today = new Date();
		                const postDate = new Date(post.date); // 게시글 날짜

		                // 날짜 비교: 오늘 날짜와 같은지 확인
		                let displayDate;

		                if (postDate.toDateString() === today.toDateString()) {
		                    // 오늘 날짜라면 시간만 표시
		                    displayDate = postDate.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
		                } else {
		                    // 오늘이 아니면 날짜만 표시
		                    displayDate = postDate.toLocaleDateString(); // 기본 포맷으로 날짜 표시
		                }
		            	
		                // 각 게시글에 대한 행 추가
		                $('#postTable').append(
		                		'<tr>' +
		                        '<td class="title">' + post.subject + '</td>' +
		                        '<td class="author">' + post.nick + '</td>' +
		                        '<td class="date">' + displayDate + '</td>' +
		                    '</tr>'
		                );
		            });
		            
		            
		        },
		        error: function(xhr, status, error) {
		            console.error('AJAX 오류:', status, error);
		        }
		    }); // 2번쨰 아작스 한줄게시글 목록 가져오기 end
		  
		    // 3번째 아작스 최신 공지사항 목록 한개 가져오기
		    $.ajax({
		        type: 'GET',
		        url: 'crew_main_notice.ajax', // 데이터 가져올 API URL
		        data: { crew_idx: $('#crew_idx').val() },
		        dataType: 'json',
		        success: function(data) {
		            // 받아온 데이터가 배열이라고 가정
		            console.log(data);
		            var subjectValue = data.subject;
		            $('input[name="crew_notice"]').val(subjectValue);
		        },
		        error: function(xhr, status, error) {
		            console.error('AJAX 오류:', status, error);
		        }
		    }); // 3번째 아작스 최신 공지사항 목록 한개 가져오기 end 
			
		    // 4번째 아작스 크루원 목록가져오기
		    $.ajax({
		        type: 'GET',
		        url: 'crew_main_crewmember.ajax', // 데이터 가져올 API URL
		        data: { crew_idx: $('#crew_idx').val() },
		        dataType: 'json',
		        success: function(data) {
		            // 받아온 데이터가 배열이라고 가정
		            console.log(data);
		            data.forEach(function(member) {
		            	const imageUrl = member.profile; // 프로필 이미지 URL
		                const profileUrl = 'mycrew_memberDetail.go?id=' + member.user_id + '&profileType=1&idx=' + crewIdx;
		                console.log(member);
		                // 각 게시글에 대한 행 추가
		             $('#profileList').append(
		                  '<span class="profile-icon" style="position: relative;">' +
		                  '<a href="' + profileUrl + '">' + // 클릭 시 프로필 페이지로 이동
		                  '<img src="/photo/' + imageUrl + '" class="profile-img" alt=" ">' +
		                  '</a>' +
		                  '</span>'
		               );
		            });
		            $('#profileList').append('<span class="profile-icon" onclick="crew_member_go()"><i class="bi bi-plus-circle"></i></span>');
		        },
		        error: function(xhr, status, error) {
		            console.error('AJAX 오류:', status, error);
		        }
		    }); // 4번쨰 아작스 크루원 목록 가져오기 end
		
		//오늘 날짜
		date = $('#date').html();

		console.log('오늘 날짜:', date);
		
		// 사진게시글 리스트 페이징 시작
			const gallery = $('#gallery'); // 갤러리 컨테이너 선택
	        const loading = $('#loading'); // 로딩 텍스트 선택
	        let page = 1; // 현재 페이지 번호
	        const pageSize = 6; // 한 번에 로드할 이미지 수
	        let isLoading = false; // 로딩 상태 체크
			let noimg = false;
	        // 이미지를 로드하는 함수
	        function loadImages() {
	            if (isLoading) return; // 이미 로딩 중이면 중복 요청 방지
	            isLoading = true;
	            if(noimg == false){
	            loading.show(); // 로딩 표시
	            }
	            $.ajax({
	                url: "crew_photo_list.ajax", // 서버에 Ajax 요청
	                method: 'GET',
	                data: { page: page, size: pageSize, crew_idx: $('#crew_idx').val() },
	                success: function(data) {
	                	console.log('포토리스트아작스 실행');
	                	console.log(data);
	                    renderImages(data); // 이미지 렌더링
	                    page++; // 페이지 번호 증가
	                    console.log(page);
	                    isLoading = false; // 로딩 완료
	                    loading.hide(); // 로딩 숨김
	                },
	                error: function(error) {
	                    console.error('Error loading images:', error);
	                    isLoading = false; // 에러 발생 시 로딩 완료
	                    loading.hide(); // 로딩 숨김
	                }
	            });
	        }

	        // 이미지를 갤러리에 추가하는 함수
	         function renderImages(items) {
	            if (!items || items.length === 0) {
	            	console.log('더 이상 불러올 이미지가 없습니다.');
	            		noimg = true;
	            	  isLoading = false; // 로딩 상태 해제
	                  loading.hide(); // 로딩 숨김
	                return;
	            }
	            items.forEach(item => {
	                if (item.board_idx) { // item에 url이 존재하는지 확인
	                	console.log('랜더링이미지 함수실행');
	                	console.log(item.status);
	                	 let imgSrc = (item.status == 2) ? '/photo/basic.png' : '/photo/' + item.new_filename;
	                     const img = $('<img>').attr('src', imgSrc); // 이미지 요소 생성
	                     img.css({
	                    	    'width': '260px',  // 최대 너비 300px
	                    	    'height': '280px'  // 최대 높이 200px
	                    	});
	                
	                    const redirectUrl = '/Fitmate/crew_photo_detail.go?board_idx=' + item.board_idx+'&crew_id='+crewId+'&crew_idx='+crewIdx;
	                    img.on('click', function() {
	                        window.location.href = redirectUrl; // 클릭 시 해당 URL로 이동
	                    });
	                    const div = $('<div>').addClass('gallery-item').append(img); // div 요소 생성
	                    gallery.append(div); // div를 갤러리에 추가
	                }
	            });
	        }
	        
	         let timeout;
	         $('.contents.crew_contents').on('scroll', function() {
	             clearTimeout(timeout);
	             timeout = setTimeout(onScroll, 100); // 100ms 후에 onScroll 실행
	         });
	        
	         function onScroll() {
	        	    const scrollTop = $('.contents.crew_contents').scrollTop();
	        	    const elementHeight = $('.contents.crew_contents').height();
	        	    const contentHeight = $('.contents.crew_contents')[0].scrollHeight;

	        	    // 스크롤 위치가 요소의 하단에 가까워졌는지 확인
	        	    if (scrollTop + elementHeight >= contentHeight - 100) {
	        	        console.log("스크롤이벤트실행");
	        	        loadImages(); // 새로운 이미지 로드
	        	    }
	        	}

	         
	        loadImages(); // 페이지 로드 시 초기 이미지 로드
		// 사진게시글 리스트 페이징 끝
		
		
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
	
	// 일정클릭시 일정 상세보기
	function get_crewplan(date) {
	    $.ajax({
	        url: 'crew_plan_detail.ajax', // API 엔드포인트
	        method: 'GET',
	        data: { 
	            date: date,
	            crew_idx: $('#crew_idx').val()	// 컨트롤러에 건내줄 crew_idx 값
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
	                        	  // 참가자 목록이 있는 경우
	                            let isParticipating = false;
	                        	
	                        	// 참가자 목록 추가
		                        if (participants && participants.length > 0) {
								    participants.forEach(function(participant) {
								        if (participant.party_id === userId) {
								        	 isParticipating = true; // 참가 중인 경우
								        	 console.log(isParticipating);
		                                }
								    });
								} 
		                        if(isParticipating){
		                        	  buttonHtml = '<button type="button" class="btn_participate" onclick="cancelParticipation(' + crewScheduleDTO.plan_idx + ')">참가취소</button>';
		                        	  console.log(isParticipating);
		                        }
		                        else {
		                        	console.log(isParticipating);
		                        	 buttonHtml = '<button type="submit" class="btn_participate">참가하기</button>';	 
								}
	                        	
	                        	
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
	                        var crew_idx = $('#crew_idx').val(); // crew_idx의 값
	                        var user_id = $('#user_id').val(); // user_id의 값
	                        // 크루 일정 정보 출력
                            $('#modalBody').append(
                            		
                            		'<div class="schedule-item" data-id="' + crewScheduleDTO.plan_idx + '">' +
                            	    '<form action="' + postform + '" method="POST">' + 
                            	        '<input type="hidden" id="user_id" name="user_id" value="'+user_id+'">' +
                            	        '<input type="hidden" id="crew_idx" name="crew_idx" value="'+crew_idx+'">'+
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

	
	
	// 참가취소 함수 (예시)
	function cancelParticipation(plan_idx) {
	    if (confirm("정말로 참가를 취소하시겠습니까?")) {
	        // AJAX로 참가취소 요청을 보내거나 폼 제출을 통해 처리
	        // 예: $.ajax({ url: 'crew_plan_cancel.ajax', method: 'POST', data: { plan_idx: plan_idx } });
		
	    $.ajax({
	    	 url: 'crew_plan_cancel.ajax',  // 서버의 참가 취소 처리 URL
	            method: 'POST',
	            data: {
	                plan_idx: plan_idx,  // 계획 ID
	                user_id: userId      // 사용자 ID
	            },
	            success: function(response) {
	                // 서버로부터의 응답 처리
	                console.log('리턴값'+response);
	                if (response) {
	                    alert("참가 취소가 완료되었습니다.");
	                    // 취소 완료 후 UI 업데이트
	                    // 예: 해당 일정을 UI에서 제거하거나, 버튼을 "참가하기"로 변경
	                    // $('#plan_' + plan_idx).remove(); // 예시
	                } else {
	                    alert("참가 취소에 실패했습니다. 다시 시도해 주세요.");
	                }
	            },
	            error: function(xhr, status, error) {
	                console.error('참가 취소 요청 중 오류 발생:', error);
	                alert("서버 오류로 참가 취소가 실패했습니다.");
	            }
	    });
	    
	    console.log('참가취소 요청: ' + plan_idx);
	    console.log('참가취소 요청: ' + userId);
	        // 실제 처리 코드 추가
	    }
	}
	
	
	// 크루일정 작성하러 가기
	function crew_plan_write(){
		var crewIdx = $('#crew_idx').val();
		location.href = "crew_schedule_write.go?crew_idx=" + crewIdx+"&crew_id="+crewId;
	}
	
	// 크루 한줄게시글 보러 가기
	function crew_oneboard_go(){
		var crewIdx = $('#crew_idx').val();
		location.href = "crew_oneboard.go?crew_idx=" + crewIdx+"&crew_id="+crewId;
	}
	
	// 크루 공지사항 보러 가기
	function crew_notice_go(){
		var crewIdx = $('#crew_idx').val();
		location.href = "crew_page_notice.go?crew_idx=" +crewIdx+"&crew_id="+crewId;
	}
	
	// 크루 사진게시글 작성하러 가기
	function crew_photo_go(){
		var crewIdx = $('#crew_idx').val();
		location.href = "crew_photo_write.go?crew_idx=" +crewIdx+"&crew_id="+crewId;
	}
	
	// 크루원 목록으로 가기
	function crew_member_go(){
		var crewIdx = $('#crew_idx').val();
		location.href = "mycrew_memberList.go?idx=" +crewIdx;
	}

</script>
</html>