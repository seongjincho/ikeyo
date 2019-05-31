<%@page import="kh.com.a.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>위시리스트</title>

<!-- // ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<!-- content.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/content.css">

</head>
<body>

<%
MemberDto user = (MemberDto)session.getAttribute("login");
%>

<div class="f_content">
<div class="f2_content">

<div align="center">
<h4>위시리스트</h4>

<!-- // 로그아웃 & 로그인  후 정보(이름)-->
<c:if test="${login.id ne ''}">
			<a href="logout.do" title="로그아웃">[로그아웃]</a>&nbsp;&nbsp;&nbsp;
		</c:if>
		
		<c:if test="${login.name ne '' }">
			[${login.name }]님 환영합니다
		</c:if>

<form action="wishdeltt.do" method="post">		
<!-- 테이블 시작-->
<div id="wish_table">


<table style="border: 1px solid gray;">

<thead>
	<tr style="height:40px" style="border: 1px solid gray;">
		<th style="width:50px">
			<input type="checkbox" class="check-all">
		</th>
		<th style="width:150px">사진</th>
		<th style="width:130px">상품정보(modelID)</th>
		<th style="width:130px">상품금액</th>
		<th style="width:110px">주문</th>
	</tr>
</thead>

<tbody id="wish_tbody">

<c:forEach var="wishlist" items="${wishlist }">
<c:if test="${wishlist.id == login.id }">
<c:if test="${wishlist.cart_type == '1' }">
	<tr style="height:180px">
		<td class="wish_select_td">
			<input type="checkbox" class="ab" name="seqq" value="${wishlist.cart_seq}">
		</td>
		
		<c:forEach var="plist" items="${plist }">
		<c:if test="${plist.model_id == wishlist.model_id }">
		<td> <!-- // 사진 -->
			<img alt="" src="/img/${plist.photo_af1}" style="max-width: 120px; height: 110px;">
		</td>
		</c:if>
		</c:forEach>

		<td> <!-- //  상품정보 -->
			${wishlist.model_id }
		</td>
		
		<c:forEach var="plist" items="${plist }">
		<c:if test="${plist.model_id == wishlist.model_id }">
		<td> <!-- //  금액 -->
			${plist.price }
		</td>
		</c:if>
		</c:forEach>
		
		<td>
		<a href="productDetail.do?model_id=${wishlist.model_id }"><button type="button">상세보기</button></a><br>
		<input type="button" value="삭제" onclick="location.href='wishdel.do?seq=${wishlist.cart_seq }'">
		</td>
	</tr>

</c:if>	
</c:if>
</c:forEach>

</tbody>

</table>
	<button type="submit" style="margin-top:20px;margin-bottom:50px">
	선택상품삭제</button>
</div>
</form>
</div>


</div>
</div>

<!-- // 모두 선택 시   -->
<script type="text/javascript">
$( document ).ready( function() {
    $( '.check-all' ).click( function() {
      $( '.ab' ).prop( 'checked', this.checked );
    } );
  } );
</script>


</body>
</html>

