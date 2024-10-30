<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> -->

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<html>
<head>
<meta charset="UTF-8">
<title>크루검색 페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/common.css" />

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
   
   h2.capt{
      margin: 1% 0;
   }
   
   div.recruitArea, div.approvalArea{
      overflow-y: scroll;
      overflow-x: hidden;
      width: 98%;
      height: 45%;
      margin: 0 auto%;
      
      display: flex;
      flex-wrap: wrap;
   }
   
   div.recruit{
      width: 40%;
      height: 200px;
      margin: 1% 1%;
      padding: 3% 2%;
      background-color: #282b34;
      flex: 1 1 40%;
      /* align-content: left; */ 
      position: relative;
   }
   
   div.recruit_odd{
      width: 48%;
      height: 200px;
      margin: 1% 1%;
      padding: 3% 2%;
      background-color: #282b34;
      /* align-content: left; */
      position: relative; 
      
   }
   
   .recruit_left{
      display: inline-block;
       width: 15%;
       aspect-ratio: 1;
       border: 1px solid black;
       border-radius: 50%;
   }
   
   .recruit_right{
      width: 80%;
      display: inline-block;
      position: absolute;
      top: 0%;
      left: 20%;
   }
   
   div.recruit_content{
      margin: 5% 2%;
      height: 20%;
        /* 줄바꿈 방지 */
        white-space: nowrap; 
        /* 영역을 넘어가는 경우 숨김처리.  */
      overflow: hidden;
      /* 숨겨지는 부분에 말줄임표(...)표시 */
        text-overflow: ellipsis;
   }
   
   div.recruit_info{
      margin: 5% 2%;
      height: 20%;
      display: flex;
      flex-wrap: wrap;
      /* justify-content: space-evenly; */
      position: relative;
   }
   
   span.cnt{
      width: 20%;
      white-space: nowrap; 
        /* 영역을 넘어가는 경우 숨김처리.  */
      overflow: hidden;
      /* 숨겨지는 부분에 말줄임표(...)표시 */
        text-overflow: ellipsis;
   }
   
   span.rgn{
      width: 80%;
      white-space: nowrap; 
        /* 영역을 넘어가는 경우 숨김처리.  */
      overflow: hidden;
      /* 숨겨지는 부분에 말줄임표(...)표시 */
        text-overflow: ellipsis;
   }
   
   .text_area{
      display: inline-block;
      width: 100%;
      /* 영역을 넘어가는 경우 숨김처리.  */
      overflow: hidden;
      /* 숨겨지는 부분에 말줄임표(...)표시 */
        text-overflow: ellipsis;
        /* 줄바꿈 방지 */
        white-space: nowrap;
        margin: 1%;
   }
   
   
   .button_area{
      position: absolute;
      top: 0%;
      right: 0%;
   }
   
   .member_button{
      position: absolute;
      top: 7%;
      right: 3%;
      aspect-ratio: 1;
      background-color: #282b34;
      color: white;
      border: none;
      margin: 0;
      padding: 0;
   }
   
   a.recruit_detail{
      display: block;
      width: 80%;
      position: relative;
      margin-bottom: 5%;
      height: 40%;
   }
   
   div.right_top, div.right_bottom{
      width: 100%;
   }
   
   i.bi.bi-plus-lg{
      position: absolute;
      top: 45%;
      left: 38%;
   }
   
   a.crew_create{
      display: block;
      width: 100%;
      height: 100%;
   }
   
   
</style>
</head>

<body>
   <div class="container">
      <c:import url="layout/leftnav_3.jsp"></c:import>

      <!-- 넓은 화면으로 작성할 시 class="contents" -->
      <!-- 좁은 화면으로 작성할 시 class="contents narrow" -->
      <div class="contents">
         <div class="area">
            <h2 class="capt">신청중인 크루</h3>
            <div class="approvalArea">
            </div>
            
            <!-- 크루모집 영역 -->
            <h2 class="capt">내 크루</h3>
            <div class="recruitArea">
            </div>
         </div>   
      </div>
      
   </div>
</body>
<c:import url="layout/modal.jsp"></c:import>
<script src="resources/js/common.js"></script>
<script>
   
   // 0: 신청중인 크루, 1: 내 크루
   var info_chk = 0;
   
   // 신청중인 크루(1)이면, : 마지막에 WHERE문 추가 =>  crew테이블-crew_idx IN (SELECT crew_idx FROM crew_join테이블 WHERE join_id = sessionID) 
   // 내크루(0) 이면, : 마지막에 WHERE문 추가 => crew테이블-crew_idx IN (SELEC crew_idx FROM crew_member테이블 WHERE member_id = sessionID)
   

   //0. 초기 크루목록 가져오기
   //0-1. 신청중인 크루 목록 가져오기
   crewList();
   
   //0-2. 내 크루 목록 가져오기
   crewList();

   // 크루목록 데이터 불러오기 함수
   function crewList() {
      $.ajax({
         url : 'mycrew.ajax',
         type : 'GET',
         data : {
            'info_chk' : info_chk
         },
         dataType : 'JSON',
         success : function(list) {
            
            // 전체 게시글 개수 Count (홀수개이면 마지막 게시글 Left정렬) 
            var cnt = 1;
            var whereAdd = '';
            
            if (info_chk == 0){
               whereAdd = $('div.approvalArea');    
               info_chk = 1;
            }else{
               whereAdd = $('div.recruitArea');
               info_chk = 0;
            }
             
            $('div.recruitArea').empty();
            
            $(list).each(function(idx, item) { // 데이터 =item
               
               console.log('cnt : ' + cnt);
            
               // Controller에서 받아온 크루원 모집게시글 추가.
               recruitAdd(item, cnt, whereAdd);      
               
               cnt++;
            });
            
            // 내크루영역이라면, 크루생성영역 추가.
            if(info_chk == 0){
               if(cnt % 2 == 1){
                  whereAdd.append('<div class="recruit"><a href="#" class="crew_create"><i class="bi bi-plus-lg">크루 생성하기</i></a></div>');
               }else{
                  whereAdd.append('<div class="recruit_odd"><a href="#" class="crew_create"><i class="bi bi-plus-lg">크루 생성하기</i></a></div>');
               }
            } 
            
            // 새로 읽어온 값이 비어 있는 경우 검색된 데이터가 없습니다. 
            if(list == null || list == ''){
               modal.showAlert('해당 조건으로 검색된 데이터가 없습니다.');
            }

             /* [...버튼]
             크루장인 경우에만 ...버튼을통해 모집글 수정 or 삭제가능..?   삭제는 빼야될듯..? 크루생성과 크루모집글생성을 합쳤기 때문에...
             크루장인지 확인은.. sessionId와 크루장 id 비교..? OR sessionName와 크루장이름 비교 */
         },
         error : function(e) {
            console.log(e); // 에러가 보이지 않도록 추후 처리필요?
            modal.showAlert('크루 목록가져오기 실패');
         }
         // Ajax 요청전 함수.
         /* ,
         beforeSend : function() {
            //데이터가 로드 중임을 나타내는 flag.
            _scrollchk = true;
            //skeleton 그리는함수로 DOM에 추가.
            // Sekeleton Screen
            // 최종 콘텐츠가 제자리에 로드되기 전에 페이지 구조의 윤곽을 나타내는 연한배경, 선 및 텍스트로 구성됨.
            document.getElementById('list').appendChild(skeleton.show());
            //loading animation 보여주기. (스피너 로딩)
            $(".loading").show();

         }, */
         // Ajax 요청후 함수. 
         /* complete : function() {
            //데이터가 로드 중임을 나타내는 flag.
            _scrollchk = false;
            //loading animation과 skeleton을 DOM에서 삭제. 태그의 hidden과 같다
            $(".loading").hide();
            skeleton.hide();
         } */
      });
   }
   
   function recruitAdd(item, cnt, whereAdd){
      var header = '';
      var content = '';
      var info = '';
      var profile = ''; // 프로필 사진
      var leader_button = ''; // 크루장에게 보이는 버튼
      var member_button = ''; // 크루원에게 보이는 버튼
      
      // profile: 프로필사진 (프로필 사진이 없을경우 기본 프로필 적용.)
      if(profile == null || item.leader_profile == ''){
         profile = '<i class="bi bi-person-circle" style="font-size: 54.18px;"></i>';                     
      }else{
         profile = '<img class="recruit_left" src="resources/img/' + item.leader_profile + '"/>';
      }
      
      // sessionID or sessionName을 체크하여 크루장일 경우 버튼추가 (크루 신청관리, 크루 정보수정)  
      leader_button = '<div class="button_area">'
                   + '<button class="mainbtn minbtn">크루 신청관리</button>&nbsp;&nbsp;'
                    + '<button class="subbtn minbtn">크루 정보수정</button>'
                  + '</div>';
      
       /* member_button = '<div class="member_button">' 
                    + '<button type="button" class="member_button">︙</button>'
                   +'</div>'; */   
                   
       member_button = '<button type="button" class="member_button"><i class="bi bi-three-dots-vertical" style="font-size:23px"></i></button>'; 
                     	
      
      // Header: 모집게시글링크-board_idx, 프로필사진, 크루명, 크루장 닉네임, MBTI
      header = '<a href="crew_recruit_detail.go?idx=' + item.board_idx + '" class="recruit_detail">'
               + profile
               + '<div class="recruit_right">'
                  + '<div class="right_top">'
                     + '<h4 class="text_area">' + item.crew_name + '</h4>'
                     + '<br/>'
                     + '<span class="text_area">'
                  + '</div>'
                  + '<div class="right_bottom">'
                     + '<span>' + item.leader_nick + '</span>'
                     + '<span> (' + item.leader_mbti + ')</span>'
                  + '</div>'
                  + '</span>'
               + '</div>'
            + '</a>'
            + member_button;
            
      // Content: 크루 소개글         
      content = '<div class="recruit_content">' + item.subject + '</div>';
      
      // Info: 크루원 수, 활동지역
      info = '<div class="recruit_info">'
               + '<span class="cnt"><i class="bi bi-people-fill"></i>&nbsp;&nbsp;' + item.member_count + ' </span>'
               + '<span class="rgn"><i class="bi bi-geo-alt-fill"></i>&nbsp;&nbsp;' + item.region_name + ' ' + item.regions_name + '</span>'
               + leader_button
           +'</div>';
      
      
      // 홀수번째 게시글은 왼쪽정렬
      if(cnt % 2 == 1){
         whereAdd.append('<div class="recruit_odd">' + header + content + info + '</div>');
      }else{
         whereAdd.append('<div class="recruit">' + header + content + info + '</div>');
      }
      
   }
</script>

</html>