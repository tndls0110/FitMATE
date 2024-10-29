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
    width: 86%;
    height: 5.5%;
}

div.list button.mainbtn.search {
    display: inline-block;
    border: none;
    background-color: #282b34;
    margin: 0;
    height: 5.5%; 
    width: 13%;
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
    overflow-y: auto; /* 세로 스크롤 가능 */
    overflow-x: hidden; /* 가로 스크롤 숨김 */
    margin: 7% 0;
    max-height: 800px; /* 높이를 적절하게 설정하여 스크롤이 나타나도록 함 */
    height: auto; /* 내용에 따라 높이 조정 */
    display: flex;
    flex-direction: column; /* 내용이 쌓이는 방향 설정 */
    justify-content: space-evenly;
    position: relative;
}

.order_by {
    background-color: transparent; /* 배경색을 투명으로 설정 */
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

.no_people{
	margin: 15% auto;
}

.list_abs{
	position:absolute;
	top: 0%;
	right: 0%;
}
</style>
</head>
<body>
    <div class="container">
        <c:import url="layout/leftnav_3.jsp"></c:import>

        <div class="contents narrow">
            <h2 class="title subject"></h2>
            <div class="list">
                <h3 class="capt">크루 검색</h3>
                <p>
                    <input type="text" class="searchKeyword" name="searchKeyword" placeholder="크루장 닉네임 / 아이디를 입력하세요." />
                    <button type="button" onclick="search()" class="mainbtn search"><i class="bi bi-search"></i></button>
                </p>
            </div>

            <div class="profile_list">
                <div class="list_abs">
                    <button type="button" class="mainbtn minbtn order_by" id="order_desc">닉네임<i class="bi bi-sort-down"></i></button>
                    <button type="button" class="mainbtn minbtn order_by" id="order_asc">닉네임<i class="bi bi-sort-down-alt"></i></button>
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
    var currentUserId = 'member01';
    
    // Ajax로 부터 반환받은 정보
    var crew_idx; // 크루idx
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
    
    
    // 크루원 목록 모두 불러오기
    $.ajax({
        url: 'mycrew_joinList.ajax',
        method: 'POST',
        data: {
            'crew_idx': crew_idx
        },
        dataType: 'JSON',
        success: function(list) {
            $.each(list, function(index, data) {
            	// 멤버수 체크하기. (크루장은 인원수에서 제외하기 때문에 index값과 동일.)
            	memberCount = index;
            	
                console.log('data : ', data);
                console.log('crew_idx : ', data.crew_idx);
                
                // 크루idx
                crew_idx = data.crew_idx;
                // 크루명
                crew_name = data.crew_name;
                // 신청 idx
                join_idx = data.join_idx;
                // 크루장 또는 신청자 닉네임
                nick = data.nick;
                // 크루장 또는 신청자 프로필
                profile = data.profile;
                // 크루장 ID
                leader_id = data.leader_id;
                // 신청자 ID
                join_id = data.join_id;
                console.log('join_idx 체크1 : ' + join_idx);
                
                
                // 크루장ID 또는 신청자ID
                id = leader_id !== null ? leader_id : join_id;
                
                // 크루장인지 여부체크 - 맨처음 한번만 체크.
                if (index === 0) {
                    if (leader_id === currentUserId) {
                        leader_chk = 1;    
                    }            
                }
                
                // 크루장이 아니라면... 권한이 없으므로 => mycrew페이지로 이동. 
                if (leader_chk !== 1) {
                    modal.showAlert('크루장만 접속할 수 있는 페이지입니다.');
                    location.href = 'mycrew'; // 나중에 링크에 id추가해야 함.
                } else {
                    // 맨 처음 title세팅
                    if (index === 0) {
                        $('.title.subject').html(crew_name + '<span>가입 신청자 목록</span>');
                    }
                    
                    profile_info = '<div class="profile relative">'
                                    + '<i class="inlineBlock bi bi-person-circle" style="font-size: 60px;"></i>' // 나중에 프로필로 변경.
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
                    
                    $('.profile_list').append(profile_info);
                    
                    // leader정보인 경우 수락/거절버튼 숨김
                    if (index === 0) { // 크루장인 경우
                        $('.leader_chk' + index).show(); // 크루장 표시
                    } else { // 나머지 경우 (신청자)
                        $('.leader_chk' + index).hide(); // 크루장 표시 숨김
                    }
                }					
            });	
            
            // 회원수가 1명도 없는 경우 '크루에 가입한 멤버가 업습니다.' 이미지 띄우기.
            if(memberCount < 1){
            	$('.profile_list').append('<div class="no_people"><div><i class="bi bi-person-x" style="font-size: 250px;"></i></div><h2>크루에 가입한 사용자가 없습니다.</h2></div>')
            }
        },
        error: function(e) {
            console.log(e);
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
                // UI 업데이트 (예: 해당 신청자 삭제)
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
