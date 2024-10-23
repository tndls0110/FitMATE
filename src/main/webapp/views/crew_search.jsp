<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> -->

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<html>
<head>
<meta charset="UTF-8">
<title>크루검색 페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/common.css" />

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>

	div.headerArea{
		text-align: center;
		padding: 0 10%;
	}
	
	div.searchArea{
		position: relative;
	}
	
	select.filterSelect{
		width: 25%;
		margin: 0px 10px;
		border: 2px solid #048187;
		border-radius: 30px;
		background-color: #363940;		
		color: #048187;
		font-weight: bolder;
		text-align: center;
	}
	
	input.searchKeyword{
	 	width: 45%;
	}
	
	select#searchFilter{
		width: 20%;
	}
	
	div.recruitArea{
		width: 90%;
		height: 35%;
		margin-top: 10%;
		margin-left: auto;
		margin-right: auto;
		
		display: flex;
		flex-wrap: wrap;
	}
	
	div.recruit{
		width: 40%;
		height: 50%;
		margin: 1% 1%;
		padding: 1% 1%;
		background-color: #282b34;
		flex: 1 1 40%;
		/* align-content: left; */ 
		position: relative;
	}
	
	div.recruit_odd{
		width: 48%;
		height: 50%;
		margin: 1% 1%;
		padding: 1% 1%;
		background-color: #282b34;
		/* align-content: left; */
		position: relative; 
		
	}
	
	div.recruit_header{
	    /* position: absolute; 
	    left: 50%; */
	    width: 15%;
	    aspect-ratio: 1;
	    border: 1px solid black;
	}
	
	div.recruit_right{
		position: absolute;
		top: 6%;
		left: 18%;
	}
	
	div.recruit_content, div.recruit_info{
		padding: 3% 5%;
	}
	
	div.recruit_info span{
		margin-right: 15%;
	}
	
	h3.capt{
		position: absolute;
		width: 50%;
	    top: -20%;
    	left: 11.5%;
	}
	
	h4.crew_name{
		display: inline;
	}
	
	button{
		background-color: #282b34;
		color: #e9ecef;
	}
	
	button.add_button{
		position: absolute;
		top: 0%;
		right: 2%;
		width: 2%;
	}
	
</style>
</head>

<body>
	<div class="container">
		<c:import url="layout/leftnav_2.jsp"></c:import>

		<!-- 넓은 화면으로 작성할 시 class="contents" -->
		<!-- 좁은 화면으로 작성할 시 class="contents narrow" -->
		<div class="contents">
			<div class="headerArea">
				<div class="searchArea">
					<h3 class="capt">크루 검색</h3>
					<div class="list">
						<select name="searchFilter" id="searchFilter">
							<option value="" selected>검색기준</option>
							<option value="1">크루이름</option>
							<option value="2">크루장닉네임</option>
						</select>
						<input type="text" class="searchKeyword" name="searchKeyword" placeholder="크루 이름/ 크루장 닉네임을 입력하세요." />
						<button type="button" onclick="search()">🔍</button>
					</div>	
				</div>
				<div class="filterArea">
					<!-- 지역정보 테이블 값가져오기... value=region_idx-regions_idx / Text=지역명 -->   
					<select name="placeFilter" class="filterSelect">
						<option value="" selected>시/ 군/ 구</option>
						<c:forEach var="filter" items="${placeFilter}" varStatus="status">
							<option value="${filter.regions_idx}">${filter.region_name} ${filter.regions_name}</option>
						</c:forEach>
					</select>
					
					<!-- 헬스mbti결과 테이블 값가져오기... value=운동성향idx / Text=운동성향   -->
					<select name="mbtiFilter" class="filterSelect">
						<option value="" selected>헬스MBTI</option>
						<c:forEach var="filter" items="${mbtiFilter}" varStatus="status">
							<option value="${filter.mbtir_idx}">${filter.mbtir_name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<!-- 크루모집 영역 -->
			<div class="recruitArea">
				
			</div>
			
		</div>
		
	</div>
</body>

<script src="resources/js/common.js"></script>
<script>
	//0. 초기 크루목록 가져오기
	crewList();
	
	// 필터선택 or 검색한 경우 데이터 다시 가져오기.
	var searchFilter = '';
	var searchKeyword = '';
	var placeFilter = '';
	var mbtiFilter = '';

	// 1. 필터를 선택한 경우(지역, MBTI)
	// 변경 이벤트 발생감시
	$('.filterSelect').on('change', function() {
		// 어떤 필터인지 구분 (활동지역 or mbti)
		if ($(this).attr('name') == 'placeFilter') {
			placeFilter = $(this).val();
			// 필터 색상변경 
			filter_color($(this));
			
		} else if ($(this).attr('name') == 'mbtiFilter') {
			mbtiFilter = $(this).val();
			// 필터 색상변경
			filter_color($(this));
			
		}
		// 1-2. 목록 불러오기 함수
		crewList();
	});
	
	
	// 필터 색상변경 함수
	function filter_color(filter){
		if(filter.val() == ''){
			filter.css({
				'background-color': '#363940',		
				'color': '#048187'
			});	
		}else{
			filter.css({
				'background-color': '#048187',
				'color': '#e9ecef'
			});
		}
	}

	
	// 2. 검색한 경우
	function search() {
		// 검색기준을 선택하지 않은경우 경고창을 띄워줌.
		if ($('#searchFilter').val() == '') {
			alert('검색기준을 선택하세요.');
		} else {
			// 2-1. 검색관련 변수세팅 
			searchFilter = $('#searchFilter').val();
			searchKeyword = $('.searchKeyword').val();
			// 2-2. 목록 불러오기 함수	
			crewList();
		}
	}
	
	
	
	// 크루목록 데이터 불러오기 함수
	function crewList() {
		$.ajax({
			url : 'crew_search.ajax',
			type : 'GET',
			data : { // 검색기준, 검색키워드, 지역필터, MBTI필터
				'searchFilter' : searchFilter,
				'searchKeyword' : searchKeyword,
				'placeFilter' : placeFilter,
				'mbtiFilter' : mbtiFilter,
			},
			dataType : 'JSON',
			success : function(list) {
				// 전체 게시글 개수 Count (홀수개이면 마지막 게시글 Left정렬) 
				var cnt = 1;
				
				$('div.recruitArea').html('');
				
				$(list).each(function(idx, item) { // 데이터 =item
					
					var header = '';
					var content = '';
					var info = '';
					
					console.log('cnt : ' + cnt);
					
					// Header: 프로필사진, 크루명, 크루장이름, MBTI			
					header = '<div class="recruit_header">' + item.leader_profile + ' </div><div class="recruit_right"><span>' + item.crew_idx + ' </span><h4 class="crew_name">' + item.crew_name + '</h4><br/><span>' + item.leader_name + '</span><span> (' + item.leader_mbti + ')</span></div>';
					// Content: 크루 소개글         => 글자수가 긴경우 잘라주어야 함.
					content = '<div class="recruit_content">' + item.crew_content + '</div>';
					// Info: 크루원 수, 활동지역
					info = '<div class="recruit_info"><span>🧟' + item.member_count + ' </span><span>🌏' + item.region_name + ' ' + item.regions_name + '</span></div>'
					// ... 버튼
					var add_button = '<button type="button" class="add_button">︙</button>';
					
					// 홀수번째 게시글은 왼쪽정렬
					if(cnt % 2 == 1){
						$('div.recruitArea').append('<div class="recruit_odd">' + header + content + info + add_button + '</div>');
					}else{
						$('div.recruitArea').append('<div class="recruit">' + header + content + info + add_button + '</div>');
					}
						
					cnt++;
					
				});

				 /* [...버튼]
				 크루장인 경우에만 ...버튼을통해 모집글 수정 or 삭제가능..?   삭제는 빼야될듯..? 크루생성과 크루모집글생성을 합쳤기 때문에...
				 크루장인지 확인은.. sessionId와 크루장 id 비교..? OR sessionName와 크루장이름 비교 */
			},
			error : function(e) {
				console.log(e); // 에러가 보이지 않도록 추후 처리필요?
				alert('크루 목록가져오기 실패');
			}
			// Ajax 요청전 함수.
			/* ,
			beforeSend : function() {
				//데이터가 로드 중임을 나타내는 flag.
				_scrollchk = true;
				//skeleton 그리는함수로 DOM에 추가.
				// Sekeleton Screen
				// 최종 콘텐츠가 제자리에 로드되기 전에 페이지 구조의 윤곽을 나타내는 연한배경, 선 및 텍스트로 구성됨.
				document.getElementById('list').appendChild(skeleton.show());
				//loading animation 보여주기. (스피너 로딩)
				$(".loading").show();

			}, */
			// Ajax 요청후 함수. 
			/* complete : function() {
				//데이터가 로드 중임을 나타내는 flag.
				_scrollchk = false;
				//loading animation과 skeleton을 DOM에서 삭제. 태그의 hidden과 같다
				$(".loading").hide();
				skeleton.hide();
			} */
		});
	}
</script>

</html>