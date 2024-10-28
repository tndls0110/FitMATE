<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FitMATE</title>
		<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		 <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #000;
            text-align: center;
        }
        .col1 {
            width: 5%;
        }
        .col2 {
            width: 65%;
        }
        .col3, .col4 {
            width: 10%;
        }
        .col15 {
            width: 10%;
        }
        .small {
    padding: 5px 10px;  /* 상하, 좌우 여백 */
    font-size: 10px;    /* 글자 크기 */
    height: auto;       /* 높이 자동 */
		}
		 #crewleader {
            display: none; /* 기본적으로 숨김 */
        }
        
		 #crewleadertitle {
            display: none; /* 기본적으로 숨김 */
        }
		#warning {
            color: red;
            display: none; /* 기본적으로 숨김 */
        }
         #charCount {
            font-weight: bold; /* 글자 수 강조 */
            margin-top: 5px; /* 위쪽 여백 */
        }
    </style>
	</head>
	<body>
		<div class="container">
			<c:import url="layout/leftnav_1.jsp"></c:import>
			
			<!-- 넓은 화면으로 작성할 시 class="contents" -->
			<!-- 좁은 화면으로 작성할 시 class="contents narrow" -->
			<div class="contents">
	
				<!-- 제목 -->
				<h2 class="title">크루이름<span>크루 공지 화면입니다.</span></h2>
				<!-- //제목 -->
			
				<!-- 폼 -->
                <form action="crew_page_notice.do" method="post">
                	
                	
                	<!-- 
                			!!	나중에 변경할때 참고할 코드   !!
                			!!  페이지 이동처리시 전달받을 변수 !!
                	
                	 로그인세션아이디 가져오기 작성자 구분, 크루장 구분 할때 이용 <input type="hidden" id="sessionId" value="${sessionScope.sessionId}"> 
                	<input type="hidden" id="sessionId" value="member01">
                	  작성자 id 넣기 크루장id 넣기? <input type="hidden" id="board_id" name="board_id" value="${board_id}"> 
                	 <input type="hidden" id="board_id" name="board_id" value="member01">
                	 나중에 크루 idx 넣기 <input type="hidden" id="crew_idx" name="crew_idx" value="${crew_idx}"> 
                	 <input type="hidden" id="crew_idx" name="crew_idx" value="6">
                	 나중에 크루장 id 넣기  <input type="hidden" id="crew_id" name="crew_id" value="${crew_id}"> 
   					<input type="hidden" id="crew_id" name="crew_id" value="member01">
                	 
                	 -->
                	
                	
                	
                	<input type="hidden" id="sessionId" value="${sessionScope.sessionId}">
                	<!-- 작성자 id 넣기 -->
                	 <input type="hidden" id="board_id" name="board_id" value="member01">
                	 <!-- 크루 idx 넣기 -->
                	 <input type="hidden" id="crew_idx" name="crew_idx" value="6">
                	<!-- 기본 입력창 -->
                	<!-- class="full": width=100% -->
                	<div class="list" id="crewleader">
                        <h3 class="capt">공지사항 작성란</h3>
                        
                        <!-- flex-narrow 박스 설정 -->
                        <div class="btn_flex narrow" >
                        
                        	<!-- 너비 설정 -->
                            <div class="width80p">
                                <input type="text" class="full flex_left" name="subject" id="subjectInput"/>
                            </div>
                            <div class="width20p">
                                <button class="mainbtn full flex_right"id="submitButton" disabled>작성하기</button>
                                 <div>
		                        <span id="charCount">0/1000</span>
		                        <div id="warning">1000자를 초과할 수 없습니다!</div>  
                           		 </div>
                        </div>
                                           
                    </div>
                    </div>
                	
                    <div class="list">
                        <h3 class="capt">공지사항 목록</h3>
                        
                    </div>
                    <!-- //기본 입력창 -->
     	<div class="list">               
		     <table>
		      <thead>
		        <tr>
		            <th class="col1">#</th>
		            <th class="col2">제목</th>
		            <th class="col3">작성자</th>
		            <th class="col4">작성일시</th>
		            <th class="col5">옵션</th>
		        </tr>
		        </thead>
		        <tbody class="show">
		        <tr>
		            <td>내용 1</td>
		            <td>내용 2</td>
		            <td>내용 3</td>
		            <td>내용 4</td>
		            <td><button class="mainbtn minbtn">작은 버튼</button></td>
		        </tr>
		        </tbody>
		    </table>
		</div>	
                   
                    
                   
                    
                </form>
				
				
			</div>
		</div>
		<c:import url="layout/modal.jsp"></c:import>
	</body>
	<script>
	
	// 크루리더 확인하기 = 세션아이디와 크루장 아이디가 같으면 크루장
	
	// 크루리더 확인하는 js 변수 크루장이면 ${isCrewLeader} = true
	// const isCrewLeader = ${isCrewLeader};
	const isCrewLeader = true;
	// 크루장이면 작성하기 폼 보여주기
	if (isCrewLeader) {
        document.getElementById('crewleader').style.display = 'block';
    }
	
	$(document).ready(function() {
	    const crew_idx = $('#crew_idx').val(); // hidden input의 값 가져오기
	  //  console.log("crew_idx:", crew_idx); // crew_idx 값을 로그로 출력
	    crewList(crew_idx); // crewList 호출 시 crew_idx 전달
	    
	    const subjectInput = $('#subjectInput');
	    const charCount = $('#charCount');
	    const warning = $('#warning');
	    const submitButton = $('#submitButton');
	    
	    $('#subjectInput').on('input', function() {
	    	 const maxLength = 1000;
	         let currentLength = $(this).val().length;

	         // 글자 수 체크
	         if (currentLength > maxLength) {
	             warning.show(); // 경고 메시지 표시
	          //   alert('1000자를 초과할 수 없습니다!'); // 경고창 표시
	             submitButton.prop('disabled', true); // 작성하기 버튼 비활성화
	         } else {
	             warning.hide(); // 경고 메시지 숨기기
	             submitButton.prop('disabled', currentLength === 0); // 글자가 없으면 버튼 비활성화
	         }

	         // 카운트 업데이트
	         charCount.text(currentLength + '/' + maxLength);
	    });
	
	    
	});

	function crewList(crewIdx) {
	    console.log("Sending crew_idx:", crewIdx); // AJAX 호출 전에 crew_idx 로그 출력
	    // 세션 아이디 가져오기
	    const sessionId = $('#sessionId').val();
	    console.log(sessionId);
	    $.ajax({
	        url: 'crew_page_notice.ajax',
	        type: 'GET',
	        data: {
	            'crew_idx': crewIdx, // crew_idx가 올바르게 포함되어 있는지 확인
	        },
	        dataType: 'JSON',
	        success: function(list) {
	            console.log("Response list:", list); // 서버 응답 로그 출력
	            let tbody = $('.show');
	            tbody.empty(); // 이전 내용 비우기
							
	           
	                $(list).each(function(idx, item) {
	                	
	                	let deleteButton = '<button type="button" class="mainbtn small"></button>';
	                	 if (sessionId == item.board_id) {
	                	        deleteButton = '<button type="button" class="mainbtn small" onclick="location.href=\'crew_notice_del?board_idx=' + item.board_idx + '\'">삭제</button>';
	                	    }
	                	
	                    tbody.append('<tr><td>' + item.board_idx 
	                    		+ '</td><td>' + item.subject
	                    		+ '</td><td>' +item.board_id
	                    		+ '</td><td>' +item.date
	                    		+ '</td><td>' + deleteButton + '</td></tr>'
                    	);
	                    
	                   
	                });
	         	
	        },
	        error: function(e) {
	            console.log(e); // 에러 로그
	            alert('크루 목록 가져오기 실패');
	        }
	    });
	}
</script>
	<script src="resources/js/common.js"></script>
</html>