<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="menu-container">

	<div class="menu-top">
		<c:choose>
			<c:when test="${table eq 'mcmorning'}">
				<c:forEach var="top" items="${tList}">
					<img class="menu-img" src="${top.MCMORNING_TABLE_BACKGROUND}">
					<h1 class="menu-title">맥모닝</h1>
					<p class="menu-text">${top.MCMORNING_TABLE_DESCRIPTION}</p>
					<ul class="menu-ul">
						<li><a href="${cpath}">Home</a></li>
						<li>•</li>
						<li>Menu</li>
						<li>•</li>
						<li>맥모닝</li>
					</ul>
				</c:forEach>
			</c:when>
			<c:when test="${table eq 'burger'}">
				<c:forEach var="top" items="${tList}">
					<img class="menu-img" src="${top.BURGER_TABLE_BACKGROUND}">
					<h1 class="menu-title">버거</h1>
					<p class="menu-text">${top.BURGER_TABLE_DESCRIPTION}</p>
					<ul class="menu-ul">
						<li><a href="${cpath}">Home</a></li>
						<li>•</li>
						<li>Menu</li>
						<li>•</li>
						<li>버거</li>
					</ul>
				</c:forEach>
			</c:when>
			<c:when test="${table eq 'side'}">
				<c:forEach var="top" items="${tList}">
					<img class="menu-img" src="${top.SIDE_TABLE_BACKGROUND}">
					<h1 class="menu-title">사이드</h1>
					<p class="menu-text">${top.SIDE_TABLE_DESCRIPTION}</p>
					<ul class="menu-ul">
						<li><a href="${cpath}">Home</a></li>
						<li>•</li>
						<li>Menu</li>
						<li>•</li>
						<li>사이드</li>
					</ul>
				</c:forEach>
			</c:when>
			<c:when test="${table eq 'mccafe'}">
				<c:forEach var="top" items="${tList}">
					<img class="menu-img" src="${top.MCCAFE_TABLE_BACKGROUND}">
					<h1 class="menu-title">맥카페</h1>
					<p class="menu-text">${top.MCCAFE_TABLE_DESCRIPTION}</p>
					<ul class="menu-ul">
						<li><a href="${cpath}">Home</a></li>
						<li>•</li>
						<li>Menu</li>
						<li>•</li>
						<li>맥카페</li>
					</ul>
				</c:forEach>
			</c:when>
			<c:when test="${table eq 'drink'}">
				<c:forEach var="top" items="${tList}">
					<img class="menu-img" src="${top.DRINK_TABLE_BACKGROUND}">
					<h1 class="menu-title">음료</h1>
					<p class="menu-text">${top.DRINK_TABLE_DESCRIPTION}</p>
					<ul class="menu-ul">
						<li><a href="${cpath}">Home</a></li>
						<li>•</li>
						<li>Menu</li>
						<li>•</li>
						<li>음료</li>
					</ul>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach var="top" items="${tList}">
					<img class="menu-img" src="${top.DESSERT_TABLE_BACKGROUND}">
					<h1 class="menu-title">디저트</h1>
					<p class="menu-text">${top.DESSERT_TABLE_DESCRIPTION}</p>
					<ul class="menu-ul">
						<li><a href="${cpath}">Home</a></li>
						<li>•</li>
						<li>Menu</li>
						<li>•</li>
						<li>디저트</li>
					</ul>
				</c:forEach>
			</c:otherwise>		
		</c:choose>	
	</div>
	
	<div class="menu-detail">
		<div class="menu-detail-name"></div>
		<div class="menu-detail-img"></div>
		<div class="menu-detail-desc"></div>
		<div class="menu-detail-time"></div>
		<div class="menu-detail-info">
			<div class="menu-detail-nutrition">
				<h4>영양정보</h4>
				<table>
					<thead>
						<tr>
							<th>영양소</th>
							<th>중량(g)</th>
							<th>중량(ml)</th>
							<th>열량</th>
							<th>당</th>
							<th>단백질</th>
							<th>포화지방</th>
							<th>나트륨</th>
							<th>카페인</th>
						</tr>
					</thead>
					<tbody>
						<tr class="nutrition-content"></tr>
						<tr class="nutrition-thresholds"></tr>
					</tbody>
				</table>
			</div>
			<div class="menu-detail-allergy"></div>
		</div>
	</div>
	
</div>


<script>
	const cpath = '${cpath}'
	const table = '${table}'
	const seq = '${sequence}'
	const name = document.querySelector('.menu-detail-name')
	const img = document.querySelector('.menu-detail-img')
	const desc = document.querySelector('.menu-detail-desc')
	const time = document.querySelector('.menu-detail-time')
	const con = document.querySelector('.nutrition-content')
	const thres = document.querySelector('.nutrition-thresholds')
	const aller = document.querySelector('.menu-detail-allergy')
		
	const url = cpath + '/ajaxMenu/' +table+ '/' +seq
	const opt = {
		method : 'GET',
	}
		fetch(url,opt)
		.then(resp => resp.json())
		.then(json =>{
			console.log(json)
			json.forEach(dto =>{
				for(key in dto){
					let kArr = key.split('_')
					if(key.includes(kArr[0]+'_NAME')){
						let nArr = dto[key].split(' // ')
						name.innerHTML = (nArr.length == 1) ?  nArr[0] : nArr[1]						
					}
					else if(key.includes(kArr[0]+'_IMG')){
						let iArr = dto[key].split(' // ')
						img.innerHTML = '<img src ="'+((iArr.length == 1) ?  iArr[0] : iArr[1])+'">'						
					}
					else if(key.includes(kArr[0]+'_DESCRIPTION')){
 						desc.innerHTML = dto[key]						
					}
					else if(key.includes('SALES_TIME')){
 						time.innerHTML = (dto[key] != 0) ? '*판매시간:'+dto[key] : ''					
 					}
 					
 					let nutrition = ''
//  					if(dto[key].includes(' // ')){
//  						console.log('12')
//  					}
//  					if(value.spilt(' // ')){
//  						let vArr = value.spilt(' // ')
//  						console.log(vArr)
//  					}
//  					let vArr = value.spilt(' // ')
//  					if(vArr.length != 1) {
//  						console.log(vArr)
//  					}
 					nutrition += '<th>함량</th>'
 					nutrition += '<td>'+((dto['WEIGHT_G'] != 0) ? dto['WEIGHT_G']+'g' : '-')+'</td>'
	  				nutrition += dto['WEIGHT_ML'] != undefined ? '<td>'+(dto['WEIGHT_ML'] != 0 ? dto['WEIGHT_ML']+'ml' : '-')+'</td>' : '<td>-</td>'
 					nutrition += '<td>'+((dto['KCAL'] != 0) ? dto['KCAL']+'kcal' : '-')+'</td>'
 					nutrition += '<td>'+((dto['SUGAR'] != 0) ? dto['SUGAR']+'g' : '-')+'</td>'
 					nutrition += '<td>'+((dto['PROTEIN'] != 0) ? dto['PROTEIN']+'g' : '-')+'</td>'
 					nutrition += '<td>'+((dto['FAT'] != 0) ? dto['FAT']+'g' : '-')+'</td>'
 					nutrition += '<td>'+((dto['NATRIUM'] != 0) ? dto['NATRIUM']+'mg' : '-')+'</td>'
	  				nutrition += dto['CAFFEINE'] != undefined ? '<td>'+(dto['CAFFEINE'] != 0 ? dto['CAFFEINE']+'mg' : '-')+'</td>' : '<td>-</td>'
 							
					con.innerHTML = nutrition

 					let baseline = ''
 					baseline += '<th>영양소기준치</th>'
 					baseline += '<td>-</td>'
 					baseline += '<td>-</td>'
 					baseline += '<td>-</td>'
 					baseline += '<td>'+((dto['NUTRIENT_STANDARDS_SUGAR'] != 0) ? dto['NUTRIENT_STANDARDS_SUGAR']+'%' : '-')+'</td>'
 					baseline += '<td>'+((dto['NUTRIENT_STANDARDS_PROTEIN'] != 0) ? dto['NUTRIENT_STANDARDS_PROTEIN']+'%' : '-')+'</td>'
 					baseline += '<td>'+((dto['NUTRIENT_STANDARDS_FAT'] != 0) ? dto['NUTRIENT_STANDARDS_FAT']+'%' : '-')+'</td>'
 					baseline += '<td>'+((dto['NUTRIENT_STANDARDS_NATRIUM'] != 0) ? dto['NUTRIENT_STANDARDS_NATRIUM']+'%' : '-')+'</td>'
 					baseline += '<td>-</td>'
 					
 					thres.innerHTML = baseline		
 					
 					if(dto['ALLERGY_INFO'] != 'null'){
 						let allergy = ''
 						allergy += '<h4>알레르기 정보</h4>'
 						allergy += '<p>'+dto['ALLERGY_INFO']+'</p>'
 						aller.innerHTML = allergy
 					}
 					
				}
			})
		})
	
	
</script>

</body>
</html>