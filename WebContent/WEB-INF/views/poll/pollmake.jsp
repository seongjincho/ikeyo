<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
<script>

$(document).ready(function () {
	
	for(var i = 5; i <= 10; i++){ 
		$("#poll" + i).hide(); //기본적으로 보기가 4개까지 보여지도록 하는 처리   poll + 5  6 7 8 9 10 은 숨김   보기 항목 2~10개             
	}
	
});

function pollchange( me ) { // 보기의 갯수를 갱신하는 함수 
	
	var num = me.options[me.selectedIndex].value;
	//alert(num + "개");
	
	for(i = 1; i <= 10; i++){ // 초기화 하는 이유 ?  기존에 있던 값을 없애기 위해  
		$("#poll" + i).val("");
		$("#poll" + i).hide();   // 10개를 모두 감춰 준다 
	}
	
	for(i = 1; i <= num; i++){
		$("#poll" + i).show();   // 선택한 갯수까지만 보여준다 
	}
	
}
</script>



<%
Calendar cal = Calendar.getInstance();
int tyear = cal.get(Calendar.YEAR);
int tmonth = cal.get(Calendar.MONTH) + 1; // month는  0부터 시작하므로 
int tday = cal.get(Calendar.DATE);
%>

<div align="center"  style="margin-left: 10%; margin-right: 10%; margin-top: 10%; margin-bottom: 10%;">
<h3>투표&nbsp;&nbsp;생성</h3>
<hr><br><br>
<form action="pollmakeAf.do" method="post">

<table class="list_table" style="width: 85%">
<colgroup>
	<col width="200px"><col width="500px">
</colgroup>

<tr>
	<th>아이디<hr></th>
	<td style="text-align: left;">
		${login.id }
		<input type="hidden" name="id" value="${login.id }">
		<hr> 
	</td>
</tr>

<tr>
	<th>투표기한<hr></th>
	<td style="text-align: left;">
		
		<!--sdate연도 -->
		
		<select name="syear">
			<%
			for(int i = tyear; i < tyear + 6; i++){
				%>
				
				<option <%=(tyear + "").equals(i + "")?"selected='selected'":"" %> value="<%=i %>">
					<%=i %>
				</option>
				
				<%
			}
			%>
		</select>년
		
		<!-- 월 -->
		<select name="smonth">
			<%
			for(int i = 1; i <= 12; i++ ){
				%>
				<option <%=(tmonth + "").equals(i + "")?"selected='selected'":"" %> value="<%=i %>">
					<%=i %>
				</option>
				<%
			}
			%>
		</select>월
		
		<!-- 일 -->
		<select name="sday">
		<% 
		for(int i = 1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){   //  getActualMaximum 말일 구하기 
			%>
				<option <%=(tday + "").equals(i + "")?"selected='selected'":"" %> value="<%=i %>">
					<%=i %>
				</option>
			<% 
		}
		
		%>
		</select>일
		
		~
		
		
		<!--edate 연도 -->
		<select name="eyear">
			<%
			for(int i = tyear; i < tyear + 6; i++){
				%>
				
				<option <%=(tyear + "").equals(i + "")?"selected='selected'":"" %> value="<%=i %>">
					<%=i %>
				</option>
				
				<%
			}
			%>
		</select>년
		
		<!-- 월 -->
		<select name="emonth">
			<%
			for(int i = 1; i <= 12; i++ ){
				%>
				<option <%=(tmonth + "").equals(i + "")?"selected='selected'":"" %> value="<%=i %>">
					<%=i %>
				</option>
				<%
			}
			%>
		</select>월
		
		<!-- 일 -->
		<select name="eday">
		<% 
		for(int i = 1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){   //  getActualMaximum 말일 구하기 
			%>
				<option <%=(tday + "").equals(i + "")?"selected='selected'":"" %> value="<%=i %>">
					<%=i %>
				</option>
			<% 
		}
		
		%>
		</select>일
		<hr>
	</td>
</tr>


<tr>
	<th>투표내용</th>
	<td style="text-align: left;">
		<textarea rows="10" cols="50" name="question"></textarea><hr>
	</td>
</tr>

<tr>
	<th>투표문항수</th>               <%-- onchange 바뀔때마다 호출  --%>
	<td style="text-align: left;">
		<select name="itemcount" onchange="pollchange(this)">
			<%
			for(int i = 2; i <= 10; i++){
				%>
				<option <%=(4 + "").equals(i + "")?"selected='selected'":"" %> value="<%=i %>">
					<%=i %>
				</option>
				<%
			}
			%>
		</select>개<hr>
	</td>
</tr>

<%-- 고를수 있는 문항  --%>
<tr>
	<th>투표상세문항</th>
	<td style="text-align: left;">
		<%
		for(int i = 1; i <= 10; i++){
			%>
			<div id="poll<%=i %>">
				<%=(i+"") %>번:<input type="text" name="poll<%=i %>" size="60"><br>
			</div>
			<%
		}
		%>
	</td>
</tr>

<!-- <tr align="center" style="margin-top: 10%;">
	<td colspan="2">
		<input type="submit" value="투표 만들기" class="joinButton btn_s_blue btn_100">
	</td>
</tr> -->

</table>

<br><br>
<input type="submit" value="투표 만들기" class="joinButton btn_s_blue btn_100">

</form>
</div>

