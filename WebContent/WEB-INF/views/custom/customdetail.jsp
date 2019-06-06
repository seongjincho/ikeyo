<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<fmt:requestEncoding value="utf-8"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<!-- content.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/content.css">


<style>
.headtitle p {
    font-size: 35px;
    margin-bottom: 70px;
    padding-top: 130px;
    text-align: center;
}

.intro{
	overflow: hidden;
	margin: 0;
    padding: 0;
    font-family: 'NanumBarunGothic', 'Nanum Gothic', Dotum, sans-serif;
    font-size: 13px;
    color: #6d6e72;
}

.intro .intro_left {
    float: left;
    width: 180px;
    color: #283444;
    font-size: 20px;
    line-height: 22px;
    letter-spacing: -1px;
    text-align: left;
}

.intro .intro_left .intro_bar {
    width: 30px;
    border-top: 2px solid #263444;
    height: 20px;
}

table.noti {
    width: 80%;
    border-collapse: collapse;
    display: table;
    border-spacing: 2px;
    border-color: grey;
}

.noti tbody tr{
	text-align: center;
}

.noti tbody tr td{
	border-bottom: 1px solid #f0f0f0;
    height: 70px;
    font-size: 15px;
    /* cursor: pointer; */
}

.noto th {
    font-family: 'Noto Sans KR';
    letter-spacing: -1px;
    border-top: 1px #aaa solid;
    border-bottom: 1px solid #f0f0f0;
    height: 40px;
    font-size: 16px;
    color: #aaa;
    text-align: center;
}
.btn1{
    margin-top: 10px;
    margin-bottom: 15px;
    margin-left: auto;
    margin-right: auto;
    width: 80px;
    height: 30px;
    font-size: 16px;
    border: none;
    background-color: #0051ba;
    color: #FFF;
}

.btn2{
    margin-top: 10px;
    margin-bottom: 15px;
    margin-left: auto;
    margin-right: auto;
    width: 80px;
    height: 30px;
    font-size: 16px;
    border: 1px solid #c80a1e;
    background-color: #fff;
    color: #c80a1e;
}

.btn3{
    margin-top: 10px;
    margin-bottom: 15px;
    margin-left: auto;
    margin-right: auto;
    width: 80px;
    height: 30px;
    font-size: 16px;
    border: 1px solid #0051ba;
    background-color: #fff;
    color: #0051ba;
    float: right;
}
.btn3:hover{
	background-color: #0051ba;
	color: #fff;
}

button{
	cursor: pointer;
}
/* ===========================모달========================== */
/* The Modal (background) */
.modal {
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
.modal-content {
	background-color: #fefefe;
	margin: 100px auto 0px; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 500px; /* Could be more or less, depending on screen size */
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
/* =================================================== */

</style>


<div class="f_content" style="margin-bottom: 30%;">
<div class="f2_content" style="background-color: white;">

<div align="center">

<div class="headtitle" align="center"><br><br>
	<!-- <p>고객의 소리</p> -->
	<h2>고객의 소리</h2>
	<br>
</div>

<!--
<div class="intro">
	<div class="intro_left">
		<div class="intro_bar"></div>
		글 보기
	</div>
<div>
-->		

<!-- ==================================================== -->
<table class="noti">
<thead>
	<tr class="noto">
		<th width="10%">공개여부</th>
		<th width="50%">제목</th>
		<th width="10%">작성자</th>
		<th width="10%">조회수</th>
		<th width="10%">작성일</th>
		<th width="10%">글정보</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>${cust.lock_ eq 0?"공개":"비공개" }</td>
		<td style="text-align: left; padding-left: 30px; font-size: 20px;font-family: 'Noto Sans KR';">${cust.title }</td>
		<td>${cust.id }</td>
		<td>${cust.readcount }</td>
		<td>
			<fmt:formatDate value="${cust.wdate }" pattern="yyyy/MM/dd"/>
		</td>
		<td>${cust.ref }-${cust.step }-${cust.depth }</td>
	</tr>
	<c:if test="${not empty cust.filename && cust.filename ne '' }">
		<tr class="noto">
			<th>이미지파일</th>
			<td colspan="5">
				<img alt="" src="/img/${cust.filename }" width="300px">
			</td>
		</tr>
	</c:if>
	<tr class="noto">
		<th>내용</th>
		<td colspan="5">
			<div style="padding: 10% 10% 10% 10%; text-align:left; background-color: #fff;">
				<pre><font size="3px">${cust.content }</font></pre>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="6" style="padding-top: 25px; border-bottom: 1px solid #fff;">
			<c:if test="${login.id eq cust.id }">
				<button type="button" class="btn1" id="_btnAdd" style="height: 60px;">수정하기</button>
				<button type="button" class="btn2" id="_btnDel" style="height: 60px;">삭제하기</button>
			</c:if>
			<c:if test="${login.auth eq 1 }">
				<button type="button" id="_btnAnswer" class="btn3" style="height: 60px;">답변하기</button>
			</c:if>
		</td>
	</tr>
</tbody>
</table>

</div>

</div>
</div>


<%-- 
<c:if test="${login.id eq cust.id }">
<div id="buttons_wrap">
	<span class="button blue">
		<button type="button" id="_btnAdd">수정하기</button>
	</span>
	<span class="button blue">
		<button type="button" id="_btnDel">삭제</button>
	</span>
</div>
</c:if>
--%>

<form name="frmForm1" id="_frmForm1" method="post">
	<input type="hidden" name="seq" value="${cust.cust_seq }">
</form>
<%-- 
<form name="frmForm2" id="_frmForm2" action="customdelete.do" method="post">
	<input type="hidden" name="seq" value="${cust.cust_seq }">
</form>
<form action="customAnswer.do" method="get">
	<input type="hidden" name="seq" value="${cust.cust_seq }">
</form>
--%>

<br><br><br><br>

<div id="myModal" class="modal">
	<!-- Modal content -->
    <div class="modal-content">
    	<span class="close" style="text-align: right;">&times;</span>                                                               
        <jsp:include page="/WEB-INF/views/custom/customanswer.jsp" flush="false"/> 
    </div>
</div>

<script>

$("#_btnAdd").click(function () {
	$("#_frmForm1").attr("action","customupdate.do").submit();
});

$("#_btnDel").click(function () {
	$("#_frmForm1").attr("action","customdelete.do").submit();
});
/* 
$("#_btnAnswer").click(function () {
	$("#_frmForm1").attr("action","customAnswer.do").submit();
});
 */
</script>

<script>
//When the user clicks on the button, open the modal 
$("#_btnAnswer").on("click", function() {
	$(".modal").css("display", "block");
});

//When the user clicks on <span> (x), close the modal
$(".close").click(function() {
	var im;
	$(".modal").css("display", "none");
	$("#title").val("");
	$("#content").val("");
	$("#lock_").prop('checked',false);
	$("#fileload").val("");
});
</script>


