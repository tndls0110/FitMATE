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
.recruit_left {
	/* position: absolute; 
			    left: 50%; */
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

/* div.recruit_right {
	position: absolute;
	top: -4%;
	left: 20%;
	width: 80%;
} */

div.recruit_header .recruit_right{
	position: absolute;
	top: -4%;
	left: 20%;
	width: 80%;
}
.comment .recruit_right, .comment_reply .recruit_right{
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
	/* 영역을 넘어가는 경우 숨김처리.  */
	overflow: hidden;
	/* 숨겨지는 부분에 말줄임표(...)표시 */
	text-overflow: ellipsis;
	/* 줄바꿈 방지 */
	white-space: nowrap;
}


h2.title {
	margin: 0;
}

div.recruit_header {
	position: relative;
	margin-top: 5%;
	height: 15%;
}

div.recruit_body {
	position: relative;
}

div.recruit_footer {
	position: relative;
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
	overflow-y: scroll;
    overflow-x: hidden;
	background-color: #282b34;
	border-radius: 4px;
	padding: 5% 5%;
	height: 45%;
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
	right: 0;
	padding: 0;
	margin: 0;
}

div.comment .mainbtn.minbtn {
	position: absolute;
	bottom: 0;
	right: 10%;
}

div.recomment {
	position: absolute;
	width: 90%;
}

div.comment_ask, div.comment_reply{
	height: 18%;
	position: relative;
	margin: 5% 0;
}

div.comment_reply{
	height: 45%;
	position: relative;
	margin: 5% 0;
}

div.comment_ask .mainbtn{
	position: absolute;
	bottom: 0;	
	right: 0;
}

div.comment_reply .mainbtn{
	position: absolute;
	bottom: 0;	
	right: 0;
}

div.reply_right{
	position: absolute;
	right: 0;
	width: 90%; 
}

textarea, hr{
	border: 1px solid white;
	font-family: 'Noto Sans KR', sans-serif;
	opacity: 0.5;
}

span.txt_opacity{
	opacity: 0.5;	
}

button.reply_close{
	/* display: block; */
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

div.comment_txt{
	margin: 5% 0;
}

div.comment.right{
	margin-top: 0;
}

div.content_right{
	width: 90%;
	margin-left: auto;
}

div.comment_box{
	border-bottom: 1px dashed; 
}
</style>
</head>
<body>
	<% String idx = request.getParameter("idx"); %>
	<div class="container">
		<c:import url="layout/leftnav_1.jsp"></c:import>

		<!-- 넓은 화면으로 작성할 시 class="contents" -->
		<!-- 좁은 화면으로 작성할 시 class="contents narrow" -->
		<div class="contents narrow">
			<div class="recruit_header">

			</div>

			<div class="recruit_body">
				
			</div>
			
			<!-- 기본 입력창 -->
			<!-- class="full": width=100% -->
			<div class="recruit_footer">
				<div class="comment_ask">
					<h3 class="capt">
						<i class="bi bi-chat-left-fill"></i>&nbsp;문의하기
					</h3>
					<form action="crew_recruit_detail.replyDo?idx=<%=idx%>" method="post">
						<p>
							<textarea class="full" name="reply" placeholder="최대 1,000자까지 입력할 수 있습니다."></textarea>
						</p>
						<button class="mainbtn">작성하기</button>
					</form>
				</div>
				<!-- //기본 입력창 -->
	
				<div class="comment_area">
				</div>
				
			</div>			
		</div>

	</div>
	<c:import url="layout/modal.jsp"></c:import>
</body>
<script src="resources/js/common.js"></script>
<script>
	
	var idx = <%=idx%>;
	console.log('idx : ', idx);
;	
	if(idx != '' && idx != null){
		// 1. 모집게시글 Header 정보가져오기
		detail(idx);					
	}else{
		modal.showAlert('모집게시글 idx를 받아오지 못했습니다.');
	}
	
	
	/* data.recruitDetail : 크루정보 관련변수 */
	// 크루명
	var crew_name;
	// 크루idx
	var crew_idx;
	// 게시글idx
	var board_idx;
	// 크루 소개글
	var crew_content;
	// 활동지역 시단위
	var region_name;
	// 활동지역 구단위
	var regions_name; 
	// 크루원 수
	var member_count;
	// 크루장 ID
	var leader_id;
	// 크루장 이름
	var leader_name;
	// 크루장 닉네임
	var leader_nick;
	// 크루장 프로필사진 
	var leader_profile;
	// 크루장 mbti
	var leader_mbti;
	// 전체 게시글 수
	var board_count;
	// 크루 생성일
	var create_date;
	
	/* data.commentAll : 댓글, 대댓글 관련변수 */
	// 댓글, 대댓글 idx
	var comment_idx;
	var recomment_idx;
	// 댓글, 대댓글 작성자 ID
	var comment_id;
	var recomment_id;
	// 댓글, 대댓글 작성자 프로필사진
	var profile;
	// 댓글, 대댓글 작성자 닉네임
	var nick;
	// 댓글, 대댓글 내용
	var content;
	// 댓글, 대댓글 작성일시
	var date;
	
	// 대댓글 존재여부체크 0:존재X / 1:존재O
	var recomment_chk;
	
	
	
	var header = '';
	var body = '';
	var footer = '';
	
	// 대댓글 정보
	var item_reply;
	var reply_area;
	
	function detail(idx){
		$.ajax({
			url : 'crew_recruit_detail.ajax',
			type : 'GET',
			data : {
				'idx' : idx
			},
			dataType : 'JSON',
			success : function(data){
				console.log('data : ', data);
				
				var detail = data.recruitDetail;
				
				// 모집 게시글정보 뿌려주기
				<!-- item.leader_profile -->
				<!-- 이미지가 있을경우 -->
				<!-- <img class="recruit_left" src="resources/img/cloth_alike_op30.png"/> -->
				<!-- 이미지가 없을경우 --> 
				header = '<i class="bi bi-person-circle" style="font-size: 60px;"></i>' 
						+ '<div class="recruit_right">'
					  		+ '<h2 class="title">'
						   		+ detail.crew_name
		   					+ '</h2>'
						    + '<span class="text_area"><span class="txt_opacity">크루장</span><span>&nbsp;&nbsp;' 
								+ detail.leader_name 
				  		    + '</span><span>&nbsp;('
				  		  		+ detail.leader_mbti 
						    + ')</span></span>'
						+ '</div>'
						+ '<div class="recruit_info">'
							+ '<span><i class="bi bi-geo-alt-fill">'
									+ detail.region_name + ' ' + detail.regions_name
							+ '</i></span>' 
							+ '<span><i class="bi bi-people-fill">'
									+ detail.member_count
							+ '</i></span>'
							+ '<span><i class="bi bi-fonts">'
								+ detail.board_count  
							+ '개</i></span>' 
							+ '<span><i class="bi bi-calendar-event">'
								+ detail.create_date
							+ '</i></span>'
						+ '</div><hr/>';
				
				body = '<div>'
					 	+ detail.crew_content
				     + '</div><hr/>'
				     + '<div>'
				     	+ '<button class="mainbtn full">크루 입단 신청하기</button>'
				     + '</div>';
						
				// 댓글-대댓글정보 뿌려주기
				$(data.commentAll).each(function(idx, item){
					
					console.log('item : ', item.content);
					
					footer += '<div class="comment_box">'
								+ '<div class="comment">'
										+ '<i class="bi bi-person-circle" style="font-size: 40px;"></i>'
										+ '<div class="recruit_right">'
									  		+ '<h2 class="title">'
						   					+ '</h2>'
										    + '<span class="text_area">'
						   						+ '<span>&nbsp;&nbsp;' 
													+ item.nick
								  		    	+ '</span></br>'
						   						+ '<span>&nbsp;'
								  		  			+ item.date 
										    	+ '</span>'
							  		    		+ '</span>'
										+ '</div>'
									+ '<div class="comment_txt">' + item.content + '</div>';
					// 대댓글이 없을 때 추가. 									
					if(item.recomment_chk != 1){
						footer += '<button class="mainbtn minbtn" onclick="reply(this)">답변하기</button>';	
					}									
									
					footer += '<button type="button" class="add_button">'
						+ '<i class="bi bi-three-dots-vertical"></i>'
						+ '</button>'
					+ '</div>';
				
									  	
					
					console.log('recomment_chk : ', item.recomment_chk);		
					// 대댓글이 존재하는 경우 대댓글 추가	
					if(item.recomment_chk == 1){
						item_reply = item.replyDTO;
						console.log('item_reply : ', item_reply);
						
						footer += '<div class="content_right">'
									+ '<i class="bi bi-arrow-return-right"></i>'
									+ '<div class="comment right">'
										+ '<i class="bi bi-person-circle" style="font-size: 40px;"></i>'
										+ '<div class="recruit_right">'
									  		+ '<h2 class="title">'
						   					+ '</h2>'
										    + '<span class="text_area">'
						   						+ '<span>&nbsp;&nbsp;' 
													+ item_reply.nick
								  		    	+ '</span>'
						   						+ '<span style="color: #048187">(크루장)</span></br>'
						   						+ '<span>&nbsp;'
								  		  			+ item_reply.date 
										    	+ '</span>'
							  		    		+ '</span>'
										+ '</div>'
									+ '<div class="comment_txt">' + item_reply.content + '</div>'
									+ '<button type="button" class="add_button">'
										+ '<i class="bi bi-three-dots-vertical"></i>'
									+ '</button>'
									+ '</div>'
								+ '</div></div>';	
					}
							
				});
				
				$('.recruit_header').empty();
				$('.recruit_header').append(header);
				$('.recruit_body').empty();
				$('.recruit_body').append(body);
				$('.comment_area').empty();
				$('.comment_area').append(footer);
				
			},
			error : function(e){
				console.log(e); // 에러가 보이지 않도록 추후 처리필요?
	            modal.showAlert('모집게시글 정보가져오기 실패.');	
			}
		});
	}
	
	// 답변하기 버튼은 크루장인 경우에만 표시. & 문의글에만 답변가능.
	function reply(obj){
		reply_area = '<div class="comment_reply">'
						+ '<div class="reply_right">'
							+ '<h3 class="capt">'
								+ '<i class="bi bi-arrow-return-right"></i>&nbsp;답변하기'
							+ '</h3>'
							+ '<p>'
								+ '<textarea name="comment" class="recomment" placeholder="최대 1,000자까지 입력할 수 있습니다."></textarea>'
							+ '</p>'
						+ '</div>'
						+ '<button class="mainbtn">작성하기</button>'
						+ '<button type="button" onclick="reply_close(this)" class="reply_close"><i class="bi bi-x-circle">닫기</i></button>'
					+ '</div>';
					
		$(obj).parent().append(reply_area);
		$(obj).remove();
	}
	
	// 답변 Area 삭제
	function reply_close(obj){
		$(obj).parent().parent().append('<button class="mainbtn minbtn" onclick="reply(this)">답변하기</button>');
		$(obj).parent().remove();		
	}

	
</script>

</html>