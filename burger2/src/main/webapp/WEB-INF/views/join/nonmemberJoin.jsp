<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<div class="join-address-container">
        <ul class="join-address-ul">
            <li style="background-color: red">비회원 주문하기</li> 
           
        </ul>
        <form class="join-address-form" method="POST">
        	<input type="hidden" name="address" value="${ param.addressName } ${ param.adressDetail }">
        	<p>휴대전화 번호 </p>
            <input type="text" name="phone" placeholder="전화번호를 입력해주세요" required>
            <p>이메일 </p>
            <input type="email" name="email" placeholder="이메일을 입력해주세요" required>
            <input id="mainBtn" type="button" value="인증번호발송">
            <p id="emailAuth"></p>
            <p>이메일 인증 </p>      
            <input id= "authResult" type="text" name="authresult" placeholder="인증번호 입력">
  			<input id="authChkBtn" type="button" value="인증확인">
  			<p id="emailResult"></p>
            <p>지역명</p>
            <input id="addressInput" type="text" name="addressName" placeholder="지번, 도로명, 건물명으로 입력해주세요" readonly>
            <hr>
            <p>상세주소</p>
            <input id="detailAddressInput" type="text" name="adressDetail" placeholder="나머지 주소를 입력해주세요" required>
            <hr>
            <p>최종 배달주소</p>
            <div id="address-result">
            	<span id="resultAddress"></span>
            </div>
            <hr>
  			<input id="addressSubmit" type="submit" value="주문하기">
        </form>
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
		const resultAddress = document.getElementById('resultAddress')
		
		console.log(resultAddress)
		
    	document.getElementById("addressInput").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("addressInput").value = data.address; // 주소 넣기
                
                resultAddress.innerText = document.getElementById("addressInput").value
                
                document.getElementById("detailAddressInput").focus(); //상세입력 포커싱
            }
        }).open();
    });
    
    	
    	$('#detailAddressInput').blur(function(){
    		resultAddress.innerText +=  (' ' + $('#detailAddressInput').val())
    	})
    	
		const cpath = '${ cpath }'
    	const mainBtn = document.getElementById('mainBtn')
    	const email = document.querySelector('input[name="email"]')
		const emailAuth = document.getElementById('emailAuth')
		const authChkBtn = document.getElementById('authChkBtn') 
    	const emailResult = document.getElementById('emailResult')
		const authInput = document.querySelector('input[name="authresult"]')
    	
    	mainBtn.onclick = function(){
    		console.log(email.value)
    		
    		const url = cpath +'/mailto/' + email.value + '/'
    		const opt = {
    			method : 'get'
    		}
    		fetch(url, opt)
    		.then(resp => resp.json())
    		.then(json => {
    			console.log(json)
    			emailAuth.innerText = json.message
    			emailAuth.style.color = json.status == 'OK' ? 'blue' : 'red'
    		})
    	}
    	
    	authChkBtn.onclick = function(){
    		const authResult = document.querySelector('input[name="authresult"]').value
    		console.log(authResult)
    		const url = cpath + '/ajaxAuth/' + authResult 
    		const opt = {
    			method : 'get'
    		}
    		fetch(url, opt)
    		.then(resp => resp.json())
    		.then(json => {
    			console.log(json)
    			
    			if(json.status == 'OK'){
    				emailResult.innerText = json.message
    				emailResult.style.color = 'blue'
//     				email.disabled = 'disabled'
    				authInput.disabled = 'disabled'
    				const emailAuth = document.createElement('input')
    				emailAuth.name = 'emailAuth'
    				emailAuth.type = 'hidden'
    				emailAuth.value = 'y'
    				form.appendChild(emailAuth)
    			}
    			else{
    				emailResult.innerText = json.message
    				emailResult.style.color = 'red'
    				email.select()
    			}
    		})
    	}
    	
    	
	</script>
