<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>


<style type="text/css">
table.type11 {
    border-collapse: separate;
    border-spacing: 1px;
    /* text-align: center; */
    line-height: 1.5;
    /* margin: 20px 10px; */
}
table.type11 th {
    width: 155px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #4D6BB3; /* #ce4869 */
}
table.type11 td {
    width: 155px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #eee;
}
</style>


<%--
Object ologin = session.getAttribute("login");
MemberDto mem = (MemberDto)ologin;
--%>

<!-- <a href="logout.jsp">로그아웃</a> -->

<!-- <h1>글쓰기</h1> -->

<div align="center" style="margin-top: 10%;">

<form id="frm" action="noticewriteAf.do" method="post">

<table border="1" class="type11">
<col width="200"><col width="400"> 

<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" readonly="readonly" size="50px" 
			value="${login.id }">
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" size="50px">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="50px" name="content"></textarea>		
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<span>
			<a href="#none" id="_writeBtn" title="글쓰기">
				<img alt="" src="image/bwrite.png">
			</a>
			<!-- <input type="submit" value="글쓰기"> -->
		</span>
	</td>
</tr>
</table>
</form>

</div>

<br><br><br><br><br><br><br><br>
<script type="text/javascript">
$(function () {
	$("#_writeBtn").click(function () {
		$("#frm").submit();
	});
});
</script>
