<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="css/ikeyo_v1-front.css"/>
<link rel="stylesheet" href="css/_common.css"/>

<c:if test="${(empty login) or (login.id eq '') }">
	<%
		session.invalidate();	// 세션이 보유한 모든 속성 제거
	%>
	<script>
	alert("로그인 해 주십시오");
	location.href = "login.do";
	</script>
</c:if>
	
<div id="login">
	<div class="container_c">
		<div class="head">
			<p class="noto">비밀번호 확인</p>
			<p style="font-size: 14px;">네이버 로그인시 비밀번호는 '0000' 으로 초기화됩니다.</p>
		</div>
		<hr><br><br>
		<div class="body">
			<form action="myInfoGoAf.do" method="post" id="_frmForm" name="frmForm">
				<input type="hidden" name="id" value="${login.id }">
				<input type="password" name="pwd" id="_pwd" data-msg="비밀번호를" placeholder="비밀번호">
			</form>
			<br><br><br>
			<div class="button_r">
				<button type="button" id="_cancle" class="btn_s_gray btn_205">취소</button>
				<button type="button" id="_btn" class="btn_s_blue btn_205">확인</button>
			</div>
		</div>
	</div>
</div>

<script>
$('#_btn').click(function() {
	var pwd = $('#_pwd').val();
	if(pwd == "") {
		alert($('#_pwd').attr("data-msg") + " 입력해주세요");
		$('#_pwd').focus();
		return false;
	} else {
		//$('#_frmForm').attr("action", "myInfoGoAf.do").submit();
		$('#_frmForm').submit();
	}
});

$('#_cancle').click(function() {
	location.href = "login.do";
});
</script>