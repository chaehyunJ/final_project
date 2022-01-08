<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${ pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<button id="check_module">카카오페이</button>


<script>
$("#check_module").click(function () {
	
	// 아임포트 일반결제 연동하기
	// https://docs.iamport.kr/implementation/payment
	
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp39136694'); 
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
	
	// 필요한 결제 정보로 imp.requeset_pay를 호출하여 결제 요청을 하면 PG사의 결제 페이지가 열린다.
	// imp.requeset_pay를 호출하기 전에 서버에서 데이터베이스에 주문 레코드를 생성하여 해당 레코드의 주문번호를
	// param.mechant_uid에 지정하길 권장. 결제 프로세스 완료 후 해당 주문번호를 서버에서 조회하여 결제 위변조 여부를 검증하는데 필요합니다.
	
	IMP.request_pay({
		pg: 'kakao',
		pay_method: 'card',
		merchant_uid: 'merchant_' + new Date().getTime(),
		/* 
		 *  merchant_uid에 경우 
		 *  https://docs.iamport.kr/implementation/payment
		 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
		 */
		name: '상품명 : 빅맥세트',
		// 결제창에서 보여질 이름
		// name: '주문명 : ${auction.a_title}',
		// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
		amount: 6900,
		// amount: ${bid.b_bid},
		// 가격 
		buyer_name: '이름',
		// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
		// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
		buyer_postcode: '123-456',
		}, function (rsp) {		// callback
			console.log(rsp);
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			msg += '결제 금액 : ' + rsp.paid_amount;
			// success.submit();
			// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
			// 자세한 설명은 구글링으로 보시는게 좋습니다.
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
		alert(msg);
	});
});
</script>
</body>
</html>