<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>상품디테일</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<style>
.quantity {
	display: inline-block;
	position: relative;
	width: 50px;
	vertical-align: top;
}

.quantity input {
	width: 30px;
	height: 25px;
	padding: 0 2px 0 3px;
	line-height: 25px;
	border: 1px solid #d4d8d9;
	border-radius: 3px 0 0 3px;
}

.quantity .up {
	position: absolute;
	left: 28px;
	top: 0;
}

.quantity .down {
	position: absolute;
	left: 28px;
	top: 12px;
}

#main_container {
	margin-bottom: 0;
	padding-bottom: 0;
}

#main {
	margin-bottom: 0;
	padding-bottom: 0;
}

#tabContainer hr {
	position: relative;
	padding: 0 20px;
	font-size: 0;
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

#tabContainer ul {
	list-style: none;
	padding: 0 0 10;
	margin: 0;
	z-index: 3;
}

#tabContainer ul li {
	display: inline; /* 세로나열을 가로나열로 변경 */
	border: 1px solid #999; /* 각 메뉴의 왼쪽에 "|" 표시(분류 표시) */
	font: bold 12px Dotum; /* 폰트 설정 - 12px의 돋움체 굵은 글씨로 표시 */
	padding: 10 20 10 20px; /* 각 메뉴 간격 */
	/* margin: 10 10 0 10; */
	border-bottom: none;
}

.tabContainer1 {
	position: relative;
	padding: 0 20px;
	font-size: 0;
	box-sizing: border-box;
	width: 100%;
	border-bottom: 1px solid #000 !important;
}

#tabContainer ul li:first-child {
	/* border-left:none; */ /* 메뉴 분류중 제일 왼쪽의 "|"는 삭제 */
	
}

#tabContainer .tabFillSpace {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 0;
	padding: 0;
	border-color: #000;
	z-index: 3;
}

.cloneTabsContainer .tabItem.active, .cloneTabsContainer .tabItem {
	position: relative;
	margin: 0;
	margin-left: -1px;
	padding: 0 10px;
	/* width: 168px; */
	height: 50px;
	line-height: 50px;
	font-size: 12px;
	color: #999;
	border-color: #D1D1D1;
	box-sizing: border-box;
	border-radius: 0;
	background: #fff;
	transition: background-color .2s, border-bottom-color .2s;
	text-overflow: ellipsis;
}

.cloneTabsContainer .tabItem:first-child {
	margin-left: 0;
}

.cloneTabsContainer .tabItem.active {
	border-color: #000;
	color: #000;
	z-index: 5;
	overflow: unset;
	white-space: unset;
	border-bottom: none;
}
#leftNavBottom{
	border-bottom: 1px solid #000 !important;
}

.productInfoContainer {
	padding-bottom: 1.04em;
	overflow: hidden;
	box-sizing: border-box;
	padding: 20px 15px;
	width: 1060px;
}

/*위시리스트*/
.exist img {
	margin-top: -14px !important;
}

.empty img {
	margin-top: 2px !important;
}

.icon {
	float: right;
	overflow: hidden;
	height: 16px;
	margin-top: 14px;
	cursor: pointer;
}

/*버튼*/
.btn_s_gray { /*장바구니*/
	border: none;
	background-color: #a9a9a9;
	color: #FFF;
}

.btn_s_gray:hover {
	background-color: #6c757d;
}

.btn_205 {
	width: 230px;
	height: 50px;
	font-size: 16px;
}

.btn_s_red {
	border: none;
	background-color: #007bff;
	color: #FFF;
}

.btn_s_red:hover {
	background-color: #0051ba
}

.grayBtn {
	display: inline-block;
	margin-top: 6px;
	width: 108px;
	height: 33px;
	border: 1px solid #63666a;
	color: #333;
	background-color: #fff;
}

.grayBtn:hover {
	color: #fff;
	background-color: #63666a;
	cursor: pointer;
}

/* The Modal (background) */
.modal3 {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 9; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content3 {
	background-color: #fefefe;
	margin: 100px auto 0px; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 450px; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close3 {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}
.close3:hover, .close3:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

</style>



</head>
<body>

<div id="main" align="center">
<div id="main_container" style="width: 85%;">
<br/><br/>
<hr/>
<div>


<table>
<colgroup>
	<col width="50%"/><col width="50%"/>
</colgroup>
<tr>
	<td valign="top">	
		<div id="left_container" style="margin-right: 20px;">	
		<table>
		<colgroup>
			<col width="30%"/><col width="30%"/><col width="30%"/>
		</colgroup>
		<tr>
			<td colspan="3">
				<div style="margin: 10 10 10 10;" id="mainImgConatiner">
					<img src="/img/${pdto.photo_af1 }" id="img_main" style="width: 500; height: 500;" />
				</div>
			</td>
		</tr>
		<tr>
			<td width="33%">
				<div style="margin: 10 10 10 10;" id="imageThumb_0">
				<img src="/img/${pdto.photo_af1 }" alt="" id="${pdto.photo_af1 }" style="width: 150px; height: 150px;"  />
				</div>
			</td>
			<td width="33%">
				<div style="margin: 10 10 10 10;" id="imageThumb_1">
				<img src="/img/${pdto.photo_af2 }" alt="" id="${pdto.photo_af2 }" style="width: 150px; height: 150px;"  />
				</div>
			</td>
			<td width="33%">
				<div style="margin: 10 10 10 10;" id="imageThumb_2">
				<img src="/img/${pdto.photo_af3 }" alt="" id="${pdto.photo_af3 }" style="width: 150px; height: 150px;"  />
				</div>
			</td>
		</tr>
		</table>
		</div>
		
	</td>
	
	<!-- 오른쪽 content -->
	<td style="padding: 20 0 10% 10px;" align="center" valign="top">
	
		<div id="right_container" style="width: 100%; height: auto;">
		<!-- 바로구매 폼 -->
		<form action="" method="post" id="_frm_cart">
		<input type="hidden" name="model_id" id="cart_model"  value="${pdto.model_id }"/>
		<input type="hidden" name="id" id="cart_id" value="${login.id }" />
		<input type="hidden" name="cart_type" value="3" />
		<table>
		<colgroup>
			<col width="50%"/><col width="50%"/>
		</colgroup>
		
		<tr align="center">
			<td colspan="2" align="left">
			<br/>
				<h4>${idto.category }</h4><!-- 카테고리 --> 
			</td>
		</tr>
		
		<tr align="center">
			<td align="left">
			<br/><br/>
				<h3>${pdto.p_name }</h3><!-- 상품명 --> 
				<br/>
			</td>
			<td>
			
			<!-- 위시리스트 -->
			<c:if test="${empty cartlist or mem == null}">
				<p class="icon wish_icon empty">
					<img src="image/icon_wish.svg"/>
				</p>
			</c:if>				
								
			<c:if test="${!empty cartlist and mem != null}">
				<c:set var="loop_flag" value="false"/>									
				<c:forEach var="j" items="${cartlist }">							
					<c:if test="${pdto.model_id eq j.model_id && mem.id eq j.id }">
						<c:set var="loop_flag" value="true"/>
					</c:if>																
				</c:forEach>
				
				<c:if test="${loop_flag eq true }">
					<p class="icon wish_icon exist">									
						<img src="image/icon_wish.svg"/>		
					</p>
				</c:if>
				<c:if test="${loop_flag eq false }">
					<p class="icon wish_icon empty">
						<img src="image/icon_wish.svg"/>		
					</p>
				</c:if>
			</c:if>						
			<label class="wishCnt" style="float: right; margin-top: 15px; margin-right: 4px; font-size: 12px; display: block;">										
				<c:if test="${pdto.likecount ne 0 }">
					${pdto.likecount }	
				</c:if>								
			</label>		
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<font size="15"><b style="color: red;">￦ <fmt:formatNumber value="${idto.price }" pattern="#,###"/></b> / 개</font> 
				<br/><br/>
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<hr/>
				<span><b>배송기간</b></span>
				<span>약 7일</span>
				<span><b>배송비</b></span>
				<span>무료배송</span>
				
				<span><b>제품코드</b> : ${pdto.model_id }</span>
			</td>
		</tr>
		
		<tr>
			<td align="center"><br/><br/>			
				수량 : 
			</td>
			<td>
			<br/><br/>
			<span class="quantity">
				<input type="text" id="count" name="count" value="1" size="20" readonly="readonly"/>&nbsp;&nbsp;
				<a href="#" onclick="plusCount()"><img alt="" src="./image/btn_count_up.gif" class="up" /></a>
				<a href="#" onclick="minusCount()"><img alt="" src="./image/btn_count_down.gif" class="down" /></a>
			</span>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<br/><hr/>
				<span style="text-align: right;"><b>총 상품금액</b> : 
					<span id="test"></span>
					<input type="text" id="totalprice" value="" readonly="readonly" style="text-align: right; border: none; padding-right: 5px;"/> 
					원
				</span>
				<hr/>
				<br/><br/>
			</td>
		</tr>
		
		<tr>
			<td align="center">
				<input type="button" value="장바구니" class="btn_s_gray btn_205" onclick="goCart()" />
			</td>
			<td align="center">
				<input type="button" value="바로구매" class="btn_s_red btn_205" onclick="nowCart()" />
			</td>
		</tr>
		<c:if test="${login.auth eq 1 }">
		<tr>
			<td colspan="2" align="center">
				<br/>			
				<input type="button" value="수정하기" class="grayBtn btn_205" onclick="p_update(${pdto.prod_seq})" />				
			</td>
		</tr>
		</c:if>
		
		</table>
		</form>
		</div>	<!-- id="right_container" -->
		
	</td>
</tr>

</table>
<br/><br/><br/>
</div>

<!-- 제품정보 컨테이너 -->
<div id="tabContainer" class="tabContainer1" align="left">
	<ul class="cloneTabsContainer">
		<li class="tabItem active" id="productinfo">제품 정보</li>
		<li class="tabItem" id="reviews" >상품평</li>
		<li class="tabItem" id="qnas" >상품Q&amp;A</li>	
	</ul>
	<div class="tabFillSpace">&nbsp;</div>
</div> <!-- id= tabContainer -->

<!-- 제품정보, 상품평, 상품 Q&A-->
<div id="leftNavBottom" style="display: block;">

<div id="infoContainer" class="productInfoContainer" align="left">	
	<jsp:include page="/WEB-INF/views/product/productInfo.jsp" flush="false"/> 
</div>

<div id="reviewsContainer" align="left" style="display: none;">
	<jsp:include page="/WEB-INF/views/reviews/p_reviewList.jsp" flush="false"/>
</div>

<div id="qnasContainer" align="left" style="display: none;">
	<jsp:include page="/WEB-INF/views/qna/p_qnaList.jsp" flush="false"/>
</div>
</div>

<!--  상품 수정페이지  -->
<!-- The Modal -->
<div id="myModal3" class="modal3">
 
	<!-- Modal content -->
    <div class="modal-content3">
    	<span class="close3" style="text-align: right;">&times;</span>                                                               
        <jsp:include page="/WEB-INF/views/product/productUpdate.jsp" flush="false"/> 
    </div>
</div>

<script>
function p_update(prod_seq) {
	//alert(prod_seq);
	$(".modal3").css("display", "block");
}

$(".close3").click(function() {
	$(".modal3").css("display", "none");
	$("#title3").val("");
	$("#content3").val("");
});
</script>

</div>	<!-- id="main_container" -->

</div><!-- id="main" -->
<br/><br/>
<script>
$(document).ready(function(){
	$("#totalprice").val((${idto.price }+"").replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " ");
});

// 작은 이미지 클릭시 메인 이미지 변경
$("#imageThumb_0").on("click", function(){
	$("#img_main").attr("src", "/img/${pdto.photo_af1 }");
});
//작은 이미지 클릭시 메인 이미지 변경
$("#imageThumb_1").on("click", function(){
	$("#img_main").attr("src", "/img/${pdto.photo_af2 }");
});
//작은 이미지 클릭시 메인 이미지 변경
$("#imageThumb_2").on("click", function(){
	$("#img_main").attr("src", "/img/${pdto.photo_af3 }");
});

// 수량 -클릭시
function minusCount(){
	var count = $("#count").val();
	
	if(count != 0 && count > 1){
		count --;
		$("#count").val(count); 
		$("#totalprice").val(((${idto.price } * count) +"").replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " ");
	}else {
		alert("수량을 다시 확인 해주세요");
		 $("#count").val(1);
		// $("#count").focus();
	}
}

// 수량 +클릭시
function plusCount(){
	var count = $("#count").val();	
	var maxcount = ${idto.count};
	if(10 <= maxcount){
		maxcount = 10;
	}
	
	if(count<maxcount && count>=0){		
		count ++;
		$("#count").val(count);
		$("#totalprice").val(((${idto.price } * count) +"").replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " ");
		
	}else {
		if(count < 0){
			alert("재고 수량이 1보다 작습니다.");
			$("#count").val(1);
			$("#count").focus();
		}else {
			alert("재고 수량(최대10개)이상 주문할 수 없습니다.");
		}		
	}
}

$("#productinfo").click(function() {
	$("#productinfo").attr("class", "tabItem active");
	$("#reviews").attr("class", "tabItem");
	$("#qnas").attr("class", "tabItem");
	
	$("#infoContainer").css("display", "block");
	$("#reviewsContainer").css("display", "none");
	$("#qnasContainer").css("display", "none");
});

$("#reviews").click(function() {
	$("#reviews").attr("class", "tabItem active");
	$("#productinfo").attr("class", "tabItem");
	$("#qnas").attr("class", "tabItem");
	
	$("#infoContainer").css("display", "none");
	$("#reviewsContainer").css("display", "block");
	$("#qnasContainer").css("display", "none");
});

$("#qnas").click(function() {
	$("#qnas").attr("class", "tabItem active");
	$("#reviews").attr("class", "tabItem");
	$("#productinfo").attr("class", "tabItem");
	
	$("#infoContainer").css("display", "none");
	$("#reviewsContainer").css("display", "none");
	$("#qnasContainer").css("display", "block");
});

// 장바구니클릭시
function goCart() {	
	var id = $("#cart_id").val();
	var model_id = $("#cart_model").val();
	var count = $("#count").val();
	if(id == null || id == ""){
		alert("로그인 후 이용 가능합니다.");
		return false;
	}
	
	$.ajax({
		url: "product_cart.do",
		method: "post",
		dataType: "json",
		data: {"model_id" : model_id, "id" : id, "count" : count},
		success:function(data){
			if(confirm("상품이 장바구니에 담겼습니다.\n바로 확인하시겠습니까?")){
				location.href="cartList.do";				
			}
		},
		error:function(xhr, textStatus, err){
			console.log("ajax 에러가 발생했습니다.: " + xhr.responseText);
			console.log("textStatus: " + textStatus);
			console.log("error: " + error);
		}	
	});	
}

function nowCart() {
	var id = $("#cart_id").val();
	var model_id = $("#cart_model").val();
	var count = $("#count").val();
	
	if(id == null || id == ""){
		alert("로그인 후 이용 가능합니다.");
		return false;
	}
	$("#_frm_cart").attr("action", "productOrder.do").submit();	
}

</script>

<script>
$(document).on("click", ".wish_icon", function(event){
	var id = '${login.id}';
	
	if(id == null || id == "") {
		alert("로그인 후 이용 가능합니다.");
		return false;
	}
	
	/* var model_id = $(this).parent().attr('data-product-cd'); */
	var model_id = '${pdto.model_id}';
	
	$.ajax({
		url: "updateWish.do",
		cache: false,
		method: "post",
		dataType: "json",
		data: {"model_id" : model_id, "id" : id},
		success:function(data){
			console.log(data.result);
			console.log(data.isExist);
			console.log(data.wishCnt);
			
			if(data.result == "SUCCESS"){
				if(data.isExist == true) {
					alert("위시리스트에 등록되었습니다.");
					$(event.target).parent().addClass('exist');
					$(event.target).parent().removeClass('empty');	
				} else {
					alert("위시리스트에서 삭제되었습니다.");
					$(event.target).parent().addClass('empty');
					$(event.target).parent().removeClass('exist');
				}
				
				if(data.wishCnt == 0) {
					$(event.target).parent().parent().find('.wishCnt').css("display", "none");
				} else {
					$(event.target).parent().parent().find('.wishCnt').css("display", "block");
					$(event.target).parent().parent().find('.wishCnt').text(data.wishCnt);
				}
			}
		},
		error:function(xhr, textStatus, err){
			console.log("ajax 에러가 발생했습니다.: " + xhr.responseText);
			console.log("textStatus: " + textStatus);
			console.log("error: " + error);
		}
	});
});
</script>

</body>
</html>