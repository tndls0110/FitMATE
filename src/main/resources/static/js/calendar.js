// 캘린더 렌더링 위치
var calendarEl = document.getElementById('calendar');

// 캘린더 설정
var calendar = new FullCalendar.Calendar(calendarEl, {
	initialView: 'dayGridMonth',
	aspectRatio: 1.1,

	headerToolbar: {
		start: 'title',
		center: '',
		end: 'prev next'
	},

	DateFormatter: {
		year:'numeric', month: 'numeric', day: 'numeric'
	},

	// 이벤트 삭제 후 작업 진행하셔야 합니다.
	events: [
		{
			start  : '2024-10-15'
		},
		{
			start  : '2024-10-18'
		},
		{
			start  : '2024-10-18'
		},
		{
			start  : '2024-10-19'
		}
	]
	// 이벤트 끝
});

// 캘린더 렌더링
calendar.render();

// 상단에 날짜 출력
var today = $('.fc-day-today').attr('data-date');
document.getElementById('date').innerHTML = today;

calendar.on('dateClick', function(info) {
	document.getElementById('date').innerHTML = info.dateStr;
});