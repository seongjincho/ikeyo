<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>


<div align="center" style="margin-left: 5%; margin-right: 5%" >
<h3>투표 결과</h3>
<hr><br><br>

<form action="polling.do" method="post">

<table class="list_table" style="width: 95%">
<colgroup>
	<col width="200px"><col width="500px">
</colgroup>


<tr>
	<th>투표번호</th>
	<td style="text-align: left;">
		<input type="text" name="pollid" value="${poll.pollid }" readonly="readonly" size="50">
	</td>
</tr>

<tr>
	<th>아이디</th>
	<td style="text-align: left;">
		<input type="text" name="id" value="${login.id}" readonly="readonly" size="50">
	</td>
</tr>

<tr>
	<th>투표기한</th>
	<td style="text-align: left;">
		<b><fmt:formatDate value="${poll.sdate}" pattern="yyyy/MM/dd/"/></b>
		 ~ 
		 <b> <fmt:formatDate value="${poll.edate}" pattern="yyyy/MM/dd"/></b> 
	</td>
</tr>

<tr>
	<th>투표 내용</th>
	<td style="text-align: left;">
		<textarea rows="10" cols="50" name="question" readonly="readonly">${poll.question }</textarea>
	</td>
</tr>

<tr>
	<th>투표 보기수</th>
	<td style="text-align: left;">
		${poll.itemcount}개 
	</td>
</tr>

<tr>
	<th>투표 보기</th>
	<td style="text-align: left;">
		<c:forEach items="${pollsublist }" var="psub" varStatus="vs">
		
		${vs.count }번:
		<input type="radio" name="pollsubid" ${vs.count==1?"checked='checked'":"" } value="${psub.pollsubid }">
		<input type="text" name="answer" size="60" value="${psub.answer }" readonly="readonly">
		<br>
		</c:forEach>
	</td>
</tr>

<tr align="center">
	<td colspan="2">
		<input type="submit" value="투표하기">
	</td>
</tr>


</table>

</form>

</div>
