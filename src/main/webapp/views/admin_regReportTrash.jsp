<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitMATE</title>
    <link rel="stylesheet" type="text/css" href="resources/css/admin_common.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/admin_regData.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
        var index = 7;
    </script>
</head>
<body>
<div class="container">
    <c:import url="layout/admin_leftnav.jsp" />
    <div class="right_wrapper">
        <c:import url="layout/admin_header.jsp" />
        <div class="title">
            <h2>신고 사유 관리 > 삭제한 항목</h2>
        </div>
        <div class="contents narrow">
            <h3 class="capt">삭제한 항목</h3>
            <ul class="noDesc narrow">
                <c:forEach items="${list}" var="list">
                    <li>
                        <form id="${list.reportr_idx}" action="admin_restoreReport.do" method="post">
                            <div class="btn_flex narrow">
                                <input type="hidden" name="reportr_idx" value="${list.reportr_idx}" />
                                <input type="hidden" name="reg_type" value="update" />
                                <div class="width80p">
                                    <input type="text" name="reportr_con" value="${list.reportr_con}" maxlength="1000" class="full flex_left" readonly />
                                </div>
                                <div class="width20p">
                                    <input type="submit" value="복구" class="disabledbtn full flex_right" />
                                </div>
                            </div>
                        </form>
                    </li>
                </c:forEach>
            </ul>
            <button onclick="location.href='admin_regReport.go'" class="textbtn full">돌아가기</button>
        </div>
    </div>
</div>
<c:import url="layout/modal.jsp" />
</body>
<script src="resources/js/admin_common.js"></script>
<script src="resources/js/admin_regData.js"></script>
</html>