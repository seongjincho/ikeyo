<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/> 

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
  <title>Resume - Start Bootstrap Theme</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet">
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/resume.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
     	<%-- <c:if test="${login.id != null }">${login.id }님 환영합니다.</c:if> --%>
     	<jsp:useBean id="nows" class="java.util.Date"/>

     <div style="color: white;">
		<c:if test="${login.name ne '' }">
			[${login.name }]님 환영합니다
		</c:if>
		<br>
		<fmt:formatDate var="now" value="${nows }" pattern="yyyy/MM/dd"/>
		${now }
	</div>
	
 	<a class="navbar-brand js-scroll-trigger" href="main.do">
      <span class="d-block d-lg-none">IKEYO</span>
      <span class="d-none d-lg-block">
        <img class="img-fluid img-profile rounded-responsive mx-auto mb-2" src="image/ikeyo.jpg" alt="">
      </span>
    </a>
    <br><br>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="productList.do">▤ 모든 제품!!</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="productList.do?category=책상/테이블">책상/테이블</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="productList.do?category=침대/매트릭스">침대/매트릭스</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="productList.do?category=의자/소파">의자/소파</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="productList.do?category=옷장/수납장">옷장/수납장</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="productList.do?category=액세서리">액세서리</a>
        </li>
      </ul>
    </div>
  </nav>


  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="js/resume.min.js"></script>

</body>

</html>


