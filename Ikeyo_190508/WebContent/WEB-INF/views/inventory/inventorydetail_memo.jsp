<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>






<div style="margin-right: 5%; margin-top: 5%;">

<table style="height: 100%; width: 100%;">
<colgroup>
<col width="2%"><col width="73%"><col width="20%"><col width="5%">
</colgroup>

<c:if test="${empty memolist }">
<tr>
	<td colspan="4" align="center">메모가 존재하지 않습니다</td>
</tr>

</c:if>

<c:if test="${not empty memolist }">



<tr>
	<th>ID</th>
	<th>Memo</th>
	<th>Date</th>
	<th>Del</th>
</tr>

<form id="memo_frm"  method="get">	

<c:forEach items="${memolist }" var="memo" varStatus="vs">



<tr>
	
	<td align="center"><b>${memo.id}</b><input type="hidden" id="memo_seq" name="memo_seq" value="${memo.memo_seq }">  
	</td> 
	<td style="margin-left: 10px;">${memo.content }</td>
	<td><fmt:formatDate value="${memo.rdate }" pattern="yyyy/MM/dd"/></td> 
	<td><input type="button" class="joinButton btn_s_gray btn_30" onclick="memoDelete('${memo.memo_seq }')" value="X"></td>
	
</tr>

</c:forEach>
</form>


</c:if>

<tr>

<td>
<input type="text" readonly="readonly" value="${login.id}" id="id" name="id" size="10">
</td>

<td>
<input type="text" id="content" name="content" size="60" value="" >
</td>

<td colspan="2" align="center">
<input type="button" class="joinButton btn_s_blue btn_130" onclick="memoWrite()" value="메모 등록">
</td>

</tr>

</table>

</div>






</body>
</html>