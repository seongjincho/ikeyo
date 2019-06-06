<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

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
    height: 25px;
    font-size: 13px;
    color: #aaa;
    text-align: center;
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
	height: 30px;
	font-size: 16px;
}


</style>

<div class="headtitle">
	<p>투표 결과</p>
</div>


<div align="center" style="margin-left: 5%; margin-right: 5%; margin-bottom: 5%;" >


<form action="polling.do" method="post">

<table class="noti" style="width: 95%">
<colgroup>
	<col width="200px"><col width="500px">
</colgroup>


<tr class="noto">
	<th>투표번호</th>
	<td style="text-align: left;">
		<input type="text" name="pollid" value="${poll.pollid }" readonly="readonly" size="50">
	</td>
</tr>

<tr class="noto">
	<th>아이디</th>
	<td style="text-align: left;">
		<input type="text" name="id" value="${login.id}" readonly="readonly" size="50">
	</td>
</tr>

<tr class="noto">
	<th>투표기한</th>
	<td style="text-align: left;">
		<b><fmt:formatDate value="${poll.sdate}" pattern="yyyy/MM/dd/"/></b>
		 ~ 
		 <b> <fmt:formatDate value="${poll.edate}" pattern="yyyy/MM/dd"/></b> 
	</td>
</tr>

<tr class="noto">
	<th>투표 내용</th>
	<td style="text-align: left;">
		<textarea rows="10" cols="50" name="question" readonly="readonly">${poll.question }</textarea>
	</td>
</tr>

<tr class="noto">
	<th>투표 보기수</th>
	<td style="text-align: left;">
		${poll.itemcount}개 
	</td>
</tr>

<tr class="noto">
	<th>투표 보기</th>
	<td style="text-align: left;">
		<c:forEach items="${pollsublist }" var="psub" varStatus="vs">
		
		${vs.count }번:
		<input type="radio" name="pollsubid" ${vs.count==1?"checked='checked'":"" } value="${psub.pollsubid }">
		<input type="text" name="answer" size="60" value="${psub.answer }" readonly="readonly">
		<br>
		</c:forEach>
	</td>
</tr>

<tr align="center" class="noto">
	<td>
		<input type="submit"  class="joinButton btn_s_blue btn_100" value="투표하기">
	</td>
	<td>
	<input type="button"  class="joinButton btn_s_gray btn_100" value="뒤로가기" onclick="goBack()"> 
	</td>
</tr>


</table>

</form>

</div>

<script>

function goBack() {
	 
location.href = "polllist.do";
		 	
		 	
		 } 

</script>
