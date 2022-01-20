<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="../header.jsp" %>


<%-- <p>${ list }</p> --%>
<div class="board-container">
        <div class="board-area" >
            <h1 class="board-title">새로운 소식</h1>
            <ul class="board-ul">
                <li>Home</li>
                <li>•</li>
                <li>Board</li>
                <li>•</li>
                <li>새로운 소식</li>
            </ul>
            <img src="${ cpath }/resources/src/board/board.jpg">
        </div>
        <div class="board-list">
        	<div class="board-list-title">
	        	<div class="board-total">총 <span class="board-total-count" style="color: #da0000;">${ list.size() }</span>의 게시글이 있습니다. </div>
	        	<div class="board-search">
	        		<form>
	        			<input type="text" placeholder="검색어를 입력하세요.">
	        			<button>검색</button>
	        		</form>
	        	</div>
        	</div>
        	<div class="board-list-main">
        		<div class="board-notice">
        			<div class="board-notice-list">
	        			<div class="board-notice-icon"><img src="${ cpath }/resources/src/board/notice.png"></div>
	        			<div class="board-notice-title">주방 공개 행사 잠정 중단 안내의 건</div>
	        			<div class="board-notice-date">2020.02.27</div>
        			</div>
        			<div class="board-notice-list">
	        			<div class="board-notice-icon"><img src="${ cpath }/resources/src/board/notice.png"></div>
	        			<div class="board-notice-title">주방 공개 행사 잠정 중단 안내의 건</div>
	        			<div class="board-notice-date">2020.02.27</div>
        			</div>
        			<div class="board-notice-list">
	        			<div class="board-notice-icon"><img src="${ cpath }/resources/src/board/notice.png"></div>
	        			<div class="board-notice-title">주방 공개 행사 잠정 중단 안내의 건</div>
	        			<div class="board-notice-date">2020.02.27</div>
        			</div>
        		</div>
        		<div class="board-post">
        			<c:forEach var="ls" items="${ list }"> 
						<div class="board-post-list">
		        			<div class="board-post-number">${ ls.notice_seq }</div>
		        			<div class="board-post-title" ><a href="${ cpath }/board/newsDetail/${ls.notice_seq}">${ ls.title }</a></div>
<%-- 							<div class="board-post-title" data-seq="${ ls.notice_seq }">${ ls.title }</div> --%>
		        			<div class="board-post-date">${ ls.regDate }</div>
        				</div>
        			</c:forEach>
        		</div>
        	</div>
        </div>
</div>

<script>
// 	const cpath = '${ cpath }'
// 	const boardTitle = document.querySelectorAll('.board-post-title')
	
// 	console.log(boardTitle)
// 	boardTitle.forEach(dto => {
// 		dto.onclick = function(event){
// 			let seq = event.target.dataset.seq
// 			console.log(seq)
// 			const url = cpath + '/ajaxNewDetail/' + seq
// 			const opt = {
// 				method : 'get'
// 			}
// 			fetch(url, opt)
// 			.then(resp => resp.json)
// 			.then(json => {
// 				console.log(json)
// 			})
// 		}
// 	})
	
</script>
</body>
</html>