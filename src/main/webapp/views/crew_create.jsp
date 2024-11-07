<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FitMATE</title>
		<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	</head>
	<script src="resources/js/common.js"></script>
	
		
	
	
	<body>
		<div class="container">
			<c:import url="layout/leftnav_1.jsp"></c:import>
			
			
			<!-- 넓은 화면으로 작성할 시 class="contents" -->
			<!-- 좁은 화면으로 작성할 시 class="contents narrow" -->
			<div class="contents narrow">
				
				<!-- 크루 생성자 id  value에 로그인 세션값 넣어주기 -->
				
				<!-- 제목 -->
				<h2 class="title">크루 생성<span>크루생성 화면입니다.</span></h2>
				<!-- //제목 -->
			
				<!-- 폼 -->
                <form action="crew_create.do" method="post">
                <!-- 작성자 id 넣기 = 세션아이디 넣기 -->
           			<input type="hidden" name="crew_id" value="${sessionScope.loginId}">
                    <!-- 경고 -->                     
                    <!-- 통과 -->
                    <div class="list">
                        <h3 class="capt">크루명 <span class="required">(필수)</span></h3>
                        <p><input type="text" class="full pass" name="name" required/></p>
                        <h3 class="msg pass">사용할 수 있는 크루명입니다.</h3>
                    </div>
                    <!-- //통과 -->
                    
                    <!-- 둘로 나뉜 셀렉트박스 / 버튼 -->
                    <div class="list">
                        <h3 class="capt">주로 운동하는 지역</h3>
                        
                        <!-- flex 박스 설정 -->
                        <div class="btn_flex">
                        
                        	<!-- 너비 설정 -->
                        	<!-- 너비는 width10p ~ width90p 범위 내에서 적용 가능 -->
                        	<!-- 단위: 10p (예: width20p, width80p 가능) -->
                            <div class="width50p">
                                <select class="narrow" name="region1" onchange="onOptionChange(event)" required>
									<c:forEach items="${region}" var="region">
										<option value="${region.region_idx}">${region.region_name}</option>
									</c:forEach>
								</select>
                            </div>
                            <div class="width50p">
                                <select class="narrow" name="regions_idx" id="childRegion" required>
									<c:forEach items="${region2}" var="region">
										<option value="${region.regions_idx}">${region.regions_name}</option>
									</c:forEach>
								</select>
                            </div>
                        </div>
                    </div>
                    <!-- //둘로 나뉜 셀렉트박스 / 버튼 -->
                    
                    <!-- 버튼이 붙은 입력창 -->
                    <div class="list">
                        <h3 class="capt">모임취지</h3>
                        
                        <!-- flex-narrow 박스 설정 -->
                       
                        
                        	<!-- 너비 설정 -->
                          <p> <textarea id="content" maxlength="1000" class="full pass" name="content" required oninput="updateCharCount()"/></textarea></p>
                          <div class="character-count" id="charCount">0 / 1000자</div>
                    </div>
               
                    <!-- 제출 버튼 -->
                    <div class="list">
                        <input type="submit" class="full mainbtn" value="크루 생성" />
                    </div>
                    <!-- //제출 버튼 -->
                    
                    
                </form>
				<!-- //폼 -->
			
				<!-- 모달 (경고창, 확인창) -->
			
				
			</div>
		</div>
		<c:import url="layout/modal.jsp"></c:import>
	</body>
	
	<script>
	
	function onOptionChange(event) {
	    // 선택된 지역 idx 값 추출
	    var selectedRegionIdx = event.target.value;
	    
	    console.log(selectedRegionIdx);
	    var selectedValue = document.getElementById("childRegion").value;
	    console.log(selectedValue);
	    // 선택된 값이 비어있지 않으면 AJAX 요청
	    if (selectedRegionIdx) {
	        $.ajax({
	            url: 'crew_regions.ajax', // 서버로 요청할 URL
	            type: 'GET', // 또는 'GET', 서버에 따라 적절히 선택
	            data: { 
	            	selectedRegionIdx: selectedRegionIdx 
	            },
	            success: function(response) {
	            	// 서버 응답을 처리 (예: 자식 지역 업데이트)
	                console.log('서버 응답:', response);

	                // 받은 데이터를 기반으로 자식 지역 업데이트
	                var childRegionSelect = $('#childRegion'); // <select> 요소 선택

	                // 기존 옵션을 모두 제거
	                childRegionSelect.empty();

	                // 기본 옵션 추가
	                childRegionSelect.append('<option value="">-- 자식 지역 선택 --</option>');

	                // 응답에서 받은 지역 데이터를 순회하여 새로운 옵션을 추가
	                response.forEach(function(region) {
	                    var option = $('<option></option>')  // 새로운 <option> 요소 생성
	                        .attr('value', region.regions_idx) // value 속성 추가
	                        .text(region.regions_name); // 텍스트로 지역 이름 추가
	                    childRegionSelect.append(option); // <select>에 옵션 추가
	                });
	               
	            },
	            error: function(xhr, status, error) {
	                // 오류 처리
	                console.error('AJAX 요청 실패:', error);
	            }
	        });
	    }
	} // function onOptionChange(event)
    
	// 선택된 자식 지역 값을 가져오는 예시 (AJAX 요청 외에도 다른 곳에서 필요할 경우)
	function getSelectedChildRegion() {
	    var selectedChildRegionIdx = document.getElementById("childRegion").value;
	    console.log('저장된 자식 지역 선택 값:', selectedChildRegionIdx);
	    
	}
	
	 // 글자수 카운트 함수
    function updateCharCount() {
        var content = document.getElementById("content").value; // textarea의 값
        var charCount = content.length; // 글자수
        var maxLength = 1000; // 최대 글자수
        var remaining = maxLength - charCount; // 남은 글자수
        
        // 글자수 표시 업데이트
        document.getElementById("charCount").innerText = charCount + " / " + maxLength + "자";
        
        // 남은 글자수가 0 이하이면 입력을 막음
        if (remaining < 0) {
            document.getElementById("content").value = content.substring(0, maxLength); // 최대 1000자까지만 입력
        }
    }
	
	</script>
	
</html>