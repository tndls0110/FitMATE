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
                    <div class="btn_flex writerContainer">
                        <div class="width90p">
                            <textarea class="full" name="notice_cont" rows="2" maxlength="1000" onkeyup="drawLength(this)"></textarea>
                            <div class="counterContainer">
                                <h3 class="capt"><span class="counter">0</span>/1,000</h3>
                            </div>
                        </div>
                        <div class="width10p">
                            <input type="button" onclick="writeNotice()" class="mainbtn full heightDouble" value="작성" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="viewer">
                <table>
                    <colgroup>
                        <col width="60px" />
                        <col width="auto" />
                        <col width="80px" />
                        <col width="150px" />
                        <col width="80px" />
                        <col width="80px" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>내용</th>
                            <th>작성자</th>
                            <th>작성일시</th>
                            <th>게시여부</th>
                            <th></th>
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
            <div class="search">
                <form>
                    <div class="btn_flex">
                        <div class="width20p">
                            <select name="searchType" class="subbtn full">
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
<script src="resources/js/admin_notice.js"></script>
</html>