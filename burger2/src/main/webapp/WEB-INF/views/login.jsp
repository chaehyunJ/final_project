<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

	<div class="login-form">
        <a href="${ cpath }/login"><button class="client-login">회원로그인</button></a>
        <a href="${ cpath }/join/nonmemberJoin"><button class="non-client-login">비회원주문하기</button></a>
        <form method="POST">
            <p class="login-p"><input class="login-input" type="text" name="userid" placeholder="ID" style="width : 240px;"></p>
            <p class="login-p"><input class="login-input" type="text" name="userpw" placeholder="PW" style="width : 240px;"></p>
            <p class="login-p"><input class="login-checkbox" name="auto" type="checkbox">자동로그인</p>
            <input class="login-submit" type="submit" value="로그인">
        </form>
        	<p class="login-p"><a href="${ cpath }/join"><button class="join-button">회원가입</button></a></p>
    </div>

<%@ include file="footer.jsp" %>
