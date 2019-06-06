<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>   
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>success</title>

<!-- // ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<!-- content.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/content.css">


</head>
<body>

<div class="f_content">
<div class="f2_content" style="background-color: white;">

<div align="center" style="margin-top: 120px; margin-left: 80px; margin-right: 100px;">


<img src="image/good1.gif"><br>
<h2>결제 완료</h2>
<h4>이용해 주셔서 감사합니다.</h4><br>

<button type="button" class="btn btn-primary" onclick="location.href='main.do'">메인으로</button>&nbsp;&nbsp;&nbsp;&nbsp;
<button type="button" class="btn btn-secondary" onclick="location.href='myorder.do'">내 주문내역으로</button>



</div>

</div>
</div>

</body>
</html>