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
				<h2 class="title">크루이름<span>한줄 게시글 화면입니다.</span></h2>
				<!-- //제목 -->
			
				<!-- 폼 -->
                <form action="crew_oneboard.do" method="post">
                	<input type="hidden" id="sessionId" value="${sessionScope.sessionId}">
                	<!-- 작성자 id 넣기 -->
                	 <input type="hidden" id="board_id" name="board_id" value="member01">
                	 <!-- 크루 idx 넣기 -->
                	 <input type="hidden" id="crew_idx" name="crew_idx" value="6">
                	<!-- 기본 입력창 -->
                	<!-- class="full": width=100% -->
                	<div class="list">
                        <h3 class="capt">공지사항 작성란</h3>
                        
                        <!-- flex-narrow 박스 설정 -->
                        <div class="btn_flex narrow">
                        
                        	<!-- 너비 설정 -->
                            <div class="width80p">
                                <input type="text" class="full flex_left" name="content" id="subjectInput"/>
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
	
	
	$(document).ready(function() {
	    const crew_idx = $('#crew_idx').val(); // hidden input의 값 가져오기
	  //  console.log("crew_idx:", crew_idx); // crew_idx 값을 로그로 출력
	  //  crewList(crew_idx); // crewList 호출 시 crew_idx 전달
	    
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

	
</script>
	<script src="resources/js/common.js"></script>
</html>