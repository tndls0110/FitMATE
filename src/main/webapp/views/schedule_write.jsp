<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<head>
  <meta charset="UTF-8">
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
      background-color: #282b34;
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
    .write_page{
      margin-left: 226px;
      margin-top: 103px;
      width: 500px;
      height: 510px;
    }

    .capt{
      margin : -99px 98px 71px 233px;
    }
    h3.capt{
      margin : -100px 0px 0px 0px;
    }
    input[type = 'date']{
      width: 400px;
      height: 20px;
      background-color: rgba(40, 43, 52, 1);
      color: white;
      font-weight: 500;
      padding: 23px;
      font-size: 14px;
      border: 1px solid #282b34;
      border-radius: 6px;
    }

    .date_title{
      font-size: 10px;
      font-weight: 200;
      margin: 0px -3px -8px 0px;
    }

    input[type = 'time']{
      margin: -2px 8px 12px 0px;
      width: 196px;
      height: 20px;
      background-color: rgba(40, 43, 52, 1);
      color: white;
      font-weight: 500;
      padding: 23px;
      font-size: 14px;
      border: 1px solid #282b34;
      border-radius: 6px;
    }

    .times{
      display: flex;
      margin-top: 52px;

    }
    .starttime_title{
      font-size: 10px;
      font-weight: 200;
      margin: -1px -4px -16px 0px;
    }
    .endtime_title{
      font-size: 10px;
      font-weight: 200;
      margin:-3px -15px -42px 205px;

    }
    textarea{
      width: 400px;
      height: 176px;
      background-color: rgba(40, 43, 52, 1);
      color: rgba(255, 255, 255, 0.532);
      font-weight: 100;
      padding: 20px;
      border-radius: 6px;
      border: 1px solid #282b34;
    }

    .journal_name{
      font-size: 10px;
      font-weight: 200;
      margin-bottom: 9px;
    }

    .journal{
      margin:29px -15px -53px 2px;
    }

    #category{
      margin: 123px 3px 4px 316px;
    }

    #date{
      margin:  45px 0px 10px 0px;
    }

    .cate{
      padding: 13px;
      border: 1px solid #282b34;
      border-radius: 6px;
      background-color: #282b34;
      color: #e9ecef;
      font-size: 11px;
      margin: 25px 0px -16px -19px;
      height: 45px;
      width: 100px;
    }
    input[type="file"]{
      display: none;
    }
    .btn-upload{
      width: 55px;
      height: 43px;
      border-radius: 6px;
      background-color: rgba(4, 129, 135, 1);
      padding: 13px 2px 7px 1px;
      margin: 1px -307px 6px -2px;
    }

    .filebox{
      margin-top: 21px;
      display: flex;
    }

    .bi-upload{
      margin : 11px 1px 15px 19px;

    }

    .time_box{
      margin-top: 41px;
    }

    #words{
      margin-left: 338px;
      font-size: 11px;
      font-weight: 400;
      display: flex;
      width: 51px;
    }

    #word_alert {
      margin-top: 6px;
      color : red;
    }
    .count_words{
      color : rgba(4, 129, 135, 1);
      font-weight: 400;
    }

    input[type=file]::file-selector-button {
      width: 150px;
      height: 30px;
      background: #fff;
      border: 1px solid rgb(77,77,77);
      border-radius: 10px;
      cursor: pointer;
    }

    .upload-name{
      width: 349px;
      height: 43px;
      border-radius: 6px 2px 2px 6px;
      background-color: rgba(40, 43, 52, 1);
      color: rgba(255, 255, 255, 0.532);
      font-weight: 100;
      padding: 20px;
      border: 1px solid #282b34;
    }

    .image_total{
      display: flex;
      margin-left: 0px;
      margin-top: 25px;
      margin-bottom: 22px;
      border-radius: 3px;
    }

    .bi-trash::before {
      z-index: 10;
      margin: 5px 0px 1px 5px;
    }

    .image_delete{
      position : relative;
      z-index: 9;
      background: gray;
      border-radius: 3px;
      width: 24px;
      height: 24px;
      margin : -26px -23px 0px 17px;
    }
    .write{
      width: 404px;
      height: 50px;
      border-radius: 6px;
      background-color: rgba(4, 129, 135, 1);
      color: white;
      border: rgba(4, 129, 135, 1);
      margin-top: 25px;
    }

    div.list{
     margin : 15px 256px -92px 256px;
    }

    input[type="button"]{
      margin : 51px 0px 0px 0px;
    }

    .count_words{
      margin-right: 3px;
    }
    .total_words{
      position: absolute;
      margin-left: 28px;
    }


    #word_alert{
      content-visibility : hidden;
    }

    .preview{
      z-index: 5;
      margin-top: -26px;
      width: 100px;
      height: 100px;
    }



  </style>
</head>
<body>
<div class="container">
  <c:import url="layout/leftnav_1.jsp"></c:import>
  <!-- 운동일지는 nav1로, mbti만 nav5로 -->
  <div class="contents">
    <!-- class="full": width=100% -->
    <form action="/schedule.go" method="POST" enctype="multipart/form-data">
      <div class="list">
        <h3 class="capt">
          <div id = "category">
            <select name="cate" class="cate">
              <option value="default">크루/개인</option>
              <option value="crew">크루</option>
              <option value="individual">개인</option>
            </select>
          </div>

          <div id = "date">
            <div class="date_title">날짜</div>
            <p><input type="date" value = "2024-10-18"/></p>
            <div class="time_box">
              <div class="starttime_title">운동 시작 시간</div><div class="endtime_title">운동 종료 시간</div>
              <div class="times"><input type = "time" class="start_time" value="09:00" onchange="onchange_check()"/><input type = "time"  class="end_time"value=""/></div>
            </div>
          </div>



          <div class="journal">
            <div class="journal_name">일지</div>
            <textarea id = "textarea" placeholder="최대 1000자까지 입력할 수 있습니다." onkeyup="word_count()"></textarea>
            <div id="word_alert">1,000자를 초과하여 작성할 수 없습니다.</div>
            <div id = "words"><div class="count_words">0</div><div class="total_words">/1,000</div></div>
            <!--파일 버튼 커스텀 하는 법
            label 안에 커스텀 버튼을 넣고, type = file은 display : none-->

            <div class="filebox">
              <input class="upload-name" value="" placeholder="첨부파일">
              <label for="file">
                <div class = "btn-upload"><i class="bi bi-upload"></i></div>
              </label>
              <input type="file" id="file" name="files" multiple="multiple" onchange="readFile(this)">
            </div>
            <div class = "image_total">
            </div>

          </div>
          <input type = "button" class = "write" value="작성하기">
        </h3>
      </div>
    </form>
  </div>

</div>
<c:import url="layout/modal.jsp"></c:import>
</div>
</body>

<script src="resources/js/common.js"></script>
<script>
  //이미지 미리보기
  function readFile(input){
    console.log(input.files);
    var reader;
    $('.image_total').empty(); //image div에 있는 내용 empty

    //파일 분리하기
    for(var file of input.files){
    //파일 읽어오기
      reader = new FileReader(); //파일 객체로부터 binary를 읽어올 수 있는 객체
      reader.readAsDataURL(file); //파일 객체로부터 DATA URL을 읽어올 수 있음
      reader.onload = function(e){ //파일 다 읽었으면 function 안의 내용 실행
        $('.image_total').append('<img class="preview" src = "' + e.target.result+ '"/>');
      }
    }
  }

  function delete_img(input){
    console.log(input);
    console.log(input);
  }

  function onchange_check(){
    var time_val = $('.start_time').attr('value');
    console.log('time_val:{}',time_val);
  }

  function word_count(){
    var content = document.getElementById('textarea').value;
    console.log('content:',content);
    var content_length = content.length;
    console.log('content_length:'+ content_length);
    $('.count_words').html(content_length);


    //만약 text_area 안의 content_length가 너무 길면...
    if(content_length > 1000){
      console.log('content substring:',content.substring(0,1000));
      $('#textarea').val(content.substring(0,1000)); //value값 변경하기
      $('.count_words').css({'color' : 'red'});
      $('.count_words').html(content_length);
      $('#word_alert').css({'content-visibility' : 'visible'}); //attr 바꾸기
    }

    if(content_length <= 996){
      $('#word_alert').css({'content-visibility' : 'hidden'});
    }
  }

</script>
</html>
