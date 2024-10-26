<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/common.css"/>
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
            margin: 13px 174px;
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
            font-size: 14px;
            font-weight: 200;
        }

        .recommend_routine{
            word-wrap: break-word;
            font-size: 14px;
            font-weight: 200;
        }

        .saveResult{
            color: white;
            width: 220px;
            height: 50px;
            border-radius: 5px;
            background-color: rgba(4, 129, 135, 1);
            padding: 15px 10px 10px 10px;
            margin: 48px 57px 57px 130px;
            font-weight: bold;
            text-align: center;
        }
        #recommed_content{
            width: 431px;
            margin: -1px 77px;
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
                <div class="b_title">헬스 mbti</div>

                &nbsp;&nbsp;
                <div class="s_title">검사하기</div>
            </div>
            <div class="name">
            <div class="name_b">이보람</div><div class="name_s">님은</div>
            </div>
            <div class="mbtiR_photo"></div>
            <div class="result">
                <div class="result_name">
                    <div class="result_name_b">결과를 불러오는 중</div> <div class="result_name_s">입니다.</div>
                </div>
                <div class="result_detail"></div>

                <div class="recommend_title">추천하는 운동 프로그램</div>
                <div id = "recommed_content">
                    <div class="recommend_detail"></div>
                    <div class="recommend_routine"></div>
                </div>
            </div>
            <div class="saveResult" onclick="saveResult()">결과 저장하기</div>
    </div>
</div>
    <c:import url="layout/modal.jsp"></c:import>
</div>
</body>

<script src="resources/js/common.js"></script>
<script>
    //mbti_r.jsp 단에서 할 것
    //[1]화면이 로딩 되자마자 최댓값 찾아서 -> 이에 해당하는 운동 성향 추천 운동 가져옴
    //[2]전달받은 매개변수(성향 및 성향별 점수) insert 수행하기
    //JS에서 map 형태 사용하는 법
    console.log('scores :{}','${scores}');
    var max = {'': 0};//만약 max보다 크면 저장...
    //매개변수
    //var max = 0;
    //전달받은 매개변수
    <c:forEach var="score" items='${scores}'>
         console.log('entry :{}','${score.key}','${score.value}');
        //object 객체에 값 넣기
        var key = '${score.key}'; // score.${score.key}= value;로 할 때 작동 안되는 이유 : var key = '${score.key}';는 문자열로 취급되기 때문에 JavaScript에서 변수로서 사용될 수 없음
        var value = ${score.value};
        console.log('value:{}',value);


        var keys = Object.keys(max);
        console.log('keys:'+keys);
        for (var k of keys){
        console.log('key:{}',k);
        console.log('value:{}',max[k]);
         //score.${score.key}= value;
            if(value>max[k]){ //만약 key에 저장된 값이 score.value보다 작으면 score.value 및 score.key를 저장
                delete max[k]; //이미 저장되어있던 값 지우기
                max[key] = value; //만약 max보다 크면 score[k]에 저장 -> 정처기 공부했던 내용 적용..
            }
    }
    </c:forEach>
    console.log(max);
    //max 분리하기
    var key_result = Object.keys(max);
    console.log('max 결과 key:'+keys);
    for (var k of keys){
        console.log('key:{}',k);
        console.log('value:{}',max[k]);

        //(1) 운동 성향은 이미 있으니까 넣어주기
        $('.result_name_b').html(k);
        //(2) max를 ajax로 전달해서 이에 해당하는 성향 설명 및 루틴 가져오기
        //그리고... id도 필요할 것 같은데........ (로그인 물어보기) //아니면 걍 session에서 가져오기

        $.ajax({
            type : 'GET',
            url : '/mbti_r_get.ajax',
            data : {'max_mbti':k},
            dataType : 'JSON',
            success : function(recommend){
                console.log(recommend);
                $('.result_detail').html(recommend.mbtir_con);
                $('.recommend_detail').html(recommend.mbtir_exc);
                $('.recommend_routine').html(recommend.mbtir_rou);
            },
            error : function (e){
                console.log(e);
            }

        });
    }


</script>

</html>
