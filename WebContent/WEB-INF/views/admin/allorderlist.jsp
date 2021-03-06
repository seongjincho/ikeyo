<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./css/inventorylist.css" type="text/css"
	media="print, projection, screen">

<script type="text/javascript" src="./jquery/jquery.tablesorter.js"></script>	
<script type="text/javascript" src="./jquery/jquery.tablesorter.min.js"></script>

<style type="text/css">

/* Button */

.btn_s_blue{
	border: none;
	background-color: #0051ba;
	color: #FFF;
}
.btn_s_blue:hover{
	background-color: #0a3670
}

.btn_s_gray{
	border: none;
	background: #63666A;
	color: #FFF;
}

.btn_s_gray:hover{
	background-color: #4F5256;
}

.btn_100{
	width: 80px; 
	height: 30px;
	font-size: 16px;
}

.orderStatus{
	width: 60px; 
	height: 60px;
	/* border: 3px solid deepskyblue; */
}



</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
String category = (String)request.getAttribute("s_category");
if(category == null){  // null값 처리 
	category = "";
}

String keyword = (String)request.getAttribute("s_keyword");
if(keyword == null){
	keyword = "";
}

%>

<script>
var category = "<%=category %>";
var keyword = "<%=keyword %>";


$(document).ready(function () {
	
	//  controller에서 다시 받은 값을 다시 넣어준다 
	$("#s_category").val( category );
	$("#s_keyword").val( keyword ); 
	// 다른 방법 name안에 name
	//document.frmForm1._s_keyword.value = keyword;
	
	
	
	
});
</script> 


<%--주문관리 시퀀스 , 사진 ? 상품명  아이디 모델명 날짜 수량 가격 상태메세지   
		텍스트 필드 검색  , 페이징 처리 --%>

<div align="center" style="margin-left: 5%; margin-right: 5%; margin-top: 10%;">


<h3>주문 관리 페이지 </h3>
<hr><br><br>
<form id="order_frm" method="post">


<table id="list_table" class="tablesorter">

<thead>

<tr style="border: 2px solid deepskyblue;" align="center">
<th>주문번호</th> <th>아이디</th><th>주문일</th> <th>진행 상태</th> 
</tr>

</thead>

<tbody>

<c:if test="${empty orderlist}">
<tr align="center">
	<th colspan="4">현재 주문처리 목록이 없습니다.</th>
<tr>
</c:if>

<c:if test="${not empty orderlist}">
<c:forEach items="${orderlist }" var="order" varStatus="vs">
<tr align="center" style="vertical-align: middle;">  <!--   ORD_SEQ NUMBER(8) PRIMARY KEY,  , ORDER_SUB_SEQ NUMBER(8) PRIMARY KEY -->
<td style="vertical-align: middle;">
<a href="#" onclick="goDetail('${order.order_num }')">${order.order_num }</a>
</td> 
<td style="vertical-align: middle;">${order.id}</td> 
<td style="vertical-align: middle;"><fmt:formatDate value="${order.regdate }" pattern="yyyy/MM/dd"/></td>
<td style="vertical-align: middle;">
	<c:if test="${order.deli_info == 0 }"> <!-- 0: 주문 접수, 1: 결제 완료, 2: 배송중, 3: 배송완료 --> 
       <!-- <font style="color: red; font-size: 18px; font-family: 'Noto Sans KR'; font-weight: 800;">상품준비중</font> -->
       <!-- <img class="orderStatus" alt="" src="image/orderStatus0.png"> -->
       <img class="orderStatus" alt="" src="image/os0.png"><br>
       <span style= "font-size: 16px; font-family: 'Noto Sans KR'; font-weight: 800;">주문 접수</span>
       <br>
    </c:if>
    <c:if test="${order.deli_info == 1 }">
      <!--  <font style="color: red; font-size: 18px; font-family: 'Noto Sans KR'; font-weight: 800;">배송중</font> -->
      <!-- <img class="orderStatus" alt="" src="image/orderStatus1.png"> -->
      <img class="orderStatus" alt="" src="image/os1.png"><br>
      <span style= "font-size: 16px; font-family: 'Noto Sans KR'; font-weight: 800;">결제 완료</span>
      <br>
    </c:if>
    <c:if test="${order.deli_info == 2 }">
       <!-- <font style="color: red; font-size: 18px; font-family: 'Noto Sans KR'; font-weight: 800;">배송완료</font> -->
       <!-- <img class="orderStatus" alt="" src="image/orderStatus2.png"> -->
       <img class="orderStatus" alt="" src="image/os2.png"><br>
       <span style= "font-size: 16px; font-family: 'Noto Sans KR'; font-weight: 800;">배송중</span>
       <br>
    </c:if>
    <c:if test="${order.deli_info == 3 }">
       <!-- <font style="color: red; font-size: 18px; font-family: 'Noto Sans KR'; font-weight: 800;">주문취소</font> -->
       <!-- <img class="orderStatus" alt="" src="image/orderStatus3.png"> -->
       <img class="orderStatus" alt="" src="image/os3.png"><br>
       <span style= "font-size: 16px; font-family: 'Noto Sans KR'; font-weight: 800;">배송 완료</span>
       <br>
    </c:if>
</td>

</tr>
</c:forEach>
</c:if>
</tbody>

<tr>
	<td colspan="4" style="text-align: center">
	<br>
	<select id="s_category" name="s_category">
	<option value="" selected="selected">선택</option>
	<option value="category">ID</option>
	</select>
	<input type="text" id="s_keyword" name="s_keyword">
	<input type="button"  class="joinButton btn_s_blue btn_100" id="_btnSearch" value="검색">
	</td>
</tr>

</table>  

<%-- controller로 넘겨주기 위한 처리 --%>
<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber }">
<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage }">

</form>  
</div>   

<div style=" margin-bottom: 10%; font-size: 20pt;">
	<jsp:include page="/WEB-INF/views/admin/paging.jsp" flush="false">
		<jsp:param value="${pageNumber }" name="pageNumber"/>
		<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
		<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
		<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
	</jsp:include>
</div>




<script type="text/javascript">

function goPage(pageNumber) {
	
	$("#_pageNumber").val(pageNumber); //setter    
	
	// 페이지가 넘어가게되면 검색부분도 같이 보내줘야한다 
	$("#inven_frm").attr("action", "allorderlist.do").submit();  
	
}


$("#_btnSearch").click(function () {

	alert("click!");
	$("#_pageNumber").val("0");

	$("#inven_frm").attr("action", "allorderlist.do").submit();
	
}); 

$(document).ready(function(){ 
	$("#list_table").tablesorter();
}); 


function goDetail( order_num ) {
	//alert(order_num);
	
	var order_num = order_num;
	window.open('allorderdetail.do?order_num=' + order_num,'주문 상세 내역','width=800,height=600', 'scrollbars=yes');

}

</script>


</body>
</html>