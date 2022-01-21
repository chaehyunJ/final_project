<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="board-container">
        <div class="board-area" >
            <h1 class="board-title">문의사항</h1>
            <ul class="board-ul">
                <li>Home</li>
                <li>•</li>
                <li>Board</li>
                <li>•</li>
                <li>문의사항</li>
            </ul>
            <img src="${ cpath }/resources/src/board/board.jpg">
        </div>
</div>
<div class="question-container">
	<table border="1" cellpadding="7" cellspacing="0">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
				<c:if test="${not empty login }">
					<th>수정</th>
				</c:if>
				<c:if test="${not empty adminlogin }">
					<th>답변</th>
				</c:if>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${list }">
				<tr>
					<td>${dto.idx }</td>
					<td>${dto.title }</td>
					<td>${dto.writer }</td>
					<td>${dto.writeDate }</td>
					<c:if test="${not empty login }">
						<td><button class="modifyBtn" data-idx=${dto.idx }">수정</button></td>
					</c:if>
					<c:if test="${not empty adminlogin }">
						<td><button class="answerBtn" data-idx="${dto.idx }">답변작성</button></td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<a href="${cpath }/questionWrite"><button>글쓰기</button></a>
	</div>
</div>

<%@ include file="../footer.jsp" %>
</body>
</html>