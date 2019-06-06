<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<fmt:requestEncoding value="utf-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

#content{

height: 100%;
}

</style>
<title> IKEYO - 1조 </title>
<!-- // 타이틀 로고  -->
<link rel="icon" type="image/ico" href="image/ikeyo.png" />

</head> 
<body>

<table>

<tr>	
	<tiles:insertAttribute name="left_menu"/>
	<td colspan="2" style="position: fixed; z-index: 100;">
		<tiles:insertAttribute name="header"/>
	</td>
</tr>

<tr>
	<td colspan="2" style="max-width: 1200px; height: auto;">
			<tiles:insertAttribute name="content"/>
	</td>
</tr>

<tr>
	<td colspan="2">
		<tiles:insertAttribute name="footer"/>
	</td>
</tr>

</table>

</body>
</html>