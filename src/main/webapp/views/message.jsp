<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> -->

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<html>
<head>
<meta charset="UTF-8">
<title>메시지 목록 페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/common.css" />

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>

	div.contents{
	border: 2px solid white;
	widthd: 1000px;
	height: 1000px;
	
	}


	div.headerArea{
		text-align: center;
		padding: 0 10%;
	}
	
	h1.capt{
		position : realative;
		width : 200px;
		margin-top : 50px;
		margin-left : 300px;
	}
	
	h2.capt{
		position : realative;
		margin-top : -50px;
		margin-left : 380px;
		width: 300px;
	}
	
	div.send_message{
	width : 600px;
	margin: 650px auto;
	}
	
	input.send_chat{
	width: 85%;
	height:60px;
	}
	
	button{
	margin: 8px 0 3px;
    padding: 14px 24px;
    border-radius: 4px;
    font-size: 14px;
    cursor: pointer;
    background-color: cadetblue;
    text-align: center;
    width:80px;
    height:60px;
}
	
</style>
</head>

<body>
	<div class="container">
		<c:import url="layout/leftnav_4.jsp"></c:import>

		<!-- 넓은 화면으로 작성할 시 class="contents" -->
		<!-- 좁은 화면으로 작성할 시 class="contents narrow" -->
		<!-- 메시지 내용이 나올 영역 -->
		<div class="contents">
			<h1 class="capt">메시지</h1>
			<h2 class="capt">상대 회원 닉네임(설정 아직 안함)</h2>
		<!-- 메시지 내용이 쭈르륵 나온다 -->
				<div class="message" name="all_message">
		<!-- 메시지 내용이 나올 자리 -->
				</div>
			<div class="send_message">			
			<input type ="text" class="send_chat" class="send_chat"  placeholder="메시지를 입력하세요">
			<button type="button" onclick="search()">🚀</button>
			</div>
		</div>	
	</div>
</body>
<script src="resources/js/common.js"></script>
<script>
</script>

</html>