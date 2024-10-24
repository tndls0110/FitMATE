<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FitMATE</title>
		<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<style>
			.recruit_left{
			    /* position: absolute; 
			    left: 50%; */
			    width: 15%;
			    aspect-ratio: 1;
			    border: 1px solid black;
			    border-radius: 50%;
			}
			
			div.recruit_right{
				position: absolute;
				top: -11%;
				left: 20%;
				width: 80%;
			}
			
			div.recruit_right span{
				width: 100%;
			}
			
			.text_area{
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
			
			h2.title{
				margin: 0;
			}
			
			div.recruit_header{
				position: relative;
				margin: 5% 0;
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
					<img class="recruit_left" src="resources/img/cloth_alike_op30.png"/><div class="recruit_right"><h2 class="title">item.crew_name</h2><span class="text_area"><span> + item.leader_name + </span><span> ( + item.leader_mbti + )</span></span></div>
					
					<div>
						<span>서울 금천구</span>
						<span>23명</span>
						<span>312개</span>
						<span>2024-10-14</span>
					</div>
					
				</div>
				
				
				<hr/>
					<div>크루 소개글</div>
				<hr/>
				
				
				<!-- 버튼 크기 최대 -->
                   <!-- [input type="submit"]에도 동일하게 적용 가능 -->
                   <div class="list">
                       <button class="mainbtn full">크루 입단 신청하기</button>
                   </div>
                   <!-- //버튼 크기 최대 -->
				
			
               	<!-- 기본 입력창 -->
               	<!-- class="full": width=100% -->
                   <div class="list">
                       <h3 class="capt">💬 문의하기</h3>
                       <p><textarea class="full" name="comment"></textarea></p>
                       <button class="mainbtn">작성하기</button>
                   </div>
                <!-- //기본 입력창 -->
                   
                   <!-- 경고 -->
                   <div class="list">
                       <h3 class="capt">↪ 답변하기</h3>
                       <p><textarea class="full" name="comment"></textarea></p>
                       <button class="mainbtn">작성하기</button>
                       <!-- <p class="confirm"><input type="password" class="full caution" name="pwconfirm" /></p> -->
                      <!--  <h3 class="msg caution">비밀번호와 비밀번호 확인 값은 동일해야 합니다.</h3> -->
                   </div>
                   
                   
                   <!-- 버튼 설정 -->
                   <!-- class="full": width=100% -->
                   <!-- class="minbtn": 작은 버튼 -->
                   
                   <!-- class="mainbtn": 녹색 버튼 -->
                   <!-- class="subbtn": 흰색 버튼 -->
                   <!-- class="textbtn": 텍스트 버튼 -->
                   
                   
                   
                   
                   <!-- 버튼 크기 최소 -->
                   <!-- [input type="submit"]에는 적용 불가 -->
                   <div class="list">
                       <button class="mainbtn minbtn">답변하기</button>
                   </div>
                   <!-- //버튼 크기 최소 -->
				
			</div>
		</div>
		<c:import url="layout/modal.jsp"></c:import>
	</body>
	<script src="resources/js/common.js"></script>
</html>