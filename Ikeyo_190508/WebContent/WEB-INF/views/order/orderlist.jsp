<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>order</title>

<!-- // ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<!-- //주소API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>

<!-- content.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/content.css">

<style type="text/css">
/* // 하단 버튼  */
.listResult { padding:20px; background:#eee; }
.listResult .sum { float:left; width:45%; font-size:22px; }

.listResult .orderOpne { float:right; width:45%; text-align:right; }
.listResult .orderOpne button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;}
.listResult::after { content:""; display:block; clear:both; }

/* // 주문정보  */
/* // display: none; -> 입력버튼 누르면 내용 보이게 */
.orderInfo { border:5px solid #eee; padding:20px; display: none;}
.orderInfo .inputArea { margin:10px 0; }
.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
.orderInfo .inputArea input { font-size:14px; padding:5px; }
#userAddr2, #userAddr3 { width:250px; }
.orderInfo .inputArea:last-child { margin-top:30px; }
.orderInfo .inputArea button { font-size:20px; border:2px solid #ccc; padding:5px 10px; background:#fff; margin-right:20px;}
</style>

</head>
<body>

<div class="f_content">
<div class="f2_content">

<div align="center">

<form role="form" method="post" autocomplete="off" action="order.do">
<!-- // 로그아웃 & 로그인  후 정보(이름)-->
<c:if test="${login.id ne ''}">
	<a href="logout.do" title="로그아웃">[로그아웃]</a>&nbsp;&nbsp;&nbsp;
</c:if>
		
<c:if test="${login.name ne '' }">
	[${login.name }]님 환영합니다
</c:if>

<h2>주문서 작성</h2>
<h4>배송/결제 정보를 정확히 입력해주세요.</h4>
<h4 style="color:red;">* 이미지를 클릭하면 해당 상품으로 이동합니다.</h4>

<h4>주문상품정보</h4>

<table style="border: 1px solid gray;">

<thead>

	<tr>
		<th colspan="2">상품정보</th>
		<th class="w130">단가</th>
		<th class="w130">수량</th>
		<th class="w130">상품금액</th>
		<th class="w100">배송형태</th>
	</tr>
	
</thead>
<tbody>
<!-- // total -->
<c:set var="totalsum" value="0"/>

<c:forEach var="orderlist" items="${orderlist }">

<c:if test="${orderlist.id == login.id }">
<c:if test="${orderlist.cart_type != 1}">		

	<tr class="mainProduct">
			
		<c:forEach var="orderplist" items="${orderplist }">
		<c:if test="${orderplist.model_id == orderlist.model_id }">
		<td width="20%">  <!-- // 사진 클릭 detail이동 	 -->
			<a href="productDetail.do?model_id=${orderlist.model_id }">
				<img alt="" src="/img/${orderplist.photo_af1}" style="max-width: 120px; height: 110px;">
			</a>
		</td>
		</c:if>
		</c:forEach>
	
		<td> <!-- // 상품정보(모델명) -->
			${orderlist.model_id }			
			<input type="hidden" name="id" value="${login.id }">  <!-- // 값 넘기려고 -->
		</td>
		
		<c:forEach var="orderplist" items="${orderplist }">
		<c:if test="${orderplist.model_id == orderlist.model_id }">
		<td> <!-- // 단가 금액 -->
			 ${orderplist.price }&nbsp;원
			 <!-- // 상품금액 구하기 위한 식 -->
			 <c:set var="sum" value="${orderplist.price }"/>
		</td>
		
		<td> <!-- // 주문수량 -->
			 &nbsp;&nbsp;${orderlist.count }
			 <c:set var="sum" value="${ sum * orderlist.count }원"/>
		</td>
		
		<td> <!-- // 상품 금액 -->
			 <c:out value="${sum }"/>
			 <c:set var="totalsum" value="${totalsum + (orderlist.count * orderplist.price)}" />
		</td>
		
		<td> <!-- // 배송 형태 -->
			<p style="color: gray;">시공</p>
		</td>
		</c:if>
		</c:forEach>
				
	</tr>

</c:if>
</c:if>

</c:forEach>
</tbody>

</table>
		<div class="listResult">
 		<div class="sum">
  		 총 상품 금액 : <fmt:formatNumber pattern="###,###,###" value="${totalsum}"/>&nbsp;원
		<input type="hidden" name="total_price" value="${totalsum}">
		</div>
		
 		<div class="orderOpne">
 		 <button type="button" class="orderOpne_bnt">주문 정보 입력</button>
 		 
 		 <script type="text/javascript">
 		 $(".orderOpne_bnt").click(function(){
 		  	$(".orderInfo").slideDown();
 		  	$(".orderOpne_bnt").slideUp();
 		 });      		
 		 </script>
 		 
		</div>
		</div>
<br>

<!-- // 배송지 정보  -->
<div class="orderInfo">
    
  <h2>배송정보</h2>
    
  <div class="inputArea">
   <label for="">수령인</label>
   <input type="text" name="rname" value="${login.name}" required="required" style="color: gray;"/>
  </div>
  
  <div class="inputArea">
   <label for="orderPhon">수령인 연락처</label>
   <input type="text" name="phone" value="${login.phone}" required="required" style="color: gray;"/>
  </div>
  
  <div class="inputArea">
   <label for="userAddr1">배송지 정보</label>
   <p style="color: gray;">* 제주도, 울릉도 지역은 온라인 주문이 불가하오니, 대리점에 직접 방문해주세요</p>
    <!-- // 주소 -->
    <div class="form-group">                   
	<input class="form-control" style="width: 5%; display: inline; color: gray;" placeholder="우편번호" name="address1" type="text" required="required"/>
    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
	</div>
	<div class="form-group">
    <input class="form-control" style="width: 30%; top: 5px; color: gray;" placeholder="도로명 주소" name="address2" type="text" required="required" />
	</div>
	<div class="form-group">
    <input class="form-control" placeholder="상세주소" type="text" name="address3" style="width: 30%; color: gray;"  />
	</div>
	
	<p>내 등록된 주소</p>
	<h5 style="color: gray;">${login.address1 }&nbsp;${login.address2 }</h5>
  </div>
  
  <div class="inputArea">
  	<label for="" style="width: 10%;">배송 시 요청사항</label>
  	<input type="text" name="content" placeholder="200자 이내로 작성해 주세요" style="color: gray; width: 20%"/>
  </div>

   <div class="inputArea">
  	<hr style="color: gray;">
  	<label for=""><b>결제 정보</b></label><br>
  	<p style="color: red;">총 결제 금액 : <fmt:formatNumber pattern="###,###,###" value="${totalsum}"/>&nbsp;원</p>	
  	<hr style="color: gray;">
  	
  	<label for=""><b>결제 전확인사항</b></label><br>
  	<hr style="color: gray;">
  	<p>1. 고객의 단순한 변심으로 교환, 반품 및 환불을 요구할 때 수반되는 배송비는 고객님께서 부담하셔야합니다.</p>
	<p>2.상품을 개봉했거나 설치한 후에는 상품의 재판매가 불가능하므로 고객님의 변심에 대한 교환, 반품이 불가능함을 양지해 주시기 바랍니다.</p>
  	<hr style="color: gray;">
  	
  </div>
	
   <!-- // 결제수단 -->
  	
  <div class="inputArea">
   <button type="submit" class="order_btn">주문</button>
   <button type="button" class="cancel_btn">취소</button> 
   
   <script type="text/javascript">   
    $(".cancel_btn").click(function(){
    	$(".orderInfo").slideUp();
   		$(".orderOpne_bnt").slideDown();
    });       
   </script>
   
  </div>
 
	<c:forEach var="orderlist" items="${orderlist }">
	<input type="hidden" name="seqq" value="${orderlist.cart_seq }">
	</c:forEach>

</div>

<!-- // 끝 -->
</form>
</div>

</div>
</div>


<!-- // 결제 API -->



<script type="text/javascript">
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
   
           $("[name=address1]").val(data.zonecode);
           $("[name=address2]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}
</script>


</body>
</html>

