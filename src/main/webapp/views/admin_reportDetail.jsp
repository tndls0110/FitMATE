<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitMATE</title>
    <link rel="stylesheet" type="text/css" href="resources/css/admin_common.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/admin_board.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
        var index = 1;
        var report_prog = '${info.report_prog}';
    </script>
</head>
<body>
<div class="container">
    <c:import url="layout/admin_leftnav.jsp" />
    <div class="right_wrapper">
        <c:import url="layout/admin_header.jsp" />
        <div class="title">
            <h2>신고 상세보기</h2>
        </div>
        <div class="contents">
            <table class="report_detail">
                <colgroup>
                    <col width="120px">
                    <col width="300px">
                    <col width="160px">
                    <col width="auto">
                </colgroup>
                <thead>
                    <tr>
                        <th colspan="4" class="left larger">신고 게시글</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>신고 번호</th>
                        <td>
                            ${info.report_idx}&nbsp;&nbsp;
                            <c:if test="${info.report_prog == 1}">
                                <button class="cautionbtn minbtn">${info.report_state}</button>
                            </c:if>
                            <c:if test="${info.report_prog == 2}">
                                <button class="mainbtn minbtn">${info.report_state}</button>
                            </c:if>
                            <c:if test="${info.report_prog > 3}">
                                <button class="subbtn minbtn">${info.report_state}</button>
                            </c:if>
                        </td>
                        <th>신고자 아이디(닉네임)</th>
                        <td>
                            <a href="admin_userDetail.go?user_id=${info.reporter_id}" target="_blank">${info.reporter_id} (${info.reporter_nick})</a>
                        </td>
                    </tr>
                    <tr>
                        <th>신고 내용</th>
                        <td>${info.reportr_con}</td>
                        <th>작성자 아이디(닉네임)</th>
                        <td>
                            <a href="admin_userDetail.go?user_id=${info.reported_id}" target="_blank">${info.reported_id} (${info.reported_nick})</a>
                        </td>
                    </tr>
                    <tr>
                        <th>신고 게시글</th>
                        <td colspan="3">
                            <p>${info.subject}</p>
                            <c:if test="${info.file_cnt > 0}">
                                <p>
                                    <!-- 추후 파일 여러 장 입력하게 될 경우 이 구간 수정할 것 -->
                                    <img src="/photo/${info.new_filename}" alt="${info.ori_filename}" />
                                </p>
                            </c:if>
                        </td>
                    </tr>
                    <c:if test="${info.report_cnt > 1}">
                        <tr>
                            <th></th>
                            <td colspan="3" class="caution">
                                <p>
                                    <a href="admin_reportList.go?searchType=board_idx&keywords=${info.board_idx}" target="_blank" class="caution">
                                        이 글은 동일한 신고 사유로 인해 ${info.report_cntdupl}회, 총 ${info.report_cnt}회 신고되었습니다.
                                    </a>
                                </p>
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
            <div class="writer">
                <form action="admin_reportDetail.do" method="post">
                    <input type="hidden" name="report_idx" value="${info.report_idx}" />
                    <input type="hidden" name="board_idx" value="${info.board_idx}" />
                    <input type="hidden" name="reportr_idx" value="${info.reportr_idx}" />
                    <input type="hidden" name="reported_id" value="${info.reported_id}" />
                    <div class="btn_flex">
                        <div class="width20p">
                            <select name="report_prog" class="mainbtn full">
                                <option value="0">처리 과정</option>
                                <c:forEach items="${status}" var="status">
                                    <option value="${status.report_prog}">${status.report_state}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="width80p">
                            <div class="btn_flex narrow">
                                <div class="width80p">
                                    <input type="text" name="reportd_con" class="full flex_left" placeholder="비고 란에 들어갈 문구를 입력하세요." />
                                </div>
                                <div class="width20p">
                                    <input type="button" onclick="confirmReport()" value="처리 상태 변경" class="mainbtn full flex_right" />
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <table>
                <colgroup>
                    <col width="120px">
                    <col width="120px">
                    <col width="160px">
                    <col width="120px">
                    <col width="auto">
                </colgroup>
                <thead>
                    <tr>
                        <th>신고처리번호</th>
                        <th>신고처리상태</th>
                        <th>신고처리일시</th>
                        <th>신고처리자</th>
                        <th>비고</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>없음</td>
                        <td><button class="cautionbtn minbtn">신고</button></td>
                        <td>${info.report_date}</td>
                        <td>시스템</td>
                        <td class="left"></td>
                    </tr>
                    <c:forEach items="${progress}" var="progress">
                        <tr>
                            <td>${progress.reportd_idx}</td>
                            <td>
                                <c:if test="${progress.report_prog == 2}">
                                    <button class="mainbtn minbtn">${progress.report_state}</button>
                                </c:if>
                                <c:if test="${progress.report_prog != 2}">
                                    <button class="subbtn minbtn">${progress.report_state}</button>
                                </c:if>
                            </td>
                            <td>${progress.reportd_date}</td>
                            <td>${progress.admin_name}</td>
                            <td class="left">${progress.reportd_con}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<c:import url="layout/modal.jsp" />
</body>
<script src="resources/js/admin_common.js"></script>
<script src="resources/js/admin_reportDetail.js"></script>
</html>