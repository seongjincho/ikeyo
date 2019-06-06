<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>




<%--
<table style="width: 85%;">
<colgroup>
	<col style="width: 200px">
	<col style="width: auto">
</colgroup>

<tr>
	<th>아이디</th>
	<td style="text-align: left;">
		<input type="text" name="id" readonly value="${login.id }" size="50">
	</td>
</tr>

<tr>
	<th>제목</th>
	<td style="text-align: left;">
		<input type="text" name="title" size="50">
	</td>
</tr>

<tr>
	<th>사진 업로드</th>
	<td style="text-align: left;">
		<input type="file" name="fileload" style="width: 400px;">
	</td>
</tr>

<tr>
	<th>내용</th>
	<td style="text-align: left;">
		<textarea rows="10" cols="50" name="content"></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" style="height: 50px; text-align: center;">
		<input type="hidden" name="cust_seq" value="${cust.cust_seq }">
		<input type="hidden" name="lock_" id="lock_" value="${cust.lock_ }">
		<a href="#none" id="_btnPds" title="답글쓰기">
			<img alt="" src="image/bwrite.png">
		</a>
	</td>
</tr>

</table>
--%>

<div id="r_container">
<div align="center" style="padding: 10px 60px 35px 60px;">
<h3>고객의 소리</h3>
<br/>
<hr/>

<div id="frm_container" align="left">
<form name="frmForm" id="_frmForm" action="customAnswerAf.do" method="post"
	enctype="multipart/form-data">
<!-- <form id="_frmForm1" method="post" enctype="multipart/form-data"> -->
<span class="noto f13">제목</span>
<br/>
<input type="text" name="title" id="title"/>
<br/>
<span class="noto f13">내용을 입력해 주세요</span>
<br/>
<textarea rows="10" cols="50" name="content" id="content" style="max-width: 338px;"
>
</textarea>
<br/>
<input type="hidden" name="id" value="${login.id }" />
<span class="noto f13">파일첨부</span>
<input type="file" name="fileload" id="fileload" />
<br/>
<!-- <span class="noto f13"><input type="checkbox" name="lock_" id="lock_" value="1"> 비공개 글쓰기</span> -->
<br/>
<br/>
<div align="center">
	<input type="button" value="작성 완료" onclick="goWrite()" />
</div>
<input type="hidden" name="cust_seq" value="${cust.cust_seq }">
<input type="hidden" name="lock_" id="lock_" value="${cust.lock_ }">

</form>

</div>
</div>

</div>



<script>

function goWrite() {
	
	if($("#title").val().trim() == ""){
		alert("제목을 입력하세요");
		$("#title").focus();
	}else if($("#content").val().trim() == ""){
		alert("내용을 입력하세요");
		$("#content").focus();
	}else if(${login.id eq null}){
		alert("로그인을 해야 작성할 수 있습니다.");
	}else{
		$("#_frmForm").submit();
	}
}

/*
$("#_btnPds").click(function () {
	$("#_frmForm").submit();
});
*/
</script>






























