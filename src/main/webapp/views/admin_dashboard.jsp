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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script>
        var index = 0;
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
            <div class="contents chart">
                <div id="chart_div"></div>
                <div class="waiting"><i class="bi bi-reception-4"></i></div>
            </div>
            <div class="contents summary">
                <table>
                    <colgroup>
                        <col width="150px" />
                        <col width="auto" />
                        <col width="auto" />
                    </colgroup>
                    <thead>
                    <tr>
                        <th>증가 항목</th>
                        <th>오늘</th>
                        <th>일주일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="left">회원 수</td>
                        <td>${data.data_member_today}명</td>
                        <td>${data.data_member_thisweek}명</td>
                    </tr>
                    <tr>
                        <td class="left">크루 수</td>
                        <td>${data.data_crew_today}개</td>
                        <td>${data.data_crew_thisweek}개</td>
                    </tr>
                    <tr>
                        <td class="left">한 줄 게시글</td>
                        <td>${data.data_textboard_today}건</td>
                        <td>${data.data_textboard_thisweek}건</td>
                    </tr>
                    <tr>
                        <td class="left">사진 게시글</td>
                        <td>${data.data_photoboard_today}건</td>
                        <td>${data.data_photoboard_thisweek}건</td>
                    </tr>
                    <tr>
                        <td class="left">신고 회수</td>
                        <td>${data.data_report_today}회</td>
                        <td>${data.data_report_thisweek}회</td>
                    </tr>
                    </tbody>
                </table>
            </div>
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
                    <c:forEach items="${notice}" var="notice">
                        <tr>
                            <td class="left">${notice.notice_cont}</td>
                            <td>${notice.notice_regdate}</td>
                            <td>
                                <c:if test="${notice.notice_show == 1}">
                                    <button class="mainbtn minbtn">게시중</button>
                                </c:if>
                                <c:if test="${notice.notice_show == 0}">
                                    <button class="subbtn minbtn">게시안함</button>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <button onclick="location.href='admin_notice.go'" class="mainbtn full">공지사항 더 보기</button>
            </div>
            <div class="contents report">
                <table>
                    <colgroup>
                        <col width="auto" />
                        <col width="110px" />
                        <col width="80px" />
                        <col width="80px" />
                    </colgroup>
                    <thead>
                    <tr>
                        <th>내용</th>
                        <th>신고유형</th>
                        <th>신고일시</th>
                        <th>처리상태</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${report}" var="report">
                        <tr>
                            <td class="left">
                                <a href="admin_reportDetail.go?report_idx=${report.report_idx}">${report.subject}</a>
                            </td>
                            <td class="left">${report.reportr_con}</td>
                            <td>${report.report_date}</td>
                            <td>
                                <c:if test="${report.report_prog == 1}">
                                    <button class="cautionbtn minbtn">${report.report_state}</button>
                                </c:if>
                                <c:if test="${report.report_prog == 2}">
                                    <button class="mainbtn minbtn">${report.report_state}</button>
                                </c:if>
                                <c:if test="${report.report_prog >= 3}">
                                    <button class="subbtn minbtn">${report.report_state}</button>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <button onclick="location.href='admin_reportList.go'" class="mainbtn full">신고내역 더 보기</button>
            </div>
        </div>
    </div>
</div>
<c:import url="layout/modal.jsp" />
</body>
<script src="resources/js/admin_common.js"></script>
<script src="resources/js/admin_dashboard.js"></script>
</html>