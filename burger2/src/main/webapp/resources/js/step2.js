function passchk1() {
	if ($('#userpass').val().length < 8 || $('#userpass').val().length >= 15) {
		$('.point2').text('')
		$('.point2').text('8자리보다 작거나 15자리보다 큽니다')
	}
	else {
		$('.point2').text('')
	}
}

function passchk2(){ 
    if($("#userpasschk").val() == $("#userpass").val()){ 
        $(".successPwChk").text("비밀번호가 일치합니다."); 
        $(".successPwChk").css("color", "green"); 
        $(".successPwChk").css("font-size", "13px");
        $(".successPwChk").css("font-weight", "bold");
       //  $("#pwDoubleChk").val("true"); 
   }else{ 
       $(".successPwChk").text("비밀번호가 일치하지 않습니다."); 
       $(".successPwChk").css("color", "red"); 
       $(".successPwChk").css("font-size", "13px");
       $(".successPwChk").css("font-weight", "bold");
       // $("#pwDoubleChk").val("false"); 
   } 
}