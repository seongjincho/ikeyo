<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<fmt:requestEncoding value="utf-8"/>

<!-- content.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/content.css">

<div class="f_content">
<div class="f2_content" style="background-color: white;">

<h2 style="margin-left: 100px; margin-top: 7%;">글 수정하기</h2>

<div align="center" style="margin-top: 5%;">

<form name="frmForm" id="_frmForm" action="customupdateAf.do" method="post"
	enctype="multipart/form-data">
<input type="hidden" name="cust_seq" value="${cust.cust_seq }">
<table style="width: 85%;">
<colgroup>
	<col style="width: 200px">
	<col style="width: auto">
</colgroup>

<tr>
	<th>아이디</th>
	<td style="text-align: left;">
		<input type="text" name="id" readonly value="${login.id }" style=" display:inline-block;
		 margin-bottom: 20px; border: 1px solid #aaa; width: 343px; padding: 5px;">
	</td>
</tr>

<tr>
	<th>제목</th>
	<td style="text-align: left;">
		<input type="text" name="title" value="${cust.title }"  style=" display:inline-block;
		 margin-bottom: 20px; border: 1px solid #aaa; width: 343px; padding: 5px;">
	</td>
</tr>

<tr>
	<th>사진 업로드</th>
	<td style="text-align: left;">
		<input type="file" name="fileload" id="fileload" style="width: 342px; background-color: #D8D8D8;  border: 1px solid #848484;" >
	</td>
</tr>

<tr>
	<th>내용</th>
	<td style="text-align: left;">
		<br>
		<textarea rows="10" cols="50" name="content" style="width: 343px;">${cust.content }</textarea>
	</td>
</tr>
<tr>
	<th>공개여부</th>
	<td>
		<br>
		<input type="checkbox" name="lock_" id="lock_" value="1" ${cust.lock_==1?'checked':'' }>
		 비공개 글쓰기
	</td>
</tr>

<tr>
	<td colspan="2" style="height: 50px; text-align: center;">
		<br>
		<button type="button" id="_btnPds" style="width: 110px; height: 30px; border: 1px solid #63666a;
		 background-color: #63666a; color: #fff; font-size: 14px; margin-right: 300px;">수정하기</button>
		<!-- <a href="#none" id="_btnPds" title="글쓰기">
			<img alt="" src="image/bwrite.png">
		</a> -->
	</td>
</tr>

</table>

</form>

<!-- // -->
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

$("#_btnPds").click(function () {
	$("#_frmForm").submit();
});
</script>







