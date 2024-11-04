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
        var index = 5;
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
        <ul class="noDesc menu_tab">
            <li>
                <a href="admin_regMbtiq.go">질문</a>
            </li>
            <li>
                <a href="admin_regMbtiq_sub.go?mbtiq_idx=1">세부 질문</a>
            </li>
            <li>
                <a href="admin_regMbtir.go">결과</a>
            </li>
            <li class="active_tab">
                <a href="admin_regMbtir_detail.go?mbtir_idx=1">결과 상세</a>
            </li>
        </ul>
        <div class="contents narrow">
            <form action="admin_insertMbtir.do" method="post" enctype="multipart/form-data">
                <input type="hidden" name="reg_type" value="update" />
                <ul class="noDesc">
                    <li>
                        <h3 class="capt">결과 이름</h3>
                        <p><input type="text" name="mbtir_name" maxlength="1000" class="full" /></p>
                    </li>
                    <li>
                        <h3 class="capt">이미지 파일</h3>
                        <p>
                            <div class="img_preview"></div>
                        </p>
                        <p><input type="file" name="mbtir_img" onchange="readFile(this)" class="full" multiple /></p>
                    </li>
                    <li>
                        <h3 class="capt">설명</h3>
                        <p><textarea name="mbtir_con" maxlength="1000" class="full"></textarea></p>
                    </li>
                    <li>
                        <h3 class="capt">추천하는 운동</h3>
                        <p><textarea name="mbtir_exc" maxlength="1000" class="full"></textarea></p>
                    </li>
                    <li>
                        <h3 class="capt">추천하는 루틴</h3>
                        <p><textarea name="mbtir_rou" maxlength="1000" class="full"></textarea></p>
                    </li>
                </ul>
                <ul class="noDesc">
                    <li>
                        <p><input type="submit" value="추가하기" class="full mainbtn" /></p>
                    </li>
                    <li>
                        <p><input type="button" value="목록으로 돌아가기" class="full disabledbtn" onclick="location.href='admin_regMbtir.go'" /></p>
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