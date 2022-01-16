<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div class="search-header">
	<h1 class="search-title">검색결과</h1>
	<ul class="search-ul">
		<li>Home</li>
		<li>•</li>
		<li>검색결과</li>
	</ul>
</div>
<div class="search-menu">
	<form action="${ cpath }/search">
		<select name="type">
			<option ${ param.type == '버거' ? 'selected' : '' } value="burger">버거</option>
			<option ${ param.type == '맥모닝' ? 'selected' : '' } value="mcmorning">맥모닝</option>
			<option ${ param.type == '사이드' ? 'selected' : '' } value="side">사이드</option>
			<option ${ param.type == '맥카페' ? 'selected' : '' } value="mccafe">맥카페</option>
			<option ${ param.type == '음료' ? 'selected' : '' } value="drink">음료</option>
			<option ${ param.type == '디저트' ? 'selected' : '' } value="dessert">디저트</option>
		</select> 
			<input name="search" placeholder="메뉴를 입력해주세요" value="${ param.search }"> 
			<input type="submit" value="검색하기">
	</form>
</div>
<div class="search-result">
	<p><span class="search-name">"${ param.search }"</span>에 대해 총  ${ list.size() }건의 검색결과가 있습니다</p>
</div>
<hr class="search-hr">
<p>${ param.type }</p>
<p>${ type }</p>
<p>${ name }</p>
<%-- <p>${ list }</p> --%>

<div class="search-content">
	<c:forEach var="ls" items="${ list }">
		<div class="search-content-inner">
			<img src="${ ls.type}">
			<div class="search-content-name">
				<span>${ ls.name }</span>
			</div>
		</div>
	</c:forEach>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>