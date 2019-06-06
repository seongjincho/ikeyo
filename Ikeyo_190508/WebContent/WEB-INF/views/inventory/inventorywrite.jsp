<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<style type="text/css">

input,textarea{
	background-color: #ffffff00;
}

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

.btn_50{
	width: 100px;
	height: 40px;
	font-size: 16px;
}

.btn_30{
	width: 30px;
	height: 30px;
	font-size: 16px;
}

</style>
<title>inventorywrite.jsp</title>
</head>
<body>

<div align="center"  style="margin-left: 10%; margin-right: 10%; margin-top: 10%; margin-bottom: 10%;">
<h3>Inventory Register</h3>
<hr><br><br>
<form id="inven_frm" method="post">
<table style="height: 100%; width: 100%;">
<colgroup>
	<col style="width: 20%">
	<col style="width: 80%">
</colgroup>	
<tr>
	<td>모델명<hr></td>
	<td>
	<input type="text" size="50" id="model_id" name="model_id">
	<input type="button" value="Inventory check" class="joinButton btn_s_blue btn_100" onclick="inventoryCheck()">
	<div id="_model_id"></div>
	<hr>
	</td>
</tr>

<tr>  <%-- 카테고리 select ? or text필드?  --%>
	<td>카테고리<hr></td>
		<td>
		<select id="category" name="category"> 
		<option value="" selected="selected">선택</option>
		<option value="책상/테이블" >책상/테이블</option>
		<option value="침대/매트리스" >침대/매트리스</option>
		<option value="의자/소파" >의자/소파</option>
		<option value="옷장/수납장" >옷장/수납장</option>
		<option value="액세서리">액세서리</option>
		</select> 
		&nbsp;&nbsp;&nbsp;
		<hr>
	</td>
	
</tr>

<tr>    <%-- + - 버튼 ??  --%>
	<!-- <td>수량:<input type="number" id="count" name="count" size="50" min="1" max="1000">개</td> -->
	<td>수량<hr></td>
	<td>
	<a href="#" class="joinButton btn_s_blue btn_30" onclick="minusCount()"><img alt="" src="./image/btn_pre.gif"></a>&nbsp;&nbsp;
	<input type="text" id="count" name="count" value="1" size="5">개&nbsp;&nbsp;
	<a href="#" class="joinButton btn_s_blue btn_30" onclick="plusCount()"><img alt="" src="./image/btn_next.gif"></a>
	<hr>
	</td>
</tr>

<tr>  
	<td>가격<hr></td>
	<td>
	<input type="text" id="price" name="price">원
	<hr></td>
</tr>

<tr>
	<td align="center" colspan="2"><input type="button" class="joinButton btn_s_blue btn_100" id="btn_regi" value="Register" onclick="goWrite()" disabled="disabled">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" class="joinButton btn_s_gray btn_100" value="Cancel" onclick="goBack()"></td>
</tr>

</table>
</form>
</div>

<script type="text/javascript">

function inventoryCheck() {
	//alert("inventoryCheck()");
	
	
	
	
	var model_id = $("#model_id").val();
	
	if(model_id == ""){
		
		alert("모델명을 입력해주세요 ");
		$("#model_id").focus();
		
	}else {
	
	$.ajax({
		url:"inventoryCheck.do",
		type:"post",
		data:{ model_id:model_id },
		success:function(data){
			//alert("success");
			//alert(data);
			
			if(data.trim() == "\"OK\""){
				
				/* $("#_model_id").css("color", "#0000ff")
				$("#_model_id").html("사용할 수 있는 모델명입니다"); */
				alert("등록할 수 있는 모델명입니다");
				$("#model_id").val(model_id); 
				 $("#btn_regi").removeAttr("disabled"); // 활성화 
					//$("#_btnRegi").attr("disabled", "disabled"); // 비활성화 
				
			}else{
				
/* 				$("#_model_id").css("color", "#ff0000")
				$("#_model_id").html("사용 중인 모델명입니다");	 */
				alert("이미 등록 되어있는 모델명입니다"); 
				$("#model_id").focus(); 
			}
		},
		error:function(r, s, err){
			alert("error");
		}
	});
	
	}
}


function minusCount(){
	
	
	var count = $("#count").val();
	
	if(count != 0 && count > 0){
		count --;
		$("#count").val(count); 
	}else {
		alert("수량을 다시 확인 해주세요");
		 $("#count").val(1);
		$("#count").focus();
		
	}
	

}

function plusCount(){
	var count = $("#count").val();
	
	
	if(count<500 && count>=0){
		
		count ++;
		$("#count").val(count); 
		
	}else {
		if(count < 0){
			alert("재고 수량이 1보다 작습니다.");
			$("#count").val(1);
			$("#count").focus();
		}else {
			
		alert("재고 수량이 500개를 넘을 수 없습니다. 수량을 확인해주세요");
		 $("#count").val(500);
		 $("#count").focus();
		}
		
	}
}	

function goWrite(){
	
	var model_id = $("#model_id").val();
	var category = $("#category").val();
	var price = $("#price").val();
	
	if(model_id == "" && model_id == 0){
		
		alert("모델명을 입력해주세요");
		$("#model_id").focus();
		
	}else if(category == "" && category == 0){
		
		alert("카테고리를 선택해주세요");
		$("#category").focus();
		
	}else if(price == "" && price == 0) {
		
		alert("가격을 입력해주세요");
		$("#price").focus();
		
	}else {
		$("#inven_frm").attr("action", "inventorywriteAf.do").submit(); 
		
	}
	
}

function goBack() {
	
	location.href="inventorylist.do";
}
	


	
	


</script>

</body>
</html>