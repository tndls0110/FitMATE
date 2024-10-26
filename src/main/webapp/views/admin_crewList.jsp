<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitMATE</title>
    <link rel="stylesheet" type="text/css" href="resources/css/admin_common.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<div class="container">
    <c:import url="layout/admin_leftnav.jsp">
        <c:param name="page" value="5"></c:param>
    </c:import>
    <div class="right_wrapper">
        <c:import url="layout/admin_header.jsp"></c:import>
        <div class="title">
            <h2>크루 목록</h2>
        </div>
        <div class="contents"></div>
    </div>
</div>
<c:import url="layout/modal.jsp"></c:import>
</body>
<script src="resources/js/admin_common.js"></script>
<script>
    var msg = '${msg}';
</script>
</html>