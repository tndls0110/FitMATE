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
	margin: 5% 0;
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
	background-color: #282b34;
	border-radius: 4px;
	padding: 5% 5%;
}

div.comment {
	position: relative;
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

div.comment button.mainbtn.minbtn {
	position: absolute;
	bottom: 0;
	right: 0;
}

div.recomment {
	width: 90%;
	margin: 3% 0%;
}

.mainbtn {
	position: absolute;
	bottom: 0;
	right: 0;
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
					<span><i class="bi bi-geo-alt-fill"></i> 서울 금천구</span> <span><i
						class="bi bi-people-fill"></i> 23명</span> <span><i
						class="bi bi-fonts"></i> 312개</span> <span><i
						class="bi bi-calendar-event"></i> 2024-10-14</span>
				</div>

			</div>


			<hr />
			<div>크루 소개글</div>
			<hr />

			<!-- 버튼 크기 최대 -->
			<!-- [input type="submit"]에도 동일하게 적용 가능 -->

			<button class="mainbtn full">크루 입단 신청하기</button>

			<!-- //버튼 크기 최대 -->

			<!-- 기본 입력창 -->
			<!-- class="full": width=100% -->
			<div class="comment">
				<h3 class="capt">
					<i class="bi bi-chat-left-fill"></i>&nbsp;문의하기
				</h3>
				<p>
					<textarea class="full" name="comment"></textarea>
				</p>
				<button class="mainbtn">작성하기</button>
			</div>
			<!-- //기본 입력창 -->


			<div class="comment_area">
				<div class="comment">
					문의댓글 뿌려줄 영역입니다.
					<button type="button" class="add_button">
						<i class="bi bi-three-dots-vertical"></i>
					</button>
					<button class="mainbtn minbtn">답변하기</button>
					<br /> 1234 <br /> 5678
				</div>
				<hr />
				<div class="comment">
					문의댓글 뿌려줄 영역2입니다.
					<button type="button" class="add_button">
						<i class="bi bi-three-dots-vertical"></i>
					</button>
					<button class="mainbtn minbtn">답변하기</button>

					<br /> 9101112 <br /> 13141516
				</div>

				<!-- 경고 -->

			</div>
			<div class="recomment">
				<h3 class="capt">
					<i class="bi bi-arrow-return-right"></i>&nbsp;답변하기
				</h3>
				<p>
					<textarea class="full" name="comment"></textarea>
				</p>
				<!-- <p class="confirm"><input type="password" class="full caution" name="pwconfirm" /></p> -->
				<!--  <h3 class="msg caution">비밀번호와 비밀번호 확인 값은 동일해야 합니다.</h3> -->
				<button class="mainbtn">작성하기</button>
			</div>
		</div>

	</div>
	<c:import url="layout/modal.jsp"></c:import>
</body>
<script src="resources/js/common.js"></script>
</html>