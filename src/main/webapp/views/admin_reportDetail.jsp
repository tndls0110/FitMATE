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
        var index = 2;
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
                        <td>${info.report_idx}</td>
                        <th>신고자 아이디(닉네임)</th>
                        <td>${info.reporter_id} (${info.reporter_nick})</td>
                    </tr>
                    <tr>
                        <th>신고 내용</th>
                        <td>${info.reportr_con}</td>
                        <th>작성자 아이디(닉네임)</th>
                        <td>${info.reported_id} (${info.reported_nick})</td>
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
                            <td colspan="4" class="caution">
                                <p>이 글은 총 ${info.report_cnt}회 신고되었습니다.</p>
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
            <div class="writer">
                <form>
                    <div class="btn_flex">
                        <div class="width20p">
                            <select name="searchType" class="mainbtn full">
                                <option value="notice_cont" selected>내용</option>
                                <option value="admin_name">작성자</option>
                            </select>
                        </div>
                        <div class="width80p">
                            <div class="btn_flex narrow">
                                <div class="width80p">
                                    <input type="text" name="keywords" class="full flex_left" placeholder="검색어를 입력하세요." />
                                </div>
                                <div class="width20p">
                                    <input type="submit" value="검색" class="mainbtn full flex_right" />
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<c:import url="layout/modal.jsp" />
</body>
<script src="resources/js/admin_common.js"></script>
</html>