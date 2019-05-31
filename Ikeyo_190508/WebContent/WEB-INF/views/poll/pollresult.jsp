<%@page import="kh.com.a.model.PollSubDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>


<%
List<PollSubDto> list = (List<PollSubDto>)request.getAttribute("pollsublist"); 

//json 생성
String jsonLike = "[";

for(PollSubDto p : list){
	jsonLike += "{name:'" + p.getAnswer() + "', y:" + p.getAcount() + "}, ";  // 마지막 ',' 없애야함
}

jsonLike = jsonLike.substring(0, jsonLike.lastIndexOf(","));

jsonLike += "]";

System.out.println(jsonLike);  // 확인용

request.setAttribute("jsonLike", jsonLike);

%>
<div align="center" style="margin-left: 10%; margin-right: 10%; margin-top: 20%">
<h3>투표 결과</h3>
<table class="list_table" style="width: 95%">
<colgroup>
	<col width="200px"><col width="500px">
</colgroup>

<tr>
	<th>투표번호</th>
	<td style="text-align: left;">
		<input type="text" name="pollid" value="${poll.pollid }" readonly="readonly" size="50">
	</td>
</tr>

<tr>
	<th>아이디</th>
	<td style="text-align: left;">
		<input type="text" name="id" value="${login.id}" readonly="readonly" size="50">
	</td>
</tr>

<tr>
	<th>투표기한</th>
	<td style="text-align: left;">
		<b><fmt:formatDate value="${poll.sdate}" pattern="yyyy/MM/dd/"/></b>
		 ~ 
		 <b><fmt:formatDate value="${poll.edate}" pattern="yyyy/MM/dd"/></b>
	</td>
</tr>

<tr>
	<th>투표 내용</th>
	<td style="text-align: left;">
		<textarea rows="10" cols="50" name="question" style="resize: none;" readonly="readonly">${poll.question }</textarea>
	</td>
</tr>

<tr>
	<th>투표결과(전체투표자수:${poll.polltotal }명)</th>
	<td>
	<%--high chart 소스  --%>
	<div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>

	</td>
	
</tr>




</table>
</div>

<script>
$(function () {
	
	//alert("!!!!");


Highcharts.chart('container', {
	  chart: {
	    type: 'pie',
	    options3d: {
	      enabled: true,
	      alpha: 45
	    }
	  },
	  title: {
	    text: 'IKEYO 투표'
	  },
	  subtitle: {
	    text: '-결과'
	  },
	  plotOptions: {
	    pie: {
	      innerSize: 100,
	      depth: 45
	    }
	  },
	  series: [{
	    name: '제목 이름 입력 ',
	    data: <%=request.getAttribute("jsonLike") %>
	  }]
	});
});
</script>


