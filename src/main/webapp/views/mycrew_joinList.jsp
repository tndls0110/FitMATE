<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitMATE</title>
    <link rel="stylesheet" type="text/css" href="resources/css/common.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        .contents.narrow {
            height: 1100px;
            padding: 24px 180px;
        }

        input.searchKeyword {
            width: 61%;
            height: 5.5%;
        }

        div.list button.mainbtn.search {
            display: inline-block;
            border: none;
            background-color: #282b34;
            margin: 0;
            height: 5.5%; 
            width: 12%;
        }

		h3.capt {
		    position: absolute;
		    width: 50%;
		    top: -45%;
		    left: 26%;
		}
		h2.title{
			margin-bottom: 15%;
		}
		
        .inlineBlock {
            display: inline-block;
            margin: 0;
        }

        .relative {
            position: relative;
        }

        .btn_set {
            display: flex;
            justify-content: space-evenly;
            position: absolute;
            top: 14%;
            right: -2%;
            width: 50%;
        }

        [id^="approv"], [id^="reject"] {
            width: 45%;
        }

        .width_40 {
            display: inline-block;
            margin: 0;
            width: 40%;
        }

        .width_50 {
            display: inline-block;
            margin-left: 3%;
            margin-bottom: 2%;
            width: 50%;
        }

        .txt_opacity {
            opacity: 0.5;
        }

        .txt_green {
            color: #048187;
            font-weight: bold;
        }

        .profile_right {
            margin-right: 5%;
            margin-bottom: 5%;
        }

        .profile_list {
            overflow-y: auto;
            overflow-x: hidden;
            margin-top: 15%;
            max-height: 680px;
            height: auto;
        }

        .order_by {
            background-color: transparent;
            border: none;
            position: absolute;
            top: 14%;
            right: 0%;
        }

        #crew_leader {
            color: white;
            position: absolute;
            bottom: 27%;
            left: 7%;
            border: 2px solid white;
            border-radius: 10px;
            background-color: #048187; 
            font-size: 20px;
        }

        .no_people {
            margin: 15% auto;
            text-align: center;
        }

        .list_abs {
            position: absolute;
            bottom: -25%;
    		right: 0%;
    		z-index: 10;
    		width: 15%;
        }
        .profile_body{
            position: relative;
        }
        .profile{
            margin: 4% 0;
            z-index: 1; /* z-index 값 조정 */
        }
        #searchFilter{
        	height: 5.5%;
        	width: 25%;
        }
        .bi.bi-sort-down, .bi.bi-sort-down-alt, .order_by{
        	font-size: 13px;
        } 
        
    </style>
</head>
<body>
    <div class="container">
        <c:import url="layout/leftnav_3.jsp"></c:import>
        	<div class="contents narrow">
            	<h2 class="title subject"></h2>
                <div class="list relative">
				   <h3 class="capt">가입신청자 검색</h3>
				   <p>
				      <select name="searchFilter" id="searchFilter">
				         <option value="" selected>검색기준</option>
				         <option value="1">크루원닉네임</option>
				         <option value="2">크루원아이디</option>
				      </select>
				      <input type="text" class="searchKeyword" name="searchKeyword" placeholder="크루원 닉네임 / 아이디를 입력하세요." />
				      <button type="button" onclick="search()" class="mainbtn search"><i class="bi bi-search"></i></button>
				   </p>
				   <div class="list_abs">
                    <button type="button" class="mainbtn minbtn order_by" id="order_desc">닉네임&nbsp;&nbsp;<i class="bi bi-sort-down"></i></button>
                    <button type="button" class="mainbtn minbtn order_by" id="order_asc">닉네임&nbsp;&nbsp;<i class="bi bi-sort-down-alt"></i></button>
                	</div>
				</div> 
            <div class="profile_body">
                <div class="profile_list">
                </div>
            </div>
        </div>
    </div>
    <c:import url="layout/modal.jsp"></c:import>
</body>
<script src="resources/js/common.js"></script>
<script>
    // 크루원 목록을 불러오기 위한 crew_idx
    var crew_idx = ${crew_idx};
    
    // 현재 유저ID
    var currentUserId = '${sessionScope.loginId}'; 
    
    // Ajax로 부터 반환받은 정보
    var crew_name; // 크루명
    var join_idx; // 신청 idx (1: 신청중/ 2: 신청거절/ 3: 신청수락)
    var nick; // 크루장 또는 신청자 닉네임
    var profile; // 크루장 또는 신청자 프로필
    var leader_id; // 크루장 ID
    var join_id; // 신청자 ID
    
    // 동적 HTML에 append하기 위한 변수 
    var profile_info;
    var leader_chk = 0; // 크루장인지 확인
    var id = ''; // 크루장 또는 신청자 id
    
    // 크루원 수를 카운트할 변수
    var memberCount = 0;

 	// 오름차순 버튼인지 내림차순 버튼인지 확인하기 위한 변수.
    var order;
 	
 	// 검색 필터 (1: 닉네임, 2: 아이디)
 	var searchFilter;
 	// 검색 키워드
 	var searchKeyword;
 	
    // 1. 크루 가입신청자 목록 불러오기
    joinList();
    
    // 2. 검색한 경우
    function search() {
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
          joinList();
       }
    }
    
    
    // 크루 가입신청자 목록 불러오기 함수
    function joinList(){
        $.ajax({
            url: 'mycrew_joinList.ajax',
            method: 'POST',
            data: {
                'crew_idx': crew_idx,
                'order': order,
             	// 검색 필터 (1: 닉네임, 2: 아이디)
             	'searchFilter':searchFilter,
             	// 검색 키워드
             	'searchKeyword':searchKeyword
            },
            dataType: 'JSON',
            success: function(list) {
                // 프로필 목록을 비워주기.
                $('.profile_list').empty();

                $.each(list, function(index, data) {
                    // 멤버수 체크하기. (크루장은 인원수에서 제외하기 때문에 index값과 동일.)
                    memberCount = index;
                    
                    console.log('data : ', data);
                    console.log('crew_idx : ', data.crew_idx);
                    
                 	// 크루명
                    crew_name = data.crew_name;
                    // 신청 idx
                    join_idx = data.join_idx;
                    // 크루장 또는 신청자 닉네임
                    nick = data.nick;
                    // 크루장 또는 신청자 프로필
                    profile = data.profile;
                    // 신청자 ID
                    join_id = data.join_id;
                 	
                 	
                    // 크루장인지 여부체크 - 맨처음 한번만 체크.
                    if (index === 0) {
                    	// 크루장 id 
                        leader_id = data.leader_id;
						
                        id = leader_id;	
                    	
                        if (leader_id === currentUserId) {
                            leader_chk = 1;    
                        }            
                    }else{
                    	id = join_id;
                    }
                    
                    console.log('leader_chk2 입니다 : ' + leader_chk);
                    
                    // 크루장이 아니라면... 권한이 없으므로 => mycrew페이지로 이동. 
                    if (leader_chk !== 1) {
                        modal.showAlert('크루장만 접속할 수 있는 페이지입니다.');
                     	// 이전 페이지로 이동
                        /* window.history.back(); */
                    } else {
                        // 맨 처음 title세팅
                        if (index === 0) {
                            $('.title.subject').html(crew_name + '<span>가입 신청자 목록</span>');
                        }

                        profile_info = '<div class="profile relative ' +id+ '">'
                        				+ '<a id="profile_detail_set" href="mycrew_memberDetail.go?id=' +id+ '&profileType=0">' //일반회원 프로필 상세보기 이동.
                                        	+ '<i class="inlineBlock bi bi-person-circle" style="font-size: 60px;"></i>' // 나중에 프로필로 변경.
                                        + '</a>'
                                        + '<div class="width_50">' 
                                            + '<div class="profile_right">'
                                                + '<div>'
                                                    + '<div class="text_area">'
                                                        + '<h3 class="inlineBlock title">' + nick + '</h3>'
                                                        + '<span class="width_50 txt_green leader_chk' + index + '">(크루장)</span>'
                                                    + '</div>'
                                                    + '<div class="text_area"><span class="txt_opacity">' + id + '</span></div>'
                                                    + '<div id="crew_leader" class="leader_chk' + index + '"><i class="bi bi-star-fill"></i></div>'
                                                + '</div>'
                                            + '</div>'
                                        + '</div>'
                                        + '<div class="btn_set">'; // btn_set 추가
                                        
                        if (index !== 0) { // 크루장이 아닌 경우에만 버튼 표시
                            profile_info += '<button type="button" class="mainbtn" id="approv' + join_idx + '" data-join_idx="' + join_idx + '" data-join_id="' + id + '" data-status="3">수락</button>'
                                            + '<button type="button" class="subbtn" id="reject' + join_idx + '" data-join_idx="' + join_idx + '" data-join_id="' + id + '" data-status="2">거절</button>';
                        }

                        profile_info += '</div></div>';
                        
                        
                     	// 크루장인 경우
                     	// leader정보인 경우 수락/거절버튼 숨김
                        if(index === 0){
                        	$('.profile_list').prepend(profile_info);
                        	$('.leader_chk' + index).show(); // 크루장 표시
                            $('#profile_detail_set').attr('href', 'mycrew_memberDetail.go?id=' +leader_id+ '&profileType=1&idx=' +crew_idx ); // 크루장 표시
                        }else{
                        	$('.profile_list').append(profile_info);
                        	$('.leader_chk' + index).hide(); // 크루장 표시 숨김
                        }
                     	
                    }			
                    
                });	
                
                // 회원수가 1명도 없는 경우 '크루에 가입신청한 멤버가 없습니다.' 이미지 띄우기.
                if(memberCount < 1){
                    $('.profile_list').append('<div class="no_people"><div><i class="bi bi-person-x" style="font-size: 250px;"></i></div><h2>크루에 가입신청한 멤버가 없습니다.</h2></div>');
                }
            },
            error: function(e) {
                console.log(e);
            }
        });	
    }
    
    
    
    // 닉네임 오름차순/내림차순 버튼 클릭이벤트
    $(document).on('click', '[id="order_asc"], [id="order_desc"]', function() {
        order = $(this).attr('id') === 'order_asc';

        // 기존 리스트 지우고 새로운 리스트로 업데이트
        // profile_list의 자식요소들중 크루장인 경우는 새로고침을 하지않는다.
        $('.profile_list > *:not(.profile.relative.' +leader_id+ ')').remove(); // 기존 프로필 목록 비우기
        
        // 새 리스트 불러오기.
        joinList();

        // 버튼 상태 업데이트
        if (order) {
            $('#order_asc').hide(); // 오름차순 버튼 숨김
            $('#order_desc').show().html('닉네임<i class="bi bi-sort-down-alt"></i>'); // 내림차순 버튼으로 변경
        } else {
            $('#order_desc').hide(); // 내림차순 버튼 숨김
            $('#order_asc').show().html('닉네임<i class="bi bi-sort-down"></i>'); // 오름차순 버튼으로 변경
        }
    });
    
    // 수락 및 거절 버튼 클릭 이벤트
    $(document).on('click', '[id^="approv"], [id^="reject"]', function() {
        var join_idx = $(this).data('join_idx');
        var join_id = $(this).data('join_id');
        var status = $(this).data('status'); // 3이면 수락, 2이면 거절

        console.log('join_idx', join_idx);
        // AJAX 요청
        $.ajax({
            url: 'join_approval.ajax', // 동일한 URL로 처리
            method: 'POST',
            data: {
                join_idx: join_idx,
                crew_idx: crew_idx, 
                join_id: join_id,
                status: status
            },
            success: function(data) {
                if (status === 3) {
                    console.log('수락 성공:', data.success);
                } else if (status === 2) {
                    console.log('거절 성공:', data.success);
                }
                joinList(); // 수락 또는 거절 후 목록 갱신
            },
            error: function(error) {
                if (status === 3) {
                    console.log('수락 실패:', error);
                } else if (status === 2) {
                    console.log('거절 실패:', error);
                }
            }
        });
    });
</script>
</html>
