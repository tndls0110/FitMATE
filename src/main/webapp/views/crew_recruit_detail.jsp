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

div.recruit_right {
	position: absolute;
	top: -4%;
	left: 20%;
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
	right: 0;
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


</style>
</head>
<body>
	<div class="container">
		<c:import url="layout/leftnav_1.jsp"></c:import>

		<!-- 넓은 화면으로 작성할 시 class="contents" -->
		<!-- 좁은 화면으로 작성할 시 class="contents narrow" -->
		<div class="contents narrow">
			<div class="recruit_header">
				<!-- item.leader_profile -->
				<!-- 이미지가 있을경우 -->
				<!-- <img class="recruit_left" src="resources/img/cloth_alike_op30.png"/> -->
				<!-- 이미지가 없을경우 -->
				<i class="bi bi-person-circle" style="font-size: 60px;"></i>


				<div class="recruit_right">
					<h2 class="title">item.crew_name</h2>
					<span class="text_area"><span> + item.leader_name + </span><span>
							( + item.leader_mbti + )</span></span>
				</div>

				<div class="recruit_info">
					<span><i class="bi bi-geo-alt-fill">서울 금천구</i></span> 
					<span><i class="bi bi-people-fill">23명</i></span>
					<span><i class="bi bi-fonts">312개</i></span> 
					<span><i class="bi bi-calendar-event">2024-10-14</i></span>
				</div>

			</div>

			<div class="recruit_body">
				<hr />
					<div>크루 소개글</div>
				<hr />

				<div>
					<button class="mainbtn full">크루 입단 신청하기</button>
				</div>	
			</div>
			
			<!-- 기본 입력창 -->
			<!-- class="full": width=100% -->
			<div class="recruit_footer">
				<div class="comment_ask">
					<h3 class="capt">
						<i class="bi bi-chat-left-fill"></i>&nbsp;문의하기
					</h3>
					<p>
						<textarea class="full" name="comment">최대 1,000자까지 입력할 수 있습니다.</textarea>
					</p>
					<button class="mainbtn">작성하기</button>
				</div>
				<!-- //기본 입력창 -->
	
	
				<div class="comment_area">
					<div>
						<div class="comment">
							문의댓글 뿌려줄 영역입니다.
							<button type="button" class="add_button">
								<i class="bi bi-three-dots-vertical"></i>
							</button>
							<button class="mainbtn minbtn">답변하기</button>
							<br /> 1234 <br /> 5678
						</div>
					</div>
					<hr />
					<div>
						<div class="comment">
							문의댓글 뿌려줄 영역입니다.
							<button type="button" class="add_button">
								<i class="bi bi-three-dots-vertical"></i>
							</button>
							<button class="mainbtn minbtn">답변하기</button>
							<br /> 1234 <br /> 5678
						</div>
					</div>
					<hr />
					<div>
						<div class="comment">
							문의댓글 뿌려줄 영역입니다.
							<button type="button" class="add_button">
								<i class="bi bi-three-dots-vertical"></i>
							</button>
							<button class="mainbtn minbtn">답변하기</button>
							<br /> 1234 <br /> 5678
						</div>
					</div>
					<hr />
					<div>
						<div class="comment">
							문의댓글 뿌려줄 영역입니다.
							<button type="button" class="add_button">
								<i class="bi bi-three-dots-vertical"></i>
							</button>
							<button class="mainbtn minbtn">답변하기</button>
							<br /> 1234 <br /> 5678
						</div>
					</div>
					<hr />
					<div>
						<div class="comment">
							문의댓글 뿌려줄 영역2입니다.
							<button type="button" class="add_button">
								<i class="bi bi-three-dots-vertical"></i>
							</button>
							<button class="mainbtn minbtn">답변하기</button>
		
							<br /> 9101112 <br /> 13141516
						</div>
						
						<div class="comment_reply">
							<div class="reply_right">
								<h3 class="capt">
									<i class="bi bi-arrow-return-right"></i>&nbsp;답변하기
								</h3>
								<p>
									<textarea name="comment" class="recomment">최대 1,000자까지 입력할 수 있습니다.</textarea>
								</p>
							</div>
							<button class="mainbtn">작성하기</button>
						</div>
					</div>	
				</div>
			</div>			
		</div>

	</div>
	<c:import url="layout/modal.jsp"></c:import>
</body>
<script src="resources/js/common.js"></script>
<script>
	
	var idx = <%= request.getParameter("idx") %>;
	console.log('idx : ', idx);
;	
	if(idx != '' && idx != null){
		// 1. 모집게시글 Header 정보가져오기
		detail(idx);					
	}else{
		modal.showAlert('모집게시글 idx를 받아오지 못했습니다.');
	}
	
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
			},
			error : function(e){
				console.log(e); // 에러가 보이지 않도록 추후 처리필요?
	            modal.showAlert('모집게시글 정보가져오기 실패.');	
			}
		});
	}
</script>

</html>