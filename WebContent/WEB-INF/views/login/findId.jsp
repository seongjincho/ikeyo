<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/> 

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<div>
	이름: <input type="text" id="_name" name="name" data-msg="이름을"> <br>
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
<input type="button" id="_btnRegi" title="ID찾기" value="ID찾기">

<script>
$('#_btnRegi').click(function() {
	if($('#_name').val() == ""){
		alert($('#_name').attr("data-msg") + " 입력해주세요");
		$('#_name').focus();
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
	}
	
	$.ajax({
		url: "findIdAf.do",
		type: "post",
		data: {"name" : $('#_name').val().trim(), "email" : $('#_email').val().trim()},
		success:function(data) {
			if(data.trim() == "NO") {
				alert("이름과 이메일을 다시 확인해주세요");
			} else {
				alert("ID는 " + data + "입니다");
				location.href = "login.do";
			}
		},
		error:function(xhr, textStatus, err) {
			console.log("ajax 에러가 발생했습니다.: " + xhr.responseText);
			console.log("textStatus: " + textStatus);
			console.log("error: " + error);
		}
	});
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