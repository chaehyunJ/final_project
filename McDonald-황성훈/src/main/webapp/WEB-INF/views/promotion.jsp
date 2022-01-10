<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/promotion.css">
<script src="${cpath }/resources/js/promotion.js"></script>
	 <div class="promotion-container">
        <div class="visual-area">
            <img src="${cpath }/resources/promotion/promotion-main.jpg">
            <div class="visual-title">맥도날드 프로모션</div>
                <ul class="visual-ul">
                    <li>Home</li>
                    <li>•</li>
                    <li>What's New</li>
                    <li>•</li>
                    <li>맥도날드 프로모션</li>
                </ul>
        </div>
        <div class="promotion-imageList"></div>
    </div>

    <div id="btnMore">
        <img id="btn" src="${cpath }/resources/promotion/btn-more.png">
    </div>
    
    <script>
    	
    	let buttonCount = 0
    	
    	const cpath = '${cpath}'
    	const btn = document.getElementById('btn')
    	const result = document.querySelector('.result')
    			
    	window.onload = getImageList()
    	
    </script>
</body>
</html>