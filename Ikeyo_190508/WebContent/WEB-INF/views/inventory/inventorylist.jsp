<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./jquery/jquery.tablesorter.js"></script>	
<script type="text/javascript" src="./jquery/jquery.tablesorter.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>InventoryList</title>

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




<!--  품명(모델번호) / 카테고리 / 수량 / 등록일 / 가격
    모델번호 카테고리    |       |  검색 -->

<div align="center"  style="margin-left: 10%; margin-right: 10%; margin-top: 10%;">
<h3>Inventory List</h3>
<hr><br>
<form action="" id="inven_frm" name="inven_frm" method="post">
<table border="2" width="100%" height="100%" id="list_table" class="tablesorter">

<colgroup>
	<col style="width: 15%">
	<col style="width: 20%">
	<col style="width: 30%">
	<col style="width: 10%">
	<col style="width: 25%">
</colgroup>

<thead>
<tr align="center"  style="border: 3px solid deepskyblue;">
	<th>모델번호</th>
	<th>카테고리</th>
	<th>가격(원)</th>
	<th>수량(개)</th>
	<th>등록일</th>
</tr>
</thead>

<tbody>
<c:if test="${empty invenlist }">
	<tr>
		<td colspan="5">작성된 글이 없습니다</td>
	</tr>
</c:if>


<%--  품번을    a href  또는   맨오른쪽에  버튼이나 아이콘을 줘서 디테일 이동--%>
<c:if test="${not empty invenlist }">
	<c:forEach items="${invenlist }" var="inven" varStatus="vs">
	<tr>
<%-- 	<c:if test="${inven.del == 1 }">
	<!-- <td colspan="5" align="center">해당 재고가 삭제 되었습니다</td> -->
	
	</c:if> --%>
	
	<c:if test="${inven.del == 0 }">
		<td align="center">
		<%-- <a href="inventorydetail.do?inven_seq=${inven.inven_seq }">${inven.model_id }</a> --%>
	
		<a href="#" onClick="goDetail('${inven.inven_seq }','${inven.model_id }')">${inven.model_id }</a>
		</td>
		<td align="center">${inven.category }</td>
		<td align="center">${inven.price }</td>
		<td align="center">${inven.count }</td>
		<td align="center"><fmt:formatDate value="${inven.rdate }" 
		pattern="yyyy/MM/dd"/></td>
		</c:if>
	</tr>
	</c:forEach>
</c:if>

</tbody>
<tr>
	<td colspan="4" style="text-align: center">
	<select id="s_category" name="s_category">
	<option value="" selected="selected">선택</option>
	<option value="model_id">모델번호</option>
	<option value="category">카테고리</option>
	</select>
	<input type="text" id="s_keyword" name="s_keyword">
	<input type="button"  class="joinButton btn_s_blue btn_100" id="_btnSearch" value="검색">
	</td>
	<td align="center">
	<input type="button" class="joinButton btn_s_blue btn_100" value="글쓰기" onclick="goWrite()"> 
	</td>
</tr>

</table>  

<%-- controller로 넘겨주기 위한 처리 --%>
<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber }">
<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage }">
</form>  
</div>   

<div style=" margin-bottom: 10%; font-size: 20pt;">
	<jsp:include page="/WEB-INF/views/inventory/paging.jsp" flush="false">
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
	$("#inven_frm").attr("action", "inventorylist.do").submit();  
	
}




function goWrite() {
	location.href = "inventorywrite.do";
}


$("#_btnSearch").click(function () {

	alert("click!");
	$("#_pageNumber").val("0");

	$("#inven_frm").attr("action", "inventorylist.do").submit();
	
}); 

$(document).ready(function(){ 
	$("#list_table").tablesorter();
}); 


function goDetail(seq, model_id) {
	var inven_seq = seq;
	var model_id = model_id;
	window.open('inventorydetail.do?inven_seq=' + inven_seq + '&model_id=' + model_id, '재고 상세 내역','width=800,height=600', 'scrollbars=yes');
}

</script>

    



</body>
</html>