<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitMATE</title>
    <link rel="stylesheet" type="text/css" href="resources/css/admin_common.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/admin_login.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
        var index = -1;
        var state = '${state}';
        var msg = '${msg}';
    </script>
</head>
<body>
<div class="container">
    <c:import url="layout/admin_leftnav.jsp" />
    <div class="right_wrapper">
        <c:import url="layout/admin_header.jsp" />
        <div class="title">
            <h2>로그인</h2>
        </div>
        <div class="contents narrow">
            <form action="admin_login.do" method="post">
                <c:if test="${addr == null}">
                    <input type="hidden" name="addr" value="redirect:/admin_dashboard.go" />
                </c:if>
                <c:if test="${addr != null}">
                    <input type="hidden" name="addr" value="${addr}" />
                </c:if>
                <div class="list">
                    <h3 class="capt">아이디</h3>
                    <p><input type="text" class="full thick" name="admin_id" value="${admin_id}" /></p>
                    <h3 class="msg caution checkid hide">아이디를 확인하세요.</h3>
                </div>
                <div class="list">
                    <h3 class="capt">비밀번호</h3>
                    <p><input type="password" class="full thick" name="pw" value="${pw}" /></p>
                    <h3 class="msg caution checkpw hide">비밀번호를 확인하세요.</h3>
                </div>
                <div class="list">
                    <input type="submit" class="full mainbtn thick" value="로그인" />
                </div>
            </form>
            <div class="list">
                <button type="button" onclick="location.href='member_login.go'" class="full subbtn thick">돌아가기</button>
            </div>
        </div>
    </div>
</div>
<c:import url="layout/modal.jsp" />
</body>
<script src="resources/js/admin_common.js"></script>
<script src="resources/js/member_login.js"></script>
</html>