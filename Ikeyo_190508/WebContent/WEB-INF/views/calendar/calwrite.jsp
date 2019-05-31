<%@page import="kh.com.a.model.MemberDto"%>
<%@page import="java.util.Calendar"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>calwrite.jsp</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> 

</head>
<body>

<%
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");

MemberDto user = (MemberDto)session.getAttribute("login");

Calendar cal = Calendar.getInstance();
int tyear = cal.get(Calendar.YEAR);
int tmonth = cal.get(Calendar.MONTH) + 1;
int tday = cal.get(Calendar.DATE);
int thour = cal.get(Calendar.HOUR_OF_DAY);
int tmin = cal.get(Calendar.MINUTE);
%>

<div align="center">

<h3>출석체크</h3>

<!-- // 로그아웃 & 로그인  후 정보(이름)-->
<c:if test="${login.id ne ''}">
			<a href="logout.do" title="로그아웃">[로그아웃]</a>&nbsp;&nbsp;&nbsp;
		</c:if>
		
		<c:if test="${login.name ne '' }">
			[${login.name }]님 의 출석체크를 시작하겠습니다!!
		</c:if>

<form action="calwriteAf.do" method="post">	
	<!-- // 현재 시간  -->
	<h4 style="color: blue">" 현재시간 "</h4>
	
	<input type="hidden" name="id" value="<%=user.getId() %>">
	
	<%=tyear %>년&nbsp;<%=tmonth %>월&nbsp;<%=tday %>일&nbsp;<%=thour %>시&nbsp;<%=tmin %>분
	<input type="hidden" name="year" value="<%=tyear %>">
	<input type="hidden" name="month" value="<%=tmonth %>">
	<input type="hidden" name="day" value="<%=tday %>">
	<input type="hidden" name="hour" value="<%=thour %>">
	<input type="hidden" name="min" value="<%=tmin %>">
		
	<br><br><br>
	<button type="submit" value="출석체크">[출석체크]</button>
</form>

</div>




</body>
</html>

