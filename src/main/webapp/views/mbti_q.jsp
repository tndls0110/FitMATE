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
		.loading_context{
			width: 480px;
			height: 250px;
			font-size: 29px;
			font-weight: 800;
			text-align: center;
			padding: 100px;
		}
		.option {
			width: 480px;
			height: 53px;
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
					<div class = "loading_context">잠시만 기다려주세요!</div>
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
					console.log(currentQuestionIdx);
					console.log(minQuestionIdx);
					//저장하고 나서
					isInitialLoad = false;
					loadQuestion(currentQuestionIdx); //idx 값을 기반으로

				},
				error : function(e) {
					console.log(e);
				}

			});

		}else{
			loadQuestion(currentQuestionIdx);	//initialload = false면 그냥 currentQuestionIdx 가져와서 loadQuestion
		}
	}
	// question 불러오기 =========================================================================================
	function loadQuestion(currentQuestionidx){
		$.ajax({
			type : 'GET',
			url : 'loadQuestion.ajax',
			data: {'Qidx': currentQuestionIdx},
			dataType : 'JSON',
			success : function(data){ //data 전달받기
				console.log("전체 데이터:", data);
				console.log("질문 내용:", data.questioncontent);
				console.log("질문 idx:",data.questionIdx);
				drawQuestion(data.questioncontent,data.questionIdx);
				drawOption(data.questionIdx);
			},
			error:function(e){
				console.log(e);
			}
		});
	}

	function drawQuestion(questioncontent, questionIdx) {
		var mainQuestioncontent = 'Q' + questionIdx + '. ' + questioncontent;
		//질문 박스를 추가하는 부분 ==========================================
		$('#main_Question').html(mainQuestioncontent);
	}

	// option 불러오기 =========================================================================================

	function drawOption(questionIdx){ //questionIdx
		$.ajax({
			type : 'GET',
			url : 'loadOption.ajax',
			data: {'Qidx': questionIdx},
			dataType : 'JSON',
			success : function(data){ //data 전달받기
				console.log('option의 길이:',data.length);
				console.log('option data의 길이 :',data);
				console.log('제대로 뽑은건가?:',data.option[0].mbtisub_con);
				for (var i = 0; i < data.option.length; i++) { //옵션 분리
					if(i == 0 || i-1 >= 0&& data.option[i].mbtisub_con != data.option[i-1].mbtisub_con){ //옵션에서 중복된 문항 거르기 위해 사용
						console.log('option의 idx 값:', data.option[i].idx);
						var optioncontent = data.option[i].mbtisub_con;

						//var optionidx= 'option'+ option[i].mbtisub_idx + '=' + option[i].mbtisub_idx; //문구 넣을 필요 없었음 수정은 아래
						var optionidx = data.option[i].mbtisub_idx;


						var optiondiv = '';
						optiondiv += '<div class="option" onclick="typeScore(' + questionIdx + ',' +optionidx+ ')">' + optioncontent + '</div>'; //click하면 typeScore 함수 실행
						//ㄴ문자열 처리를 위해 \'

						console.log('optiondiv : '+ optiondiv);

						//로딩 문구 빼는 부분 ======================================================
						$('.loading_context').remove();

						//option 박스를 추가하는 부분 ==========================================
						$('#main_option').append(optiondiv);
						// 해결 : option[i].typeScores에 있는 type들을 하나 하나 빼면서 a++을 증가시키는 형태로 type1, type2... 순차적으로 type들을 저장해줌.

					}
				}
			},
			error:function(e){
				console.log(e);

			}
		});
	}

	let selectedScore = {};
	//선택지들 중 뭐를 선택했는지 확인해야.. 선택지 누를 때 다른 선택지 클릭했는지 구분할 수 있음ㄴ +나중에 이전 페이지로 돌아가기 고도화

	// typeScore 불러오기 =========================================================================================
	function typeScore(questionIdx,optionidx){ //클릭한 것만 성향과 점수 가져오는 것
		// 1. click된 버튼의 optionidx 기반으로 운동 성향과 점수 가져오기
		$.ajax({
			type : 'GET',
			url : 'get_typeScore.ajax',
			data : {'Oidx' : optionidx},
			dataType :'JSON',
			success : function (data){
				console.log('typeScore 데이터:',data);
				//typeScore 데이터 가져오기 성공
				console.log('저장된 값 있어? 1:', selectedScore);

				//질문 1. 저장된 값이 있는가
				console.log('저장된 값의 길이: ' + Object.keys(selectedScore).length);


				if(Object.keys(selectedScore).length != 0){  //selectedScore에 값이 있는 경우, 비교하고 저장
					//★object에 저장된 값이 있는지 확인하는 것은 selecteScore 그대로 가져와서 하면 안됨..
					//★Object.keys(selectedScore).length가 0이면 없는 거고.... 그 이상이면 값이 있는 상태

					//질문 2. 현재 질문 idx 값이 있는가
						//Yes -> selectedScore에서 질문 idx값 분리해서 비교.
						if(selectedScore[questionIdx] != null) { //만약 질문 idx 값이 있으면?
							//질문 3. 저장된 옵션 idx가 같은가?
							// questionIdx값이 같은 것은 아무것도 안하니까.. 추가하지 않기
							//if(){ //NO-> saved된 값의 성향, 점수 가져오기 -> decrease() + 새로운 값 save(),add()

							let isMatch = selectedScore[questionIdx].options.some(function (option) {
								//some()은 각 요소에 대해 이 함수를 호출해서 조건을 만족하는 요소가 있는지 확인
								//option은 현재 검사 중인 배열의 요소
								return option.optionidx == optionidx;
							});
							//}
						}else{//NO
							//else -> save (), addscore()
							saveScore(questionIdx,optionidx, data);
							addScore(data);
						}


					//selectedScore
					//var saved_optionIdx = selectedScore[questionIdx].map(data => data.optionIdx); //questionIdx 키를 가진 값 중
					console.log('저장된 값 있어? 2 :', selectedScore);


					}else{
					saveScore(questionIdx,optionidx, data); // 만약 값이 없으면 바로 save
					addScore(data);
				}

				//클릭했을 때 만약 질문에 대한 문항 idx값이 다를 경우
				//addScore(optionidx, typescore);


			},
			error : function(e){
			console.log(e);

			}
		});
	}

	function saveScore(questionIdx,optionidx, data){

		// =======================================
		//저장하는 방법...
		//1. 직접 데이터 형태를 만들기 (노가다..노가다...)
		//2. selectedScore에 넣어주기....
		// =======================================

		//1.
		selectedScore[questionIdx] = {
			questionIdx : questionIdx,
			options : []
		}

		//data (TypeScore 분리하기...)




		// //selectedScore[questionIdx].options.push({넣을 값 작성});

		var a = 1;
		console.log("typeScore: ", data.typeScore);
		var typescores = {}; //얘도 객체로 저장해야함
		var b = '';
		for(var TypeScore of data.typeScore){
			//문자열로 저장해서 문제 생김 -> 객체로 저장하기...
			// console.log('saveScore에서 TypeScore 분리한 값:',TypeScore);
			// console.log('"Type' + a + '":' + TypeScore.mbtir_name +','+'"score'  + a + '": "' + TypeScore.mbtiscr_scr + '"');
			// b+= '"Type' + a + '":' + TypeScore.mbtir_name +','+'"score'  + a + '": "' + TypeScore.mbtiscr_scr + '"';
			typescores["Type"+a] = TypeScore.mbtir_name;
			typescores["Score" + a] = TypeScore.mbtiscr_scr;
			console.log('바꾼 TypeScore 값 : ', typescores);
			a++;
		}
		selectedScore[questionIdx].options.push({
			optionidx : optionidx,
			typeScores : b
		});

		console.log('selectedScore : {} ' + JSON.stringify(selectedScore,null,2)); //잘 들어간 것 같음 -> save까지 완료

	}
	//전역 변수 설정 ======================================================
	//재선언할 수 없는 let으로
	//띄어쓰기 있는 문자를 검색해야하니까.. let 잔근육매니아가 아닌.. let scores = {}


	let scores = {
		"잔근육 매니아" : 0,
		"유산소 매니아" : 0,
		"건강추종자" : 0,
		"자기 개발자" : 0,
		"시간 부족형" : 0,
	} //add하면 scores["잔근육 매니아"] +=

	function addScore(data){
		console.log('받아온값: ', data);
		var a = 1;
		for(var TypeScore of data.typeScore){
			console.log('saveScore에서 TypeScore 분리한 값:',TypeScore);
			console.log('"Type' + a + '":' + TypeScore.mbtir_name +','+'"score'  + a + '": "' + TypeScore.mbtiscr_scr + '"');
			a++;
			scores[TypeScore.mbtir_name]+= TypeScore.mbtiscr_scr;
		}
		console.log('합산 점수 확인하기 : ', JSON.stringify(scores));

	};


</script>

</html>