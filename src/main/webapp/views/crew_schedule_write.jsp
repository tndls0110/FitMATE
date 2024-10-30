<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FitMATE</title>
		<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<style>
	
	.days, .checkboxes {
    display: flex;
    justify-content: space-around; /* 간격 균등 배치 */
    margin-bottom: 15px; /* 아래쪽 간격 */
}

.days span, .checkboxes label {
    flex: 1; /* 각 요소가 동일한 폭을 가짐 */
    text-align: center; /* 텍스트 중앙 정렬 */
}

.checkboxes label {
    margin: 0 10px; /* 체크박스 사이의 간격 조정 */
}

input[type="time"]
{
    width: 100%;
    border: 1px solid #282b34;
    border-radius: 6px;
    background-color: #282b34;
    color: #e9ecef;
    font-size: 14px;
}

input[type="time"]
{
    padding: 16px;
}	

.mainbtn {
    float: right; /* 버튼을 오른쪽으로 이동 */
    margin-top: 10px; /* 버튼과 체크박스 사이에 여백 추가 */
}	

/* 기존 css */
	
/* 카카오 api css 시작*/
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}

/* 카카오 api css 종료 */
	
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
				<h2 class="title">크루 이름<span>크루 일정 작성 화면입니다.</span></h2>
				<!-- //제목 -->
			
				<!-- 폼 -->
                <form action="crew_schedule_write.do" method="post">
                	<!-- 작성자 id 넣기 = 세션아이디 넣기 -->
           			<input type="hidden" name="crew_id" value="member01">
                    <input type="hidden" name="crew_idx" value="6">
                    <!-- 경고 -->                     
                    <!-- 통과 -->
                    <div class="list">
                        <h3 class="capt">모임 날짜 <span class="required">(오늘날짜부터)</span></h3>
                        <p><input type="date" class="full pass" name="date" /></p>
                        
                    </div>
                    <!-- //통과 -->
                    <h3 class="capt">모임 주기</h3>
                    <div class="list">
                    	
                    	
				    <div class="days">
				        <span>월</span>
				        <span>화</span>
				        <span>수</span>
				        <span>목</span>
				        <span>금</span>
				        <span>토</span>
				        <span>일</span>
				    </div>
				    <div class="checkboxes" name="days" value=checkedDays>
				        <label>
				            <input type="checkbox" name="day" value="1"> 
				        </label>
				        <label>
				            <input type="checkbox" name="day" value="2"> 
				        </label>
				        <label>
				            <input type="checkbox" name="day" value="3"> 
				        </label>
				        <label>
				            <input type="checkbox" name="day" value="4"> 
				        </label>
				        <label>
				            <input type="checkbox" name="day" value="5"> 
				        </label>
				        <label>
				            <input type="checkbox" name="day" value="6"> 
				        </label>
				        <label>
				            <input type="checkbox" name="day" value="7"> 
				        </label>
				    </div>
                    	
						<button class="mainbtn" type="button" onclick="getCheckedDays()">확인</button>
						</br>
						<p id="selectedDays">  </p>
						
					</div>
					
                    <div class="list">
                    	<div>
                    	
                        <h3 class="capt">운동 시간</h3>
                        </div>
                        <!-- flex 박스 설정 -->
                        <div class="btn_flex">
                        
                        	<!-- 너비 설정 -->
                        	<!-- 너비는 width10p ~ width90p 범위 내에서 적용 가능 -->
                        	<!-- 단위: 10p (예: width20p, width80p 가능) -->
                           
                            <div class="width50p">
                             <h5 class="capt">운동 시작 시간</h5>
                                <input class="narrow" type="time" id="start_time" name="start_time" required>
                            </div>
                            
                            <div class="width50p">
                            <h5 class="capt">운동 종료 시간</h5>
                                <input class="narrow" type="time" id="end_time" name="end_time" required>
                            </div>
                        </div>
                    </div>
                    <!-- //둘로 나뉜 셀렉트박스 / 버튼 -->
                    
                    <!-- 버튼이 붙은 입력창 -->
                    
                    <div class="list">
                        <h3 class="capt">모임장소</h3>
                        
                        <!-- flex-narrow 박스 설정 -->
                        	<!-- 너비 설정 -->
                          <p> <textarea id="place" maxlength="1000" class="full pass" name="place" readonly/></textarea></p>
                     </div>     
                          <!-- 카카오 지도 시작 -->
                          
                         <h3 class="capt">장소검색(검색후 마커를 클릭하세요)</h3>
                          <div class="btn_flex narrow">
	                          <div class="width70p">
	                                <input type="text" class="full flex_left" name="placesearch" value="" />
	                            </div>
	                            <div class="width30p">
	                                <button type="button" class="mainbtn full flex_right" onclick="searchPlaces()">검색하기</button>
	                            </div>
                          </div>
                     <div class="map_wrap">
    				<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

   
                         
                         <!-- 카카오 지도 끝 -->
                         
                    </div>
                    
                    <div class="list">
                        <h3 class="capt">제목</h3>
                        
                        <!-- flex-narrow 박스 설정 -->
                       
                        
                        	<!-- 너비 설정 -->
                          <p> <textarea id="content" maxlength="1000" class="full pass" name="subject" /></textarea></p>
                          <div class="character-count" id="charCount">0 / 1000자</div>
                    </div>
                    
                    <div class="list">
                        <h3 class="capt">모임취지</h3>
                        
                        <!-- flex-narrow 박스 설정 -->
                       
                        
                        	<!-- 너비 설정 -->
                          <p> <textarea id="content" maxlength="1000" class="full pass" name="content" /></textarea></p>
                          <div class="character-count" id="charCount">0 / 1000자</div>
                    </div>
               
                    <!-- 제출 버튼 -->
                    <div class="list">
                        <input type="submit" class="full mainbtn" value="작성하기" />
                    </div>
                    <!-- //제출 버튼 -->
                    
                    
                </form>
				<!-- //폼 -->
			
				<!-- 모달 (경고창, 확인창) -->
			
		
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a522c7744ff77d8193b972f95c556a1&libraries=services,clusterer,drawing"></script>
<script>
// 카카오 api 스크립트 start
// textarea 요소 선택
const textarea = document.getElementById("place");






// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다
function searchPlaces() {
       const placesearch = document.querySelector('input[name="placesearch"]');
        ps.keywordSearch(placesearch.value, placesSearchCB);
      }


// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
        

        
        // textarea에 값 설정
        textarea.value = place.place_name;
        
    });
}





// 카카오 api end
</script> 
			
				
			</div>
		</div>
		<c:import url="layout/modal.jsp"></c:import>
	</body>
	<script>
	function getCheckedDays() {
	    const checkboxes = document.querySelectorAll('input[name="day"]:checked');
	    const checkedDays = [];
	    
	    checkboxes.forEach((checkbox) => {
	        checkedDays.push(checkbox.value);
	    });
	    
	    document.getElementById("selectedDays").innerText = "선택된 요일:"+ checkedDays.join(", ");
	}
	</script>
	
	<script src="resources/js/common.js"></script>
</html>