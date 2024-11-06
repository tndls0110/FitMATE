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
		    position: absolute;
		    top: 10%;
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
		    bottom: 7%;
		    left: -12%;
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
        
        .profile_detail_set{
        	display: inline-block;
        	width: 60px;
        	height: 60px;
        }
        /* 웹킷 기반 브라우저에서 스크롤바 숨기기 */
		.profile_list::-webkit-scrollbar{
		    width: 0;  /* 수직 스크롤바의 너비를 0으로 설정 */
		    height: 0; /* 수평 스크롤바의 높이를 0으로 설정 */
		}
		
		/* Firefox에서 스크롤바 숨기기 */
		.profile_list{
		    scrollbar-width: none;  /* 스크롤바를 숨김 */
		    scrollbar-color: transparent transparent;  /* 스크롤바 색상도 투명하게 설정 */
		}
    </style>
</head>
<body>
    <div class="container">
        <c:import url="layout/leftnav_3.jsp"></c:import>
        	<div class="contents narrow">
            	<h2 class="title subject"></h2>
                <div class="list relative">
				   <h3 class="capt">크루원 검색</h3>
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
	window.addEventListener("pageshow", (event) => {
	    if (event.persisted) {
	        // 페이지가 캐시에서 로드된 경우 새로고침
	        window.location.reload();
	    }
	});

    // 크루원 목록을 불러오기 위한 crew_idx
    var crew_idx = ${crew_idx};
    
    // 현재 유저ID
    var currentUserId = '${sessionScope.loginId}';
    
    // Ajax로 부터 반환받은 정보
    var crew_name; // 크루명
    var nick; // 크루장 또는 신청자 닉네임
    var profile; // 크루장 또는 신청자 프로필
    var leader_id; // 크루장 ID
    var user_id; // 크루원 ID
    
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
 	
    // 1. 크루원 목록 불러오기
    crew_memberList();
    
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
          crew_memberList();
			
          // 검색 키워드 초기화. (검색했는지 여부를 판단하기 위함.)
          searchKeyword = '';
       }
    }
    
    
    // 크루원 목록 불러오기 함수
    function crew_memberList(){
        $.ajax({
            url: 'mycrew_memberList.ajax',
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
            	
                $('.profile_list').empty(); // 프로필 목록 비우기

                console.log('list : ', list);
                
                $.each(list, function(index, data) {
                	
               		// 멤버수 체크하기. 
                    memberCount += 1;
                 	
                 	// 크루명
                    crew_name = data.crew_name;
                    // 크루장 또는 크루원 닉네임
                    nick = data.nick;
                    // 크루장 또는 신청자 프로필
                    profile = data.profile;
                    // 크루원 ID
                    user_id = data.user_id;
	                // 크루장 id 
                    leader_id = data.crew_id;
                    
                    console.log('data : ', data);
                    console.log('leader_id : ', leader_id);
                    console.log('user_id : ', user_id);
                    
                    // 크루장인지 여부체크 - 맨처음 한번만 체크.
                    if (index === 0) {
                        if (leader_id === currentUserId) {
                            leader_chk = 1;    
                        }            
                    }
                    
                    // 크루장인 경우
                    if(leader_id === user_id){
                    	id = leader_id;	
                    }else{
                    	id = user_id;
                    }
                 	
                 	
                    console.log('id : ', id);
                    console.log('user_id : ', user_id);
                    console.log('leader_id12314 : ' + leader_id);
                    console.log('leader_chk_f : ' + leader_chk);
                    
                    	
                    // 맨 처음 title세팅
                    if (index === 0) {
                        $('.title.subject').html(crew_name + '<span>크루원 목록</span>');
                    }
                    
                    profile_info = '<div class="profile relative ' +id+ '">'
                    				+ '<a class="profile_detail_set ' +id+ '" href="mycrew_memberDetail.go?id=' +id+ '&profileType=1&idx=' +crew_idx+ '">' //일반회원 프로필 상세보기 이동.
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
                                    

                    profile_info += '</div></div>';
                    
                    // 크루장인 경우
                    if(leader_id === user_id){
                    	$('.profile_list').prepend(profile_info);
	                    $('.leader_chk' + index).show(); // 크루장 표시
                    }else{
                    	$('.profile_list').append(profile_info);
                    	$('.leader_chk' + index).hide(); // 크루장 표시 숨김                    	
                    }
                    
                    console.log('profile 확인!!: ' + profile);  
                    // 프로필  
                    if (profile !== ''){
                    	$('.profile_detail_set.' + id).html('<img src="/photo/' + profile + '" alt="프로필 이미지" style="width: 60px; height: 60px; object-fit: cover; border-radius: 50%;">');
                    	/* $('.profile_detail_set.' + id).css('background-image', 'url(/photo/' + profile + ')'); */
                	} else {
                 		$('.profile_detail_set.' + id).html('<i class="bi bi-person-circle" style="font-size:60px"></i>');
    				}
                });
                // 크루원이 한명도 없는경우 => 크루원이 없습니다.
                if(memberCount === 1){
         	        $('.profile_list').append('<div class="no_people"><div><i class="bi bi-person-x" style="font-size: 250px;"></i></div><h2>크루에 멤버가 없습니다.</h2></div>');
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
        crew_memberList();

        // 버튼 상태 업데이트
        if (order) {
            $('#order_asc').hide(); // 오름차순 버튼 숨김
            $('#order_desc').show().html('닉네임<i class="bi bi-sort-down-alt"></i>'); // 내림차순 버튼으로 변경
        } else {
            $('#order_desc').hide(); // 내림차순 버튼 숨김
            $('#order_asc').show().html('닉네임<i class="bi bi-sort-down"></i>'); // 오름차순 버튼으로 변경
        }
    });
    
    
</script>
</html>
