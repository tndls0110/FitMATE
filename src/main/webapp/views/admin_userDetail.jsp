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
        var index = 3;
    </script>
</head>
<body>
<div class="container">
    <c:import url="layout/admin_leftnav.jsp" />
    <div class="right_wrapper">
        <c:import url="layout/admin_header.jsp" />
        <div class="title">
            <h2>사용자 조회</h2>
        </div>
        <div class="contents narrow">
            <table>
                <colgroup>
                    <col width="150px" />
                    <col width="auto" />
                </colgroup>
                <tr>
                    <td colspan="2" class="profileImage">
                        <c:if test="${member.profile != ''}">
                            <div class="profImg" style="background-image: url('/photo/${member.profile}')"></div>
                        </c:if>
                        <c:if test="${member.profile == ''}">
                            <i class="bi bi-person-square"></i>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <th class="left">사용자 ID</th>
                    <td class="left">${member.user_id}</td>
                </tr>
                <tr>
                    <th class="left">닉네임</th>
                    <td class="left">${member.nick}</td>
                </tr>
                <tr>
                    <th class="left">이름</th>
                    <td class="left">${member.name}</td>
                </tr>
                <tr>
                    <th class="left">이메일</th>
                    <td class="left">${member.email}</td>
                </tr>
                <tr>
                    <th class="left">생년월일</th>
                    <td class="left">${member.birthday}</td>
                </tr>
                <tr>
                    <th class="left">상태 메시지</th>
                    <td class="left">${member.status}</td>
                </tr>
                <tr>
                    <th class="left">주로 운동하는 지역</th>
                    <td class="left">${member.region_name} ${member.regions_name}</td>
                </tr>
                <tr>
                    <th class="left">헬스 MBTI</th>
                    <td class="left">${member.mbtir_name}</td>
                </tr>
                <tr>
                    <th class="left">게시글 수</th>
                    <td class="left">${member.board_cnt}</td>
                </tr>
                <tr>
                    <th class="left">마지막 활동일시</th>
                    <td class="left">${member.last_regdate}</td>
                </tr>
                <tr>
                    <th class="left">이용 상태</th>
                    <td class="left">
                        <c:if test="${!member.restrict_state}">
                            <button class="mainbtn minbtn">이용중</button>
                        </c:if>
                        <c:if test="${member.restrict_state}">
                            <button class="cautionbtn minbtn">이용제재</button>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <th class="left">제재 종료일</th>
                    <td class="left">${member.cleared_date_String}</td>
                </tr>
            </table>
            <button onclick="location.href='admin_userList.go'" class="mainbtn full">목록으로 돌아가기</button>
        </div>
    </div>
</div>
<c:import url="layout/modal.jsp" />
</body>
<script src="resources/js/admin_common.js"></script>
</html>