<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="menu-list-inner">

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
	// 메뉴 클릭
		const cpath = '${ cpath }'
		const menu = document.querySelector('.menu-list-inner')
		const menuList = document.querySelectorAll('.top-menu-inner li')
		console.log(menu)
		console.log(menuList)
		
		const url = cpath + '/ajaxBurgerList'
		const opt = {
			method : 'get'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			console.log(json)
			let dom = ''
			
			json.forEach(dto => {
				dom += '<div class="burger-list">'
				dom += '<img src="'+ dto.BURGER_IMAGE +'">'
				dom += '<div>' + dto.BURGER_NAME + '</div>'
				dom += '<div class="burger-desc">' + dto.BURGER_DESCRIPTION + '</div>'
				dom += '</div>'
			})
			menu.innerHTML += dom
		})
		
		
	
// 		menuList.forEach(list => {
// 			list.onclick = function(event){
// 				const table = event.target.dataset.table
// 				console.log(table)
				
// 				const url = cpath + '/ajaxBurger/' + table
// 				console.log(url)
// 				const opt = {
// 					method : 'get'
// 				}
// 				fetch(url, opt)
// 				.then(resp => resp.json())
// 				.then(json => {
// 					console.log(json)
// 				})
// 		}
// 	})
    </script>
</body>
</html>