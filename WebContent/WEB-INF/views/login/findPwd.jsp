<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/> 

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<form method="post" id="_frmForm" name="frmForm">
	<div>
		아이디: <input type="text" name="id" id="_uid" data-msg="아이디를"> <br>
		Email: <input type="hidden" name="email" id="_email">
				<input type="text" id="_email1" data-msg="이메일을">
				@ <input type="text" id="_email2" data-msg="이메일 주소를">
			<select id="_selemail">
				<option value="" selected>직접입력</option>
				<option value="gmail.com">gmail.com</option>
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
			</select> 
	</div>
	<br>
	<input type="button" id="_btnRegi" title="비밀번호 찾기" value="비밀번호 찾기">
</form>

<script>
$('#_btnRegi').click(function() {
	if($('#_uid').val() == ""){
		alert("아이디를 입력해주세요");
		$('#_uid').focus();
		return false;
	} else if($('#_email1').val() == "" || $('#_email1').val().indexOf("@") != -1){
		if($('#_email1').val() == "") {
			alert($('#_email1').attr("data-msg") + " 입력해주세요");
			$('#_email1').focus();	
		} else {
			alert("이메일 형식이 알맞지 않습니다. 다시 확인해 주세요");
			$('#_email1').val("");
			$('#_email1').focus();
		}
		return false;
	} else if($('#_email2').val() == "") {
		alert($('#_email2').attr("data-msg") + " 입력해주세요");
		$('#_email2').focus();
		return false;
	} else {
		var email = $('#_email1').val().trim() + "@" + $('#_email2').val().trim();
		$('#_email').val(email);
		$('#_frmForm').attr("action", "findPwdAf.do").submit();
		alert("임시 비밀번호를 이메일로 전송했습니다.\n이메일을 확인해주세요.");
	}
});

//메일 select
$('#_selemail').change(function() {
	$('#_selemail option:selected').each(function() {
		if($(this).val() == "") {	// 직접 입력인 경우
			$('#_email2').val("");
			$('#_email2').attr("disabled", false);
		} else {
			$('#_email2').val($(this).text());	// 선택값 입력
			$('#_email2').attr("disabled", true);	// 비활성화
		}
	});
});	
</script>