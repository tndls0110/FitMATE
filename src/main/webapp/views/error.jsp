<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitMATE</title>
    <link rel="stylesheet" type="text/css" href="resources/css/common.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/error.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
        var state = '${state}';
        var msg = '';
    </script>
</head>
<body>
<div class="container">
    <c:import url="layout/leftnav_0.jsp"></c:import>
    <div class="contents narrow">
        <div class="center">
            <h1 class="icon">🫢</h1>
            <h1>오류가 발생했습니다.</h1>
            <p class="capt">(${code}) ${msg}</p>
        </div>
        <div class="list">
            <button type="button" onclick="window.history.back()" class="full subbtn thick">돌아가기</button>
        </div>
    </div>
</div>
<c:import url="layout/modal.jsp"></c:import>
</body>
<script src="resources/js/common.js"></script>
<script src="resources/js/member_login.js"></script>
</html>