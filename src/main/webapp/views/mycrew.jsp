<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> -->

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<html>
<head>
<meta charset="UTF-8">
<title>내 크루</title>
<link rel="stylesheet" type="text/css" href="resources/css/common.css" />

<style>
h2.capt {
	margin: 1% 0;
}

div.recruitArea, div.approvalArea {
	overflow-y: scroll;
	overflow-x: hidden;
	width: 98%;
	height: 45%;
	margin: 0 auto;
	display: flex;
	flex-wrap: wrap;
}

div.recruit, div.recruit_odd {
	width: 48%;
	height: 200px;
	margin: 1% 1%;
	padding: 3% 2%;
	background-color: #282b34;
	position: relative;
}

.recruit_left {
	display: inline-block;
	width: 15%;
	aspect-ratio: 1;
	border: 1px solid black;
	border-radius: 50%;
}

.recruit_right {
	width: 80%;
	display: inline-block;
	position: absolute;
	top: 0%;
	left: 20%;
}

div.recruit_content {
	margin: 5% 2%;
	height: 20%;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

div.recruit_info {
	margin: 5% 2%;
	height: 20%;
	display: flex;
	flex-wrap: wrap;
	position: relative;
}

span.cnt, span.rgn {
	width: 20%;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

span.rgn {
	width: 35%;
}

.text_area {
	display: inline-block;
	width: 100%;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	margin: 1%;
}

.button_area {
	position: absolute;
	top: 77%;
	right: 3%;
}

.member_button {
	position: absolute;
	top: 7%;
	right: 3%;
	aspect-ratio: 1;
	background-color: #282b34;
	color: white;
	border: none;
	margin: 0;
	padding: 0;
}

a.recruit_detail {
	display: block;
	width: 80%;
	position: relative;
	margin-bottom: 5%;
	height: 40%;
}

div.right_top, div.right_bottom {
	width: 100%;
}

i.bi.bi-plus-lg {
	position: absolute;
	top: 45%;
	left: 38%;
}

a.crew_create {
	display: block;
	width: 100%;
	height: 100%;
}

#no_approvalArea {
	text-align: center;
	margin: auto;
}

.modal_cancel_request, .modal_leave_crew, .modal_container.min {
	width: 190px;
	height: auto;
	margin: 0;
}
</style>
</head>

<body>
	<div class="container">
		<c:import url="layout/leftnav_3.jsp"></c:import>
		<div class="contents">
			<div class="area">
				<h2 class="capt">신청중인 크루</h2>
				<div class="approvalArea"></div>

				<h2 class="capt">내 크루</h2>
				<div class="recruitArea"></div>
			</div>
		</div>
	</div>
</body>

<!-- 모달 div모음 -->
<c:import url="layout/modal.jsp"></c:import>

<!-- 신청취소 모달 -->
<div class="modal modal_cancel_request">
	<div class="modal_container min">
		<button class="btn_cancel_request subbtn full">
			<i class="bi bi-x-lg">신청 취소</i>
		</button>
		<button class="btn_cancel mainbtn full">창 닫기</button>
	</div>
</div>

<!-- 탈퇴하기 모달 -->
<div class="modal modal_leave_crew">
	<div class="modal_container min">
		<button class="btn_leave_crew subbtn full">
			<i class="bi bi-exclamation-circle-fill" style="color: red">탈퇴하기</i>
		</button>
		<button class="btn_cancel mainbtn full">창 닫기</button>
	</div>
</div>

<script src="resources/js/common.js"></script>
<script>
   // 0: 신청중인 크루, 1: 내 크루
   var currentUserId = 'member01'; // 현재 유저아이디 => 세션으로 바꿔줘야함.
   var leader_chk = 0; // 크루장여부 체크 (0: 크루원, 1: 크루장)
   var cntApproval = 0; // 신청중인 크루 Count
   var cntRecruit = 0; // 내 크루 Count

   // 버튼 변수
   var leader_button = '';
   var member_button = '';
   
   // 모달 변수 modal_cancel_request: 신청취소모달, modal_leave_crew: 탈퇴모달
   var modal_chk = '';
   
   // 신청중인 크루 목록 가져오기
   $('div.approvalArea').empty();
   crewList(0);
   
   // 내 크루 목록 가져오기
   $('div.recruitArea').empty();
   crewList(1);

   // 크루 목록 데이터 불러오기 함수
   function crewList(info_chk) {
      $.ajax({
         url: 'mycrew.ajax',
         type: 'GET',
         data: { 'info_chk': info_chk }, // info_chk 0: 신청중인 크루, 1: 내 크루
         dataType: 'JSON',
         success: function(list) {
            $(list).each(function(idx, item) { // 데이터 = item
               recruitAdd(item, info_chk); // Controller에서 받아온 크루원 모집게시글 추가.
            });
            
            // 신청중인 크루가 없을 경우 '신청중인 크루가 없습니다.'
            if (info_chk == 0) {
               if ($('div.approvalArea').text().trim() === '') {
                  $('div.approvalArea').append('<div id="no_approvalArea"><i class="bi bi-ban" style="font-size:30px">신청중인 크루가 없습니다.</i></div>');
               }
            } else {
               // 내 크루 영역 마지막에 크루 생성 영역 추가.
               if (cntRecruit % 2 == 1) {
                  $('div.recruitArea').append('<div class="recruit"><a href="crew_create.go" class="crew_create"><i class="bi bi-plus-lg">크루 생성하기</i></a></div>');
               } else {
                  $('div.recruitArea').append('<div class="recruit_odd"><a href="crew_create.go" class="crew_create"><i class="bi bi-plus-lg">크루 생성하기</i></a></div>');
               }	
            } 
         },
         error: function(e) {
            modal.showAlert('크루 목록가져오기 실패');
         }
      });
   }
   
   function recruitAdd(item, info_chk) {
	   
	   // 크루장인지 크루원인지 체크
	   if(currentUserId === item.leader_id){
		   leader_chk = 1;	   
	   }else{
		   leader_chk = 0;
	   }
	   
	   
      var profile = item.leader_profile ? '<img class="recruit_left" src="resources/img/' + item.leader_profile + '"/>' 
                                         : '<i class="bi bi-person-circle" style="font-size: 54.18px;"></i>'; // 프로필사진 설정
      
      // Header: 모집게시글링크-board_idx, 프로필사진, 크루명, 크루장 닉네임, MBTI
      var header = '<a href="crew_recruit_detail.go?idx=' + item.board_idx + '&id=' + currentUserId + '" class="recruit_detail">'
                   + profile
                   + '<div class="recruit_right">'
                      + '<div class="right_top">'
                         + '<h4 class="text_area">' + item.crew_name + '</h4>'
                         + '<br/>'
                         + '<span class="text_area"></span>'
                      + '</div>'
                      + '<div class="right_bottom">'
                         + '<span>' + item.leader_nick + '</span>'
                         + '<span> (' + item.leader_mbti + ')</span>'
                      + '</div>'
                   + '</div>'
                + '</a>';
      
      // Content: 크루 소개글         
      var content = '<div class="recruit_content">' + item.subject + '</div>';
      
      // Info: 크루원 수, 활동지역
      var info = '<div class="recruit_info">'
                   + '<span class="cnt"><i class="bi bi-people-fill"></i>&nbsp;&nbsp;' + item.member_count + ' </span>'
                   + '<span class="rgn"><i class="bi bi-geo-alt-fill"></i>&nbsp;&nbsp;' + item.region_name + ' ' + item.regions_name + '</span>'
               + '</div>';

		
      
   	  // 신청중인 크루 영역이라면
      if (info_chk === 0) {     
    	  // 신청취소 버튼 => crew_join테이블 크루idx와 신청자ID(내ID) 사용. status=1 DELETE      추후 가입신청 idx있으면 좋음.join_idx
    	  modal_chk = '.modal_cancel_request';
          member_button = member_button = '<button type="button" class="member_button" onclick="my_modal(this, \'' + modal_chk + '\', ' + item.crew_idx + ', \'' + item.member_id + '\')"><i class="bi bi-three-dots-vertical" style="font-size:23px"></i></button>';     
          
         if (cntApproval % 2 == 1) {
            $('div.approvalArea').append('<div class="recruit">' + header + member_button + content + info + '</div>');
         } else {
            $('div.approvalArea').append('<div class="recruit_odd">' + header + member_button + content + info + '</div>');
         }
         
         cntApproval++; // 신청중인 크루 Count 증가
         
      } else {
    	// 크루장이면 리더버튼 세팅 OR 크루원,신청자이면 멤버버튼 세팅
         if(leader_chk === 1){
        	 leader_button = '<div class="button_area">'
        	 		// 크루 신청관리 => crew_join페이지 이동. 크루idx만 있으면 될듯?
        	       + '<button type="button" class="mainbtn minbtn" onclick="location.href=\'mycrew_joinList.go?idx=' + item.crew_idx + '\'">크루 정보수정</button>&nbsp;&nbsp'
        	       // 크루정보 수정페이지 => crew_idx랑 board_idx정도 넘겨주면될 듯?
        	       + '<button type="button" class="subbtn minbtn" onclick="location.href=\'crew_create_rewrite.go?idx=' + item.crew_idx + '&board_idx=' + item.board_idx + '\'">크루 정보수정</button>'
        	       + '</div>';	 
         }else{
        	// 탈퇴하기 버튼 => crew_member테이블 크루idx와 크루원ID(내ID) 사용.          추후 크루원 목록. member_idx값을 가져올 수 있으면 좋음.
        	 modal_chk = '.modal_leave_crew';
        	 member_button = '<button type="button" class="member_button" onclick="my_modal(this, \'' + modal_chk + '\', ' + item.crew_idx + ', \'' + item.member_id + '\')"><i class="bi bi-three-dots-vertical" style="font-size:23px"></i></button>'; 
         } 
    	 
    	 
         if (cntRecruit % 2 == 1) {
            $('div.recruitArea').append('<div class="recruit">' + header + member_button + content + info + leader_button + '</div>');
         } else {
            $('div.recruitArea').append('<div class="recruit_odd">' + header + member_button + content + info + leader_button + '</div>');
         }
     	
         cntRecruit++; // 내 크루 Count 증가
      }
   	  
      // Append후 변수 초기화
      member_button = '';
      leader_button = '';
   }

   // 멤버 버튼 클릭 시 모달 표시 함수
   function my_modal(obj, modal_chk) {
	// 이미 열려 있는 모달이 있는지 체크
    if ($('.modal:visible').length) {
        return; // 이미 열려있다면 아무 것도 하지 않음
    }
	
 	// add버튼 위치좌표		
	var offset = $(obj).offset();
    
	// 스크롤 위치를 고려하여 top 값 조정
    var scrollTop = $(window).scrollTop(); // 현재 스크롤 위치
    $(modal_chk).css({
        top: offset.top - scrollTop, // 스크롤 위치 추가
        left: offset.left
    });
	
	$(modal_chk).fadeIn(); // 모달표시
     
   }
   
   // 모달 닫기 버튼 클릭 시 모달 숨기기
   $('.btn_cancel').on('click', function() {
      $(this).closest('.modal').hide();
   });

   // 신청 취소하기 버튼 클릭 시
   $('.btn_cancel_request').on('click', function() {
      // 여기에 신청 취소 로직 추가
      alert("신청이 취소되었습니다.");
      $('.modal_cancel_request').hide(); // 모달 숨기기
   });

   // 탈퇴하기 버튼 클릭 시
   $('.btn_leave_crew').on('click', function() {
      // 여기에 탈퇴하기 로직 추가
      alert("크루에서 탈퇴하였습니다.");
      $('.modal_leave_crew').hide(); // 모달 숨기기
   });
   
</script>
</html>
