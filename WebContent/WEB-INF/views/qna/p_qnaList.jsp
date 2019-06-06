<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<style type="text/css">
/* The Modal (background) */
.modal2 {
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
.modal-content2 {
	background-color: #fefefe;
	margin: 100px auto 0px; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 450px; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close2 {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}
.close2:hover, .close2:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
.btn-ad{
	width: auto;
    height: 30px;
    font-size: 16px;
}

.redBtn {
    border: 1px solid #c80a1e;
    background-color: #c80a1e;
    color: #fff;
    width: 205px;
    height: 40px;
}
.font_qna{
	color: #c80a1e; 
	font-size: 16px; 
	font-family: 'Noto Sans KR'; 
	font-weight: 800;
}

</style>

</head>
<body>
<br/>

<div class="title">
<!-- <span class="noto tt">상품평</span> -->
<h3>상품 Q&amp;A</h3>
</div>
<div align="right">
<input type="button" value="상품 Q&A쓰기" class="grayBtn" id="qnaWrite" <%-- onclick="goWrite('${pdto.model_id}', '${login.id }')" --%>/>
<input type="button" value="고객지원" class="grayBtn" onclick="location.href='customlist.do'"/>
</div>
<div align="center">
<span style="font-size: 14px; color: #aaa;">
상품에 관한 문의가 아닌 경우 고객센터를 이용해주세요.
</span>
</div>

<br/>
<div id="mainContainer2">

<table style="width: 100%;">
<colgroup>
	<col width="10%"/><col width="70%"/><col width="10%"/><col width="10%"/>
</colgroup>

<c:if test="${empty qlist }">
	<tr style="width: 100%; height: 80px; border-top: 1px solid #aaa; text-align: center;">
		<td colspan="4">작성된 글이 없습니다</td>
	</tr>
</c:if>

<c:if test="${not empty qlist }">
	<c:forEach items="${qlist }" var="qna" varStatus="vs">
	
		<tr style="height: 80px; border-top: 1px solid #aaa; border-bottom: 1px solid #aaa;">			
			
			<td style="vertical-align: middle; text-align: center;">
				<c:if test="${qna.answer eq null }">
					<font class="font_qna">접수</font>
				</c:if>
				<c:if test="${qna.answer ne null }">
					<font class="font_qna">답변완료</font>
				</c:if>
			</td>
			
			<td style="vertical-align: middle; padding: 40px 40px 30px 20px;">
				
				<input type="hidden" id="qna_seq${vs }"/>
				<span onclick="qnadetail(${qna.qna_seq})" style="display: inline-block; font-size: 16px; 
					font-family: 'Noto Sans KR';letter-spacing: -1px;">${qna.title }</span>
			</td>
			<td style="vertical-align: middle; padding: 40px 40px 30px 10px; text-align: right;">
				<!-- 마지막글자 * 처리 -->
				${fn:substring((qna.id),0,(fn:length(qna.id)-1 )) }*
			</td>
			
			<td style="vertical-align: middle; padding: 40px 40px 30px 0px;">
				<fmt:formatDate value="${qna.wdate }" pattern="yyyy.MM.dd"/>
			</td>
		</tr>
		
		<tr id="q${qna.qna_seq }" style="display:none; height: 80px; border-top: 1px solid #aaa; border-bottom: 1px solid #aaa;">
			<td style="vertical-align: middle; text-align: center;"><font class="font_qna">Q</font></td>
			<td colspan="3"><span>${qna.content }</span></td>
		</tr>
		
		<!-- 답변이 되었을 경우 -->
		<c:if test="${qna.answer ne null }">
		<tr id="a${qna.qna_seq }" style="display:none; height: 80px; border-top: 1px solid #aaa; border-bottom: 1px solid #aaa;">
			<td style="vertical-align: middle; text-align: center;"><font class="font_qna">A</font></td>
			<td colspan="2">${qna.answer }</td>
			<td><fmt:formatDate value="${qna.adate }" pattern="yyyy.MM.dd"/></td>
		</tr>
		</c:if>
		<!-- 답변이 안달렸을 경우 + 관리자일 경우 -->
		<c:if test="${qna.answer eq null and login.auth eq 1}">
		<tr id="an${qna.qna_seq }" style="display:none; height: 80px; border-top: 1px solid #aaa; border-bottom: 1px solid #aaa;">
			<td style="vertical-align: middle; text-align: center;">
			<font class="font_qna">답변</font></td>
			<td style="vertical-align: middle; text-align: center;">				
				<form id="_frmAnswer${qna.qna_seq }" action="" method="post">
				<textarea rows="5" cols="70" name="answer" id="answer${qna.qna_seq }" style="resize: none;"></textarea>	
				<input type="hidden" name="qna_seq" id="qna_seq${qna.qna_seq }" value=""/>
				<input type="hidden" name="model_id" id="qna_model_id${qna.qna_seq }" value="${pdto.model_id }"/>
				</form>			
			</td>
			<td colspan="2">
				<input type="button" value="답변달기" class="grayBtn" onclick="answer(${qna.qna_seq})" />
			</td>
		</tr>
		</c:if>
		
<input type="hidden" id="cl${qna.qna_seq }" value="0"/>

	</c:forEach>
</c:if>


</table>

</div>
<!-- The Modal -->
<div id="myModal2" class="modal2">
 
	<!-- Modal content -->
    <div class="modal-content2">
    	<span class="close2" style="text-align: right;">&times;</span>                                                               
        <jsp:include page="/WEB-INF/views/qna/qnaWrite.jsp" flush="false"/> 
    </div>
</div>

<script>

//When the user clicks on the button, open the modal 
$("#qnaWrite").on("click", function() {
	$(".modal2").css("display", "block");
});

//When the user clicks on <span> (x), close the modal
$(".close2").click(function() {
	$(".modal2").css("display", "none");
	$("#title2").val("");
	$("#content2").val("");
});

function qnadetail(qna_seq) {
	if($("#cl"+qna_seq).val() == 1 ){
		$("#q"+qna_seq).hide();
		$("#a"+qna_seq).hide();
		$("#an"+qna_seq).hide();
		$("#cl"+qna_seq).val(0);
	}else if($("#cl"+qna_seq).val() == 0 ){
		$("#q"+qna_seq).show();
		$("#a"+qna_seq).show();
		$("#an"+qna_seq).show();
		$("#cl"+qna_seq).val(1);
	}
}

// 답글남기기
function answer(qna_seq) {
	// 답글을 쓰지 않았을 경우
	if($("#answer"+qna_seq).val().trim() == null || $("#answer"+qna_seq).val().trim() ==""){
		alert("답글을 입력해 주세요");
		return;
	}
	$("#qna_seq"+qna_seq).val(qna_seq);
	//alert($("#qna_seq" + qna_seq).val());
	$("#_frmAnswer"+qna_seq).attr("action", "qnaAnswer.do").submit();
}

</script>

</body>
</html>