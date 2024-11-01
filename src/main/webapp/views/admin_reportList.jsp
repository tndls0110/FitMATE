<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitMATE</title>
    <link rel="stylesheet" type="text/css" href="resources/css/admin_common.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/admin_board.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
    <script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
    <script>
        var index = 1;
    </script>
</head>
<body>
<div class="container">
    <c:import url="layout/admin_leftnav.jsp" />
    <div class="right_wrapper">
        <c:import url="layout/admin_header.jsp" />
        <div class="title">
            <h2>신고 목록</h2>
        </div>
        <div class="contents">
            <div class="viewer">
                <table>
                    <colgroup>
                        <col width="60px" />
                        <col width="auto" />
                        <col width="120px" />
                        <col width="100px" />
                        <col width="100px" />
                        <col width="150px" />
                        <col width="80px" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>내용</th>
                            <th>신고유형</th>
                            <th>신고자</th>
                            <th>작성자</th>
                            <th>신고일시</th>
                            <th>상태</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <td colspan="7">
                                <nav aria-label="Page navigation">
                                    <ul class="pagination" id="pagination"></ul>
                                </nav>
                            </td>
                        </tr>
                    </tfoot>
                    <tbody></tbody>
                </table>
            </div>
            <form>
                <div class="search">
                    <div class="btn_flex">
                        <div class="width20p">
                            <select name="searchType" class="subbtn full">
                                <option value="subject" selected>게시글 내용</option>
                                <option value="reported_id">작성자 ID</option>
                                <option value="reported_nick">작성자 닉네임</option>
                                <option value="reporter_id">신고자 ID</option>
                                <option value="reporter_nick">신고자 닉네임</option>
                            </select>
                        </div>
                        <div class="width80p">
                            <div class="btn_flex narrow">
                                <div class="width80p">
                                    <input type="text" name="keywords" class="full flex_left" placeholder="검색어를 입력하세요." />
                                    <button type="button" onclick="location.href='admin_reportList.go'" class="textbtn refresh">
                                        <i class="bi bi-x-circle-fill"></i>
                                    </button>
                                </div>
                                <div class="width20p">
                                    <input type="submit" onclick="pageCall(1)" value="검색" class="mainbtn full flex_right" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<c:import url="layout/modal.jsp" />
</body>
<script src="resources/js/admin_common.js"></script>
<script src="resources/js/admin_report.js"></script>
</html>