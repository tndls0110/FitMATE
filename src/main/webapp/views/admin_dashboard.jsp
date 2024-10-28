<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitMATE</title>
    <link rel="stylesheet" type="text/css" href="resources/css/admin_common.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/admin_board.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/admin_dashboard.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
        var index = 1;
    </script>
</head>
<body>
<div class="container">
    <c:import url="layout/admin_leftnav.jsp" />
    <div class="right_wrapper">
        <c:import url="layout/admin_header.jsp" />
        <div class="title">
            <h2>대시보드</h2>
        </div>
        <div class="contents_flex">
            <div class="contents notice">
                <table>
                    <colgroup>
                        <col width="auto" />
                        <col width="80px" />
                        <col width="80px" />
                    </colgroup>
                    <thead>
                    <tr>
                        <th>내용</th>
                        <th>작성일시</th>
                        <th>게시여부</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${notice}" var="list1">
                        <tr>
                            <td class="left">${list1.notice_cont}</td>
                            <td>${list1.notice_regdate}</td>
                            <td>
                                <c:if test="${list1.notice_show == 1}">
                                    <button class="mainbtn minbtn">게시중</button>
                                </c:if>
                                <c:if test="${list1.notice_show == 0}">
                                    <button class="subbtn minbtn">게시안함</button>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <button onclick="location.href='admin_notice.go'" class="mainbtn full">공지사항 더 보기</button>
            </div>
            <div class="contents report"></div>
        </div>
    </div>
</div>
<c:import url="layout/modal.jsp" />
</body>
<script src="resources/js/admin_common.js"></script>
<script>
    var msg = '${msg}';
</script>
</html>