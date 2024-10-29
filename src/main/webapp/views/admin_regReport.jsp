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
        var index = 8;
    </script>
</head>
<body>
<div class="container">
    <c:import url="layout/admin_leftnav.jsp" />
    <div class="right_wrapper">
        <c:import url="layout/admin_header.jsp" />
        <div class="title">
            <h2>신고 사유 관리</h2>
        </div>
        <div class="contents narrow">
            <h3 class="capt">기존 항목</h3>
            <ul class="noDesc narrow">
                <c:forEach items="${list}" var="list">
                    <li>
                        <form id="${list.reportr_idx}" action="admin_updateReport.do" method="post">
                            <div class="btn_flex narrow">
                                <input type="hidden" name="reportr_idx" value="${list.reportr_idx}" />
                                <input type="hidden" name="reg_type" value="update" />
                                <div class="width80p">
                                    <input type="text" name="reportr_con" value="${list.reportr_con}" class="full flex_left" onblur="regData('update', ${list.reportr_idx})" />
                                </div>
                                <div class="width20p">
                                    <input type="button" value="삭제" class="subbtn full flex_right" onclick="regData('delete', ${list.reportr_idx})" />
                                </div>
                            </div>
                        </form>
                    </li>
                </c:forEach>
            </ul>
            <form id="insert" action="admin_insertReport.do" method="post">
                <ul class="noDesc narrow">
                    <li>
                        <h3 class="capt">항목 추가</h3>
                        <div class="btn_flex narrow">
                            <div class="width80p">
                                <input type="text" name="reportr_con" class="full flex_left" placeholder="추가할 항목을 입력하세요." />
                            </div>
                            <div class="width20p">
                                <input type="submit" value="추가" class="mainbtn full flex_right" />
                            </div>
                        </div>
                    </li>
                </ul>
            </form>
        </div>
    </div>
</div>
<c:import url="layout/modal.jsp" />
</body>
<script src="resources/js/admin_common.js"></script>
<script src="resources/js/admin_regData.js"></script>
</html>