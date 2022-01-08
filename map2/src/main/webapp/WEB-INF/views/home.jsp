<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${ pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>주소로 지도 띄우기</title>
</head>
<body>
<!-- jquery 사용 -->
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fe8cb756f9e4d1d6a624a436989632fd&libraries=services"></script>


<table border="1" cellpadding="7" cellspacing="0">
	<tr>
		<td>주소</td>
		<td><input type="text" id="address" name="address_kakao" readonly></td>
		<td><input type="button" id="searchBtn" value="검색"></td>
	</tr>
</table>

<div id="map" style="width:500px;height:350px;"></div>


<a href="${ cpath }/kakaopay">카카오페이</a>
<a href="${ cpath }/cancel">취소</a>
<a href="${ cpath }/fail">실패</a>

<script>

    document.getElementById("address").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address").value = data.address; // 주소 넣기
            }
        }).open();
    });

</script>


<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

//지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 
    

$('#searchBtn').click(function(){	// 버튼 클릭 시 함수 실행
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch($('#address').val(), function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
	        // 추출한 좌표를 통해 도로면 주소 추출
	        
	        let lat = result[0].y;
	        let lng = result[0].x;
	        
	        getAddr(lat, lng);
	        
	        function getAddr(lat, lng){
	        	let geocoder = new kakao.maps.services.Geocoder();
	        	
	        	let coord = new kakao.maps.LatLng(lat, lng);
	        	let callback = function(result,status){
	        		if(status === kakao.maps.services.Status.OK){
	        			// 추출한 도로명 주소를 해당 input의 value값으로 적용
	        			$('#address').val(result[0].road_address.address_name);
	        			
	        		}
	        	}
	        	geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
	        }
	        
	        
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;"> ' + $('#address').val() +'</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});   
	
})
 
</script>

</body>
</html>