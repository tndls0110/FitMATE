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

    #total_date{
      margin:  45px 0px 10px 0px;
    }

    #cate{
      padding: 13px;
      border: 1px solid #282b34;
      border-radius: 6px;
      background-color: #282b34;
      color: #e9ecef;
      font-size: 11px;
      margin: 25px 0px -17px -42px;
      height: 45px;
      width: 125px;
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

    .preview{
      margin-right: 10px;
    }

    .image_total{
      margin : 25px 10px 22px 0px;
      border-radius: 3px;
      display: flex;
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
      margin : -27px -25px 0px 2px;
    }
    #update{
      width: 404px;
      height: 50px;
      border-radius: 6px;
      background-color: rgba(4, 129, 135, 1);
      color: white;
      border: rgba(4, 129, 135, 1);
      margin-top: 47px;
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
    <form action="schedule_update.do" method="POST" enctype="multipart/form-data">
      <div class="list">
        <h3 class="capt">
          <div id = "category">
            <select name="cate" id ="cate" onchange = "onOptionChange(event)">
              <option value="default">크루/개인</option>

              <option value="1" name = "option" <c:if test = "${journal.journal_cate eq '1'}"> selected</c:if>>개인</option>
              <option value="2" name = "option"<c:if test = "${journal.journal_cate eq '2'}"> selected</c:if>>크루</option>
            </select>
          </div>

          <div id = "total_date">
            <div class="date_title">날짜</div>
            <p><input type="date" name="date" id = "date" value = "${journal.date}"/></p>
            <div class="time_box">
              <div class="starttime_title">운동 시작 시간</div><div class="endtime_title">운동 종료 시간</div>
              <div class="times"><input type = "time" name="start_time" id ="start_time" value="${journal.journal_start}"/><input type = "time" name="end_time"  id ="end_time" value="${journal.journal_end}"/></div>
            </div>
          </div>

          <div class="journal">
            <div class="journal_name">일지</div>
            <textarea name="textarea" id = "textarea" placeholder="최대 1000자까지 입력할 수 있습니다." onkeyup="word_count()">${journal.journal_content}</textarea>
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
                <c:forEach items="${file}" var = "files">
                  <c:if test="${files.size()>0}">
                    <div class="image" data-file-idx = "${files.file_idx}">
                     <div class="image_delete" onclick="delete_img(${files.file_idx})"><i class="bi bi-trash"></i></div>
                     <img width = "100px" class = "preview" src="/photo/${files.new_filename}" alt="${files.ori_filename}"/>
                    </div>
                  </c:if>
                </c:forEach>
              </div>
            </div>
          <input type = "button" id = "update" value="수정하기"/>
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
  //처음에 값 받아온 거 넣어주기
  var start_time = '${journal.journal_start}';
  var end_time = '${journal.journal_end}';
  var change = '${journal.journal_cate}';
  var date = '${journal.date}';
  var journal_idx = '${journal.journal_idx}';
  console.log("시작 시간:", start_time);
  console.log("끝난 시간:",end_time);
  console.log('value : ' + change);
  console.log('journal_idx:'+journal_idx);



  document.getElementById('date').addEventListener('input',function(){
    date = this.value;
    console.log ("date : ", date);
  });

  //시작 시간
  document.getElementById('start_time').addEventListener('input',function() {
    start_time = this.value;
    console.log("시작 시간:", start_time);
  });

  //끝나는 시간
  document.getElementById('end_time').addEventListener('input',function(){
    end_time = this.value;
    console.log("끝난 시간:",end_time);
  });



  document.getElementById('update').addEventListener('click',update);




  function onOptionChange(event){
    change = event.target.value;
    console.log('value : ' + change);
    if(change == 1){
      event.target.style.backgroundColor = 'rgba(4, 129, 135, 1)';
    }else if(change == 2){
      event.target.style.backgroundColor = 'orange';
    }else if(change == 'default'){
      event.target.style.backgroundColor = 'rgba(40, 43, 52, 1)';

    }
  }

  const delete_idx = [];
  function delete_img(file_idx){
    const img = document.querySelector(`.image[data-file-idx="`+file_idx+`"]`);

    //만약 값이 있으면 remove
    console.log("img:",img);

    const idx = {
      'file_idx' : file_idx
    };

    delete_idx.push(idx);
    console.log("삭제할 idx :", delete_idx);
    if(img){
      img.remove();
    }
  }


  const f =[];
  //이미지 미리보기
  function readFile(input){
    console.log(input.files);
    var reader;
    const f_bound = {};
    for(var file of input.files){
      f.push(file);
    }

    console.log("전달해야하는 파일:",f);


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


  //만약에 값이 중간에 바뀌면.. this.value로 다시 넣어주기
  function update(){

    //alert
    console.log("시작 시간:", start_time);
    console.log("끝난 시간:",end_time);
    console.log('value : ' + change);

    //조건 별 alert
    if(change == "default" || change == ""){
      alert('크루/개인 카테고리를 선택해주세요!');
    }else if(date == ""){
      alert('운동한 날짜를 선택해주세요!');
    }else if (start_time == ""){
      alert('시작 시간을 선택해주세요!');
    }else if (end_time == "") {
      alert('끝난 시간을 선택해주세요!');
    }else if (start_time > end_time) {
      alert('종료 시간은 시작 시간보다 빠를 수 없습니다');
    }




    //1. 저장해둔 delete_idx값 param으로 가져가서 삭제
    console.log("삭제할 idx :", delete_idx);
    if(delete_idx.length >0){
      for (var idx of delete_idx){
        console.log("삭제할 idx 분리:", idx);
        real_delete_img(idx);
      }
    }


    //2. file update

    console.log("update 할 file 길이:",f.length);

    console.log("update 할 file:",f);
    if(f.length >0){
      file_update(f,journal_idx);
    }


    //ajax로 전달할 param 만들기
    var param = {id : "${journal.user_id}", journal_idx : ${journal.journal_idx}}

    $('form').find('input, select, textarea').each(function(idx, item) {
      console.log("아이템:", item);
      console.log("아이템0:", item[0]);

      var name = $(item).attr('name'); //name 속성 뽑아오기 -> 안되고 있음...
      console.log("이름:", name);


      if (name == 'option') {
        if ($(item)[0].defaultSelected != $(item[0].selected)) {
          console.log("아이템0:", item[0]);
          param[$(item).attr('name')] = $(item).val();
        }
      }else if(name == 'files'){
        //insert_files();
      }else{
        if($(item)[0].defaultValue != $(item)[0].value){
          param[$(item).attr('name')] = $(item).val();
        }
      }
    });
    console.log('param:',param);
    update_content(param);
    location.href = "schedule.go";
  }




  function update_content(param){
    console.log("update 해야 하는 매개변수:",param);
    $.ajax({
      type : 'GET',
      url : 'update_content.ajax',
      data : param,
      dataType: 'JSON',
      success : function(data){
        console.log(data);
      },error : function (e){
        console.log(e);
      }
    });
  }


  console.log('받아온 값 :', '${journal}');
  console.log('받아온 값 :', '${file}');
  /*console.log('받아온 파일 길이 :', '${file.size()}');*/


  <c:forEach items="${file}" var = "files">
  console.log('받아온 파일 분리:', '${files}');
  </c:forEach>


  console.log('date 받아온 값 :', '${journal.date}'); //journal안의 값 가져오기..



  //페이지 첫 로딩 때 크루, 개인 태그 색깔 넣는 것..+ 들어가있는 글자수 세기 => 나중에 추가하기





  //글자 체크 + 제한 + 내용 뽑아오기
  var content='';
  function word_count(){
    content = document.getElementById('textarea').value;
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

    if(content_length <= 999){
      $('#word_alert').css({'content-visibility' : 'hidden'});
      $('.count_words').css({'color' : 'rgba(4, 129, 135, 1)'});
    }
  }








  //글자 체크 + 제한 + 내용 뽑아오기
  var content='';
  function word_count(){
    content = document.getElementById('textarea').value;
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

    if(content_length <= 999){
      $('#word_alert').css({'content-visibility' : 'hidden'});
      $('.count_words').css({'color' : 'rgba(4, 129, 135, 1)'});
    }
  }

  //실제로 삭제
function real_delete_img(idx){

  $.ajax({
    type : 'GET',
    url : 'delete_img.ajax',
    data : idx,
    dataType : 'JSON',
    success : function(data){
      console.log(data);
      console.log("삭제 성공 : ",data.success);
    },error : function(e){
      console.log(e);
    }
  })
}
function file_update(f,journal_idx){
  console.log("업데이트 해야 하는 file:",f);

  for (var file of f){
    console.log("file 분리 :",file);
    file["journal_idx"]=journal_idx;
    console.log("file로 전달하게 될 매개변수 : ", file);
    var formData = new FormData();
    formData.append('journalIdx',journal_idx);
    formData.append('file',file);

    $.ajax({
      type : 'POST',
      url : 'file_insert.ajax',
      data : formData,
      dataType: 'JSON',
      enctype:'multipart/form-data',
      processData :false,//얘네는 다 false처리
      contentType:false, //얘네는 다 false처리
      success : function (data){
        console.log(data.success);

      },error : function(e){
        console.log(e);
      }

    })


  }

}


</script>
</html>
