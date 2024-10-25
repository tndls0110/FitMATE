<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
<head>
    <meta charset="UTF-8">
    <style>
        body{
            margin: 0;
            padding: 0;
            background-color: #282b34;
            font-size: 14px;
            color: #e9ecef;
        }
        .Question_page {
            margin-left: 226px;
            margin-top: 103px;
            width: 500px;
            height: 510px;
        }

        #title {
            display: flex;
            flex-direction: row;
        }

        .b_title {
            font-weight: bold;
            font-size: 25px;
        }

        .s_title {
            margin-top: 10px;
        }
        .name{
            display: flex;
            margin: 66px 197px 24px 193px;
            font-weight: 500;
            font-size: 16px;
        }
        .name_b{
            font-weight: 500;
            font-weight: 500;
            font-size: 16px;
        }

        .mbtiR_photo{
            height: 250px;
            width: 200px;
            background-color: red;
            margin: 24px 134px;

        }

        .result_name{
            display: flex;
            margin: 13px 164px;
        }
        .result_name_b{
            font-weight: 500;
            font-size: 16px;
        }

        .result_name_s{
            font-weight: 500;
            font-size: 16px;
        }
        .result_detail{
            word-wrap: break-word;
            margin: 9px 23px;
            font-weight: 200;
            width: 431px;
        }

        .recommend_title{
            margin: 45px 19px 17px 156px;
            font-weight: 500;
            font-size: 16px;


        }
        .recommend_detail{
            word-wrap: break-word;
            margin: -1px 80px;
            font-size: 14px;
            font-weight: 200;
            width: 431px;
        }

        .recommend_routine{
            word-wrap: break-word;
            margin: -1px 80px;
            font-size: 14px;
            font-weight: 200;
            width: 431px;
        }
    </style>
</head>
<body>
<div class="container">
    <c:import url="layout/leftnav_1.jsp"></c:import>
    <!-- 운동일지는 nav1로, mbti만 nav5로 -->
    <div class="contents">
        <div class="Question_page">
            <div id="title">
                <div class="b_title">헬스 MBTI</div>
                &nbsp;&nbsp;
                <div class="s_title">검사하기</div>
            </div>
            <div class="name">
            <div class="name_b">이보람</div><div class="name_s">님은</div>
            </div>
            <div class="mbtiR_photo"></div>
            <div class="result">
                <div class="result_name">
                    <div class="result_name_b">잔근육 매니아</div> <div class="result_name_s">입니다.</div>
                </div>
                <div class="result_detail">규칙적인 운동은 어려워도 가끔씩 힘을 내서 꾸준함을 유지하려고 노력하는 타입입니다. 식단 관리에 다소 소홀한 면이 있으니 주의하세요.</div>

                <div class="recommend_title">추천하는 운동 프로그램</div>
                <div class="recommend_detail">전신 근력 운동: 덤벨 스쿼트, 푸시업, 바디웨이트 로우</div>
                <div class="recommend_routine">주 2-3회: 한 세션당 30-45분, 세트 사이에 충분한 휴식</div>



            </div>
        </div>
    </div>
    <c:import url="layout/modal.jsp"></c:import>
</div>
</body>

<script src="resources/js/common.js"></script>
<script>
    var scores = ${scores};
    console.log('scores : ', scores);

</script>

</html>
