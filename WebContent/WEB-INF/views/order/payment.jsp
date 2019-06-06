<%@page import="kh.com.a.model.Order_Dto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
List<Order_Dto> paymentlist = (List<Order_Dto>)request.getAttribute("paymentlist");
System.out.println("jsp?" + paymentlist);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>payment</title>

<!-- // ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<!-- content.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/content.css">

<!-- 결제 API -->
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


</head>
<body>

<!-- // 결제페이지 -->
<div class="f_content">
<div class="f2_content" style="background-color: white;">

<%-- <!-- // 로그아웃 & 로그인  후 정보(이름)-->
<c:if test="${login.id ne ''}">
	<a href="logout.do" title="로그아웃">[로그아웃]</a>&nbsp;&nbsp;&nbsp;
</c:if>
		
<c:if test="${login.name ne '' }">
	[${login.name }]님 환영합니다
</c:if> --%>

<div align="center" style="margin-top: 100px; margin-left: 80px; margin-right: 100px;">

<form id="frmpay" method="post">

<h2>결제 정보</h2><br>
<h4>결제 전 확인사항</h4><br>
<p>1. 고객의 단순한 변심으로 교환, 반품 및 환불을 요구할 때 수반되는 배송비는 고객님께서 부담하셔야합니다.</p>
<p>2.상품을 개봉했거나 설치한 후에는 상품의 재판매가 불가능하므로 고객님의 변심에 대한 교환, 반품이 불가능함을 양지해 주시기 바랍니다.</p>
<hr style="border:1px solid #f0f0f0;">

<br>
<div style="font-size: 30px; color: black;" align="center">
<c:forEach var="paymentlist" items="${paymentlist}">
		<c:if test="${paymentlist.id == login.id }">
		<c:if test="${paymentlist.deli_info == 0}">
		
		<h4>주문번호</h4>
		<h4 style="color: red; font-size: 40px;">${paymentlist.order_num}</h4><br>
		
		<h4>총&nbsp;&nbsp;&nbsp;결제금액</h4>
		<h4 style="color: red; font-size: 40px;">${paymentlist.total_price}&nbsp;원</h4>
		
		<br>
		<button type="button" class="btn btn-danger" onclick="pay()">결제하기</button>
		
		
		<input type="hidden" id="ord_seq" name="ord_seq" value="${paymentlist.ord_seq}">
		<input type="hidden" id="total_price" name="total_price" value="${paymentlist.total_price}">
		<input type="hidden" id="order_num" name="order_num" value="${paymentlist.order_num}">
		<input type="hidden" id="deli_info" name="deli_info" value="${paymentlist.deli_info}">
		<input type="hidden" id="rname" name="rname" value="${paymentlist.rname}">
		<input type="hidden" id="address1" name="address1" value="${paymentlist.address1}">
		<input type="hidden" id="address2" name="address2" value="${paymentlist.address2}">
		<input type="hidden" id="phone" name="phone" value="${paymentlist.phone}">
		<input type="hidden" id="content" name="content" value="${paymentlist.content}">
 </c:if>
 </c:if>
</c:forEach>
</div>
<%-- <table style="font-size: 30px; color: black;">
	
	<c:forEach var="paymentlist" items="${paymentlist}">
		<c:if test="${paymentlist.id == login.id }">
		<c:if test="${paymentlist.deli_info == 0}">
		
		<tr>
			<td>주문번호</td>
		</tr>
		<tr style="color: red;">
			<td>${paymentlist.order_num}</td>
		</tr>
		
		<tr>
			<td>총 결제 금액 :&nbsp;</td>	
		</tr>
		<tr>
			<td>${paymentlist.total_price}</td>	
		</tr>
		
		<tr>
			<td>결제 수단 :&nbsp;</td>	
		</tr>
		<tr>
			<td><button type="button">무통장 입금</button></td>	
			<td><button type="button">신용카드</button></td>
		</tr>
		
		<tr>
			<td><button type="button" onclick="pay()">결제하기</button></td>
		</tr>
		<input type="hidden" id="ord_seq" name="ord_seq" value="${paymentlist.ord_seq}">
		<input type="hidden" id="total_price" name="total_price" value="${paymentlist.total_price}">
		<input type="hidden" id="order_num" name="order_num" value="${paymentlist.order_num}">
		<input type="hidden" id="deli_info" name="deli_info" value="${paymentlist.deli_info}">
		<input type="hidden" id="rname" name="rname" value="${paymentlist.rname}">
		<input type="hidden" id="address1" name="address1" value="${paymentlist.address1}">
		<input type="hidden" id="address2" name="address2" value="${paymentlist.address2}">
		<input type="hidden" id="phone" name="phone" value="${paymentlist.phone}">
		<input type="hidden" id="content" name="content" value="${paymentlist.content}">
		
	</c:if>
	</c:if>
	</c:forEach>
</table> --%>
				
<!-- // -->
</form>

</div>

</div>
</div>

<script type="text/javascript">
function pay() {
	
	alert("결제 진행!");
	
	var totalprice = $('#total_price').val();
	var ordernum = $('#order_num').val();
	var rname = $('#rname').val();
	var phone = $('#phone').val();
	var addr1 = $('#address1').val();
	var addr2 = $('#address2').val();

	var IMP = window.IMP;    // 생략가능
	IMP.init('imp80499630'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	// pg : 'kakaopay'
	
	
	IMP.request_pay({
	    // pg : 'kakaopay', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : 'ikeyo',
	    amount : totalprice,
	    buyer_email : ordernum,
	    buyer_name : rname,
	    buyer_tel : phone,
	    buyer_addr : addr1,
	    buyer_postcode : addr2,
	    // m_redirect_url : 'https://www.naver.com'
	    
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    	// alert(msg);
	    	$("#frmpay").attr("action", "success.do").submit();
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        // alert(msg);
	        location.href="fail.do";
	    }
	});
	
	// alert("끝"); 
}
</script>


</body>
</html>

