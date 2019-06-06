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

<!-- cart.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/orderlist.css">

<style type="text/css">
/* // 하단 버튼  */
.listResult { padding:20px; background:#eee; }
.listResult .sum { float:left; width:45%; font-size:22px; }

.listResult .orderOpne { float:right; width:45%; text-align:right; margin-right:100px; }
.listResult .orderOpne button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;}
.listResult::after { content:""; display:block; clear:both; }

/* // 주문정보  */
/* // display: none; -> 입력버튼 누르면 내용 보이게 */
.orderInfo { border:5px solid #eee; padding:20px; display: none; }
.orderInfo .inputArea { margin:10px 0; }
.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; color: black;}
.orderInfo .inputArea input { font-size:14px; padding:5px; }
.orderInfo .inputArea:last-child { margin-top:30px; }
.orderInfo .inputArea button { font-size:20px; border:2px solid #ccc; padding:5px 10px; background:#fff; margin-right:20px;}
</style>

<style type="text/css">
hr {
    box-sizing: content-box;
    height: 0;
    overflow: visible;
}
</style>

</head>
<body>

<div class="f_content" style="margin-bottom: 70%;">
<div class="f2_content" style="background-color: white;">

<div align="center" style="margin-top: 100px; margin-left: 80px; margin-right: 100px;">

<form role="form" method="post" autocomplete="off" action="order.do"
	style="float: left; clear: both; margin-left: 200px; margin-bottom: 30px; width: 800px;">

<%-- <!-- // 로그아웃 & 로그인  후 정보(이름)-->
<c:if test="${login.id ne ''}">
	<a href="logout.do" title="로그아웃">[로그아웃]</a>&nbsp;&nbsp;&nbsp;
</c:if>
		
<c:if test="${login.name ne '' }">
	[${login.name }]님 환영합니다
</c:if> --%>

<h2>주문서 작성</h2><br>
<h4>배송/결제 정보를 정확히 입력해주세요.</h4>
<hr style="margin:63px 0px; border:1px solid #f0f0f0;">


<h3>주문상품정보</h3>
<h5 style="color:red;">*&nbsp;이미지를 클릭하면 해당 상품으로 이동합니다.</h5><br>

<table style="border: 1px solid gray;" class="orderProduct_info">

<thead>

	<tr>
		<th colspan="2" style="font-size: 16px;">상품정보</th>
		<th class="w130" style="font-size: 16px;">단가</th>
		<th class="w130" style="font-size: 16px;">수량</th>
		<th class="w130" style="font-size: 16px;"style="font-size: 16px;">상품금액</th>
		<th class="w100" style="font-size: 16px;">배송형태</th>
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
		<td style="color: black; font-weight:normal; font-size: 16px;" align="center"> <!-- // 단가 금액 -->
			 ${orderplist.price }&nbsp;원
			 <!-- // 상품금액 구하기 위한 식 -->
			 <c:set var="sum" value="${orderplist.price }"/>
		</td>
		
		<td style="color: black; font-weight:normal; font-size: 16px;" align="center"> <!-- // 주문수량 -->
			 &nbsp;&nbsp;${orderlist.count }
			 <c:set var="sum" value="${ sum * orderlist.count }원"/>
		</td>
		
		<td style="color: black; font-weight:normal; font-size: 16px;" align="center"> <!-- // 상품 금액 -->
			 <c:out value="${sum }"/>
			 <c:set var="totalsum" value="${totalsum + (orderlist.count * orderplist.price)}" />
		</td>
		
		<td style="color: black; font-weight:normal; font-size: 16px;" align="center"> <!-- // 배송 형태 -->
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
 		<div class="sum" style="color: red;">
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
  <br>  
  <h3>배송지 정보</h3><br>
    
   <div class="inputArea">
   
   <label>수령인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
   <input type="text" name="rname" value="${login.name}" style="color: gray;" required/>
   <br>	   	
 
   <label>수령인 연락처</label>
   <input type="text" name="phone" value="${login.phone}" style="color: gray;" required/>
  
   <br><br><br>
   <label>주소</label>
   <p class="f13" style="margin:10px 0px 14px 10px;">
      * 제주도, 울릉도 지역은 온라인 주문이 불가하오니, 대리점에 직접 방문해주세요</p>
   
    <!-- // 주소 --> 
    <br>             
	<input class="w305" id="zipcode_disabled" disabled="disabled" name="address1" type="text"/>
    <input type="button" style="border: none; background-color: #63666A; color: #FFF;" class="btn_s_gray btn_100_41" onclick="execPostCode();" value="주소검색">
    <br>                             
	
    <input class="w420" style="margin:9px 0px;" name="address2" type="text" size="53.8px;" id="_addr1" required/>
	<br> 
    <input class="w420" type="text" name="address3" size="53.9px;" id="_addr2"/>

	<br><br> <!-- // 내 배송지  불러오기 -->
	<input type="hidden" id="_id" value="${login.id }">
	<input type="hidden" id="addr1" value="${login.address1 }">
	<input type="hidden" id="addr2" value="${login.address2 }">

	<input type="button" class="btn btn-outline-danger" 
	     style="margin: 20px 9px 30px 0px; border: solid 1px #c80a1e; background-color: white; color: #c80a1e;"
	     value="내 배송지 불러오기" id="_btnaddr">  
 
  <div class="inputArea">
  	<label for="">배송 시 요청사항</label>
  	<!-- // maxlength- 필드의 최대 문자 갯수 -->
  	<input type="text" name="content" placeholder="200자 이내로 작성해 주세요" style="color: gray; width: 20%" maxlength="200"/>
  </div><br>

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
   
   <!-- // null값 -->
   <script type="text/javascript">
   
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

<br><br><br><br><br><br><br>

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

<!-- // 주소 가져오기  -->
<script type="text/javascript">
/* $("#_btnaddr").click(function () {	
	alert("테스트");

	$.ajax({
		type:"post",
		url:"getaddr.do",
		data:{ id:$("#_id").val() },
		async:true,
		success:function(msg){
			
			if(msg == 'NO'){
				$("#_addr1").val( $("#_addr1").val() );
				$("#_addr2").val( $("#_addr2").val() );
			
			
			}else {	
				$("#_addr1").val("");
				$("#_addr2").val("");
			}
			
		},
		error:function(){
			alert("error");	
		}
		
	});
	
});  */

$("#_btnaddr").click(function () {

	
	$("#_addr1").val( $("#addr1").val() );
	$("#_addr2").val( $("#addr2").val() );
	
	
});
</script>


</body>
</html>

