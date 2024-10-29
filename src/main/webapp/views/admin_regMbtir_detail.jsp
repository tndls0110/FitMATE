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
            <h2>헬스 MBTI 정보 관리</h2>
        </div>
        <ul class="noDesc menu_tab wide">
            <li>
                <a href="admin_regMbtiq.go">질문</a>
            </li>
            <li>
                <a href="admin_regMbtiq_sub.go?mbtiq_idx=1">세부 질문</a>
            </li>
            <li>
                <a href="admin_regMbtiq_scr.go?mbtisub_idx=1">질문별 점수</a>
            </li>
            <li>
                <a href="admin_regMbtir.go">결과</a>
            </li>
            <li class="active_tab">
                <a href="admin_regMbtir_detail.go?mbtir_idx=1">결과 상세</a>
            </li>
        </ul>
        <div class="contents narrow">
            <p>
                <select class="full bg_dark" onchange="onOptionChange(event)">
                    <c:forEach items="${mbtir}" var="mbtir">
                        <option name="mbtir" value="${mbtir.mbtir_idx}">${mbtir.mbtir_name}</option>
                    </c:forEach>
                </select>
            </p>
            <form action="admin_updateMbtir.do" method="post" enctype="multipart/form-data">
                <input type="hidden" name="reg_type" value="update" />
                <ul class="noDesc">
                    <li>
                        <h3 class="capt">결과 이름</h3>
                        <p><input type="text" name="mbtir_name" value="${list.mbtir_name}" class="full" /></p>
                    </li>
                    <li>
                        <h3 class="capt">이미지 파일</h3>
                        <p>
                            <div class="img_preview hide">
                                <img src="resources/img/${list.mbtir_img}" alt="${list.mbtir_name} 이미지 파일" />
                            </div>
                        </p>
                        <p><input type="file" name="mbtir_img" value="${list.mbtir_img}" onchange="readFile(this)" class="full" multiple /></p>
                    </li>
                    <li>
                        <h3 class="capt">설명</h3>
                        <p><textarea name="mbtir_con" class="full">${list.mbtir_con}</textarea></p>
                    </li>
                    <li>
                        <h3 class="capt">추천하는 운동</h3>
                        <p><textarea name="mbtir_exc" class="full">${list.mbtir_exc}</textarea></p>
                    </li>
                    <li>
                        <h3 class="capt">추천하는 루틴</h3>
                        <p><textarea name="mbtir_rou" class="full">${list.mbtir_rou}</textarea></p>
                    </li>
                </ul>
                <ul class="noDesc">
                    <li>
                        <p><input type="button" value="수정하기" class="full mainbtn" onclick="regData('update')" /></p>
                    </li>
                    <li>
                        <p><input type="button" value="삭제하기" class="full subbtn" onclick="regData('delete')" /></p>
                    </li>
                </ul>
            </form>
        </div>
    </div>
</div>
<c:import url="layout/modal.jsp" />
</body>
<script src="resources/js/admin_common.js"></script>
<script src="resources/js/admin_regMbtiR.js"></script>
</html>