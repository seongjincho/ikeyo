<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/> 

<!DOCTYPE html>
<html lang="en">

<head>
	<%--메뉴 css --%>
	<style>
    .nav-item a{cursor:pointer;}
    .nav-item .hide{display:none;}
	</style>
	
	
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
     <div style="color: white;">
		<c:if test="${login.id ne '' && login.id != null  }">
			[${login.name }]님 환영합니다
		<br>
		<fmt:formatDate var="now" value="${nows }" pattern="yyyy/MM/dd"/>
		${now }
		</c:if>
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
        <li class="nav-item"><br><br>     
          <a class="nav-link js-scroll-trigger active" href="storeInfo.do" >매장 안내</a>
            <ul class="hide">  
                <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#" onclick="changeLoca('용산점')">용산점</a>
                </li> 
                <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#" onclick="changeLoca('중곡점')">중곡점</a>
                </li>
                <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#" onclick="changeLoca('논현점')">논현점</a>
                </li>
                <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#" onclick="changeLoca('강동점')">강동점</a>
                </li>
                <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#" onclick="changeLoca('송파점')">송파점</a>
                </li>   
            </ul>
        
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

<script type="text/javascript">
$(document).ready(function(){
    $(".nav-item>a").click(function(){
        var submenu = $(this).next("ul");

        // submenu 가 화면상에 보일때는 위로  부드럽게 접고 아니면 아래로 부드럽게 펼치기
        if( submenu.is(":visible") ){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
    }).mouseover(function(){
        $(this).next("ul").slideDown();
    });
});


function changeLoca( local ) {
	//alert(local);
	
	location.href = "findStore.do?local=" + local;
}

</script>



</body>

</html>


