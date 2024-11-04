<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		
		<meta charset="UTF-8">
		<title>FitMATE</title>
		<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<!-- 추가한코드 -->
		
		<style>
		
		/* 모달 기본 스타일 */
.modal {
    display: none; /* 기본적으로 숨김 */
    position: fixed; 
    z-index: 1000; /* 다른 요소 위에 표시 */
    left: 0;
    top: 0;
    width: 100%; 
    height: 100%; 
    overflow: auto; 
    background-color: rgba(0, 0, 0, 0.7); /* 반투명 배경 */
}

.modal-content {
    background-color: #282b34; /* 기존 스타일과 일치 */
    margin: 15% auto; 
    padding: 20px;
    border-radius: 4px; /* 둥근 모서리 */
    width: 30%; 
    color: white; /* 글자 색상 */
}

.close {
    color: #aaa; /* 닫기 버튼 색상 */
    float: right;
    font-size: 28px;
    font-weight: bold;
}
		
		/*내용 작성란 스타일 크기 조절*/
		#contentInput {
        height: 300px; /* 원하는 높이 설정 */
        resize: none; /* 사용자가 크기를 조절할 수 없도록 설정 (선택 사항) */
    }
    	/* 글자수 카운팅하는 부분 스타일 */
         #charCount {
            font-weight: bold; /* 글자 수 강조 */
            margin-top: 5px; /* 위쪽 여백 */
        }
        
        
    .recruit_left {
	/* position: absolute; 
			    left: 50%; */
	width: 15%;
	aspect-ratio: 1;
	border: 1px solid black;
	border-radius: 50%;
}

.bi bi-person-circle {
	aspect-ratio: 1;
	border: 1px solid black;
	border-radius: 50%;
	font-size: 15%;
}

div.recruit_right {
	position: absolute;
	top: -4%;
	left: 20%;
	width: 80%;
}

div.recruit_right span {
	width: 100%;
}

.text_area {
	display: inline-block;
	width: 63%;
	margin: 0%;
	/* 영역을 넘어가는 경우 숨김처리.  */
	overflow: hidden;
	/* 숨겨지는 부분에 말줄임표(...)표시 */
	text-overflow: ellipsis;
	/* 줄바꿈 방지 */
	white-space: nowrap;
}

h2.title {
	margin: 0;
}

div.recruit_header {
	position: relative;
	margin-top: 5%;
	height: 15%;
}

div.recruit_body {
	position: relative;
}

div.recruit_footer {
	position: relative;
} 

div.recruit_info {
	margin: 5% 0;
	display: flex;
	flex-wrap: wrap;
}

div.recruit_info span {
	text-align: center;
	flex: 1 1 10%;
}

div.comment_area {
	overflow-y: scroll;
    overflow-x: hidden;
	background-color: #282b34;
	border-radius: 4px;
	padding: 5% 5%;
	height: 45%;
}

div.comment {
	position: relative;
	margin: 5% 0;
}

button.add_button {
	background-color: #282b34;
	color: white;
	border: none;
	position: absolute;
	top: 0;
	right: 0;
	padding: 0;
	margin: 0;
}

div.comment .mainbtn.minbtn {
	position: absolute;
	bottom: 0;
	right: 0;
}

div.recomment {
	position: absolute;
	width: 90%;
}

div.comment_ask, div.comment_reply{
	height: 18%;
	position: relative;
	margin: 5% 0;
}

div.comment_reply{
	height: 45%;
	position: relative;
	margin: 5% 0;
}

div.comment_ask .mainbtn{
	position: absolute;
	bottom: 0;	
	right: 0;
}

div.comment_reply .mainbtn{
	position: absolute;
	bottom: 0;	
	right: 0;
}

div.reply_right{
	position: absolute;
	right: 0;
	width: 90%;
}

textarea, hr{
	border: 1px solid white;
	font-family: 'Noto Sans KR', sans-serif;
	opacity: 0.5;
}
        
		</style>
	</head>
	<body>
		<div class="container">
			<c:import url="layout/leftnav_1.jsp"></c:import>
			
			
			<!-- 넓은 화면으로 작성할 시 class="contents" -->
			<!-- 좁은 화면으로 작성할 시 class="contents narrow" -->
			<div class="contents narrow">
				<!-- 크루 생성자 id  value에 로그인 세션값 넣어주기 -->
				
				<!-- 제목 -->
				<h2 class="title">크루이름<span>사진게시글</span></h2>
					
					<input type="hidden" id="sessionId" value="${sessionScope.loginId}">
                	<!-- 작성자 id 넣기 -->
                	 <input type="hidden" id="board_id" name="board_id" value="${board.board_id}">
                	 <!-- 크루 idx 넣기 -->
                	 <input type="hidden" id="board_idx" name="board_idx" value="${board.board_idx}">     	             
                    <input type="hidden" id="crew_idx" name="crew_idx" value="${crew_idx}"> 
                      <input type="hidden" id="crew_id" name="crew_id" value="${crew_id}"> 
                    <div id="img_list" class="list">
   							<img alt="${file.ori_filename}" id="photo_file" src="/photo/${file.new_filename}"><br/>
                    </div>  
             			
                    <!-- 버튼이 붙은 입력창 -->
                    <div class="list">
                        <h3 class="capt">게시글내용</h3>
                        
                        <div class="recruit_header">
				<!-- item.leader_profile -->
				
				<!-- 이미지가 있을경우 -->
				<c:if test="${not empty member.profile}">
				 <img class="recruit_left" src="/photo/${member.profile}"/> 
				</c:if>
				<!-- 이미지가 없을경우 -->
				<c:if test="${empty member.profile}">
				<i class="bi bi-person-circle" style="font-size: 60px;">${member.profile}</i>
				</c:if>
				<div class="list">

				<div class="recruit_right">
					<h2 class="title">${member.nick}</h2>
					<span class="text_area"><span> ${board.board_id} </span><span>
							${member.profile}</span></span>
				</div>
				</br>
				<div class="recruit_info">
				
					<span><i class="bi bi-geo-alt-fill"></i></span> 
					<span><i class="bi bi-people-fill"></i></span>
					<span><i class="bi bi-fonts"></i></span> 
					<!-- 옵션버튼 시작 -->
					
					<span> <button type="button" class="mainbtn small" onclick="showReportModal()">옵션</button>
					</span>	
                       <div id="reportModal" class="modal">
						    <div class="modal-content">
						        <span class="close" onclick="hideReportModal()">&times;</span>
						        <h5 id="modaltitle"></h5>
						        <p id="modalcontent"></p>
						        <p id="buttontype">
						      	<button onclick="submitReport()">확인</button></p>
						        <button onclick="hideReportModal()">취소하기</button>
						    </div>
						</div>
										
					<!-- 옵션버튼 끝 -->
				<!-- <span id="buttontype"></span> -->	
				</div>
				<div>
				<div class="list">
				 <p><textarea  class="full pass" name="subject" id="contentInput" readonly/>${board.subject}</textarea></p>
					
				</div>
	
			</div>
                       
            </div>

			</div>
		</div>
		<c:import url="layout/modal.jsp"></c:import>
	</body>
	
	<script>
	var reportUrl = '초기값';
	const photosubject = document.getElementById("contentInput");
	
	 var file = "${file}"; // EL을 사용하여 모델 값 가져오기
     console.log(file); // 콘솔에 출력
	 
     var board = "${board}"; // EL을 사용하여 모델 값 가져오기
     console.log(board); // 콘솔에 출력

	
     var member = "${member.nick}"; // EL을 사용하여 모델 값 가져오기
     console.log(member); // 콘솔에 출력
     console.log(member.profile);
     var crewIdx = $('#crew_idx').val();
     var crewId = $('#crew_id').val();
     var loginId = '${sessionScope.loginId}';
     // 크루장인지 확인하는 변수
     var isCrewLeader = false;
     if(loginId === $('#crew_id').val() ){
    	 isCrewLeader = true;
     }
     else{
    	 isCrewLeader = false;
     }
     console.log(Object.keys(board)); 
     Buttontype(1);
     
 
     // 사진게시글 블라인드 하기
     if ("${board.status}" === "2") {
	        
	        photosubject.value = '블라인드된 게시글 입니다';
	        // 사진 블라인드 사진으로 바꿔주기 document.getElementById("contentInput").value = '기본이미지';
	    	
	    }
    
   //  const reportUrl = ''; // URL 설정
     const boardIdx = "${board.board_idx}"; // board_idx 값
     
     
     
     function Buttontype() {
    	    // 기본 버튼 설정
    	 //   let deleteButton = '<button type="button" class="mainbtn small"></button>';
    	    
    	    const modalTitle = document.getElementById("modaltitle");
    	     const modalContent = document.getElementById("modalcontent");
    	     const photosubject =  document.getElementById("contentInput");
    	     
    	     
    	     
    	     if(isCrewLeader){ // 크루장이라면
    	    	 if (sessionId === "${board.board_id}") { // 내가 작성자라면
    	    	      //  deleteButton = '<button type="button" onclick="showReportModal(\'crew_oneboard_del?board_idx=${board.board_idx}\')" class="mainbtn full">삭제하기</button>';
    	    	        reportUrl = 'crew_photo_del?board_idx=${board.board_idx}';
    	    	        modalTitle.textContent = '삭제하기';
    	    	        modalContent.textContent = '정말로 삭제하시겠습니까';
    	    	        console.log(reportUrl);
    	    	    }
    	    	 else{
    	    		 if ("${board.status}" === "2") { // 숨겨진 글이라면 블라인드 풀기
           	          //  deleteButton = '<button type="button" class="mainbtn small" onclick="showReportModal(\'crew_oneboard_unblind?board_idx=${board.board_idx}\')">블라인드취소하기</button>';
           	            reportUrl = 'crew_photo_unblind?board_idx=${board.board_idx}&crew_idx=' + crewIdx;
           	            modalTitle.textContent = '블라인드풀기';
               	        modalContent.textContent = '정말로 블라인드 해제 하시겠습니까';
               	        console.log(reportUrl);
           	        }
    	    		 if("${board.status}" === "1"){ // 보여지는 글이라면 블라인드하기
    	    			 reportUrl = 'crew_photo_blind?board_idx=${board.board_idx}&crew_idx=' + crewIdx;
           	            modalTitle.textContent = '블라인드하기';
               	        modalContent.textContent = '정말로 블라인드 하시겠습니까';
               	        console.log(reportUrl);
    	    		 }
    	    	 }
    	     }
    	     else{ // 크루장이 아니라면
    	    	 if (sessionId === "${board.board_id}") { // 내가 작성자라면
   	    	      //  deleteButton = '<button type="button" onclick="showReportModal(\'crew_oneboard_del?board_idx=${board.board_idx}\')" class="mainbtn full">삭제하기</button>';
   	    	        reportUrl = 'crew_photo_del?board_idx=${board.board_idx}&crew_idx=' + crewIdx;
   	    	        modalTitle.textContent = '삭제하기';
   	    	        modalContent.textContent = '정말로 삭제하시겠습니까';
   	    	        console.log(reportUrl);
   	    	    }
    	    	 else{ // 내가 작성자가 아니라면
    	    		 if("${board.status}" !== "2"){
    	   			  //  deleteButton = '<button type="button" class="mainbtn small" onclick="showReportModal(\'crew_report.go?board_idx=${board.board_idx}&board_id=${board.board_id}\')">신고하기</button>';
    	   			    reportUrl = 'crew_report.go?board_idx=${board.board_idx}&board_id=${board.board_id}&crew_idx=' + crewIdx;
    	   			    modalTitle.textContent = '신고하기';
    	       	        modalContent.textContent = '정말로 신고 하시겠습니까';
    	       	        
    	       	        	console.log(reportUrl);
    	       	    	}
    	    		 else{
    	    			 modalTitle.textContent = '블라인드된 글입니다';
        	    	     modalContent.textContent = '블라인드된 글입니다';
        	    	     reportUrl = 'crew_photo_detail.go?board_idx=${board.board_idx}';
        	    	     console.log(reportUrl);
    	    		 }
    	    	 }
    	     }

    	    // 버튼을 #buttontype 요소에 추가
    	  //  $('#buttontype').append(deleteButton);
    	}
	
     console.log(reportUrl);

     function showReportModal() {
          // 신고 URL 저장
         document.getElementById("reportModal").style.display = "block"; // 모달 보여주기
         
         console.log('쇼모달창 주소 ',reportUrl);
         
     }

     function hideReportModal() {
         document.getElementById("reportModal").style.display = "none"; // 모달 숨기기
     }
     
     function submitReport() {
    	    console.log("신고가 완료되었습니다.");
    	    // 신고 URL로 이동
    	    console.log(reportUrl);
    	    location.href = reportUrl; 
    	    hideReportModal(); // 모달 닫기
    	}
     
     //
     
     
	</script>
	<script src="resources/js/common.js"></script>
</html>