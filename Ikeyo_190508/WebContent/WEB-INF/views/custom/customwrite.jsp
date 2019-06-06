<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<fmt:requestEncoding value="utf-8"/>

<style type="text/css">

.noto { font-family: 'Noto Sans KR'; letter-spacing: -1px;}
.f13 {
	font-size:13px;	/* 10pt */
	margin-bottom: 5px; 
}

* {
    margin: 0px;
    padding: 0px;
    font-family: 'Malgun Gothic', 'Noto Sans KR';
    letter-spacing: -1.5px;
    color: #333;
 
 }   
 
.file_{
	background-color: #A4A4A4;
	color: white;

} 

</style>


<!-- ============================================== -->
<%-- 
<form name="frmForm" id="_frmForm" action="customwriteAf.do" method="post"
	enctype="multipart/form-data">

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
	<th>공개여부</th>
	<td>
		<input type="checkbox" name="lock_" id="lock_" value="1">
		비공개 글쓰기
	</td>
</tr>

<tr>
	<td colspan="2" style="height: 50px; text-align: center;">
		<a href="#none" id="_btnPds" title="글쓰기">
			<img alt="" src="image/bwrite.png">
		</a>
	</td>
</tr>

</table>

</form> --%>
<!-- ============================================================= -->


<div id="r_container">
<div align="center" style="padding: 10px 60px 35px 60px;">
<h3>고객의 소리</h3>
<br/>
<hr style="color: black;"/>

<div id="frm_container" align="left">

<form id="_frmForm1" method="post" enctype="multipart/form-data">
<span class="noto f13" style="color: black; font-size: 15px; font-weight:normal;">제목</span>
<br/>
<input type="text" name="title" id="title" style="margin-bottom: 20px; border: 1px solid #aaa; width: 343px; padding: 10px;"/>
<br/>
<span class="noto f13" style="color: black; font-size: 15px; font-weight:normal;">내용을 작성해 주세요</span>
<br/>
<textarea rows="10" cols="50" name="content" id="_content" style="height: 220px; overflow-y: auto; resize: none; max-width: 340px;">
</textarea>
<br/>
<input type="hidden" name="id" value="${login.id }" />
<br>
<span class="noto f13" style="color: black; font-size: 15px; font-weight:normal;">파일첨부 :</span>&nbsp;&nbsp;
<input type="file" name="fileload" id="fileload" class="file_"/>
<br/>
<br>
<span class="noto f13"><input type="checkbox" name="lock_" id="lock_" value="1" style="color: black; font-size: 15px; font-weight:normal;"> 비공개 글쓰기</span>
<br/>
<br/>

<div align="center">
	<input type="button" value="작성 완료" onclick="goWrite()" style="border: 1px solid #0051ba; 
	background-color: #0051ba; color: #fff; width: 205px; height: 40px;"/>
</div>

</form>

</div>
</div>

</div>
<script>
$(function(){
	$("#fileload").change(function(){
		var ext = this.value.match(/\.(.+)$/)[1];
		switch(ext){
			case 'jpg':
	    	case 'jpeg':
	    	case 'png':
	    	case 'gif':
	       		$("#fileload").val($(this).val().slice(12, $(this).val().length));
	       		break;
	    	default:
	       		alert('jpg, jpeg, png, gif 확장자인 이미지를 첨부해주세요.');
	       		$("#fileload").val("");
	 	}
	});
});
/*
$("#_btnPds").click(function () {
	$("#_frmForm").submit();
});
*/
function goWrite() {
	
	if($("#title").val().trim() == ""){
		alert("제목을 입력하세요");
		$("#title").focus();
	}else if($("#_content").val().trim() == ""){
		alert("내용을 입력하세요");
		$("#content").focus();
	}else if(${login.id eq null}){
		alert("로그인을 해야 작성할 수 있습니다.");
	}else{
		$("#_frmForm1").attr("action", "customwriteAf.do").submit();
	}
}
</script>





