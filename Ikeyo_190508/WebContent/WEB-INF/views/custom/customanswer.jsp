<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>



<form name="frmForm" id="_frmForm" action="customAnswerAf.do" method="post"
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
	<td colspan="2" style="height: 50px; text-align: center;">
		<input type="hidden" name="cust_seq" value="${cust.cust_seq }">
		<input type="hidden" name="lock_" id="lock_" value="${cust.lock_ }">
		<a href="#none" id="_btnPds" title="답글쓰기">
			<img alt="" src="image/bwrite.png">
		</a>
	</td>
</tr>

</table>

</form>

<script>
$("#_btnPds").click(function () {
	$("#_frmForm").submit();
});
</script>






























