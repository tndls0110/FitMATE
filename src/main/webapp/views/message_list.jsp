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

	div.headerArea{
		text-align: center;
		padding: 0 10%;
	}
	
	div.searchArea{
		position: relative;
	}
	input.searchKeyword{
		margin-top : 30px;
	 	width: 35.5%;
	}
	
	select#searchFilter{
		width: 16%;
	}
	
	div.recruitArea{
		width: 90%;
		margin-top: 30%;
		margin-left: auto;
		margin-right: auto;
		display: flex;
		flex-wrap: wrap;
		text-align:center;
	}
	
	div.recruit{
		width: 40%;
		margin: 3% 1%;
		background-color: #282b34;
		flex: 1 1 40%;
		align-content: left; 
	}
	
	div.recruit_odd{
		width: 48%;
		margin: 3% 1%;
		background-color: #282b34;
		align-content: left; 
		
	}
	
	h1.capt{
		position : realative;
		width : 200px;
		margin-top : 50px;
		margin-left : 350px;
	}
	
	h2.capt{
		position : realative;
		width : 200px;
		margin-top : -50px;
		margin-left : 430px;
	}
	
	
	h3.capt{
		position: absolute;
		width: 50%;
	    top: 0px;
    	left: 14%;
	}
	
	
</style>
</head>

<body>
	<div class="container">
		<c:import url="layout/leftnav_4.jsp"></c:import>

		<!-- 넓은 화면으로 작성할 시 class="contents" -->
		<!-- 좁은 화면으로 작성할 시 class="contents narrow" -->
		<div class="contents">
			<h1 class="capt">메시지</h1>
			<h2 class="capt">목록</h2>
			<div class="headerArea">
				<div class="searchArea">
					<h3 class="capt">멤버 검색</h3>
					<div class="list">
						<select name="searchFilter" id="searchFilter">
							<option value="" selected>검색설정</option>
							<option value="1">ID</option>
							<option value="2">닉네임</option>
						</select>
						<input type="text" class="searchKeyword" name="searchKeyword" placeholder="ID 혹은 닉네임을 선택해 입력하세요." />
						<button type="button" onclick="search()">검색</button>
					</div>	
				</div>	
			</div>	
		</div>
	</div>
</body>
<script src="resources/js/common.js"></script>
<script>
</script>

</html>