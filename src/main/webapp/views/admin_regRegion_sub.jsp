<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitMATE</title>
    <link rel="stylesheet" type="text/css" href="resources/css/admin_common.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/admin_regData.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
        var index = 6;
    </script>
</head>
<body>
<div class="container">
    <c:import url="layout/admin_leftnav.jsp" />
    <div class="right_wrapper">
        <c:import url="layout/admin_header.jsp" />
        <div class="title">
            <h2>지역 정보 관리</h2>
        </div>
        <ul class="noDesc menu_tab">
            <li>
                <a href="admin_regRegion.go">지역</a>
            </li>
            <li class="active_tab">
                <a href="admin_regRegion_sub.go?region_idx=1">세부 지역</a>
            </li>
        </ul>
        <div class="contents narrow">
            <p>
                <select name="region" class="full bg_dark" onchange="onOptionChange(event)">
                    <c:forEach items="${region}" var="list">
                        <option name="region" value="${list.region_idx}">${list.region_name}</option>
                    </c:forEach>
                </select>
            </p>
            <h3 class="capt">기존 항목</h3>
            <ul class="noDesc narrow">
                <c:forEach items="${list}" var="list">
                    <li>
                        <form id="${list.regions_idx}" action="admin_updateRegion_sub.do" method="post">
                            <div class="btn_flex narrow">
                                <input type="hidden" name="region_idx" />
                                <input type="hidden" name="regions_idx" value="${list.regions_idx}" />
                                <input type="hidden" name="reg_type" value="update" />
                                <div class="width80p">
                                    <input type="text" name="regions_name" value="${list.regions_name}" maxlength="1000" class="full flex_left" onblur="regData('update', ${list.regions_idx})" />
                                </div>
                                <div class="width20p">
                                    <input type="button" value="삭제" class="disabledbtn full flex_right" onclick="regData('delete', ${list.regions_idx})" />
                                </div>
                            </div>
                        </form>
                    </li>
                </c:forEach>
            </ul>
            <form id="insert" action="admin_insertRegion_sub.do" method="post">
                <ul class="noDesc narrow">
                    <li>
                        <h3 class="capt">항목 추가</h3>
                        <input type="hidden" name="region_idx" />
                        <div class="btn_flex narrow">
                            <div class="width80p">
                                <input type="text" name="regions_name" class="full flex_left" placeholder="추가할 항목을 입력하세요." />
                            </div>
                            <div class="width20p">
                                <input type="submit" value="추가" class="mainbtn full flex_right" />
                            </div>
                        </div>
                    </li>
                </ul>
            </form>
            <button class="textbtn full goTrash">삭제한 항목 보기</button>
        </div>
    </div>
</div>
<c:import url="layout/modal.jsp" />
</body>
<script src="resources/js/admin_common.js"></script>
<script src="resources/js/admin_regData.js"></script>
<script src="resources/js/admin_regRegion.js"></script>
</html>