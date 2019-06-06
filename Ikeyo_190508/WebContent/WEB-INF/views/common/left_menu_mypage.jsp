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
    <br>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav" id="nav-ul">
         <li class="nav-item" id="nav-li">
            <span class="nav-span" style="color: rgba(255,255,255,.9);">나의 쇼핑내역</span>
         </li>
        <li class="nav-item" id="nav-li"> <!--  내 정보    주문내역  장바구니 위시리스트 출석체크 /회원관리 재고관리  -->
           <a class="nav-link js-scroll-trigger" id="nav-a" href="myorder.do">주문/배송 조회</a>
        </li>
        <li class="nav-item" id="nav-li">
           <a class="nav-link js-scroll-trigger" id="nav-a" href="cartList.do">장바구니</a>
        </li>
        <li class="nav-item" id="nav-li">
           <a class="nav-link js-scroll-trigger" id="nav-a" href="wishList.do">위시리스트</a>          
        </li>
        <br>
        <li class="nav-item" id="nav-li">
           <span class="nav-span" style="color: rgba(255,255,255,.9);">나의 게시글 답변</span>
        </li>
        <li class="nav-item" id="nav-li">
           <a class="nav-link js-scroll-trigger" id="nav-a" href="myQnA.do">상품 Q&A</a>
        </li>
        <li class="nav-item" id="nav-li">
           <a class="nav-link js-scroll-trigger" id="nav-a" href="myReview.do">상품평 관리</a>
        </li>
        <br>
        <li class="nav-item" id="nav-li">
           <span class="nav-span" style="color: rgba(255,255,255,.9);">회원정보</span>
        </li>
        <li class="nav-item" id="nav-li">           
           <a class="nav-link js-scroll-trigger active" id="nav-a" href="myInfoGo.do">회원정보 수정</a>
        </li>
        <br>
        <c:if test="${login.auth == 1 }">
        <li class="nav-item" id="nav-li">
           <span class="nav-span" style="color: rgba(255,255,255,.9);">관리 페이지</span>             
        </li>
        <li class="nav-item" id="nav-li">
             <a class="nav-link js-scroll-trigger" id="nav-a" href="memberlist.do">회원 관리</a>
        </li>
        <li class="nav-item" id="nav-li">
          <a class="nav-link js-scroll-trigger" id="nav-a" href="inventorylist.do">재고 관리</a>
        </li>
        <li class="nav-item" id="nav-li"> 
          <a class="nav-link js-scroll-trigger" id="nav-a" href="allorderlist.do">주문 관리</a>
        </li>
        <li class="nav-item" id="nav-li"> 
          <a class="nav-link js-scroll-trigger" id="nav-a" href="qnaList_admin.do">QnA 관리</a>
        </li>
        </c:if>
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

