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
			
					<fieldset class="store-searchbox">
						<div class="store-form">
							<input class="store-searchInput" type="text" placeholder="매장명, 동명, 도로명을 검색해 주세요" >
							<button type="button" class="store-searchBtn" onclick="search()">검색하기</button>	
						</div>
					</fieldset>
			</div>
			<div class="storeResult">
				<div id="map" class="store-map" style="height:600px; position: relative; overflow: hidden; background: url(https://t1.daumcdn.net/mapjsapi/images/bg_tile.png)"></div>
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
						<td class="tdName">
							<dl class="name">
								<dt><strong class="tit"><a href="javascript:moveMap(37.570698,126.983558);" title="지도보기">한국맥도날드(유)</a></strong>
								</dt><dd>서울 종로구 공평동 70</dd>
								<dd class="road">서울특별시 종로구  종로 51(종로타워)</dd>
							</dl>
						</td>
						<td>1600-5252</td>
						<td></td>
						<td class="tdService">
							<div class="service">
							</div>
						</td>
					</tr>
			</tbody>
			</table>
		</div>
	</div>
</div>
<%@ include file="footer.jsp" %>

