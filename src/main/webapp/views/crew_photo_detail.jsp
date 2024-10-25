<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FitMATE</title>
		<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<style>
		
		/*내용 작성란 스타일 크기 조절*/
		#contentInput {
        height: 300px; /* 원하는 높이 설정 */
        resize: none; /* 사용자가 크기를 조절할 수 없도록 설정 (선택 사항) */
    }
    	/* 글자수 카운팅하는 부분 스타일 */
         #charCount {
            font-weight: bold; /* 글자 수 강조 */
            margin-top: 5px; /* 위쪽 여백 */
        }
        
        
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
				<!-- 크루 생성자 id  value에 로그인 세션값 넣어주기 -->
				
				<!-- 제목 -->
				<h2 class="title">크루이름<span>사진게시글</span></h2>

                   
                    <div id="img_list" class="list">
   							<img alt="${file.ori_filename}" src="/photo/${file.new_filename}"><br/>
                    </div>  
             			
                    <!-- 버튼이 붙은 입력창 -->
                    <div class="list">
                        <h3 class="capt">게시글내용</h3>
                        
                        <div class="recruit_header">
				<!-- item.leader_profile -->
				
				<!-- 이미지가 있을경우 -->
				<c:if test="${not empty member.profile}">
				 <img class="recruit_left" src="/photo/${member.profile}"/> 
				</c:if>
				<!-- 이미지가 없을경우 -->
				<c:if test="${empty member.profile}">
				<i class="bi bi-person-circle" style="font-size: 60px;">${member.profile}</i>
				</c:if>
				<div class="list">

				<div class="recruit_right">
					<h2 class="title">${member.nick}</h2>
					<span class="text_area"><span> ${board.board_id} </span><span>
							${member.profile}</span></span>
				</div>

				<div class="recruit_info">
					<span><i class="bi bi-geo-alt-fill">어떤</i></span> 
					<span><i class="bi bi-people-fill">값을</i></span>
					<span><i class="bi bi-fonts">넣을</i></span> 
					<span><i class="bi bi-calendar-event">옵션버튼넣기</i></span>
				</div>
				<div>
				<div class="list">
				 <p><textarea  class="full pass" name="content" id="contentInput" readonly/>${board.content}</textarea></p>
					
				</div>
			</div>
                       
                    </div>

			</div>
		</div>
		<c:import url="layout/modal.jsp"></c:import>
	</body>
	
	<script>	
	 var file = "${file}"; // EL을 사용하여 모델 값 가져오기
     console.log(file); // 콘솔에 출력
	 
     var board = "${board}"; // EL을 사용하여 모델 값 가져오기
     console.log(board); // 콘솔에 출력

     var member = "${member.nick}"; // EL을 사용하여 모델 값 가져오기
     console.log(member); // 콘솔에 출력
     console.log(member.profile);
     
	</script>
	<script src="resources/js/common.js"></script>
</html>