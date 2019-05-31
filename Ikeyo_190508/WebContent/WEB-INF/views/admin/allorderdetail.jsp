<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<fmt:requestEncoding value="utf-8"/>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	width: 100px; 
	height: 50px;
	font-size: 16px;
}

.orderStatus{
	width: 80px; 
	height: 80px;
	border: 3px solid deepskyblue;
}

</style>

<title>Insert title here</title>
</head>
<body>

<div align="center" style="margin-left: 5%; margin-right: 5%;" >
<!-- (모델명(order_sub)/수량(order_sub)/가격/주문자이름/주소/폰번/총가격/메모)  order_ /// order_sub-->
<h3>주문 관리 상세내역 </h3>
<hr><br><br>
<form id="order_frm" method="post">

<table style="height: 100%; width: 100%;"> 

<colgroup>
	<col style="width: 20%">
	<col style="width: 80%">
</colgroup>



<tr align="left">
	<td>주문번호<hr></td>
	<td>${order_.order_num }<hr></td>
	
</tr>

<tr align="left">
	<td>모델명/수량<hr></td>
	<td><c:forEach items="${order_sub }" var="sub">[<b>${sub.model_id }</b>]&nbsp;&nbsp;&nbsp;[<b>${sub.count }</b>]개<br></c:forEach><hr></td>
</tr>

<tr align="left">
	<td>총수량<hr></td>
	<td><c:set var = "total" value = "0" />

<c:forEach var="sub" items="${order_sub}" varStatus="vs">     

<c:set var= "total" value="${total + sub.count}"/>

</c:forEach>

<c:out value="${total}"/><hr></td>
</tr>

<tr align="left">
	<td>주문자<hr></td>
	<td>${order_.rname }<hr></td>
</tr>

<tr align="left">
	<td>연락처<hr></td>
	<td>${order_.phone }<hr></td>

</tr>

<tr align="left">  
	<td>총 가격<hr></td>
	<td>${order_.total_price }원<hr></td> 
</tr>

<tr align="left">  
	<td>배송지 요청사항<hr></td> 
	<td>${order_.content }<hr></td>
	
</tr>

<tr align="left">  
	<td style="text-align: center;">진행 상태<hr></td> 
	<td align="center">    
	<c:if test="${order_.deli_info == 0 }">
       <!-- <font style="color: red; font-size: 18px; font-family: 'Noto Sans KR'; font-weight: 800;">상품준비중</font> -->
       <img class="orderStatus" alt="" src="image/orderStatus0.png">
    </c:if>
    <c:if test="${order_.deli_info == 1 }">
      <!--  <font style="color: red; font-size: 18px; font-family: 'Noto Sans KR'; font-weight: 800;">배송중</font> -->
      <img class="orderStatus" alt="" src="image/orderStatus1.png">
    </c:if>
    <c:if test="${order_.deli_info == 2 }">
       <!-- <font style="color: red; font-size: 18px; font-family: 'Noto Sans KR'; font-weight: 800;">배송완료</font> -->
       <img class="orderStatus" alt="" src="image/orderStatus2.png">
    </c:if>
    <c:if test="${order_.deli_info == 3 }">
       <font style="color: red; font-size: 18px; font-family: 'Noto Sans KR'; font-weight: 800;">주문취소</font>
    </c:if>
    <hr></td>
	
</tr>



<tr align="center">
	<td colspan="2">
	<input type="button" value="Update"  class="joinButton btn_s_blue btn_100" onclick="goUpdate('${order_.deli_info }')">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="Cancel" class="joinButton btn_s_gray btn_100" onclick="window.close()">
	<input type="hidden" id="ord_seq" name="ord_seq" value="${order_.ord_seq }">
	</td>
</tr>

</table>

</form>

</div>

<script type="text/javascript">

function goUpdate(deli_info) {
	
	//alert(deli_info);
	
	var result = confirm('배송상태를 업데이트 하시겠습니까?'); 
	
	if(result) { 
		
	if(deli_info >= 1){
		
		alert("이미 업데이트가 되어있습니다.");
		
		
	}else { // 0일 때 작동 
			
	var ord_seq = $("#ord_seq").val();
	
	//alert("ord_seq");
	
	$.ajax({
		url:"allorderupdate.do",
		type:"post",
		data:{ ord_seq:ord_seq },
		success:function(data){
			
			//alert("success");
			//alert(data);
			
			if(data.trim() == "\"OK\""){
				
				alert("배송 상태 업데이트 완료");
				opener.parent.location.reload();
				window.close();
				
			}else{
				alert(data);
				
			}
		},
		error:function(r, s, err){
			alert("error");
		}
	});
	
	}
	
	}else{
		
		
		
	}	
	
}


</script>

</body>
</html>