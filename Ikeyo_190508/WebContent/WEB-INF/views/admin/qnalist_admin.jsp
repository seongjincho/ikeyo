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
	width: 80px; 
	height: 30px;
	font-size: 16px;
}





</style>

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


<%--	qna_seq, id , title , content, wdate , answer, adate, readcount, parent, del	
		 시퀀스 	 아이디   제목           내용 		작성일 	답글 		답글작성일 조회수      상품글 시퀀스 삭제여부
 --%>
 
 <div align="center"  style="margin-left: 10%; margin-right: 10%; margin-top: 10%;">
<h3>QnA&nbsp;&nbsp;관리&nbsp;&nbsp;페이지</h3>
<hr><br>
<form action="" id="qnalist_frm" name="qnalist_frm" method="post">
<table border="1" width="100%" height="100%" id="list_table" class="tablesorter">

<colgroup>

	<col style="width: 10%">
	<col style="width: 10%">
	<col style="width: 10%">
	<col style="width: 50%">
	<col style="width: 10%">
	<col style="width: 10%">

</colgroup>

<thead>
<tr align="center"  style="border: 3px solid deepskyblue;">
	
	<th>번호</th>
	<th>상태</th>
	<th>아이디</th>
	<th>제목</th>
	<th>작성일</th>
	<th>답변일</th>

	
</tr>
</thead>

<tbody>

<c:if test="${empty qlist_admin }">
	<tr>
		<td colspan="6" align="center">문의글이 없습니다</td>
	</tr>
</c:if> 

<c:if test="${not empty qlist_admin }">
	<c:forEach items="${qlist_admin }" var="qna" varStatus="vs">
	<tr align="center">
		<td>${qna.qna_seq }</td>
		<td>
		    <c:if test="${qna.answer eq null }">
               <font style="color: red; font-size: 18px; font-family: 'Noto Sans KR'; font-weight: 800;">접수</font>
            </c:if>
            
            <c:if test="${qna.answer ne null }">
               <font style="color: red; font-size: 18px; font-family: 'Noto Sans KR'; font-weight: 800;">답변완료</font>
            </c:if>
		</td>
		<td>${qna.id }</td>
		<td><a href="#" onclick="goAnswer('${qna.parent }')">${qna.title }</a>
		<input type="hidden" id="parent" name="parent" value="${qna.parent }"></td>
		<td><fmt:formatDate value="${qna.wdate }" pattern="yyyy.MM.dd"/></td>
		<td><fmt:formatDate value="${qna.adate }" pattern="yyyy.MM.dd"/></td>
	</tr>
	</c:forEach>
</c:if> 


   
   
</tbody>

 <tr>
	<td colspan="9" style="text-align: center">
	<select id="s_category" name="s_category">
	<option value="" selected="selected">선택</option>
	<option value="id">아이디</option>
	</select>
	<input type="text" id="s_keyword" name="s_keyword">
	<input type="button" id="_btnSearch" value="검색" class="joinButton btn_s_blue btn_100">
	</td>

</tr> 


</table>

<%-- controller로 넘겨주기 위한 처리 --%>
<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber }">
<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage }">
 

<div style="margin-bottom: 10%;">
	<jsp:include page="/WEB-INF/views/admin/paging.jsp" flush="false">
		<jsp:param value="${pageNumber }" name="pageNumber"/>
		<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
		<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
		<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
	</jsp:include>
</div>

</form>

</div>


<script type="text/javascript">


$(document).ready(function(){ 
	$("#list_table").tablesorter();
}); 


function goPage(pageNumber) {
	
	$("#_pageNumber").val(pageNumber); //setter    
	
	// 페이지가 넘어가게되면 검색부분도 같이 보내줘야한다 
	$("#inven_frm").attr("action", "qnaList_admin.do").submit();  
	
}

$("#_btnSearch").click(function () {

	alert("click!");
	$("#_pageNumber").val("0");

	$("#inven_frm").attr("action", "memberlist.do").submit();
	
}); 


function goAnswer(parent) {
	//var parent = $("#parent").val();
	//alert(parent);
	
	$.ajax({
		url:"goProductDetail.do",
		type:"post",
		data:{ parent:parent},
		success:function(data){
			//alert("success");
			//alert(data);
			if(data.trim() != null){
				
			    var data = data.replace(/\"/gi, "");  
			    // "" 붙는 에러로 정규식으로 사용 ,
				//alert(data);
				
				location = "productDetail.do?model_id=" + data;
				
				
			}else{
				alert(data);
				
			}
		},
		error:function(r, s, err){
			alert("error");
		}
	});
}

</script>

</body>
</html>