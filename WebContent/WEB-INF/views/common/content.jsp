<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<fmt:requestEncoding value="utf-8"/>  

<!-- content.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/content.css">

<style>
.carousel-item .d-block w-80{
	max-width: 1200px;
	height: auto;
}
</style>

<div class="f_content">
<div class="f2_content" style="background-color: white;">
  
  <!-- <h3 style="color: #2e497e;">meubelmake</h3> -->
<br><br> 
  <div class="bd-example">
 
  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
    </ol>
    
    <div class="carousel-inner">
      
      <div class="carousel-item active">
        <img src="image/top-bn-ko.jpg" class="d-block w-80" alt="" style="width: 100%; height: 80%;">
      </div>
      
      <div class="carousel-item">
        <img src="image/20190508_betterworld_pcko.jpg" class="d-block w-80" alt="..." style="width: 100%; height: 80%;">
      </div>
      <div class="carousel-item">
        <img src="image/S12001.jpg" class="d-block w-80" alt="..." style="width: 100%; height: 80%;">
        <div class="carousel-caption d-none d-md-block">
          <h5><b>보스턴 3인(패브릭)</b></h5>
			  <p style="color: black;"><b>몸을 포근하게 감싸주어 오래 머물고 싶은 기분 좋은 휴식을 선사합니다.</b></p>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
	
</div>	
</div>
 