<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitMATE</title>
    <link rel="stylesheet" type="text/css" href="resources/css/common.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
    	
    	.contents.narrow{
        	height: 1100px;
        	padding: 24px 220px;
        }
        
        .recruit_left {
            width: 15%;
            aspect-ratio: 1;
            border: 1px solid black;
            border-radius: 50%;
        }

        .bi bi-person-circle {
            aspect-ratio: 1;
            border: 1px solid black;
            border-radius: 50%;
            font-size: 15%;
        }

        div.recruit_header .recruit_right {
            position: absolute;
            top: -3%;
            left: 20%;
            width: 80%;
        }

        .comment .recruit_right, .comment_reply .recruit_right {
            position: absolute;
            top: 0%;
            left: 12%;
            width: 80%;
        }

        div.recruit_right span {
            width: 100%;
        }

        .text_area {
            display: inline-block;
            width: 63%;
            margin: 0%;
            overflow: hidden; /* 영역을 넘어가는 경우 숨김처리.  */
            text-overflow: ellipsis; /* 숨겨지는 부분에 말줄임표(...) 표시 */
            white-space: nowrap; /* 줄바꿈 방지 */
        }

        h2.title {
            margin: 0;
        }

        div.recruit_header {
            position: relative;
            margin-top: 5%;
            border-bottom: 1px solid white;
            height: 14%;
        }

        div.recruit_body {
            position: relative;
            height: 14%;
            margin-bottom: 5%;
        }

        div.recruit_footer {
            position: relative;
            height: 63%;
            overflow: hidden;
        } 

        div.recruit_info {
            margin: 5% 0;
            display: flex;
            flex-wrap: wrap;
        }

        div.recruit_info span {
            text-align: center;
            flex: 1 1 10%;
        }

        div.comment_area {
		    overflow-y: auto; /* 세로 스크롤 가능 */
		    overflow-x: hidden; /* 가로 스크롤 숨김 */
		    background-color: #282b34;
		    border-radius: 4px;
		    padding: 5% 5%;
		    margin: 5% 0;
		    max-height: 400px; /* 높이를 적절하게 설정하여 스크롤이 나타나도록 함 */
		    height: auto; /* 내용에 따라 높이 조정 */
		    display: flex;
		    flex-direction: column; /* 내용이 쌓이는 방향 설정 */
		}

        
        div.comment {
            position: relative;
            margin: 5% 0;
        }

        button.add_button {
            background-color: #282b34;
            color: white;
            border: none;
            position: absolute;
            top: -13px;
    		right: -13px;
        }

        div.recomment {
            position: absolute;
            width: 90%;
        }

        div.comment_ask {
        	height: 18%;
            position: relative;
            margin-top: 0;
            margin-bottom: 10%;
        }

        div.comment_box .mainbtn.reply_write{
        	position: absolute;
        	bottom: 0;
        	right: 0;
        }

        div.reply_right {
            position: absolute;
            right: 0;
            width: 90%; 
        }

        textarea {
            border: 1px solid white;
            font-family: 'Noto Sans KR', sans-serif;
            opacity: 0.5;
        }

        span.txt_opacity {
            opacity: 0.5;    
        }

        button.reply_close {
            position: absolute;
            right: 0%;
            top: 0%;
            background-color: #282b34;
            color: white;
            opacity: 0.5;
            border: none;
            margin: 0;
            padding: 0;
        }

        div.comment_txt {
            margin: 5% 0;
        }

        div.comment.right {
            margin-top: 0;
        }

        div.content_right {
            width: 90%;
            margin-left: auto;
        }

        div.comment_box {
            border-bottom: 1px dashed; 
            position: relative;
            margin: 0;
        }

        div.comment_box i.bi.bi-arrow-return-right.absolute {
            position: absolute;
            top: 2%;
            left: 3%;
        }

        div.comment_box div.comment_box  {
            border-bottom: 0; 
            position: relative;
            margin: 5% 0;
            height: auto;
        }
        
        div.comment_box div.comment_box.reply_write  {
            border-bottom: 0; 
            position: relative;
            margin: 5% 0;
            height: 157px;
        }

        div.comment_box button.mainbtn.minbtn {
            position: absolute;
            top: 15%;
    		right: 40%;
        }

        div.body_content {
            margin: 7% 0;
        }

        div.line {
            border-top: 1px solid white; 
        }

        button.full {
            margin: 5% 0;
        }

        div.comment_ask .mainbtn {
            position: absolute;
            bottom: -34%;
            right: 0;
        }
        
        .modal_edit_delete, .modal_report, .modal_container.min{
        	width: 190px;
        	height: auto;
        	margin: 0;
        }  
        #crew_leader {
            color: white;
            position: absolute;
            bottom: -22%;
    		left: -15%;
            border: 2px solid white;
            border-radius: 10px;
            background-color: #048187; 
            font-size: 20px;
        }
        
        #crew_leader_min{
       	    color: white;
		    position: absolute;
		    top: 15%;
		    left: 16%;
		    border: 2px solid white;
		    border-radius: 10px;
		    background-color: #048187;
		    font-size: 16px;
		    z-index: 10;
        }
        
    </style>
</head>
<body>
    <% String board_idx = request.getParameter("board_idx"); %>
    
    <div class="container">
        <c:import url="layout/leftnav_1.jsp"></c:import>

        <div class="contents narrow">
            <div class="recruit_header">
            	<a class="profile_detail_set leader" href="mycrew_memberDetail.go?id=${recruitHead.leader_id}&profileType=1&idx=${recruitHead.crew_idx}"> <!-- 크루회원 프로필 상세보기 이동. -->
				</a>            	
                <div class="recruit_right">
	                <h2 class="title">${recruitHead.crew_name}</h2>
	                <span class="text_area"><span class="txt_opacity">크루장</span><span>&nbsp;&nbsp;${recruitHead.leader_name}</span><span>&nbsp;( ${recruitHead.leader_mbti} )</span></span>
                	<div id="crew_leader" class="leader_chk">
                		<i class="bi bi-star-fill"></i>
                	</div>
                </div>
                <div class="recruit_info">
	                <span><i class="bi bi-geo-alt-fill">${recruitHead.region_name} ${recruitHead.regions_name}</i></span> 
	                <span><i class="bi bi-people-fill">${recruitHead.member_count}</i></span>
	                <span><i class="bi bi-fonts">${recruitHead.board_count}개</i></span> 
	                <span><i class="bi bi-calendar-event">${recruitHead.create_date}</i></span>
                </div>
            </div>
            
            
            <div class="recruit_body">
            	<div class="body_content">${recruitHead.subject}</div>
	            <div class="line">
	            	<button class="mainbtn full" id="crew_btn" type="button"></button>
	            </div>
            </div>
            

            <div class="recruit_footer">
                <div class="comment_ask" id="commentAskSection">
                    <h3 class="capt">
                        <i class="bi bi-chat-left-fill"></i>&nbsp;문의하기
                    </h3>
                    <form action="crew_recruit_detail.do?idx=<%=board_idx%>" method="post">
                        <input type="text" name="board_idx" value="<%=board_idx%>" hidden/>
                        <input type="text" name="comment_id" value="" id="currentUserId" hidden/>
                        <input type="text" name="content_chk" value="0" hidden/>
                        <p>
                            <textarea class="full" name="content" placeholder="최대 1,000자까지 입력할 수 있습니다."></textarea>
                        </p>
                        <button class="mainbtn">작성하기</button>
                    </form>
                </div>
                <h3 class="capt">
        	        <i class="bi bi-chat-left-fill"></i>&nbsp;문의 & 답변내역
                </h3>
                <div class="comment_area">
                	
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- 모달 div모음 -->
    <c:import url="layout/modal.jsp"></c:import>
    <!-- 수정/삭제 모달 -->
	<div class="modal modal_edit_delete">
	    <div class="modal_container min">
		    <button class="btn_update subbtn full"><i class="bi bi-pencil">수정하기</i></button>
		    <button class="btn_delete subbtn full"><i class="bi bi-trash">삭제하기</i></button>
		    <button class="btn_save subbtn full" hidden><i class="bi bi-floppy2-fill">저장하기</i></button>
		    <button class="btn_cancel mainbtn full">창 닫기</button>
	    </div>
	</div>
	
	<!-- 신고하기 모달 -->
	<div class="modal modal_report">
	    <div class="modal_container min">
	        <div class="modal_footer">
	            <button class="btn_report subbtn full"><i class="bi bi-exclamation-circle-fill" style="color:red">신고하기</i></button>
	            <button class="btn_cancel mainbtn full">창 닫기</button>
	        </div>
	    </div>
	</div>
    
</body>

<script src="resources/js/common.js"></script>
<script>

	// 현재 게시글의 idx번호 저장.
    var board_idx = <%=board_idx%>;
    // 현재 유저정보 세팅.
    var currentUserId = '${sessionScope.loginId}'; 
    // 문의하기에 현재 유저ID넣어주기.
    $('#currentUserId').val(currentUserId);
    // 크루 idx
    var crew_idx = ${recruitHead.crew_idx};
    
    // 크루이름
    var crew_name = '${recruitHead.crew_name}';
    
 	// 크루장 프로필사진
 	var header_profile = '${recruitHead.leader_profile}' ? '<img class="recruit_left" src="/photo/${recruitHead.leader_profile}" alt="프로필 이미지" style="width: 60px; height: 60px; object-fit: cover; border-radius: 50%;"/>' 
            : '<i class="bi bi-person-circle" style="font-size: 60px;"></i>';
    var leader_profile = '${recruitHead.leader_profile}' ? '<img class="recruit_left" src="/photo/${recruitHead.leader_profile}" alt="프로필 이미지" style="width: 40px; height: 40px; object-fit: cover; border-radius: 50%;"/>' 
            : '<i class="bi bi-person-circle" style="font-size: 40px;"></i>';
    
    // Header정보에 프로필사진 넣어주기
    $('.profile_detail_set.leader').append(header_profile);
            
    // 댓글, 대댓글 불러오기.
    if (board_idx != '' && board_idx != null) {
    	detail(board_idx);                    
    } 

    
    
    var contentSelect = ''; // 댓글 또는 대댓글 textArea영역 selecter
    
    var offset = ''; // 버튼의 좌표 값을 가져오기 위한 변수 (모달창을 버튼 옆에 위치시키기 위해 사용.)
 	// 댓글 수정/삭제/신고시 controller로 넘겨줄 데이터들을 담을 객체
    var info = {};
    
	// 댓글 모달요소(신고 or 수정/삭제)받아오기.
	var modal_chk = '';
    
	/* 댓글, 대댓글관련 값 */
	var idx;
 	// 댓글 작성자 ID
    var comment_id;
 	// 댓글 내용
    var content;
 	// 작성일시
    var date;
    // 댓글 작성자 닉네임
    var nick;
    // 문의자 프로필
    var comment_profile = '';

	
    // 동적 html을 생성하기 위한 변수. (댓글 또는 대댓글 관련 요소들)
    var footer = '';
    
 	// 크루장인지 일반유저인지, 일반유저라면 크루입단 여부에 따른 버튼 및 문의입력창 처리 (approval_status 0: 신청전/ 1: 신청중/ 2: 신청거절/ 3: 신청수락/ 4: 크루원)
    var apv_status = ${approval_status};
    var join_idx = '${join_idx}';        // 크루 입단신청목록 idx
    var crewLeaderId = '${recruitHead.leader_id}'; // 크루장의 ID정보
    
    
 	// 크루장 체크 (0:일반유저, 1: 크루장)
    var leader_chk = 0; 
    if(crewLeaderId === currentUserId){
		leader_chk = 1;
    }
    

    if (leader_chk === 1) {
    	$('div.comment_area').css({
    		'max-height': 610
    	})
    	// 신청자 관리버튼 클릭시 신청자 관리페이지로 이동.
        $('#crew_btn').text('신청자 관리하기').attr('onclick', 'approv_manage(' + leader_chk + ',' + crew_idx + ');'); 
        
        $('#commentAskSection').hide(); // 크루장일 경우 문의하기 섹션 숨김
    } else {
		
		switch (apv_status) {
		// 0:신청전, 2:신청거절, 3:신청수락 -> 입단 신청버튼 (가입신청테이블의 마지막기록이 신청수락이여도... 현재 크루원이 아니라면... 재가입으로 간주) 
		case 3:
		case 0:
		case 2: $('#crew_btn').text('크루 입단 신청하기').attr('onclick', 'join_crew(' + crew_idx + ');'); 
				$('#crew_btn').attr('class', 'mainbtn full');
			break;
		// 1:신청중상태 -> 입단 취소버튼	
		case 1: $('#crew_btn').text('크루 입단 취소하기').attr('onclick', 'leave_crew(' + join_idx + ');');
				$('#crew_btn').attr('class', 'subbtn full');
			break;
		// 4:이미 크루원인 유저 => 모집게시글 페이지 접근불가하므로 크루페이지로 이동.
		case 4: location.href='crew_main_page.go?crew_idx=' + crew_idx;
			break;
		}
    }
    
 	
 	// 댓글, 대댓글 가져오기
    function detail(board_idx) {
        $.ajax({
            url: 'crew_recruit_detail.ajax',
            type: 'GET',
            data: { 
            	'board_idx': board_idx,      // 댓글정보를 가져오기 위함.
          	},
            dataType: 'JSON',
            success: function(data) {
                
                // 댓글 및 대댓글 정보를 DB에서 가져와서 뿌려줌.
                $(data).each(function(idx, item){
                	
                	// 댓글작성자 프로필
                	comment_profile = item.comment_profile ? '<img class="recruit_left" src="/photo/' + item.comment_profile + '" alt="프로필 이미지" style="width: 40px; height: 40px; object-fit: cover; border-radius: 50%;"/>' 
                            : '<i class="bi bi-person-circle" style="font-size: 40px;"></i>'; 
                	
                	// 삭제된 댓글이 아닌경우 
                	if(item.comment_status != 2){
                    	footer += '<div class="comment_box">'
    				        + '<div class="comment">'
    				        //일반회원 프로필 상세보기 이동.
    				        + '<a class="profile_detail_set" href="mycrew_memberDetail.go?id=' +item.comment_id+ '&profileType=0">' 
    				        + comment_profile
    				        + '</a>'
    				        + '<div class="recruit_right">'
    				        + '<h2 class="title"></h2>'
    				        + '<span class="text_area">'
    				        + '<span>&nbsp;&nbsp;' + item.comment_nick + '</span></br>'
    				        + '<span>&nbsp;' + item.comment_date + '</span>'
    				        + '</span>'
    				        + '</div>';
    				        
                    	if(item.comment_status === 1){       // 정상게시 댓글인경우
    				    	footer += '<div class="comment_txt"><textarea id="0_' +item.comment_idx+ '" name="content" disabled>' + item.comment_content + '</textarea></div>'; 
    					}else if(item.comment_status === 3){ // 운영자가 제재한 경우
    						footer += '<div class="comment_txt"><div id="comment_blind" disabled><i class="bi bi-file-earmark-x-fill">&nbsp;&nbsp;운영자에게 제재된 문의글입니다.</i></div></div>';	
    					}
                    	
                	}else{ // 대댓글이 있지만, 삭제된 댓글인경우
                		if(item.recomment_idx !== 0){  
                			footer += '<div class="comment_box">'
        				        + '<div class="comment">'
        				        //일반회원 프로필 상세보기 이동.
        				        + '<a id="profile_detail_set" href="mycrew_memberDetail.go?id=' +item.comment_id+ '&profileType=0">' 
        				        + comment_profile
        				        + '</a>'
        				        + '<div class="recruit_right">'
        				        + '<h2 class="title"></h2>'
        				        + '<span class="text_area">'
        				        + '<span>&nbsp;&nbsp;' + item.comment_nick + '</span></br>'
        				        + '<span>&nbsp;' + item.comment_date + '</span>'
        				        + '</span>'
        				        + '</div>';
                			
    						footer += '<div class="comment_txt"><div id="comment_del" disabled><i class="bi bi-file-earmark-x-fill">&nbsp;&nbsp;삭제된 문의글입니다.</i></div></div>';
                		}
                	}
				        
                		// 대댓글 가져오기
    				    if (item.recomment_idx !== 0) {	
                		
    				    	// 현재유저가 크루장, 대댓글 작성자면 => 수정/삭제 버튼.
    				        if(leader_chk === 1 && currentUserId === item.recomment_id){
    				        	modal_chk = '.modal_edit_delete';                	
    		                }
    				    	
    				        footer += '<div class="comment_box">'
    				        	+ '<div id="crew_leader_min" class="leader_chk">'
    	                		+ '<i class="bi bi-star-fill"></i>'
    	                		+ '</div>'
    				            + '<i class="bi bi-arrow-return-right absolute"></i>'
    				            + '<div class="content_right">'
    				            + '<div class="comment right">'
    				            + '<a id="profile_detail_set leader_profile" href="mycrew_memberDetail.go?id=' +item.recomment_id+ '&profileType=0">' //일반회원 프로필 상세보기 이동.
    				            + leader_profile
    				            + '</a>'
    				            + '<div class="recruit_right">'
    				            + '<h2 class="title"></h2>'
    				            + '<span class="text_area">'
    				            + '<span>&nbsp;&nbsp;' + item.recomment_nick + '</span>'
    				            + '<span style="color: #048187">(크루장)</span></br>'
    				            + '<span>&nbsp;' + item.recomment_date + '</span>'
    				            + '</span>'
    				            + '</div>';
    				            
    				        // 대댓글 - 모달추가
    				     	// 일반유저인 경우 대댓글에 수정/삭제 버튼이 보이지 않도록 처리.
				            if (leader_chk === 1 && currentUserId === item.recomment_id) {
				                footer += '<button type="button" class="add_button" onclick="my_modal(this)" '
						    		+ 'data-modal_chk="' + modal_chk + '" '  
							        + 'data-content_chk="1" '
							        + 'data-comment_idx="' + item.recomment_idx + '" '
							        + 'data-comment_id="' + item.recomment_id + '" >'  
							        + '<i class="bi bi-three-dots-vertical"></i>'
							        + '</button>';
				            } 
    				     	
					        footer += '<div class="comment_txt"><textarea id="1_' +item.recomment_idx+ '" name="content" disabled>' + item.recomment_content + '</textarea></div>'
					            	+ '</div>'
					            	+ '</div>'
					            	+ '</div>';
    				    	
					            	
					            	
		            	// 대댓글이 존재하지 않고, 크루장인 경우 답변버튼        	
    				    }else { 
    				    	if (leader_chk === 1 && item.comment_status === 1) {
    				            footer += '<button class="mainbtn minbtn" '
    				                + 'data-comment-idx="' + item.comment_idx + '" '
    				                + 'data-id="' + currentUserId + '" '
    				                + 'onclick="reply(this)">답변하기</button>';
    				        }
    				    }
				        
    				 	// 정상적인 내 댓글인경우 대댓글 수정/삭제 모달.
    				    if(item.comment_id === currentUserId && item.comment_status === 1){
    				    	modal_chk = '.modal_edit_delete'; 
    				    }else if(item.comment_id !== currentUserId && item.comment_status === 1){
    				    	// 내가 쓴 댓글이 아니고, 크루장인경우 신고하기 모달. 
    				    	if(leader_chk === 1){
    				    		modal_chk = '.modal_report';					    		
    				    	}
    				    }
                		
    				 	// 정상댓글인경우 - 모달추가
    				    if(item.comment_status === 1){
    				    	footer += '<button type="button" class="add_button" onclick="my_modal(this)" '
    				    		+ 'data-modal_chk="' + modal_chk + '" '  
    					        + 'data-content_chk="0" '
    					        + 'data-comment_idx="' + item.comment_idx + '" '
    					        + 'data-comment_id="' + item.comment_id + '" >'  
    					        + '<i class="bi bi-three-dots-vertical"></i>'
    					        + '</button>';
    				    }
                		
    				    footer += '</div></div>'; // comment_box 끝
    				    
    				    modal_chk = '';
                });
                
 				$('.comment_area').empty().append(footer);
 				
 			
            },
            error: function(e) {
                console.log(e);
                modal.showAlert('모집게시글 정보가져오기 실패.');
            }
        });
    }
    
    // 크루 입단신청 함수
    function join_crew(crew_idx) {
        $.ajax({
            url: 'join_crew.ajax', // 입단 신청 처리 URL
            type: 'POST',
            data: {
                crew_idx : crew_idx,
                join_id : currentUserId,
                leader_id : crewLeaderId,
                crew_name : crew_name
            },
            success: function(data) {
                if (data.success) {
                	// 주소창 그대로 새로고침.
             	    location.reload();
                } else {
                    modal.showAlert('입단 신청 실패');
                }
            },
            error: function() {
                modal.showAlert('입단 신청 처리 중 오류가 발생했습니다.');
            }
        });
    }

    
    // 크루 입단취소 함수
    function leave_crew(join_idx) {
    	
        $.ajax({
            url: 'leave_crew.ajax', // 입단 신청 처리 URL
            type: 'POST',
            data: {
                join_idx : join_idx // 크루 입단신청 idx => 입단신청 목록에서 삭제하기 위함.
            },
            success: function(data) {
                if (data.success) {
                	// 주소창 그대로 새로고침.
             	    location.reload();
                } else {
                    modal.showAlert('입단 취소 실패');
                }
            },
            error: function() {
                modal.showAlert('입단 취소 처리 중 오류가 발생했습니다.');
            }
        });
    }
 
    
 	// 크루 입단관리 페이지로 이동
    function approv_manage(leader_chk, crew_idx){
        // 크루장일 경우 신청자 관리 페이지로 이동
        if(leader_chk === 1){
        	location.href = 'mycrew_joinList.go?idx=' + crew_idx;	
        }else{
        	console.log('당신은 크루장이 아닙니다.');
        }
    }
	
 	// 대댓글 달기 함수.
    function reply(obj) {
    	// 문의댓글 정보가져오기.
        var comment_idx = $(obj).data('comment-idx');

		// 답변입력영역 생성.
        var reply_area = '<div class="comment_box reply_write">'
            + '<form action="crew_recruit_detail.do?board_idx=' + board_idx + '&crew_idx=' +crew_idx+ '" method="post">'
            + '<div class="reply_right">'
            + '<h3 class="capt"><i class="bi bi-arrow-return-right"></i>&nbsp;답변하기</h3>'
            + '<p>'
            + '<textarea name="content" class="recomment" placeholder="최대 1,000자까지 입력할 수 있습니다."></textarea>'
            + '<input type="text" name="board_idx" value="' + board_idx + '" hidden/>'
            + '<input type="text" name="comment_idx" value="' + comment_idx + '" hidden/>'
            + '<input type="text" name="recomment_id" value="' +currentUserId+ '" hidden/>'
            + '<input type="text" name="content_chk" value="1" hidden/>'
            + '</p>'
            + '</div>'
            + '<button class="mainbtn reply_write">작성하기</button>'
            + '</form>'
            + '<button type="button" onclick="reply_close(this)" class="reply_close"><i class="bi bi-x-circle">닫기</i></button>'
            + '</div>';

        $(obj).parent().append(reply_area);
        $(obj).remove(); //답변하기 버튼 삭제
    }

    // 답변입력영역 닫기 + 답변하기 버튼생성
    function reply_close(obj) {
        $(obj).parent().parent().append('<button class="mainbtn minbtn" onclick="reply(this)">답변하기</button>');
        $(obj).parent().remove();        
    }
    
    /********************** 모달관련 함수 및 이벤트 *********************/
    
	// 모달위치 값을 구하여 모달 띄우기 & 스크롤 비활성화
	function showModal(modal_chk, offset, obj){
		// 스크롤 위치를 고려하여 top 값 조정
	    var scrollTop = $(window).scrollTop(); // 현재 스크롤 위치
	    $(modal_chk).css({
	        top: offset.top - scrollTop, // 스크롤 위치 추가
	        left: offset.left
	    });
		
	    console.log('modal_chk1: ' + $(modal_chk));
	 
	 	// 브라우저 및 comment_area 스크롤 비활성화
	    $('.comment_area').css({
	    	'overflow-y': 'hidden'
	    });
	    document.body.style.overflow = 'hidden';
	    
	    
		$(modal_chk).fadeIn(); // 모달표시
	}
    
    // 모달닫기 & 스크롤 활성화
	function modal_close(modal_chk){
    	
		console.log('modal_chk2: ' + modal_chk);
		$(modal_chk).fadeOut(); // 자기자신 모달 닫기
		
		$('.comment_area').css({
			'overflow-y' : 'scroll'
		})
		document.body.style.overflow = 'auto';	
    }
    
    
	// 모달창 띄우기(시작)
	function my_modal(obj) {
    	
		console.log('hi : ', obj);
		
		// 이미 열려 있는 모달이 있는지 체크
	    if ($('.modal:visible').length) {
	    	console.log('뭔가가 띄워짐? : ', obj);
	        return; // 이미 열려있다면 아무 것도 하지 않음
	    }
		
	 	// 모달창 수정/삭제 버튼
   		$('.modal_edit_delete .btn_save').prop('hidden', true);
   		$('.modal_edit_delete .btn_update').prop('hidden', false);
   		$('.modal_edit_delete .btn_delete').prop('hidden', false);
		
		// controller로 보내줄 데이터들을 담을 자바스크립트 객체생성.
		info = {
			'board_idx': board_idx,	
			'content_chk': $(obj).data('content_chk'),	
			'comment_idx': $(obj).data('comment_idx'),
			'comment_id': $(obj).data('comment_id'),
		}
		
		// 댓글 또는 대댓글 요소selecter
		contentSelect = $('#' + info.content_chk + '_' + info.comment_idx);
		
		// 댓글 모달요소(신고 or 수정/삭제)받아오기.
		modal_chk = $(obj).data('modal_chk');
		
		// add버튼 위치좌표		
		offset = $(obj).offset();
		
		// 모달창 띄우기. & 스크롤 비활성화
        showModal(modal_chk, offset, obj);
	}
    
    // 수정 버튼 클릭 시 
	$('.btn_update').click(function() {

		contentSelect.prop("disabled", false);

		contentSelect.css({
			'opacity' : '1',
			'background-color' : '#FAFAFB',
			'color' : 'black'
		});

		// 수정/삭제 버튼 변경 => 모달창 저장
		$('.modal_edit_delete .btn_save').prop('hidden', false);
		$('.modal_edit_delete .btn_update').prop('hidden', true);
		$('.modal_edit_delete .btn_delete').prop('hidden', true);
		
	});

	// 저장하기 버튼 클릭 시
	$('.btn_save').click(function() {

		info.content = contentSelect.val();

		info.event = 'update';
		// Ajax함수 실행.
		modal_event();

		modal_close($(this).parents('.modal'));

	});

	// 삭제하기 버튼 클릭 시
	$('.btn_delete').click(function() {

		info.event = 'delete';
		// Ajax함수 실행.
		modal_event();

		modal_close($(this).parents('.modal'));
	});

	// 신고하기 버튼 클릭 시
	$('.btn_report').click(function() {
		info.event = 'report';
		// Ajax함수 실행.
		modal_event();

		modal_close($(this).parents('.modal'));
	});

	// 취소 버튼 클릭 시 모달 닫기
	$('.btn_cancel').click(function() {

		// 댓글 또는 대댓글 textarea 비활성화
		contentSelect.prop("disabled", true);

		contentSelect.css({
			'opacity' : '0.5',
			'background-color' : '#282b34',
			'color' : '#e9ecef'
		});

		modal_close($(this).parents('.modal'));
	});

	// Ajax - 모달 Event
	function modal_event() {

		// 객체를 JSON 문자열로 변환
		var json_info = JSON.stringify(info);

		$.ajax({
			method : 'POST',
			url : 'comment_event.ajax',
			contentType : 'application/json',
			dataType : 'JSON',
			data : json_info,
			success : function(data) {

				if (data.report_chk === '0') {
					// 주소창 그대로 새로고침.
					location.reload();
				} else {
					// 폼 생성
					var form = $('<form>', {
						action : 'crew_report.go', // 이동할 페이지
						method : 'POST' // POST 방식
					});

					// 데이터 추가
					$('<input>').attr({
						type : 'hidden',
						name : 'comment_idx',
						value : data.comment_idx
					// 댓글 idx
					}).appendTo(form);

					$('<input>').attr({
						type : 'hidden',
						name : 'comment_id',
						value : data.comment_id
					// 댓글 id
					}).appendTo(form);

					$('<input>').attr({
						type : 'hidden',
						name : 'board_type',
						value : data.board_type
					// 댓글 신고 유형
					}).appendTo(form);

					// 폼을 body에 추가하고 제출
					form.appendTo('body');
					form.submit();
				}
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
</script>
</html>