<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitMATE</title>
    <link rel="stylesheet" type="text/css" href="resources/css/admin_common.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/admin_board.css" />
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
            <li class="active_tab">
                <a href="admin_regMbtiq_sub.go?mbtiq_idx=1">세부 질문</a>
            </li>
            <li>
                <a href="admin_regMbtir.go">결과</a>
            </li>
            <li>
                <a href="admin_regMbtir_detail.go?mbtir_idx=1">결과 상세</a>
            </li>
        </ul>
        <div class="contents">
            <p>
                <select class="full bg_dark" onchange="onOptionChange(event)">
                    <c:forEach items="${mbtiq}" var="mbtiq">
                        <option name="mbtiq" value="${mbtiq.mbtiq_idx}">${mbtiq.mbtiq_con}</option>
                    </c:forEach>
                </select>
            </p>
            <form>
                <table class="full">
                    <colgroup>
                        <col style="width:310px;" />
                        <c:forEach items="${mbtir}" var="mbtir">
                            <col style="width:auto;" />
                        </c:forEach>
                        <col style="width:40px;" />
                    </colgroup>
                    <thead>
                    <tr>
                        <th>질문</th>
                        <c:forEach items="${mbtir}" var="mbtir">
                            <th>${mbtir.mbtir_name}(점)</th>
                        </c:forEach>
                        <th>복구</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${mbtisub.size() == 0}">
                        <tr>
                            <td colspan="${mbtir.size() + 2}">
                                <input type="text" value="삭제한 항목이 없습니다." class="full" readonly />
                            </td>
                        </tr>
                    </c:if>
                    <c:forEach items="${mbtisub}" var="mbtisub">
                        <tr>
                            <td>
                                <input type="text" name="mbtisub_idx_${mbtisub.mbtisub_idx}" value="${mbtisub.mbtisub_con}" maxlength="1000" onblur="updateQuestion(${mbtisub.mbtisub_idx})" />
                            </td>
                            <c:forEach items="${mbtisub.regMBTIDTO}" var="score">
                                <td>
                                    <input type="text" name="mbtiscr_idx_${score.mbtiscr_idx}" value="${score.mbtiscr_scr}" maxlength="10" onblur="updateScore(${score.mbtiscr_idx})" />
                                </td>
                            </c:forEach>
                            <td>
                                <button onclick='restoreRow(${mbtisub.mbtisub_idx});' class="disabledbtn">
                                    <i class="bi bi-arrow-clockwise"></i>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <ul class="noDesc">
                    <li>
                        <p>
                            <input type="button" value="세부 항목 추가하기" class="mainbtn" onclick="insertRow()" />
                            <input type="button" value="질문 삭제하기" class="subbtn" onclick="deleteQuestion()" />
                        </p>
                    </li>
                </ul>
            </form>
            <button onclick="goBack()" class="textbtn full">목록으로 돌아가기</button>
        </div>
    </div>
</div>
<c:import url="layout/modal.jsp" />
</body>
<script src="resources/js/admin_common.js"></script>
<script src="resources/js/admin_regMbtiQTrash.js"></script>
</html>