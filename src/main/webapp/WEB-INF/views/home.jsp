<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${cpath}/resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<script src="${cpath }/resources/js/order.js"></script>
<script src="${cpath }/resources/js/orderCount.js"></script>
<script src="${cpath }/resources/js/totalprice.js"></script>
	<ul class="menuparent">
        <li class="selectMenu showColor" data-cate="mac">맥모닝</li>
        <li class="selectMenu" data-cate="macSet">맥모닝 세트</li>
        <li class="selectMenu" data-cate="burger">버거</li>
        <li class="selectMenu" data-cate="burgerSet">버거 세트</li>
        <li class="selectMenu" data-cate="side">스낵＆사이드</li>
        <li class="selectMenu" data-cate="drink">음료</li>
        <li class="selectMenu" data-cate="dessert">디저트</li>
        <li class="selectMenu" data-cate="mcafe">맥카페</li>
    </ul>
    <div class="show">
    	<div class="show-frame"></div>
    	<button class="slide-before"><</button>
        <button class="slide-next">></button>
    </div>
    
    <!-- 주문목록 -->
    <div class="grand_order">
	    <div class="parent_order"></div>
	    <div class="totalprice">
	    	<div class="deleteall">전체  삭제</div>
	    	<div class="productcount">선택한 상품     <span style="color: #783933;">0</span>개</div>
	    	<div>
		    	<div class="total0"></div>
		    	<div class="totalnotnull"></div>
	    	</div>
	    </div>
    </div> 
   <script>
   	   const cpath = '${cpath}'
	   const before = document.querySelector('.slide-before')
	   const next = document.querySelector('.slide-next')
	   const showFrame = document.querySelector('.show-frame')
	   const menuSelectList = document.querySelectorAll('.selectMenu')
	   const parent_order = document.querySelector('.parent_order')
	   const totalprice = document.querySelector('.totalprice')
	   const total0 = document.querySelector('.total0')
	   const totalnotnull = document.querySelector('.totalnotnull')
	   window.onload = macImageHandler
	   menuSelectList.forEach(menu=>{
		   menu.onclick = function(event) {
			  menuSelectList.forEach(menu=>{
				  menu.classList.remove("showColor")
			  })
			  event.target.classList.add("showColor")
			  if(menu.dataset.cate == 'mac')
				  macImageHandler()
			  else if(menu.dataset.cate =='macSet')
				  macSetImageHandler()
			  else if(menu.dataset.cate =='burger')
				  burgerImageHandler()
			  else if(menu.dataset.cate == 'burgerSet')
				  burgerSetImageHandler()
			  else if(menu.dataset.cate == 'side')
				  sideImageHandler()
			  else if(menu.dataset.cate == 'drink')
				  drinkImageHandler()
			  else if(menu.dataset.cate == 'mcafe')
				  mcafeImageHandler()
			  else
				  dessertImageHandler()
		   }
	   })
	   next.onclick = nextSildeHandler
	   before.onclick = beforeSildeHandler
	   parent_order.onclick = function(event) {
           if(event.target.classList == 'deleteBtn') {
               deleteHandler(event)
           }
           else if(event.target.classList == 'addminusBtn') {
               console.log(event.target)
               countHandler(event)    
           }
           else {
               return;
           }
       }
	  /*   imageOrderBtn.forEach(arr=>{
		   arr.onclick=imageOrderDom
	   }) */
	</script>
</body>
</html>