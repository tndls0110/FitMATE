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
        var index = 4;
    </script>
</head>
<body>
<div class="container">
    <c:import url="layout/admin_leftnav.jsp">
        <c:param name="page" value="5" />
    </c:import>
    <div class="right_wrapper">
        <c:import url="layout/admin_header.jsp" />
        <div class="title">
            <h2>크루 목록</h2>
        </div>
        <div class="contents">
            <div class="viewer">
                <table>
                    <colgroup>
                        <col width="60px" />
                        <col width="auto" />
                        <col width="auto" />
                        <col width="auto" />
                        <col width="auto" />
                        <col width="auto" />
                        <col width="auto" />
                        <col width="80px" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>크루 이름</th>
                            <th>크루장 아이디(닉네임)</th>
                            <th>자주 모이는 지역</th>
                            <th>크루원 수</th>
                            <th>생성일시</th>
                            <th>마지막 이용일시</th>
                            <th>이용 상태</th>
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
                                <option value="name" selected>크루 이름</option>
                                <option value="user_id">크루장 ID</option>
                                <option value="nick">크루장 닉네임</option>
                            </select>
                        </div>
                        <div class="width80p">
                            <div class="btn_flex narrow">
                                <div class="width80p">
                                    <input type="text" name="keywords" class="full flex_left" placeholder="검색어를 입력하세요." />
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
<script src="resources/js/admin_crewList.js"></script>
</html>