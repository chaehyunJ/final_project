<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div id="store-container">
	<div class="store-content">
		<div class="store-banner">
			<div class="store-inner">
				<h1 class="store-title">매장찾기</h1>
				<ul class="store-navPath">
					<li><a>Home</a></li>
					<li><a>Store</a></li>
					<li><a>매장찾기</a></li>
				</ul>
			</div>
		</div>
		<div class="store-contArea">
			<div class="storefind">
			<div class="service-category">
				<div data-cate="hours24">
					<img src="https://www.mcdonalds.co.kr/upload/main/store_service/1580887217994.png">
					<p>24시간</p>
				</div>
				<div data-cate="mcdrive">
					<img src="https://www.mcdonalds.co.kr/upload/main/store_service/1580887501964.png">
					<p>맥드라이브</p>
				</div>
				<div data-cate="mcdelivery">
					<img src="https://www.mcdonalds.co.kr/upload/main/store_service/1580887371824.png">
					<p>맥딜리버리</p>
				</div>
				<div data-cate="mcmorning">
					<img src="https://www.mcdonalds.co.kr/upload/main/store_service/1580887410227.png">
					<p>맥모닝</p>
				</div>
				<div data-cate="parking">
					<img src="https://www.mcdonalds.co.kr/upload/main/store_service/1580887307761.png">
					<p>주차</p>
				</div>
				<div data-cate="decaffeine">
					<img src="https://www.mcdonalds.co.kr/upload/main/store_service/1580887849368.png">
					<p>디카페인 커피</p>
				</div>
			</div>
					<fieldset class="store-searchbox">
						<div class="store-form">
							<input class="store-searchInput" type="text" id="address" name="address_kakao" placeholder="도로명을 검색해 주세요" readonly>
<!-- 							<input class="store-searchInput" type="text" placeholder="도로명을 검색해 주세요" > -->
							<input class="store-searchBtn" type="button" id="searchBtn" value="검색">
<!-- 							<button type="button" class="store-searchBtn" onclick="search()">검색하기</button>	 -->
						</div>
					</fieldset>
			</div>
			<div class="storeResult">
				<div id="map" class="store-map" style="width : 1250px; height:600px; position: relative; overflow: hidden;"></div>
<!-- 				<div id="map" class="store-map" style="height:600px; position: relative; overflow: hidden; background: url(https://t1.daumcdn.net/mapjsapi/images/bg_tile.png)"></div> -->
			</div>
		</div>
		<div class="store-table">
			<table class="store-tableType01">
				<thead>
					<tr>
						<th scope="col">매장명 / 주소</th>
						<th scope="col">전화번호</th>
						<th scope="col">영업시간</th>
						<th scope="col">이용가능 서비스</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div class="store-address-name"></div>
						</td>
						<td>
							<div class="store-tel"></div>
						</td>
						<td>
							<div class="store-open"></div>
						</td>
						<td>
							<div class="store-service"></div>
						</td>
					</tr>
			</tbody>
			</table>
			<div id="storeResult"></div>
		</div>
	</div>
</div>

 <footer class="footer">
        <div class="footer-inner">
            <div class="footer-left">
                <ul>
                    <li><a>개인정보 처리방침</a></li>
                    <li><a>위치정보 이용약관</a></li>
                    <li><a>QnABoard</a></li>
                </ul>
            </div>
            <div class="footer-right">
                <ul>
                    <li>Coded Burger</li>
                    <li>공동대표 : 5조 전원</li>
                    <li>사업자등록번호 : 1234-56-789</li>
                    <li>회사전화 : 010-7374-5328</li>
                    <li>COPYRIGHT © 2019 ALL RIGHTS RESERVED BY McDonald's.</li>
                </ul>
            </div>
            <div class="footer-icon">
                <a href=""><img src="${ cpath }/resources/src/footer/fb.png" alt=""></a>
                <a href=""><img src="${ cpath }/resources/src/footer/insta.png" alt=""></a>
                <a href=""><img src="${ cpath }/resources/src/footer/youtube.png" alt=""></a>
            </div>
        </div>
    </footer>
    
<script>
	const cpath = '${ cpath }'
	const addressName = document.querySelector('.store-address-name')
	const storeTel = document.querySelector('.store-tel')
	const storeOpen = document.querySelector('.store-open')
	const storeService = document.querySelector('.store-service')
	const searchBtn = document.getElementById('searchBtn')
	const address = document.getElementById('address')
	let addressValue = address.value
	
	const storeResult = document.getElementById('storeResult')
	console.log(storeResult)
	
	// 2022-01-21 추가
	const serviceCategory = document.querySelectorAll('.service-category > div')
	console.log(serviceCategory)
	
	serviceCategory.forEach(dto => {
		dto.onclick = function(event){
			let target = event.target
			if(target != 'DIV'){
				target = target.parentNode
				const cate = target.dataset.cate
				console.log(cate)
				const url = cpath + '/storeCate/' + cate
				const opt = {
					method : 'get'
				}
				fetch(url, opt)
				.then(resp => resp.json())
				.then(json => {
					console.log(json)
					let dom1 = ''
					let dom2 = ''
					let dom3 = ''
					let dom4 = ''
					json.forEach(dto => {
						dom1 += '<div>' + dto.STORE_NAME + ' / ' + dto.STORE_ADDRESS +'</div>'
						dom2 += '<div>' + dto.STORE_TEL + '</div>'
						dom3 += '<div>' + dto.STORE_OPENING_HOURS + '</div>'
						dom4 +=  dto.DECAFFEINE == 'y' ? '디카페인 커피\n' : '' 
						dom4 +=  dto.HOURS24 == 'y' ? '24시간\n' : ''
						dom4 +=  dto.MCDELIVERY == 'y' ? '맥딜리버리\n' : ''
						dom4 +=  dto.MCMORNING == 'y' ? '맥모닝\n' : ''
						dom4 +=  dto.PARKING == 'y' ? '주차\n' : ''
						dom4 +=  dto.MCDRIVE == 'y' ? '맥드라이브\n ' : ''
// 									   + dto.HOURS24 == 'y' ? '24시간\n' : ''
// 									   + dto.MCDELIVERY == 'y' ? '맥딜리버리\n' : ''
// 									   + dto.MCMORNING == 'y' ? '맥모닝\n' : ''
// 									   + dto.PARKING == 'y' ? '주차\n' : ''
// 									   + dto.MCDRIVE == 'y' ? '맥드라이브\n ' : '' +
								
					})
					addressName.innerHTML += dom1
					storeTel.innerHTML += dom2
					storeOpen.innerHTML += dom3
					storeService.innerText += dom4
// 					storeResult.innerHTML += dom
				})
			}
		}
	})
	console.log(address)
	console.log(searchBtn)
	console.log(addressName)

    document.getElementById("address").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address").value = data.address // 주소 넣기
//                 addressName.innerText = data.address
            }
        }).open()
    })

</script>


<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    }  

//지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption) 
    

searchBtn.onclick = function(){
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	const url = cpath + '/ajaxStoreInfo/' + address.value
	const opt = {
		method : 'get'
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		console.log(json)
		
		json.forEach(dto => {
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(address.value, function(result, status) {

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
//		 	        			addressValue(result[0].road_address.address_name);
			        			$('#address').val(result[0].road_address.address_name)
			        		}
			        	}
			        	geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
			        }
			        
			        
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        })

			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;"> ' + dto.store_name +'</div>'
			        })
			        infowindow.open(map, marker);

			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords)
			    } 
			})
			
			
			addressName.innerText = dto.store_name + ' / ' + dto.store_address
			storeTel.innerText = dto.store_tel
			storeOpen.innerText = dto.store_opening_hours
			storeService.innerText += dto.hours24 == 'y' ? '24시간\n' : ''
			storeService.innerText += dto.mcdrive == 'y' ? '맥드라이브\n ' : ''
			storeService.innerText += dto.mcdelivery == 'y' ? '맥딜리버리\n' : ''
			storeService.innerText += dto.momorning == 'y' ? '맥모닝\n' : ''
			storeService.innerText += dto.parking == 'y' ? '주차\n' : ''
			storeService.innerText += dto.decaffeine == 'y' ? '디카페인 커피\n' : ''
		})
	})
}


 
</script>
</body>
</html>