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

	// 모달
	const searchIcon = document.querySelector('.search-icon')
	const closeModal = document.getElementById('closeModal')
	const overlay = document.querySelector('.overlay')
	const modal = document.querySelector('.modal')
	
	const promotionImageList = document.querySelector('.promotion-imageList')
	console.log(promotionImageList)
	
	let value = 0

	const unit = 1700

	
	
	btnOpen.onclick = btnOpenHandler
	
	btnClose.onclick = btn1Handler

	

	

	
	window.addEventListener('load', function(){
		ajaxPromotion()
	})
	
	// 기존 버튼형 슬라이더
	$('.main-slide > .page-btns > div').click(btnSlider)

	// 좌/우 버튼 추가 슬라이더
	// 자동 슬라이드 기능도 같이 동작함
	$('.main-slide > .side-btns > div').click(slider)

	window.addEventListener('load', function(){
		setMoveInterval()
	})
	
	searchIcon.addEventListener('click', function(){
		modal.classList.remove('hidden')
		searchIcon.classList.add('hidden')
	})
// 	searchIcon.onclick = modalOpen
	
	closeModal.addEventListener('click', function(){
		modal.classList.add('hidden')
		searchIcon.classList.remove('hidden')
	})

</script>


</body>
</html>