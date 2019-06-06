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
<title>cart</title>

<!-- // ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<!-- cart.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/cart.css">

<!-- content.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/content.css">

</head>

<body>

<div class="f_content">
<div class="f2_content" style="background-color: white;">

<div align="center" style="margin-top: 100px; margin-left: 80px; margin-right: 100px;">

<%-- <!-- // 로그아웃 & 로그인  후 정보(이름)-->
<c:if test="${login.id ne ''}">
	<a href="logout.do" title="로그아웃">[로그아웃]</a>&nbsp;&nbsp;&nbsp;
</c:if>
		
<c:if test="${login.name ne '' }">
	[${login.name }]님 환영합니다
</c:if> --%>
		
<h2>장바구니</h2><br>
<h4>주문하실 상품을 선택해주세요.</h4>
<h5 style="color:red;">*&nbsp;이미지를 클릭하면 해당 상품으로 이동합니다.</h5>

<br>

<form name="form" method="get" onSubmit="return CheckForm(this)">

<table class="order_product" style="border: 1px solid gray;">
<thead>

	<tr>
		<th>		
		  <input type="checkbox" class="check-all">				 
	    </th>
		<th colspan="2" style="font-size: 16px;">상품정보</th>
		<th class="w130" style="font-size: 16px;">단가</th>
		<th class="w130" style="font-size: 16px;">수량</th>
		<th class="w130" style="font-size: 16px;">상품금액</th>
		<th class="w100" style="font-size: 16px;">주문</th>
	</tr>
	
</thead>
<tbody>

<!-- // total -->
<c:set var="totalsum" value="0"/>

<c:forEach var="cartlist" items="${cartlist }">

<c:if test="${cartlist.id == login.id }">
<c:if test="${cartlist.cart_type == '2' }">

	<tr class="mainProduct">

		<td class="ccheck">
			<input type="checkbox" id="chk_id" class="ab" name="seqq" value="${cartlist.cart_seq}">
		</td>
		
		<c:forEach var="plist" items="${plist }">
		<c:if test="${plist.model_id == cartlist.model_id }">
		<td width="20%"> <!-- // 사진 클릭 detail이동 	 -->							
			<a href="productDetail.do?model_id=${cartlist.model_id }">
				<img alt="" src="/img/${plist.photo_af1}" style="max-width: 120px; height: 110px;">
			</a>														
		</td>
		</c:if>
		</c:forEach>
		
		<!-- // 상품정보	 -->						
		<td class="productInfo mainProductInfo" style="color: black; font-weight:normal; font-size: 16px; padding: 50 0 50 40;">						
		     ${cartlist.model_id }
		</td>
		
		<c:forEach var="plist" items="${plist }">
		<c:if test="${plist.model_id == cartlist.model_id }">
		<td style="color: black; font-weight:normal; font-size: 16px;"> <!-- // 단가 금액 -->
			${plist.price }&nbsp;원
			<c:set var="sum" value="${plist.price }"/>
		</td>
		
		<td style="color: black; font-weight:normal; font-size: 16px;"> <!-- // 주문수량 -->
			&nbsp;&nbsp;${cartlist.count }
			<c:set var="sum" value="${ sum * cartlist.count }원"/>
		</td>
		
		<td style="color: black; font-weight:normal; font-size: 16px;">
			<c:out value="${sum }"/>
			<c:set var="totalsum" value="${totalsum + (cartlist.count * plist.price)}"/>
		</td>
		
		<td>
			<button type="button" class="btn btn-outline-primary" value="바로구매" onclick="location.href='orderlist.do?seqq=${cartlist.cart_seq }'">
			바로구매
			</button>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-outline-secondary" value="삭제하기" onclick="location.href='cartdel.do?seq=${cartlist.cart_seq }'">
			삭제하기
			</button>
		</td>
		
		</c:if>
		</c:forEach>

	</tr>
</c:if>
</c:if>
</c:forEach>	

<tr>
	<td colspan="7">
		<span style="color: red; font-weight: bold; font-size: 20px;">
	     	총 상품 금액 : <fmt:formatNumber pattern="###,###,###" value="${totalsum}" />&nbsp;원	     	
	     </span>
	     <br><br>
		 <button type="submit" class="btn btn-secondary btn-lg" value="btn_del" onclick="javascript:form.action='cartdeltt.do';">
	           선택상품삭제</button>&nbsp;&nbsp;
	     <button type="submit" class="btn btn-primary btn-lg" value="btn_order" onclick="javascript:form.action='orderlist.do';">
		  선택상품구매</button>
	</td>
</tr>
</tbody>
</table> 			
		 
</form>
				<br>
			 <br><br><br><br><br><br><br><br>

</div>
<!--// -->
</div>
</div>
<br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br>


<!-- // 모두 선택 시   -->
<script type="text/javascript">
$( document ).ready( function() {
    $( '.check-all' ).click( function() {
      $( '.ab' ).prop( 'checked', this.checked );
    });
  });
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

