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
        var index = 4;
    </script>
</head>
<body>
<div class="container">
    <c:import url="layout/admin_leftnav.jsp" />
    <div class="right_wrapper">
        <c:import url="layout/admin_header.jsp" />
        <div class="title">
            <h2>크루 조회</h2>
        </div>
        <div class="contents narrow">

            <table>
                <colgroup>
                    <col width="150px" />
                    <col width="auto" />
                </colgroup>
                <tr>
                    <td colspan="2" class="profileImage">
                        <c:if test="${crew.profile != ''}">
                            <div class="profImg" style="background-image: url('/photo/${crew.profile}')"></div>
                        </c:if>
                        <c:if test="${crew.profile == ''}">
                            <i class="bi bi-person-square"></i>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <th class="left">크루 이름</th>
                    <td class="left">${crew.name}</td>
                </tr>
                <tr>
                    <th class="left">크루장 ID</th>
                    <td class="left">
                        <a href="admin_userDetail.go?user_id=${crew.crew_id}" target="_blank">
                            ${crew.crew_id}
                        </a>
                    </td>
                </tr>
                <tr>
                    <th class="left">크루장 닉네임</th>
                    <td class="left">${crew.nick}</td>
                </tr>
                <tr>
                    <th class="left">크루장의 헬스 MBTI</th>
                    <td class="left">${crew.mbtir_name}</td>
                </tr>
                <tr>
                    <th class="left">주로 운동하는 지역</th>
                    <td class="left">${crew.region_name} ${crew.regions_name}</td>
                </tr>
                <tr>
                    <th class="left">크루 모집글</th>
                    <td class="left">${crew.recruit}</td>
                </tr>
                <tr>
                    <th class="left">크루원 수</th>
                    <td class="left">${crew.cnt_members} 명</td>
                </tr>
                <tr>
                    <th class="left">크루 일정 회수</th>
                    <td class="left">${crew.cnt_plan} 회</td>
                </tr>
                <tr>
                    <th class="left">모든 게시글 개수</th>
                    <td class="left">${crew.cnt_board} 개</td>
                </tr>
                <tr>
                    <th class="left">공지 회수</th>
                    <td class="left">${crew.cnt_notice} 회</td>
                </tr>
                <tr>
                    <th class="left">한 줄 게시글 개수</th>
                    <td class="left">${crew.cnt_singleline} 개</td>
                </tr>
                <tr>
                    <th class="left">사진 게시글 개수</th>
                    <td class="left">${crew.cnt_photo} 개</td>
                </tr>
                <tr>
                    <th class="left">운영 상태</th>
                    <td class="left">
                        <c:if test="${crew.status}">
                            <button class="mainbtn minbtn">운영중</button>
                        </c:if>
                        <c:if test="!${crew.status}">
                            <button class="subbtn minbtn">운영종료</button>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <th class="left">생성일시</th>
                    <td class="left">${crew.create_date}</td>
                </tr>
                <tr>
                    <th class="left">마지막 활동일시</th>
                    <td class="left">${crew.last_date}</td>
                </tr>
            </table>
            <button onclick="location.href='admin_crewList.go'" class="mainbtn full">목록으로 돌아가기</button>
        </div>
    </div>
</div>
<c:import url="layout/modal.jsp" />
</body>
<script src="resources/js/admin_common.js"></script>
</html>