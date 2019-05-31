<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<fmt:requestEncoding value="utf-8"/> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<!-- content.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/content.css">
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-140681492-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-140681492-1');
</script>
<!-- header.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/header.css">

<style>
#topyo {
text-shadow: 1px 1px 2px black, 0 0 1em blue, 0 0 0.2em blue;
}

</style>

<div id="header_div" style="height: 60px; min-width: 890px;">

<div id="header_nav" style="margin-left: 5%;">
<br>
     <ul>
		<li style="margin-left: 5%;">
        	<div class="dropdown">
				<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" 
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
					style="color: #535353; text-decoration: none;">
					<b>고객지원 </b>
				</a><b> ｜</b>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					<a class="dropdown-item" href="noticelist.do">공지사항</a>
					<a class="dropdown-item" href="customlist.do">고객의 소리</a>
				</div>
        	</div>
        </li>
        <li><b><a href="storeInfo.do" style="color:#535353; text-decoration: none;">&nbsp;매장 안내 ｜</a></b></li>
        <li><b><a href="calendar.do" style="color:#535353; text-decoration: none;" title="출석체크" class="test">&nbsp;<img src="image/AC_20190530-145249.gif"> ｜</a></b></li>
        
        <c:if test="${login.id == null}">	
        <li style="padding-left: 0px;"><b><a href="login.do" style="color: #535353; text-decoration: none;">
        &nbsp;로그인 </a>｜</b></li>
        </c:if>
        
        <c:if test="${not empty login && login.id ne ''}">	
			<li><b><a href="logout.do" title="로그아웃" style="text-decoration: none;">&nbsp;<img src="image/ico-login.png"></a>｜</b></li>
			<li><b><a href="myInfoGo.do" style="color:#535353; text-decoration: none;">&nbsp;마이페이지 ｜</a></b></li>
		</c:if>
        
        <li><b><a href="wishList.do" style="color:#535353; text-decoration: none;">&nbsp;<img src="image/ico-bookmark.png" title="위시리스트"> ｜</a></b></li>   
        <li><b><a href="cartList.do" style="color:#535353; text-decoration: none;">&nbsp;<img src="image/ico-cart.png" title="장바구니"> ｜</a></b></li>
        <li><b><a href="#" style="color:#535353; text-decoration: none;" onclick="goPoll()">&nbsp;투표 ｜</a></b></li>
     	
     	<c:if test="${login.auth eq '1' }">
			<li><b><a href="pollmake.do" style="color:deepskyblue; text-decoration: none;" >&nbsp;투표 만들기 ｜</a></b></li>
			<li><b><a href="inventorylist.do" style="color:deepskyblue; text-decoration: none;">&nbsp;재고리스트 </a>｜</b></li>
		</c:if>
		
     </ul>
</div>


</div>

<script>

function goPoll() {
	if(${empty login.id}){
		alert("로그인해주세요");
		location="login.do";
	}else {
		
		location="polllist.do";
	}
}
</script>
