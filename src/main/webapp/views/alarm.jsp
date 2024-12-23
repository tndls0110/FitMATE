<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="resources/css/common.css" />
    <style>

        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
        @import url('https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css');



        /* common */


        html{
            font-family: 'Noto Sans KR', sans-serif;
            box-sizing: border-box;
        }

        *, *:before, *:after{
            box-sizing: inherit;
        }

        .hide{
            display: none;
        }

        /* layout */

        body{
            margin: 0;
            padding: 0;

            font-size: 14px;
            color: #e9ecef;
        }

        .container{
            width: 1200px;
            margin: 0 auto;
            display: flex;
        }

        .contents{
            width: 960px;
            min-height: 900px;
            margin: 32px 0;
            padding: 24px;
            background-color: #363940;
            border-radius: 5px;
        }

        .contents.narrow{
            padding: 24px 280px;
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
            font-weight: 500;
            font-size: 16px;
            margin: 66px 197px 24px 193px;
        }

        .crew_alarm,.admin_alarm{
            max-width: 385px;
            min-height: 111px;
            background-color: #282b34;
            margin-bottom: 19px;
            padding: 5px 10px 10px 9px;
        }


        #alarm_box{
            width: 445px;
            margin: 25px 10px 13px 198px;
        }

        #total_tab{
            display: flex;
            margin: -436px 0px 40px 289px;
            font-size: 16px;
        }

        .tab{
            margin-right: 35px;
            cursor: pointer;
            opacity: 40%;
        }

        .round{
            border-radius: 100px;
            width: 70px;
            height: 70px;
            background-color: rgba(217, 217, 217, 1);
            margin: 18px 10px 10px 17px;
        }
        .top{
            display: flex;
            padding: 14px;
        }
        .alarm_description{
            display: flex;
            margin: -12px 12px 0px -4px;
        }

        .notis_date{
            margin: 23px 10px 0px 0px;
            float: right;
        }

        .bi-bell::before,.bi-person {
            content: "\f18a";
            font-size: 33px;
            color: rgba(27, 27, 27, 1);
            position: relative;
            top: 16px;
            left: 2px;
        }
        .bi-bell::before{
            margin: 4px -4px 27px 17px;
        }
        .bi-person {
            margin: 34px -4px 27px 17px;
        }

        .read{
            margin: 15px 11px -34px 78px;
            color: rgba(251, 89, 89, 1);
            font-size: 10px;
            width: 10px;
            visibility: visible;
        }

        .already_read{
            margin: 15px 11px -34px 78px;
            color: rgba(251, 89, 89, 1);
            font-size: 10px;
            width: 10px;
            visibility: hidden;
        }

        .delete{
            margin: 3px 10px -21px 237px;
            position: absolute;
            font-size: 21px;
        }

        .bi-bell-slash-fill{
            font-size: 100px;
            padding: 146px 24px 12px 134px;
            color: white;
            position: absolute;
            top: 268px;
            opacity: 50%;
        }
        .no_alarm_text{
            margin: 252px 10px 30px 133px;
            font-size: 16px;
            opacity: 70%;
        }

        #count_unread_alarm{
            width: 399px;
            height: 10px;
            margin: 16px 10px 0px 490px;
            color: white;
            opacity: 50%;
        }
        .alarm_text{
            height: 59px;
            margin: 60px 10px 9px 96px;
            word-break: break-word;

        }
        .show_detail{
            width: 121px;
            margin: 4px 10px 10px 308px;
            opacity: 50%;
            cursor: pointer;
            /*position이 설정되어 있으면 부모 요소의 overflow= hidden이 안 적용됨*/
        }

        .alarm_content_clickable{
            cursor: pointer;
        }

        .already_read_crew_alarm,.already_read_admin_alarm{
            margin-bottom: 19px;
            padding: 5px 10px 10px 9px;
            opacity: 50%;
            background-color: #282b34;
            max-width: 385px;
            min-height: 111px;
        }


        .already_read_sign{
            margin: -16px 0px 17px 358px;
            font-size: 10px;
            opacity: 50%;
            font-style: oblique;
            visibility:hidden;
        }

        .bi-x{
            cursor: pointer;
        }

        .container1{
            float: left;
        }

        .container2{
            float : right;
            width: 266px;
        }
        .alarm_title{
            float: left;
            font-weight: bold;
            margin: 25px 0px 0px 0px;
        }

    </style>
    <script>
        var msg = '${msg}';
        if (msg != ''){
            modal.showAlert(msg);
        }
    </script>
</head>
<body>
<div class="container">
    <c:import url="layout/leftnav_6.jsp"></c:import>
    <!-- 운동일지는 nav1로, mbti만 nav5로 -->
    <div class="contents">
        <div class="Question_page">
            <div id="title">
                <div class="b_title">알림</div>
            </div>
        </div>

        <div id = "total_tab">
            <div class="tab" name = "all" onclick="get_alarm(0,event)">전체 알림</div> <div class="tab"  name = "admin" onclick="get_alarm(1,event)">관리자 알림</div><div class="tab" name = "crew" onclick="get_alarm(2,event)">크루 알림</div>
        </div>

        <div id="count_unread_alarm"><div class="show_unread_alarm"></div></div>
        <div id = alarm_box>

        </div>
    </div>
    <c:import url="layout/modal.jsp"></c:import>
</div>
</body>

<script src="resources/js/common.js"></script>
<script>
    window.onload = function initialize(){
        //창 로딩되면 전체 알림 띄우기
        idx = 0;
        var initialize = true;
        get_alarm(idx,initialize); //처음 로딩에도 idx = 0으로 잡아줘야 오류 안남
    }


    function get_alarm(idx,event){
        console.log("idx",idx);
        console.log("event:",event);
        //default opacity 설정


        //opacity 0.4
        var tabs = document.getElementsByClassName('tab');

        for (var tab of tabs){
            console.log('tab',tab);
            tab.style.opacity ="0.4";
        }

        //initialize = true일 경우 전체 알림에 opacity = 1
        if(event == true){
            document.getElementsByClassName('tab')[0].style.opacity ="1";
        }else{
            //클릭 이벤트가 일어난 대상을 opacity = 1
            event.target.style.opacity = "1"; //선택한 값의 opacity 1
        }

        $.ajax({
            type : 'GET',
            url : 'get_all_alarm.ajax',
            data : {'idx':idx},
            dataType : 'JSON',
            success : function (data){
                console.log(data);
                console.log(data.id.length);

                console.log(data.id);


                var read ='';
                var content = '';
                for(var noti of data.id){
                    console.log(noti);
                    console.log(noti.notis_cate);
                    console.log(noti.notis_date);

                    //날짜 포맷
                    const dateTimeString = noti.notis_date;

                    // T를 공백으로 대체하고 + 이후를 잘라내기
                    const formattedDate = dateTimeString.replace("T", " ").split(".")[0];

                    console.log("날짜:",formattedDate);  // "2024-10-22 23:41:13"

                    var url = noti.noti_url;
                    var idx = noti.noti_idx;
                    read = noti.notis_check;

                        //아래 코드는 수정하기...
                        if(read == 0){
                            if(noti.notis_cate == 2){
                               if(url == 'none') {
                                   //content += '<div class="crew_alarm" alarm_idx ="' + idx + '" read =' + read + '><div class="read" alarm_idx ="' + idx + '" read =' + read + '>●</div><div class="alarm_description"><div class="cate"><div class="round"><i class="bi bi-person"></i></div></div><div class="top"><div class="alarm_title">크루 알림</div><div class="notis_date">' + formattedDate + '</div><div class="delete" onclick="delete_alarm(' + idx + ')"><i class="bi bi-x"></i></div></div></div><div class="alarm_content_clickable" onclick="url(\'' + url + '\',' + idx + ')"><div class="alarm_text">' + noti.noti_content + '</div></div><div class="show_detail"></div></div><div class = "already_read_sign">읽은 알림</div>';
                                   content += '<div class="crew_alarm" alarm_idx="' + idx + '" read="' + read + '"><div class="container1"><div class="read" alarm_idx="' + idx + '" read="' + read + '">●</div><div class="round"><i class="bi bi-person"></i></div></div><div class="container2"><p class="alarm_title">크루 알림</p><p class="notis_date">' + formattedDate + '</p><div class="delete" onclick="delete_alarm(' + idx + ')"><i class="bi bi-x"></i></div></div><div class="alarm_text">' + noti.noti_content + '</div><div class="show_detail"></div></div>';

                               } else {
                                   //content += '<div class="crew_alarm" alarm_idx ="' + idx+'" read ='+read+'><div class="read" alarm_idx ="'+idx+'" read ='+read+'>●</div><div class="alarm_description"><div class="cate"><div class="round"><i class="bi bi-person"></i></div></div><div class="top"><div class="alarm_title">크루 알림</div><div class="notis_date">' + formattedDate + '</div><div class="delete" onclick="delete_alarm(' + idx + ')"><i class="bi bi-x"></i></div></div></div><div class="alarm_content"><div class="alarm_text">' + noti.noti_content + '</div></div><div class="show_detail" onclick="url(\'' + url + '\',' + idx + ')">+더보기</div></div><div class = "already_read_sign">읽은 알림</div>';

                                   content += '<div class="crew_alarm" alarm_idx="' + idx + '" read="' + read + '"><div class="container1"><div class="read" alarm_idx="' + idx + '" read="' + read + '">●</div><div class="round"><i class="bi bi-person"></i></div></div><div class="container2"><p class="alarm_title">크루 알림</p><p class="notis_date">' + formattedDate + '</p><div class="delete" onclick="delete_alarm(' + idx + ')"><i class="bi bi-x"></i></div></div><div class="alarm_text">' + noti.noti_content + '</div><div class="show_detail" onclick="url(\'' + url + '\',' + idx + ')">+더보기</div></div>';


                               }
                            }else if(noti.notis_cate == 1){
                                content += '<div class="admin_alarm" alarm_idx="' + idx + '" read="' + read + '"><div class="container1"><div class="read" alarm_idx="' + idx + '" read="' + read + '">●</div><div class="round"><i class="bi bi-bell"></i></div></div><div class="container2"><p class="alarm_title">관리자 알림</p><p class="notis_date">' + formattedDate + '</p><div class="delete" onclick="delete_alarm(' + idx + ')"><i class="bi bi-x"></i></div></div><div class="alarm_text">' + noti.noti_content + '</div><div class="show_detail" style = "visibility: hidden;"></div></div>';

                                /* if(url == 'none') {
                                    content += '<div class="admin_alarm" alarm_idx ="' + idx + '" read ='+read+'><div class ="read" alarm_idx ="' + idx + '" read ='+read+'>●</div> <div class="alarm_description"><div class = "cate"><div class="round"><i class="bi bi-bell"></i></div></div><div class = "top"><div class="alarm_title">관리자 알림</div> <div class ="notis_date">' + formattedDate + '</div><div class="delete" onclick="delete_alarm(' + idx + ')"><i class="bi bi-x"></i></div></div></div><div class = "alarm_content_clickable" onclick="url(\'' + url + '\',' + idx + ')"><div class="alarm_text">' + noti.noti_content + '</div></div><div class="show_detail"></div></div><div class = "already_read_sign">읽은 알림</div>'
                                }else{
                                    content += '<div class="admin_alarm" alarm_idx ="' + idx + '" read ='+read+'><div class ="read" alarm_idx ="' + idx + '" read ='+read+'>●</div> <div class="alarm_description"><div class = "cate"><div class="round"><i class="bi bi-bell"></i></div></div><div class = "top"><div class="alarm_title">관리자 알림</div> <div class ="notis_date">' + formattedDate + '</div><div class="delete" onclick="delete_alarm(' + idx + ')"><i class="bi bi-x"></i></div></div></div><div class = "alarm_content"><div class="alarm_text">' + noti.noti_content + '</div></div><div class="show_detail" onclick="url(\'' + url + '\',' + idx + ')"> +더보기</div></div><div class = "already_read_sign">읽은 알림</div>'
                                }*/
                            }
                        }else if(read == 1){
                            if(noti.notis_cate == 2){
                                if(url == 'none'){
                                    // content += '<div class="already_read_crew_alarm" alarm_idx ="'+idx+'" read ='+read+'><div class="already_read" alarm_idx ="'+idx+'" read ='+read+'>●</div><div class="alarm_description"><div class="cate"><div class="round"><i class="bi bi-person"></i></div></div><div class="top"><div class="alarm_title">크루 알림</div><div class="notis_date">' + formattedDate + '</div><div class="delete" onclick="delete_alarm(' + idx + ')"><i class="bi bi-x"></i></div></div></div><div class="alarm_content_clickable" onclick="url(\'' + url + '\',' + idx + ')"><div class="alarm_text">' + noti.noti_content + '</div></div><div class="show_detail"></div></div><div class = "already_read_sign">읽은 알람</div>';
                                    content += '<div class="already_read_crew_alarm" alarm_idx="' + idx + '" read="' + read + '"><div class="container1"><div class="read" style = "visibility: hidden" alarm_idx="' + idx + '" read="' + read + '">●</div><div class="round"><i class="bi bi-person"></i></div></div><div class="container2"><p class="alarm_title">크루 알림</p><p class="notis_date">' + formattedDate + '</p><div class="delete" onclick="delete_alarm(' + idx + ')"><i class="bi bi-x"></i></div></div><div class="alarm_text">' + noti.noti_content + '</div><div class="show_detail"></div></div>';
                                }else{
                                    content += '<div class="already_read_crew_alarm" alarm_idx="' + idx + '" read="' + read + '"><div class="container1"><div class="read" style = "visibility: hidden" alarm_idx="' + idx + '" read="' + read + '">●</div><div class="round"><i class="bi bi-person"></i></div></div><div class="container2"><p class="alarm_title">크루 알림</p><p class="notis_date">' + formattedDate + '</p><div class="delete" onclick="delete_alarm(' + idx + ')"><i class="bi bi-x"></i></div></div><div class="alarm_text">' + noti.noti_content + '</div><div class="show_detail" onclick="url(\'' + url + '\',' + idx + ')">+더보기</div></div>';
                                    //content += '<div class="already_read_crew_alarm" alarm_idx ="'+idx+'" read ='+read+'><div class="already_read" alarm_idx ="'+idx+'" read ='+read+'>●</div><div class="alarm_description"><div class="cate"><div class="round"><i class="bi bi-person"></i></div></div><div class="top"><div class="alarm_title">크루 알림</div><div class="notis_date">' + formattedDate + '</div><div class="delete" onclick="delete_alarm(' + idx + ')"><i class="bi bi-x"></i></div></div></div><div class="alarm_content"><div class="alarm_text">' + noti.noti_content + '</div></div><div class="show_detail" onclick="url(\'' + url + '\',' + idx + ')">+더보기</div></div><div class = "already_read_sign">읽은 알람</div>';
                                }
                            }else if(noti.notis_cate == 1){
                                content += '<div class="already_read_admin_alarm" alarm_idx="' + idx + '" read="' + read + '"><div class="container1"><div class="read" style = "visibility: hidden" alarm_idx="' + idx + '" read="' + read + '">●</div><div class="round"><i class="bi bi-bell"></i></div></div><div class="container2"><p class="alarm_title">관리자 알림</p><p class="notis_date">' + formattedDate + '</p><div class="delete" onclick="delete_alarm(' + idx + ')"><i class="bi bi-x"></i></div></div><div class="alarm_text">' + noti.noti_content + '</div><div class="show_detail" style = "visibility: hidden;" onclick="url(\'' + url + '\',' + idx + ')"> +더보기</div></div>';
                                /* if(url == 'none') {
                                    //content += '<div class="already_read_admin_alarm" alarm_idx ="' + idx + '" read ='+read+'><div class ="already_read" alarm_idx ="' + idx + '" read ='+read+'>●</div> <div class="alarm_description"><div class = "cate"><div class="round"><i class="bi bi-bell"></i></div></div><div class = "top"><div class="alarm_title">관리자 알림</div> <div class ="notis_date">' + formattedDate + '</div><div class="delete" onclick="delete_alarm(' + idx + ')"><i class="bi bi-x"></i></div></div></div><div class = "alarm_content_clickable" onclick="url(\'' + url + '\',' + idx + ')"><div class="alarm_text">' + noti.noti_content + '</div></div><div class="show_detail"></div></div><div class = "already_read_sign">읽은 알람</div>'
                                }else{
                                    content += '<div class="already_read_admin_alarm" alarm_idx ="' + idx + '" read ='+read+'><div class ="already_read" alarm_idx ="' + idx + '" read ='+read+'>●</div> <div class="alarm_description"><div class = "cate"><div class="round"><i class="bi bi-bell"></i></div></div><div class = "top"><div class="alarm_title">관리자 알림</div> <div class ="notis_date">' + formattedDate + '</div><div class="delete" onclick="delete_alarm(' + idx + ')"><i class="bi bi-x"></i></div></div></div><div class = "alarm_content"><div class="alarm_text">' + noti.noti_content + '</div></div><div class="show_detail" onclick="url(\'' + url + '\',' + idx + ')"> +더보기</div></div><div class = "already_read_sign">읽은 알람</div>'
                                }*/
                            }
                        }
                }

                //알림이 없을 경우 css
                if(data.id.length == 0){
                    content += ' <div class="no_alarm"><i class="bi bi-bell-slash-fill"></i><div class="no_alarm_text">알림이 없습니다.</div></div>';
                }
                console.log("content:",content);
                $('#alarm_box').html(content);

                //다 끝나면 읽은 알람은 css 바꾸기
                var read_opacity = document.querySelector('div[read = "'+1+'"]');
                var unread_icon = document.querySelector('.read[read = "'+1+'"]');
                //이미 읽은 알림은 style적용되지 않게
                console.log(read_opacity);
                console.log(unread_icon);

                get_unread_count();

            },
            error : function(e){
                console.log(e);
            }

        })
    }


    function delete_alarm(idx){
        console.log("idx",idx);

        $.ajax({
            type : 'GET',
            url : 'delete_alarm.ajax',
            data  : {"idx":idx},
            dataType : 'JSON',
            success : function (data){
                console.log(data);
                //해당 idx가진 html 없애기
                var read = document.querySelector('div[alarm_idx = "'+idx+'"]');
                read.remove();
            }, error: function (e){
                console.log(e);
            }
        })

    }

    function url(url,idx,event){

        var read = document.querySelector('div[alarm_idx = "'+idx+'"]');

        var round = document.querySelector('.read[alarm_idx="' + idx + '"]');
        var already_read = document.querySelector('.already_read_admin_alarm');

        read.setAttribute('read',1); //읽으면 읽음 숫자 1로
        console.log("바뀌었는지 확인 :",read);

        console.log("읽은 알림인지 확인 :",read.getAttribute('read') == 1);
        if(!already_read || read.getAttribute('read')!= 1){
            console.log(event);
            read.style.opacity = "0.7";
            round.style.visibility ="hidden"; //jquery에서는 .html이지만 js에서는.innerHTML을 사용해야함
        }

        get_unread_count();

        console.log("idx",idx);
        console.log("url",url);
        //클릭한 알람의 noti_idx의 읽음 여부 0->1로 바꿈
        $.ajax({
            type : 'get',
            url : 'read_change.ajax',
            data : {'idx' : idx},
            dataType: 'JSON',
            success : function (data){
             console.log(data.success);
                if(url!='none') {
                    location.href = url;
                }

            },error : function(e){
                console.log(e);
            }
        })

    }

    function get_unread_count(){
        $.ajax({
            type : 'GET',
            url : 'unread_count.ajax',
            data : {},
            dataType : 'JSON',
            success : function(data){
                console.log("안읽은 알림 :", data.count);
                var count = '안 읽은 알림 '+data.count+'건';
                $('.show_unread_alarm').html(count);

            },error : function (e){
                console.log(e);
            }
        })
    }

</script>
</html>

