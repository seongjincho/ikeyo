<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<table border="2" width="100%" height="100%">
<tr>
	<th>모델번호</th>
	<th>카테고리</th>
	<th>가격</th>
	<th>수량</th>
	<th>등록일</th>
</tr>

<c:if test="${empty invenlist }">
	<tr>
		<td colspan="5">작성된 글이 없습니다</td>
	</tr>
</c:if>


<%--  품번을    a href  또는   맨오른쪽에  버튼이나 아이콘을 줘서 디테일 이동--%>
<c:if test="${not empty invenlist }">
	<c:forEach items="${invenlist }" var="inven" varStatus="vs">
	<tr>
		<td align="center">
		<a href="#none" onclick="invenAdd(${inven.inven_seq})">${inven.model_id }</a>
		
		</td>
		<td align="center">${inven.category }</td>
		<td align="center">[${inven.price }]원</td>
		<td align="center">[${inven.count }]개</td>
		<td align="center"><fmt:formatDate value="${inven.rdate }" 
		pattern="yyyy/MM/dd"/></td>
	</tr>
	</c:forEach>
</c:if>

<tr>
	<td colspan="5" style="text-align: center">
	<select id="inven_select">
	<option value="" selected="selected">선택</option>
	<option value="model_id">모델번호</option>
	<option value="category">카테고리</option>
	</select>
	<input type="text" id="inven_seach" name="inven_seach">
	<input type="button" id="btn_" value="검색">
	</td>
</tr>

</table>    
</div>

</body>
</html>