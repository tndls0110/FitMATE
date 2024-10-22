<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
<head>
<meta charset="UTF-8">

<style>

/*전체 페이지에 스크롤 없애는 법*/
html, body {
	overflow: hidden; /* 스크롤 숨기기 */
	height: 100%; /* 페이지 전체 높이를 설정 */
	margin: 0; /* 기본 마진 제거 */
	background-color: rgba(40, 43, 52, 1);
}

.Question_page {
	margin-left: 226px;
	margin-top: 103px;
	width: 500px;
	height: 510px;
}

#title {
	display: flex;
	flex-direction: row;
}

.b_title {
	font-weight: bold;
	font-size: 25px;
}

.s_title {
	margin-top: 10px;
}

#line {
	margin-top: 40px;
	margin-bottom: 20px;
}

.line_fixed {
	width: 500px;
	border: 0.5px solid rgba(4, 129, 135, 1);
}

.line_move {
	/* 고도화 : 헬스 mbti 테이블의 질문 수 세어서, 총 길이를 질문 수로 나눈 다음.. getElementClass('line_moved'), lineElement.style.width = lineLength 가져와서 바꾸기*/
	width: 83px;
	height: 5px;
	background-color: rgba(4, 129, 135, 1);
}

#main_Question {
	font-weight: bold;
	margin: 20px 0px;
}

#main_option {
	margin: 30px 0px;
}

.option {
	width: 480px;
	height: 30px;
	background-color: rgba(40, 43, 52, 1);
	margin: 10px 3px;
	padding: 15px 10px 10px 10px;
	border-radius: 5px;
} /*클릭 이벤트의 옵션은 초록색으로 바뀌도록*/
#prev_next_div {
	display: flex;
	flex-direction: row;
}

.prev {
	width: 220px;
	height: 50px;
	border-radius: 5px;
	background-color: rgba(233, 236, 239, 1);
	padding: 15px 10px 10px 10px;
	color: rgba(40, 43, 52, 1);
	font-weight: bold;
	text-align: center;
}

.next {
	width: 220px;
	height: 50px;
	border-radius: 5px;
	background-color: rgba(4, 129, 135, 1);
	padding: 15px 10px 10px 10px;
	margin-left: 30px;
	font-weight: bold;
	text-align: center;
}
</style>

</head>

<body>
	<div class="container">
		<c:import url="layout/leftnav_1.jsp"></c:import>
		<!-- 운동일지는 nav1로, mbti만 nav5로 -->
		<div class="contents">

			<div class="Question_page">
				<div id="title">
					<div class="b_title">헬스 MBTI</div>
					&nbsp;&nbsp;
					<div class="s_title">검사하기</div>
				</div>
				<div id="line">
					<div class="line_fixed"></div>
					<div class="line_move"></div>
					<!-- 다음 페이지 버튼 누르면 이동하게 하기-->
				</div>
				<div id="Question_div">
					<div id="main_Question"></div>
					<div id="main_option">
						<!--foreach로 분리해서 div 추가하는 로직으로 바꾸기-->

					</div>
				</div>

				<div id="prev_next_div">
					<div class="prev">← 이전 질문</div>
					<!--이미지로 넣기-->
					<div class="next">다음 질문 →</div>
					<!--이미지로 넣기-->
				</div>
			</div>
		</div>
	</div>
<c:import url="layout/modal.jsp"></c:import>
</body>
<script src="resources/js/common.js"></script>

<script>
	let isInitialLoad = true;
	let currentQuestionIdx = 0;
	let minQuestionIdx = 0;

	//페이지 시작하자마자 정보 가져오기
	//최소 idx 값을 가져오는 ajax 요청부터 실행
	//성공하면 받아온 currentIdx를 currentQuestionIdx와 minQuestionIdx의 전역 변수에 넣음
	// 그 후 idx로 질문 및 문항 가져오는 함수 실행
	window.onload = function initialLoad() {
		//초기화값 설정해줘야함...
		if (isInitialLoad) {

			$.ajax({
				type : 'GET',
				url : 'mbtiIdx.ajax',
				data : {},
				dataType : 'JSON',
				success : function(result) {
					console.log(result.idx);

					//최소 idx 가져오면 currentQuestionIdx와 minQuestionIdx에 저장하기
					currentQuestionIdx = result.idx;
					minQuestionIdx = result.idx;
					console.log(currentQuestIdx);
					console.log(minQuestionIdx);
					//저장하고 나서
					isInitialLoad = false;	
					loadQuestion(currentQuestionIdx); //idx 값을 기반으로
					
				},
				error : function(e) {
					console.log(e);
				}
				else{
					loadQuestion(currentQuestionIdx);	
				}
			});

		}
	}

	function loadQuestion(idx){
		$.ajax({
			type : 'GET',
			url : 'loadQuestion.ajax',
			data: {'Qidx': currentQuestionIdx},
			dataType : 'JSON',
			success : function(data){ //data 전달받기 
 				console.log(data); //data 찍어보기....
 				console.log(data.questioncontent);
 				console.log(data.questionIdx);
 				console.log(data.option);
				drawQuestion(data.questioncontent,data.questionIdx,data.option);
			},
			error:function(e){
				console.log(e);
				
			}		
		});
	}
	
	
	//$('.option').remove(); //이전의 문항 div는 삭제
	//메인 질문의 html을 가져온 데이터로 바꿔주기
	/* main_Question */
</script>

</html>