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
            top: -4%;
            left: 20%;
            width: 80%;
        }

        .comment .recruit_right, .comment_reply .recruit_right {
            position: absolute;
            top: -4%;
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
            top: 0;
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
            top: 10%;
            right: 12%; 
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
        
    </style>
</head>
<body>

    <% String idx = request.getParameter("idx"); %>
    <div class="container">
        <c:import url="layout/leftnav_1.jsp"></c:import>

        <div class="contents narrow">
            <div class="recruit_header"></div>
            <div class="recruit_body"></div>

            <div class="recruit_footer">
                <div class="comment_ask" id="commentAskSection">
                    <h3 class="capt">
                        <i class="bi bi-chat-left-fill"></i>&nbsp;문의하기
                    </h3>
                    <form action="crew_recruit_detail.do?idx=<%=idx%>" method="post">
                        <input type="text" name="board_idx" value="<%=idx%>" hidden/>
                        <input type="text" name="comment_id" value="" id="currentUserId" hidden/>
                        <input type="text" name="comment_chk" value="0" hidden/>
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
		    <button class="btn_cancel mainbtn full">취소</button>
	    </div>
	</div>
	
	<!-- 신고하기 모달 -->
	<div class="modal modal_report">
	    <div class="modal_container min">
	        <div class="modal_footer">
	            <button class="btn_report subbtn full"><i class="bi bi-exclamation-circle-fill" style="color:red">신고하기</i></button>
	            <button class="btn_cancel mainbtn full">취소</button>
	        </div>
	    </div>
	</div>
    
</body>

<script src="resources/js/common.js"></script>
<script>
	// 현재 게시글의 idx번호 저장.
    var board_idx = <%=idx%>;
    // 현재 유저정보 세팅.
    var currentUserId = 'member01'; // 현재사용자ID => 나중에 sessionID정보로 바꿔줄 예정.
    // 문의하기에 현재 유저ID넣어주기.
    $('#currentUserId').val(currentUserId);
    
    
    if (board_idx != '' && board_idx != null) {
        detail(board_idx);                    
    } else {
        modal.showAlert('모집게시글 idx를 받아오지 못했습니다.');
    }

    var header = '';
    var body = '';
    var footer = '';
    
    function detail(idx) {
        $.ajax({
            url: 'crew_recruit_detail.ajax',
            type: 'GET',
            data: { 'idx': board_idx },
            dataType: 'JSON',
            success: function(data) {
                console.log('data : ', data);
                
                var detail = data.recruitDetail;
                var crewLeaderId = detail.leader_id; // Ajax로 가져온 크루장의 ID정보
                
                var leader_chk = 0; // 0:일반유저, 1: 크루장
                
                // 크루장 체크
                if(crewLeaderId === currentUserId){
					leader_chk = 1;
                }
                
                // 신고하기 모달인지 수정/삭제 모달인지 요소선택.
                var modal = '';
                
                header = '<i class="bi bi-person-circle" style="font-size: 60px;"></i>' 
                        + '<div class="recruit_right">'
                        + '<h2 class="title">' + detail.crew_name + '</h2>'
                        + '<span class="text_area"><span class="txt_opacity">크루장</span><span>&nbsp;&nbsp;' + detail.leader_name + '</span><span>&nbsp;(' + detail.leader_mbti + ')</span></span>'
                        + '</div>'
                        + '<div class="recruit_info">'
                        + '<span><i class="bi bi-geo-alt-fill">' + detail.region_name + ' ' + detail.regions_name + '</i></span>' 
                        + '<span><i class="bi bi-people-fill">' + detail.member_count + '</i></span>'
                        + '<span><i class="bi bi-fonts">' + detail.board_count + '개</i></span>' 
                        + '<span><i class="bi bi-calendar-event">' + detail.create_date + '</i></span>'
                        + '</div>';
                
                body = '<div class="body_content">' + detail.crew_content + '</div>'
                     + '<div class="line">'
                     + '<button class="mainbtn full" id="joinButton">크루 입단 신청하기</button>' // 초기 텍스트
                     + '</div>';
                
                // 댓글 및 대댓글 정보를 DB에서 가져와서 뿌려줌.
                $(data.commentAll).each(function(idx, item) {
				    console.log('item : ', item.content);
				    var datetime = item.date.split('T'); 
				
				    footer += '<div class="comment_box">'
				        + '<div class="comment">'
				        + '<i class="bi bi-person-circle" style="font-size: 40px;"></i>'
				        + '<div class="recruit_right">'
				        + '<h2 class="title"></h2>'
				        + '<span class="text_area">'
				        + '<span>&nbsp;&nbsp;' + item.nick + '</span></br>'
				        + '<span>&nbsp;' + datetime[0] + ' / ' + datetime[1] + '</span>'
				        + '</span>'
				        + '</div>'
				        + '<div class="comment_txt"><textarea id="0_' +item.comment_idx+ '" name="content" disabled>' + item.content + '</textarea></div>'
				        + '</div>';
				
				    // 대댓글이 존재하는 경우
				    if (item.recomment_chk === 1) {
				        var item_reply = item.replyDTO;
				        // 크루장id이며, 대댓글 id와도 같다면 대댓글 수정/삭제 모달추가.
				        if(leader_chk === 1 && crewLeaderId === item_reply.recomment_id){
							modal = '.modal_edit_delete';                	
		                }
				        
				        footer += '<div class="comment_box">'
				            + '<i class="bi bi-arrow-return-right absolute"></i>'
				            + '<div class="content_right">'
				            + '<div class="comment right">'
				            + '<i class="bi bi-person-circle" style="font-size: 40px;"></i>'
				            + '<div class="recruit_right">'
				            + '<h2 class="title"></h2>'
				            + '<span class="text_area">'
				            + '<span>&nbsp;&nbsp;' + item_reply.nick + '</span>'
				            + '<span style="color: #048187">(크루장)</span></br>'
				            + '<span>&nbsp;' + datetime[0] + ' / ' + datetime[1] + '</span>'
				            + '</span>'
				            + '</div>';
				            
				            if (modal !== '') {
				                footer += '<button type="button" class="add_button" onclick="my_modal(this)" '
						    		+ 'data-modal="' + modal + '" '  
							        + 'data-content_chk="1" '
							        + 'data-comment_idx="' + item_reply.recomment_idx + '" '
							        + 'data-comment_id="' + item_reply.recomment_id + '" >'  
							        + '<i class="bi bi-three-dots-vertical"></i>'
							        + '</button>';
				            } 
					        footer += '<div class="comment_txt"><textarea id="1_' +item_reply.recomment_idx+ '" name="content" disabled>' + item_reply.content + '</textarea></div>'
					            	+ '</div>'
					            	+ '</div>'
					            	+ '</div>';
				    } else { // 대댓글이 존재하지 않고, 크루장인 경우 답변하기 버튼추가  
				        if (leader_chk === 1) {
				            footer += '<button class="mainbtn minbtn" '
				                + 'data-comment-idx="' + item.comment_idx + '" '
				                + 'data-id="' + currentUserId + '" '
				                + 'onclick="reply(this)">답변하기</button>';
				        }
				    }
					
                modal = '';
             	// 내 댓글인경우 대댓글 수정/삭제 모달추가.
			    if(item.comment_id === currentUserId){
			    	modal = '.modal_edit_delete'; 
			    }else{
			    	// 내 댓글이 아니고, 크루장인경우 신고하기 모달추가.
			    	if(leader_chk === 1){
			    		modal = '.modal_report';					    		
			    	}
			    }
             
                if(modal !== ''){
			    	footer += '<button type="button" class="add_button" onclick="my_modal(this)" '
			    		+ 'data-modal="' + modal + '" '  
				        + 'data-content_chk="0" '
				        + 'data-comment_idx="' + item.comment_idx + '" '
				        + 'data-comment_id="' + item.comment_id + '" >'  
				        + '<i class="bi bi-three-dots-vertical"></i>'
				        + '</button>';
			    }
			    	
		        footer += '</div>'; // comment_box 끝
				    
				});
                
                $('.recruit_header').empty().append(header);
                $('.recruit_body').empty().append(body);
                $('.comment_area').empty().append(footer);
                
                // 크루장인지 확인하여 버튼 처리
                if (leader_chk === 1) {
                	// 크루장인 경우 comment_area 크기 변경
                	$('div.comment_area').css({
                		'max-height': 610
                	})
                	
                    $('#joinButton').text('신청자 관리하기').attr('onclick', 'apply_manage()'); // 크루장일 경우 버튼 텍스트 변경
                    $('#commentAskSection').hide(); // 크루장일 경우 문의하기 섹션 숨김
                } else {
                    $('#joinButton').click(function() {
                        joinCrew(currentUserId, idx); // 크루원일 경우 입단 신청 처리
                    });
                }
            },
            error: function(e) {
                console.log(e);
                modal.showAlert('모집게시글 정보가져오기 실패.');
            }
        });
    }

    function joinCrew(userId, boardId) {
        $.ajax({
            url: 'join_crew.ajax', // 입단 신청 처리 URL
            type: 'POST',
            data: {
                // 크루가입신청 crew_join테이블 - crew_idx크루idx, join_id신청자ID, status(1: 신청)
            },
            success: function(data) {
                if (data.success) {
                    $('#joinButton').text('입단 신청 완료').prop('disabled', true); // 버튼 텍스트 변경 및 비활성화
                } else {
                    modal.showAlert('입단 신청 실패: ' + data.message);
                }
            },
            error: function() {
                modal.showAlert('입단 신청 처리 중 오류가 발생했습니다.');
            }
        });
    }

    function apply_manage() {
        // 크루장일 경우 신청자 관리 페이지로 이동
        // 여기서 세션ID를 한번더 체크해줄 예정...ID값은 여기서 넣어줄 필요없이 sessionID를 활용해서 controller에서 처리.
        location.href = 'manage_applicants.do';
    }
	
    function reply(obj) {
    	// 문의댓글 정보가져오기.
        var comment_idx = $(obj).data('comment-idx');
    	// 게시글페이지 정보가져오기.
        var board_idx = <%=idx%>; 
		// 답변입력영역 생성.
        var reply_area = '<div class="comment_box reply_write">'
            + '<form action="crew_recruit_detail.do?idx=' + board_idx + '" method="post">'
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
    
    
    var info;
    
    // 모달창을 띄우는 함수
	function my_modal(obj) {
    	
		// 이미 열려 있는 모달이 있는지 체크
	    if ($('.modal:visible').length) {
	        return; // 이미 열려있다면 아무 것도 하지 않음
	    }
		
	 	// 모달창 수정/삭제 버튼
   		$('.modal_edit_delete .btn_save').prop('hidden', true);
   		$('.modal_edit_delete .btn_update').prop('hidden', false);
   		$('.modal_edit_delete .btn_delete').prop('hidden', false);
		
		var modal = $(obj).data('modal');
		
		info = {
			'board_idx': board_idx,	
			'content_chk': $(obj).data('content_chk'),	
			'comment_idx': $(obj).data('comment_idx'),
			'comment_id': $(obj).data('comment_id'),
		}
		// add버튼 위치좌표		
		var offset = $(obj).offset();
		
		// 열려 있는 모달이 있을 경우
	    if ($('.modal:visible').length) {
	        $('.modal:visible').fadeOut(function() {
	            // 기존 모달이 닫힌 후 새로운 모달을 열기
	            showModal(modal, offset, obj);
	        });
	    } else {
	        // 열려 있는 모달이 없을 경우 바로 새로운 모달 열기
	        showModal(modal, offset, obj);
	    }
	    
		// 브라우저 및 comment_area 스크롤 비활성화
	    $('.comment_area').css({
	    	'overflow-y': 'hidden'
	    });
	    document.body.style.overflow = 'hidden';
	}
    
	// 모달표시
	function showModal(modal, offset, obj){
		// 스크롤 위치를 고려하여 top 값 조정
	    var scrollTop = $(window).scrollTop(); // 현재 스크롤 위치
	    $(modal).css({
	        top: offset.top - scrollTop, // 스크롤 위치 추가
	        left: offset.left
	    });
		
		$(modal).fadeIn(); // 모달표시
	}
    
    // 수정 버튼 클릭 시 
    $('.btn_update').click(function() {
        // 크루정보 수정 페이지로 이동. (크루idx, 크루장ID, 등... 넘겨줘야함.)
        // 댓글인 경우
       	if(info.content_chk === 0){
       		
       		$('#0_' + info.comment_idx).prop("disabled", false);
       		
       		$('#0_' + info.comment_idx).css({
       			'opacity' : '1',
       			'background-color' : '#FAFAFB',
       			'color': 'black'
       		});
       		
       	}else{
       		$('#1_' + info.comment_idx).prop("disabled", false);
       		
       		$('#1_' + info.comment_idx).css({
       			'opacity' : '1',
       			'background-color' : '#FAFAFB',
       			'color': 'black'
       		});
       		
       	}
        
     	// 수정/삭제 버튼 변경 => 모달창 저장
   		$('.modal_edit_delete .btn_save').prop('hidden', false);
   		$('.modal_edit_delete .btn_update').prop('hidden', true);
   		$('.modal_edit_delete .btn_delete').prop('hidden', true);
   		
    });

    // 저장하기 버튼 클릭 시
    $('.btn_save').click(function() {
    	
    	if(info.content_chk === 0){
    		info.content = $('#0_' + info.comment_idx).val();
    	}else{
    		info.content = $('#1_' + info.comment_idx).val();
    	}
    	
    	info.event = 'update';
    	// Ajax함수 실행.
    	modal_event();
		
    	// 모달창 닫기 
    	$(this).closest('.modal').fadeOut();
        
        // 브라우저 및 comment_area 스크롤 활성화
        $('.comment_area').css({
      		'overflow-y': 'scroll'
	    })
        document.body.style.overflow = 'auto';
        
    });
    
    // 삭제하기 버튼 클릭 시
    $('.btn_delete').click(function(){
    	
    	if(info.content_chk === 0){
    		info.content = $('#0_' + info.comment_idx).val();
    	}else{
    		info.content = $('#1_' + info.comment_idx).val();
    	}
    	
    	info.event = 'delete';
		// Ajax함수 실행.
		modal_event();
		
		$(this).closest('.modal').fadeOut();
        
        // 브라우저 및 comment_area 스크롤 활성화
        $('.comment_area').css({
      		'overflow-y': 'scroll'
	    })
        document.body.style.overflow = 'auto';
    });
    
    // 신고하기 버튼 클릭 시
    $('.btn_report').click(function() {
    	info.event = 'report';
		// Ajax함수 실행.
		modal_event();
		
		$(this).closest('.modal').fadeOut();
        
        // 브라우저 및 comment_area 스크롤 활성화
        $('.comment_area').css({
      		'overflow-y': 'scroll'
	    })
        document.body.style.overflow = 'auto';
    });
    
    // 취소 버튼 클릭 시 모달 닫기
    $('.btn_cancel').click(function() {
		$(this).closest('.modal').fadeOut();
		
		// 댓글인 경우
       	if(info.content_chk === 0){
       		
       		$('#0_' + info.comment_idx).prop("disabled", true);
       		
       		$('#0_' + info.comment_idx).css({
       			'opacity' : '0.5',
       			'background-color' : '#282b34',
       			'color': '#e9ecef'
       		});
       		
       	}else{
       		$('#1_' + info.comment_idx).prop("disabled", true);
       		
       		$('#1_' + info.comment_idx).css({
       			'opacity' : '0.5',
       			'background-color' : '#282b34',
       			'color': '#e9ecef'
       		});
       		
       	}
        
        // 브라우저 및 comment_area 스크롤 활성화
        $('.comment_area').css({
      		'overflow-y': 'scroll'
	    })
        document.body.style.overflow = 'auto';
        
    });
    
    
    // Ajax - 모달 Event
    function modal_event(){
    	
    	console.log('last info : ', info);
    	
    	// 객체를 JSON 문자열로 변환
    	var json_info = JSON.stringify(info);
    	
    	$.ajax({
    		method: 'POST',
    		url: 'comment_event.ajax',
    		contentType: 'application/json', 
    		dataType: 'JSON',
    		data: json_info,
    		success: function(data){
   				console.log('데이터 처리완료');
   				
   				// 저장 또는 삭제 버튼을 누르면 새로고침.
   				location.href='crew_recruit_detail.go?idx=' + board_idx;
   				
   				// 신고하기 버튼누르면 신고페이지로 이동.
   				/* location.href = 'crew_report.go?idx=' + ; */
   				// report테이블 board_type신고글유형(2:댓글), reporter_id신고자ID, reported_id피신고자ID, board_idx댓글idx, report_prog처리상태(1:처리전)   
    		},
    		error: function(e){
    			console.log(e);
    		}
    	});
    }
    
</script>
</html>