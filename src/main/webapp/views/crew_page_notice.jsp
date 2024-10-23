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
                                <input type="text" class="full flex_left" name="subject" />
                            </div>
                            <div class="width20p">
                                <button class="mainbtn full flex_right">작성하기</button>
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
		            <th class="col5">삭제</th>
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
	    console.log("crew_idx:", crew_idx); // crew_idx 값을 로그로 출력
	    crewList(crew_idx); // crewList 호출 시 crew_idx 전달
	});

	function crewList(crewIdx) {
	    console.log("Sending crew_idx:", crewIdx); // AJAX 호출 전에 crew_idx 로그 출력
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
	                    tbody.append('<tr><td>' + item.board_idx 
	                    		+ '</td><td>' + item.subject
	                    		+ '</td><td>' +item.board_id
	                    		+ '</td><td>' +item.date
	                    		+ '</td><td><button type="button" class="mainbtn small" onclick="location.href=\'crew_notice_del?board_idx=' + item.board_idx + '\'">삭제</button></td></tr>'
                    	);
	                    console.log(item);
	                    console.log('idx : ' + item.board_idx);
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