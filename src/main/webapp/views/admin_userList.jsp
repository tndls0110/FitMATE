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
        var index = 3;
    </script>
</head>
<body>
<div class="container">
    <c:import url="layout/admin_leftnav.jsp" />
    <div class="right_wrapper">
        <c:import url="layout/admin_header.jsp" />
        <div class="title">
            <h2>사용자 목록</h2>
        </div>
        <div class="contents">
            <div class="viewer">
                <table>
                    <colgroup>
                        <col width="60px" />
                        <col width="auto" />
                        <col width="auto" />
                        <col width="100px" />
                        <col width="60px" />
                        <col width="150px" />
                        <col width="80px" />
                        <col width="80px" />
                    </colgroup>
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>아이디 (닉네임)</th>
                        <th>이메일</th>
                        <th>이름</th>
                        <th>게시글 수</th>
                        <th>마지막 이용일</th>
                        <th>이용상태</th>
                        <th>제재해제일</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <td colspan="8">
                            <nav aria-label="Page navigation">
                                <ul class="pagination" id="pagination"></ul>
                            </nav>
                        </td>
                    </tr>
                    </tfoot>
                    <tbody></tbody>
                </table>
            </div>
            <div class="search">
                <form>
                    <div class="btn_flex full">
                        <div class="width20p">
                            <select name="searchType" class="subbtn full">
                                <option value="user_id" selected>사용자 ID</option>
                                <option value="nick">사용자 닉네임</option>
                                <option value="name">사용자 이름</option>
                                <option value="email">사용자 이메일</option>
                            </select>
                        </div>
                        <div class="width80p">
                            <div class="btn_flex narrow">
                                <div class="width80p">
                                    <input type="text" name="keywords" class="full flex_left" placeholder="검색어를 입력하세요." />
                                    <button type="button" onclick="location.href='admin_userList.go'" class="textbtn refresh">
                                        <i class="bi bi-x-circle-fill"></i>
                                    </button>
                                </div>
                                <div class="width20p">
                                    <input type="submit" onclick="pageCall(1)" value="검색" class="mainbtn full flex_right" />
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
<script src="resources/js/admin_userList.js"></script>
</html>