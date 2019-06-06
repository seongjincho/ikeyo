<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/_common.css">


<style>
#contents {
    margin: 100px auto 80px;
    width: 1200px;
    overflow: hidden;
}

.right_contents {
    float: left;
    position: relative;
    min-height: 600px;
    width: 730px;
    margin-left: 65px;
    text-align: center;
}

span {
    display: inline-block;
}

.title {
    font-size: 35px;
    letter-spacing: -1.1px;
    color: #333;
    margin-bottom: 44px;
}

.order_status_div {
    background-color: #f0f0f0;
    padding: 23px;
    margin-bottom: 45px;
    overflow: hidden;
    padding-left: 90px;
}

.status_item {
    float: left;
    width: 100px;
    height: 100px;
    position: relative;
}

.bar_item {
    float: left;
    width: 8px;
    height: 2px;
    margin: 51px 19px 47px;
    background-color: #63666a;
}

.noto {
    font-family: 'Noto Sans KR';
    letter-spacing: -1px;
}



.order_table {
    border-top: 1px solid #aaa;
    border-bottom: 1px solid #aaa;
    width: 100%;
	margin: 0px auto 80px;
	border-collapse: collapse;
}

.order_table tr:first-child td {
    color: #aaa;
    height: 24px;
}
.order_table tr:not(:first-child) td {
    padding: 40px 0px;
    vertical-align: top;
}

.order_table tr:not(:first-child) td:nth-child(2) {
    text-align: left;
    padding: 40px 25px;
}

.order_table tr td.nolist {
    border-bottom: none;
    color: #aaa;
    font-weight: 300;
    padding: 100px 0 395px;
}

.order_table tr td {
    color: #333;
    text-align: center;
    border-bottom: 1px solid #f0f0f0;
}


.arial {
    font-family: 'arial';
    letter-spacing: 0px;
}

.table_value_lb {
    letter-spacing: -0.4px;
}

.orderNo_lb {
    padding-bottom: 1px;
    border-bottom: 1px solid #c80a1e;
    color: #c80a1e;
}

.mg190 {
    margin-bottom: 190px;
}

.table_key_lb {
    margin-bottom: 14px;
    font-weight: 500;
}

.seriesNm {
    font-weight: 500;
    margin-bottom: 11px;
}
.oneProductPrice {
    float: right;
    padding-top: 6px;
    font-weight: 300;
    color: #c80a1e;
}
.order_option_div {
    overflow: hidden;
    margin: 10px 0px;
    line-height: 2;
}
.optionNm {
    float: left;
    font-weight: 300;
    color: #63666a;
    width: 50%;
    white-space: nowrap;
    overflow: hidden;
}

.one_product_price_div {
    margin-top: 25px;
    margin-bottom: 50px;
}
.price_div {
    overflow: hidden;
}
.rightOptionNm {
    float: right;
    font-weight: 300;
    color: #aaa;
    width: 38px;
    text-align: center;
}
.bar {
    height: 1px;
    background-color: #f0f0f0;
    margin-bottom: 30px;
}
.totalPrice {
    color: #c80a1e;
    font-weight: 300;
    float: right;
}

.orderStatus {
    font-weight: 500;
    margin-bottom: 15px;
}

.orderCancelBtn {
    border: 1px solid #63666a;
    background-color: #63666a;
    color: #fff;
    border-radius: inherit;
    cursor: pointer;
}
.paymentBtn{
	border: 1px solid #6610f2;
    background-color: #6610f2;
    color: #fff;
    border-radius: inherit;
    cursor: pointer;
}
.btn:hover {
    color: #212529;
    text-decoration: none;
}
.reviewBtn {
    display: inline-block;
    float: left;
    width: 108px;
    height: 28px;
    border: 1px solid #c80a1e;
    color: #c80a1e;
    background-color: #fff;
}

</style>


<div id="content" style="margin-top: 10%; margin-left: 15%;">
<div class="right_contents">
<span class="title noto">주문/배송 조회</span>
<div class="order_status_div">
	<div class="status_item">
		<img src="./image/orderStatus0.png" alt="" class="status_img" />
		<span class="status_count f13 arial"></span>
	</div>
	<div class="bar_item"></div>
	<div class="status_item">
		<img src="./image/orderStatus1.png" alt="" class="status_img" />
		<span class="status_count f13 arial"></span>
	</div>
	<div class="bar_item"></div>
	<div class="status_item">
		<img src="./image/orderStatus2.png" alt="" class="status_img" />
		<span class="status_count f13 arial"></span>
	</div>
	<div class="bar_item"></div>
	<div class="status_item">
		<img src="./image/orderStatus3.png" alt="" class="status_img" />
	</div>
</div>

<div style="margin: 40px auto;">
	<span class="noto f14" style="color:#aaa;">최대 3년 이내 주문내역만 조회하실 수 있습니다.</span>
</div>

<table class="order_table">
	<!-- 여기에 if문 -> 주문내역 리스트 뿌려주기-->
	<!-- list 비었을때 출력 -->
	<c:if test="${empty orderlist }">
		<tr>
			<td class="nolist noto f20" style="text-align: center;">주문내역이 없습니다.</td>
		</tr>
	</c:if>
	
	<!-- list 출력 (login.id와 비교) for문 돌리기 -->
	<c:if test="${not empty orderlist }">
	<tr>
		<td class="noto f13" width="150px">주문번호</td>
		<td class="noto f13">주문 배송 정보</td>
		<td class="noto f13" width="140px">진행상태</td>
	</tr>
	<c:forEach items="${orderlist }" var="olist" varStatus="vs">
	
	<tr>
		<td>
			<span class="table_key_lb noto f13"><b>주문번호</b></span><br>
			<span class="table_value_lb arial f16 orderNo_lb mg190">${olist.order_num }</span><br>
			<span class="table_key_lb noto f13"><b>주문일</b></span><br>
			<fmt:formatDate var="rdate" value="${olist.regdate }" pattern="yyyy/MM/dd"/>
			<span class="table_value_lb arial f16">${rdate }</span>
		</td>
		<td class="prel">
			<c:forEach items="${sublist }" var="sub" varStatus="subvs">
				<c:if test="${sub.order_num eq olist.order_num }">
				<span class="noto f16 seriesNm">${sub.model_id }</span><br>
				<span class="noto f16 productNm">${sub.p_name }</span><br>
				<div class="order_option_div">
					<span class="noto f13 rightOptionNm ml15"></span>
					<span class="noto f13 rightOptionNm ">수량</span>
				</div>
				
				<div class="order_option_div">
					<span class="noto f13 optionNm">${sub.p_name }</span>
					<span class="noto f13 rightOptionNm ml15"></span>
					<span class="noto f13 rightOptionNm">${sub.count }</span> 
				</div>
				<div class="price_div one_product_price_div">
					<button type="button" class="reviewBtn noto f13" onclick="review('${sub.model_id }')">상품평 작성</button>
					<span class="oneProductPrice arial f16">${sub.price * sub.count }<b class="noto" style="color:#c80a1e;">원</b></span>
				</div>
			</c:if>
			</c:forEach>
				<div class="bar"></div>
				<div class="total_price_div price_div">
					<span class="noto f20" style="color: #333; font-weight: 300;">전체</span>
					<span class="totalPrice arial f20">${olist.total_price }<b class="noto" style="color:#c80a1e;">원</b></span>
				</div>
		</td>
		<td>
			<!-- 0: 주문 접수, 1: 결제 완료, 2: 배송중, 3: 배송완료 -->
			<c:if test="${olist.deli_info eq 0 }">
				<span class="orderStatus noto f16">주문 접수</span><br>
				<img src="./image/os0.png" alt="주문 접수" width="80px" height="80px"/><br>
			</c:if>
			<c:if test="${olist.deli_info eq 1 }">
				<span class="orderStatus noto f16">결제 완료</span><br>
				<img src="./image/os1.png" alt="결제 완료" width="80px" height="80px"/><br>
			</c:if>
			<c:if test="${olist.deli_info eq 2 }">
				<span class="orderStatus noto f16">배송중</span><br>
				<img src="./image/os2.png" alt="배송중" width="80px" height="80px"/><br>
			</c:if>
			<c:if test="${olist.deli_info eq 3 }">
				<span class="orderStatus noto f16">배송완료</span><br>
				<img src="./image/os3.png" alt="배송완료" width="80px" height="80px"/><br>
			</c:if>
			
			
			<c:if test="${olist.deli_info eq 0 }">
				<button type="button" class="noto f13 btn orderCancelBtn" onclick="orderCancel(${olist.order_num })">주문취소</button>
				<button type="button" class="noto f13 btn paymentBtn" onclick="payment(${olist.order_num })">결제진행</button>
			</c:if>
			<c:if test="${olist.deli_info eq 1 }">
				<button type="button" class="noto f13 btn orderCancelBtn" onclick="orderCancel(${olist.order_num })">주문취소</button>
			</c:if>
			<c:if test="${olist.deli_info eq 2 }">
				<button type="button" class="noto f13 btn orderCancelBtn" onclick="orderFix('${olist.order_num }','${olist.total_price }')">구매확정</button>
			</c:if>
			
			<!-- <span class="table_key_lb noto f13">희망 배송일</span><br> -->
			<!-- <span class="table_value_lb arial f16 mg30">2019.06.07</span><br> -->
		</td>
	</tr>
	
	<!-- 오더리스트 foreach -->
	</c:forEach>
	
	<!-- ${not empty orderlist } -->
	</c:if>
	
</table>

</div>
</div>
<form id="orderfrm1" method="get">
   <input type="hidden" id="onum" name="order_num" value="">
</form>

<form id="orderfrm2" method="get">
	<input type="hidden" id="mid" name="model_id" value="">
</form>

<form id="orderfrm3" method="get">
   <input type="hidden" id="_onum" name="order_num" value="">
   <input type="hidden" id="_total" name="total_price" value="">
</form>

<script>
function orderCancel( order_num ) {
	
	if(confirm("주문을 취소하시겠습니까?")==true){
		$("#onum").val(order_num);
		$("#orderfrm1").attr("action", "orderCancel.do").submit();
	}else{
		
	}
	
}
</script>
<script>
function orderFix( order_num, total_price ) {
	/* alert("여기는 orderfix"); */
	$("#_onum").val(order_num);
	$("#_total").val(total_price);
	$("#orderfrm3").attr("action", "orderFix.do").submit();
}
</script>
<script>
function payment( order_num ) {
	$("#onum").val(order_num);
	$("#orderfrm1").attr("action", "payment_.do").submit();
}
</script>
<script>
function review( model_id ) {
	$("#mid").val(model_id);
	$("#orderfrm2").attr("action","productDetail.do").submit();
}
</script>



