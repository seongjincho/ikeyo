<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품등록페이지</title>

<style type="text/css">
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}
/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

</style>

</head>
<body>
<div align="center" style="margin-top: 10%;margin-bottom: 10%;">

<h3>상품등록 write</h3>

<!-- <form action="productAddAf.do" method="post" enctype="multipart/form-data"> -->
<form id="_frmForm" method="post" enctype="multipart/form-data">
<table border="1">
<colgroup>
<col width="100"><col width="200">
</colgroup>
<tbody>
<tr>
	<th>모델명  : </th>
	<td align="center"><input type="text" name="model_id" id="_model_id" readonly="readonly" style="text-align: right; width: 70%;"></td>
</tr>
<tr>
	<th>가격  : </th>
	<td align="center"><input type="text" name="price" id="_price" readonly="readonly" style="text-align: right;"> 원</td>
</tr>
<tr>
	<th>상품이름  : </th>
	<td align="center"><input type="text" name="p_name" id="_p_name" style="text-align: right;"></td>
</tr>
<tr>
	<th>카테고리  : </th>
	<td align="center"><input type="text" name="category" id="_category" readonly="readonly" style="text-align: right;"></td>
</tr>
<tr>
	<th>상품갯수  : </th>
	<td align="center"><input type="text" id="_count" readonly="readonly" style="text-align: right;"> 개</td>
</tr>
<tr>
	<th>상품내용  : </th>
	<td>
		<textarea rows="10" cols="50" name="content" id="_content"
>
</textarea>
	</td>
</tr>
<tr>
	<th>메뉴얼  : </th>
	<td align="center"><input type="file" name="pdf_bs" id="_pdf_bf"></td>
</tr>
<tr>
	<th>사진등록1  : </th>
	<td align="center"><input type="file" name="photo_bs1" id="_photo_bf1"></td>
</tr>
<tr>
	<th>사진등록2  : </th>
	<td align="center"><input type="file" name="photo_bs2" id="_photo_bf2"></td>
</tr>
<tr>
	<th>사진등록3  : </th>
	<td align="center"><input type="file" name="photo_bs3" id="_photo_bf3"></td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="button" id="pbtnsearch" value="상품 검색">&nbsp;&nbsp;
		<!-- <input type="submit" value="상품 등록">&nbsp; -->
		<input type="button" value="상품 등록" onclick="goWrite()">&nbsp;
		<input type="button" value="상품 등록 취소" id="pbtncancel">
	</td>
</tr>

</tbody>
</table>
<input type="hidden" name="pdf_af">
<input type="hidden" name="photo_af1">
<input type="hidden" name="photo_af2">
<input type="hidden" name="photo_af3">
</form>

<!-- The Modal -->
<div id="myModal" class="modal">
 
	<!-- Modal content -->
    <div class="modal-content">
    	<span class="close" style="text-align: right;">&times;</span>                                                               
        <jsp:include page="/WEB-INF/views/product/inventoryAddlist.jsp" flush="false"/> 
    </div>
</div>


<script type="text/javascript">
function goWrite() {
	
	// 유효성 검사
	if($("#_p_name").val().trim() == ""){
		alert("상품명을 입력해 주세요!");
		$("#_p_name").focus();
		return;
	}
	if($("#_content").val().trim() == ""){
		alert("상품내용을 입력해 주세요!");
		$("#_content").focus();
		return;
	}
	
	$("#_frmForm").attr("action", "productAddAf.do").submit();
}

/*
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];                                          
*/

// When the user clicks on the button, open the modal 
$("#pbtnsearch").on("click", function() {
	$(".modal").css("display", "block");
});

//When the user clicks on <span> (x), close the modal
$(".close").click(function() {
	$(".modal").css("display", "none");
});

// When the user clicks anywhere outside of the modal, close it
/* window.onclick = function(event) {
    if (event.target == $(".modal")) {
    	$(".modal").css("display", "none");
    }
} */

function invenAdd(i_seq) {
	
	//alert("idcheck");
	$.ajax({
			url : "getinventory.do",
			type : "post",
			data : {
				inven_seq : i_seq
			},
			success : function(data) {
				//alert("success");
				//alert(data.model_id);
				//alert(data.price);
				
				$("#_model_id").val(data.model_id);
				$("#_price").val(data.price);
				$("#_category").val(data.category);
				$("#_count").val(data.count);
				$(".modal").css("display", "none");
			},
			error : function(r, s, err) {
				alert("error");
			}
		});
}
	

</script>
</div>
</body>
</html>