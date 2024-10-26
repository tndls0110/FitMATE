<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitMATE</title>
    <link rel="stylesheet" type="text/css" href="resources/css/admin_common.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
    <script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
    <script>
        var index = 3;
        var msg = '${msg}';
    </script>
</head>
<body>
<div class="container">
    <c:import url="layout/admin_leftnav.jsp">
        <c:param name="page" value="3" />
    </c:import>
    <div class="right_wrapper">
        <c:import url="layout/admin_header.jsp" />
        <div class="title">
            <h2>공지사항</h2>
        </div>
        <div class="contents">
            <div class="writer">
                <form action="admin_noticeWrite.do" method="post">
                    <textarea class="full" name="notice_cont" rows="3" maxlength="1000" onkeyup="drawLength(this)"></textarea>
                    <div class="showLength">
                        <h3 class="capt"><span>0</span>/1,000</h3>
                    </div>
                    <input type="button" onclick="writeNotice()" class="mainbtn" value="작성하기" />
                </form>
            </div>
            <div class="viewer">
                <table>
                    <colgroup>
                        <col width="60px" />
                        <col width="auto" />
                        <col width="100px" />
                        <col width="140px" />
                        <col width="80px" />
                        <col width="80px" />
                    </colgroup>
                    <thead>
                        <tr>
                            <td>#</td>
                            <td>내용</td>
                            <td>작성자</td>
                            <td>작성일시</td>
                            <td>게시여부</td>
                            <td></td>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <td colspan="6">
                                <nav aria-label="Page navigation">
                                    <ul class="pagination" id="pagination"></ul>
                                </nav>
                            </td>
                        </tr>
                    </tfoot>
                    <tbody></tbody>
                </table>
            </div>
            <div class="search"></div>
        </div>
    </div>
</div>
<c:import url="layout/modal.jsp" />
</body>
<script src="resources/js/admin_common.js"></script>
<script src="resources/js/admin_notice.js"></script>
</html>