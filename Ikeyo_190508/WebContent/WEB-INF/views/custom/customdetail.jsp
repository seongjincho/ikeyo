<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<fmt:requestEncoding value="utf-8"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>




<div align="right">

<table style="width: 65%; border: 1px solid;">
<colgroup>
	<col width="200"><col width="500">
</colgroup>

<tr>
	<th>아이디</th>
	<td style="text-align: left;">${cust.id }</td>
</tr>
<tr>
	<th>제목</th>
	<td style="text-align: left;">${cust.title }</td>
</tr>

<tr>
	<th>조회수</th>
	<td style="text-align: left;">${cust.readcount }</td>
</tr>

<tr>
	<th>등록일</th>
	<td style="text-align: left;">
		<fmt:formatDate value="${cust.wdate }" pattern="yyyy/MM/dd"/>
	</td>
</tr>

<tr>
	<th>정보</th>
	<td>${cust.ref }-${cust.step }-${cust.depth }</td>
</tr>

<c:if test="${not empty cust.filename && cust.filename ne '' }">
	<tr>
		<th>이미지</th>
		<td>
			<img alt="" src="/img/${cust.filename }" width="300px;">
		</td>
	</tr>
</c:if>
<tr>
	<th>내용</th>
<td style="text-align: left;"><textarea rows="10" cols="50" readonly 
name="content" id="content">${cust.content }</textarea>
</td>
</tr>

</table>
<form action="customAnswer.do" method="get">
	<input type="hidden" name="seq" value="${cust.cust_seq }">
	<c:if test="${login.auth eq 1 }">
		<input type="submit" value="답글">
	</c:if>
</form>
</div>



<c:if test="${login.id eq cust.id }">
<div id="buttons_wrap">
	<span class="button blue">
		<button type="button" id="_btnAdd">수정하기</button>
	</span>
	<span class="button blue">
		<button type="button" id="_btnDel">삭제</button>
	</span>
</div>
</c:if>

<form name="frmForm1" id="_frmForm1" action="customupdate.do" method="post">
	<input type="hidden" name="seq" value="${cust.cust_seq }">
</form>

<form name="frmForm2" id="_frmForm2" action="customdelete.do" method="post">
	<input type="hidden" name="seq" value="${cust.cust_seq }">
</form>

<br><br><br><br>

<script>

$("#_btnAdd").click(function () {
	$("#_frmForm1").submit();
});

$("#_btnDel").click(function () {
	$("#_frmForm2").submit();
});


</script>



