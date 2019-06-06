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

<!-- wish.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/wish.css">

</head>
<body>

<%
MemberDto user = (MemberDto)session.getAttribute("login");
%>

<div class="f_content" style="margin-bottom: 50%;">
<div class="f2_content" style="background-color: white;">

<div align="center" style="margin-top: 120px; margin-left: 80px; margin-right: 100px;">

<%-- <!-- // 로그아웃 & 로그인  후 정보(이름)-->
<c:if test="${login.id ne ''}">
			<a href="logout.do" title="로그아웃">[로그아웃]</a>&nbsp;&nbsp;&nbsp;
		</c:if>
		
		<c:if test="${login.name ne '' }">
			[${login.name }]님 환영합니다
		</c:if> --%>


<form action="wishdeltt.do" method="post" onSubmit="return CheckForm(this)">		
<!-- 테이블 시작-->
<div id="wish_table">
<h2>위시리스트</h2><br><br>
<table>

<thead>
    <tr style="height:40px">
		<th style="width:50px">
			<input type="checkbox" class="check-all">
		</th>
		<th style="width:150px; font-size: 17px; text-align: center;" colspan="2">상품정보</th>
		<th style="width:140px; font-size: 17px; text-align: center;">상품금액</th>
		<th style="width:130px; font-size: 17px; text-align: center;">&nbsp;&nbsp;주문</th>
	</tr>
</thead>

<tbody id="wish_tbody">

<c:forEach var="wishlist" items="${wishlist }">
<c:if test="${wishlist.id == login.id }">
<c:if test="${wishlist.cart_type == '1' }">
	
	<tr style="height:180px">
		<td>
			<input type="checkbox" id="chk_id" class="ab" name="seqq" value="${wishlist.cart_seq}">
			<input type="hidden" name="model_id" value="${wishlist.model_id }">
		</td>
		
		<c:forEach var="plist" items="${plist }">
		<c:if test="${plist.model_id == wishlist.model_id }">
		<td class="wishProductImg"> <!-- // 사진 -->
			<a href="productDetail.do?model_id=${wishlist.model_id }" style="text-decoration: none;">
				<img alt="" src="/img/${plist.photo_af1}" style="max-width: 120px; height: 110px;">
			</a>
		</td>
		</c:if>
		</c:forEach>

		<td style="color: black; font-weight:normal; font-size: 16px;"> <!-- //  상품정보 -->
			${wishlist.model_id }
		</td>
		
		<c:forEach var="plist" items="${plist }">
		<c:if test="${plist.model_id == wishlist.model_id }">
		<td style="text-align: center; color: black; font-weight:normal; font-size: 16px;"> <!-- //  금액 -->
			${plist.price }
		</td>
		</c:if>
		</c:forEach>
		
		<td>
		<a href="productDetail.do?model_id=${wishlist.model_id }" style="text-decoration: none;">
		  <button type="button" class="wish_delete_btn" style="color: gray;">상세보기</button>
		</a>
		<br>
		
		<input type="button" class="wish_delete_btn" value="삭제" onclick="location.href='wishdel.do?seq=${wishlist.cart_seq }&model_id=${wishlist.model_id }'">
		</td>
	</tr>
	
</c:if>	
</c:if>
</c:forEach>
	<tr align="center">
		<td colspan="5">
		<button type="submit" style="margin-top:20px;margin-bottom:50px;" class="wish_delete_btn" >
	선택상품삭제</button>
		<td>
	</tr>
</tbody>
	
</table>
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


<!-- // 체크값 없을 경우 경고창  -->
<script type="text/javascript">
function CheckForm(join) {
	
	if($("input:checkbox[id='chk_id']").is(":checked") == true){

		return;

	}else{
		
		alert("체크된 곳이 없습니다.");
		return false;
		
	}

}
</script>


</body>
</html>

