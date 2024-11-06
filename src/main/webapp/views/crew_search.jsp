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
   /* /*긴 단어가 영역 넘어가면 줄 바꿈되도록 하기
   word-wrap: break-word; */
   
   div.headerArea{
      text-align: center;
      padding: 0 10%;
      overflow: hidden; /* 스크롤 숨기기 */
   }
   
   div.searchArea{
      position: relative;
   }
   
   input.searchKeyword{
      width: 50%;
      height: 6%;                   
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
   
   select#searchFilter{
      width: 20%;
      height: 5.8%;
   }
   
   div.recruitArea{
      overflow-y: scroll;
      overflow-x: hidden;
      width: 90%;
      height: 73%;
      margin-top: 10%;
      margin-left: auto;
      margin-right: auto;
      
      display: flex;
      flex-wrap: wrap;
   }
   
   div.recruit{
      width: 45%;
      height: 200px;
      margin: 3% 1%;
      padding: 2% 2%;
      background-color: #282b34;
      flex: 1 1 40%;
      /* align-content: left; */ 
      position: relative;
   }
   
   div.recruit_odd {
	    width: 46%;
	    height: 200px;
	    margin: 3% 3%;
	    padding: 2% 2%;
	    background-color: #282b34;
	    position: relative;
	}
   
   .recruit_left{
      display: inline-block;
       width: 15%;
       aspect-ratio: 1;
       border: 0 solid black;
       border-radius: 50%;
   }
   
   .recruit_right{
      width: 80%;
      display: inline-block;
      position: absolute;
      top: 0%;
      left: 20%;
   }
   
   
   div.recruit_content{
      margin: 5% 2%;
      height: 20%;
        /* 줄바꿈 방지 */
        white-space: nowrap; 
        /* 영역을 넘어가는 경우 숨김처리.  */
      overflow: hidden;
      /* 숨겨지는 부분에 말줄임표(...)표시 */
        text-overflow: ellipsis;
   }
   
   div.recruit_info{
      margin: 5% 2%;
      height: 20%;
      display: flex;
      flex-wrap: wrap;
      justify-content: space-evenly;
   }
   
   div.recruit_info span{
      width: 50%;
      
      white-space: nowrap; 
        /* 영역을 넘어가는 경우 숨김처리.  */
      overflow: hidden;
      /* 숨겨지는 부분에 말줄임표(...)표시 */
        text-overflow: ellipsis;
   }
   
   
   h3.capt{
      position: absolute;
      width: 50%;
       top: -45%;
       left: 10%;
   }
   
   .text_area{
      display: inline-block;
      width: 100%;
      /* 영역을 넘어가는 경우 숨김처리.  */
      overflow: hidden;
      /* 숨겨지는 부분에 말줄임표(...)표시 */
        text-overflow: ellipsis;
        /* 줄바꿈 방지 */
        white-space: nowrap;
        margin: 1%;
   }
   
   div.list button.mainbtn{
      display: inline-block;
      border:none;
      background-color: #282b34;
      margin: 0;
      height: 6%;
   }
   
   a.recruit_detail{
      display: block;
      width: 100%;
      position: relative;
      margin-bottom: 5%;
      height: 40%;
   }
   
   div.right_top, div.right_bottom{
      width: 100%;
   }
   
   .contents{
   	height:1100px;
   }
   
   .bi.bi-arrow-repeat {
    display: inline-block; /* 또는 block */
    animation: spin 1s infinite; /* 애니메이션 적용 */
	}
   
   @keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
	}
 
	.recruit:hover, .recruit_odd:hover {
    	transform: translateY(-5px) scale(1.1) !important;
    	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2) !important; /* 추가된 그림자 효과 */
   	 	transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out !important; /* 전환 효과 추가 */
	}

	/* 웹킷 기반 브라우저에서 스크롤바 숨기기 */
	div.recruitArea::-webkit-scrollbar, div.approvalArea::-webkit-scrollbar {
	    width: 0;  /* 수직 스크롤바의 너비를 0으로 설정 */
	    height: 0; /* 수평 스크롤바의 높이를 0으로 설정 */
	}
	
	/* Firefox에서 스크롤바 숨기기 */
	div.recruitArea, div.approvalArea {
	    scrollbar-width: none;  /* 스크롤바를 숨김 */
	    scrollbar-color: transparent transparent;  /* 스크롤바 색상도 투명하게 설정 */
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
               
               <!-- <div class="list"> -->
                  
               <div class="list">
                  <h3 class="capt">크루 검색</h3>
                  <p>
                  <select name="searchFilter" id="searchFilter">
                     <option value="" selected>검색기준</option>
                     <option value="1">크루이름</option>
                     <option value="2">크루장닉네임</option>
                  </select>
                  <input type="text" class="searchKeyword" name="searchKeyword" placeholder="크루 이름/ 크루장 닉네임을 입력하세요." />
                  <button type="button" onclick="search()" class="mainbtn"><i class="bi bi-search"></i></button>
                  </p>
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
<c:import url="layout/modal.jsp"></c:import>
<script src="resources/js/common.js"></script>
<script>

   // 현재 유저ID 세팅
   var currentUserId = '${sessionScope.loginId}';

   // 필터선택 or 검색한 경우 데이터 다시 가져오기.
   var searchFilter = '';
   var searchKeyword = '';
   var placeFilter = '';
   var mbtiFilter = '';
   
   
   // 전체 게시글 개수 Count (홀수개이면 마지막 게시글 Left정렬) 
   var cnt = 1;
   
   // 무한 스크롤 이벤트 작동 시 데이터를 가져올 offset을 초기화
   var offset = 0;
   // 한 번에 가져올 데이터 개수
   const limit = 6; 
   // 데이터 로딩 중 여부를 관리할 변수
   var isLoading = false;
   
   //0. 초기 크루목록 가져오기
   crewList();
   
   // 1. 필터를 선택한 경우(지역, MBTI)
   // 변경 이벤트 발생감시
   $('.filterSelect').on('change', function() {
	  cnt = 1;
	  $('.recruitArea').empty();
	  offset = 0;
	  
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
	   cnt = 1;
	   $('.recruitArea').empty();
	   offset = 0;
	   
      // 검색기준을 선택하지 않은경우  경고창을 띄워줌.
      if ($('#searchFilter').val() == '') {
         modal.showAlert('검색기준을 선택하세요.');
      } else if($('.searchKeyword').val() == ''){
    	  modal.showAlert('검색 키워드를 입력하세요.');
      }else {
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
            'offset': offset,
            'limit': limit
         },
         dataType : 'JSON',
         success : function(list) {
        	 
            // 새로 읽어온 값이 비어 있는 경우 검색된 데이터가 없습니다. => 기존 데이터 그대로 유지 
            if (list == null || list == '') {
                modal.showAlert('읽어올 데이터가 없습니다.');
             	// 더이상 읽어올 데이터가 없는경우 트리거 메시지 변경.
            	$('#load-more-trigger').html('더 이상 불러올 데이터가 없습니다.');
            } else {
                if (list && list.length > 0) {
                    $.each(list, function(index, item) {
                        recruitAdd(item); 
                        cnt++;
                    });
                    isLoading = false; // 데이터 로딩 완료 시 다시 로딩 가능하도록 설정
                    addLoadMoreTrigger(); // 추가된 요소 아래에 로딩 메시지 추가
                } else {
                	
                    // 더 이상 데이터가 없으면 관찰 중지
                    observer.unobserve($('#load-more-trigger')[0]); // jQuery로 선택한 요소의 첫 번째 DOM 요소를 관찰 중지
                    $('#load-more-trigger').remove(); // 트리거 요소 제거
                }
            }
         },
         error : function(e) {
            console.log(e); // 에러가 보이지 않도록 추후 처리필요?
            modal.showAlert('크루 목록가져오기 실패');
         }
      });
   }
   
   function recruitAdd(item){
	  // 모집게시글에 담기는 정보
      var header = '';
      var content = '';
      var info = '';
      var profile = ''; // 프로필 사진
      var leader_id = item.leader_id; // 크루장ID
      
      // 기본값은 모집페이지이동 (크루원: 크루페이지, 일반회원or크루장: 모집페이지)
      var page = 'crew_recruit_detail.go?board_idx=' + item.board_idx + '&crew_idx=' +item.crew_idx;       
      
      // 크루장이 아닌 크루원이라면 => 크루페이지로 이동!!
      /* if(leader_id !== currentUserId && item.member_idx !== ''){
    	  page = 'crew_main_page.go?crew_idx=' +item.crew_idx;
    	  
      } */
      
      
      // 프로필
      profile = item.leader_profile ? '<img class="recruit_left" src="/photo/' + item.leader_profile + '" alt="프로필 이미지" style="width: 54.18px; height: 54.18px; object-fit: cover; border-radius: 50%;"/>' 
                                         : '<i class="bi bi-person-circle" style="font-size: 54.18px;"></i>'; // 프로필사진 설정

                                         
      // Header: 모집게시글링크-board_idx/크루장id, 프로필사진, 크루명, 크루장닉네임, MBTI
      header = '<a href="' +page+ '" class="recruit_detail">'
               + profile
               + '<div class="recruit_right">'
                  + '<div class="right_top">'
                     + '<h4 class="text_area">' + item.crew_name + '</h4>'
                     + '<br/>'
                     + '<span class="text_area">'
                  + '</div>'
                  + '<div class="right_bottom">'
                     + '<span>' + item.leader_nick + '</span>'
                     + '<span> (' + item.leader_mbti + ')</span>'
                  + '</div>'
                  + '</span>'
               + '</div>'
            + '</a>';
            
      // Content: 크루 소개글         
      content = '<div class="recruit_content">' + item.subject + '</div>';
      
      // Info: 크루원 수, 활동지역
      info = '<div class="recruit_info">'
               + '<span><i class="bi bi-people-fill"></i>&nbsp;&nbsp;' + item.member_count + ' </span>'
               + '<span><i class="bi bi-geo-alt-fill"></i>&nbsp;&nbsp;' + item.region_name + ' ' + item.regions_name + '</span>'
           +'</div>';

      // 홀수번째 게시글은 왼쪽정렬
      if(cnt % 2 == 1){
         $('div.recruitArea').append('<div class="recruit_odd">' + header + content + info  + '</div>');
      }else{
         $('div.recruitArea').append('<div class="recruit">' + header + content + info + '</div>');
      }
   }
   
   
   /* 무한스크롤 IntersectionObserver 구현 */
   var observer = new IntersectionObserver(loadMoreEntries, {
	    root: null, // 기본 뷰포트를 기준으로 설정   
	    rootMargin: '0px',
	    threshold: 0.5
	});
   
   // Intersection Observer 콜백 함수
   function loadMoreEntries(entries, observer) {
	    // 엔트리마다 체크
	    entries.forEach(function(entry) {
	        if (entry.isIntersecting && !isLoading) {
	            isLoading = true; // 로딩 상태 설정
	            offset += limit; // 다음 요청을 위한 offset 값 증가
	            crewList(); // 데이터를 가져오는 함수 호출
	        }
	    });
	}
   
	// '더보기' 트리거 요소 추가 함수
	function addLoadMoreTrigger() {
		// 요소가 6개이상 즉, 두번째 페이지부터 발동.
		if(cnt > 6){
			$('#load-more-trigger').remove(); 
		    
		    var targetElement = $('<div>', {
		        id: 'load-more-trigger',
		        html: '<i class="bi bi-arrow-repeat" style="font-size: 24px;"></i> 더 많은 데이터를 불러오는 중...',
		        css: {
		            textAlign: 'center',
		            width: '100%',
		            padding: '20px',
		            fontSize: '16px'
		        }
		    });
		
		    // recruitArea에 트리거 요소 추가
		    $('.recruitArea').append(targetElement);
		    
		    // 새로운 트리거 요소를 observer로 관찰
		    observer.observe(targetElement[0]); 
		}
	}

   
</script>

</html>