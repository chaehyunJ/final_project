<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${ pageContext.request.contextPath }</c:set>


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
	const btnOpen = document.getElementById('btnOpen')
	const btnClose = document.getElementById('btnClose')
	const mainOne = document.querySelector('.main-inner-one1')
	const mainOne2 = document.querySelector('.main-inner-one2')
	const slide = document.querySelector('.slide')
	const mainInner = document.querySelector('.main-inner')

	
	const promotionImageList = document.querySelector('.promotion-imageList')
	console.log(promotionImageList)
	
	let value = 0

	const unit = 1700

	
	
	btnOpen.onclick = function(){
		let classList = document.querySelector('.detailinfo').classList; 
		
		if(classList.contains('main-inner')){
			classList.remove('main-inner')
			classList.add('main-inner1')
			btnOpen.add('hidden')
			btnClose.remove('hidden')
		}
	}
	
	btnClose.onclick = function(){
		let classList = document.querySelector('.detailinfo').classList;
		
		if(classList.contains('main-inner1')){
			classList.remove('main-inner1')
			classList.add('main-inner')
			btnOpen.remove('hidden')
			btnClose.add('hidden')
		}
	}

	setMoveInterval()
	
	
	const url = cpath + '/ajaxPromotion'
	const opt = {
		method : 'get'
	}
	fetch(url,opt)
	.then(resp => resp.json())
	.then(json => {
		console.log(json)
		let dom = ''
			json.forEach(dto => {
			dom += '<div class="main-inner-event">'
			dom += '<img src="'+ dto.promotion_img +'">'
			dom += '</div>'
	})
	mainInner.innerHTML += dom
})


</script>


</body>
</html>