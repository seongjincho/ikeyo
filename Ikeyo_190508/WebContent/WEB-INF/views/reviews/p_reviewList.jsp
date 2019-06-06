<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>

<style type="text/css">
/* The Modal (background) */
.modal {
   display: none; /* Hidden by default */
   position: fixed; /* Stay in place */
   z-index: 9; /* Sit on top */
   left: 0;
   top: 0;
   width: 100%; /* Full width */
   height: 100%; /* Full height */
   overflow: auto; /* Enable scroll if needed */
   background-color: rgb(0, 0, 0); /* Fallback color */
   background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
   background-color: #fefefe;
   margin: 100px auto 0px; /* 15% from the top and centered */
   padding: 20px;
   border: 1px solid #888;
   width: 500px; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close {
   color: #aaa;
   float: right;
   font-size: 28px;
   font-weight: bold;
}
.close:hover, .close:focus {
   color: black;
   text-decoration: none;
   cursor: pointer;
}

/* 수정 */

/* The Modal (background) */
.modal1 {
   display: none; /* Hidden by default */
   position: fixed; /* Stay in place */
   z-index: 9; /* Sit on top */
   left: 0;
   top: 0;
   width: 100%; /* Full width */
   height: 100%; /* Full height */
   overflow: auto; /* Enable scroll if needed */
   background-color: rgb(0, 0, 0); /* Fallback color */
   background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content1 {
   background-color: #fefefe;
   margin: 100px auto 0px; /* 15% from the top and centered */
   padding: 20px;
   border: 1px solid #888;
   width: 500px; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close1 {
   color: #aaa;
   float: right;
   font-size: 28px;
   font-weight: bold;
}
.close1:hover, .close1:focus {
   color: black;
   text-decoration: none;
   cursor: pointer;
}

</style>
</head>
<body>
<br/>

<div class="title">
<!-- <span class="noto tt">상품평</span> -->
<h3>포토 상품평</h3>
</div>
<div align="right">
<input type="button" value="상품평쓰기" class="grayBtn" id="goWrite" />
</div>
<div align="center">
<span style="font-size: 14px; color: #aaa;">
*상품과 무관하거나 오해의 소지가 있는 내용의 상품평은 통보 없이 삭제될 수 있습니다. 게시물에 대한 상업적/비상업적 권리는 이케요에 귀속됩니다.
</span>
</div>

<br/>
<div id="mainContainer">
<table style="width: 100%;">
<colgroup>
   <col width="20%"/><col width="60%"/><col width="15%"/><col width="5%"/>
</colgroup>

<c:if test="${empty rlist }">
   <tr style="width: 100%; height: 120px; border-top: 1px solid #aaa; text-align: center;">
      <td colspan="4">작성된 글이 없습니다</td>
   </tr>
</c:if>

<c:if test="${not empty rlist }">
   <c:forEach items="${rlist }" var="review" varStatus="vs">
      <tr style="height: 200px; border-top: 1px solid #aaa;">
         <td style="width: 200px; height:200px; padding: 20 50 20 0;">
            <img style="max-width: 200px; max-height: 200px;" src="/img/${review.photo_af }" alt="" />
         </td>
         
         <td style="padding: 45 20 30 0;">         
         
         <c:forEach var="st" begin="1" end="5" step="1">
            <c:choose>
            <c:when test="${review.starpoint ge st}">
               <img src="<%=request.getContextPath() %>/image/star_on.png" style="width: 20px;height: 20px;" />            
            </c:when>
            <c:when test="${review.starpoint lt st}">
               <img src="<%=request.getContextPath() %>/image/star_off.png" style="width: 20px;height: 20px;" />            
            </c:when>            
            </c:choose>
         </c:forEach>
         <br/>
         <span style="margin-top: 30px; margin-bottom: 15px; display: inline-block; font-size: 16px; 
            font-family: 'Noto Sans KR';letter-spacing: -1px;">${review.title }</span>
         <br/>
         <p style="font-size: 16px; font-family: 'Noto Sans KR';letter-spacing: -1px;">${review.content }</p>
         </td>
         <td style="padding: 45px 40px 30px 0px; text-align: right; vertical-align: top; color: #909090;">
            <fmt:formatDate value="${review.wdate }" pattern="yyyy.MM.dd"/>
            <br/>
            <!-- 이름 마지막글자 * 처리 -->
            ${fn:substring((review.id),0,(fn:length(review.id)-1 )) }*
         </td>
         
         <td>
         <c:choose>
            <c:when test="${login.id eq review.id }">
               <button type="button" class="grayBtn" onclick="update(${review.rev_seq})">수정</button>
            </c:when>
            <c:when test="${login.id ne review.id }">
               
            </c:when>
         </c:choose>
         </td>
      </tr>
   </c:forEach>
</c:if>

</table>
<input type="hidden" id="rev_seq" value=""/>
</div>

<!-- The Modal 상품평쓰기 -->
<div id="myModal" class="modal">
 
   <!-- Modal content -->
    <div class="modal-content">
       <span class="close" style="text-align: right;">&times;</span>                                                               
        <jsp:include page="/WEB-INF/views/reviews/reviewWrite.jsp" flush="false"/> 
    </div>
</div>

<!-- The Modal 상품평 수정 -->
<div id="myModal1" class="modal1">
 
   <!-- Modal content -->
    <div class="modal-content1">
       <span class="close1" style="text-align: right;">&times;</span>                                                               
        <jsp:include page="/WEB-INF/views/reviews/reviewUpdate.jsp" flush="false"/> 
    </div>
</div>
<script>

//When the user clicks on the button, open the modal 
$("#goWrite").on("click", function() {
   $(".modal").css("display", "block");
});

//When the user clicks on <span> (x), close the modal
$(".close").click(function() {
   var im;
   $(".modal").css("display", "none");
   $("#title").val("");
   $("#review_content").val("");
   for(i = 1; i <=5; i++){
      im = "#star" + i;
      $(im).attr("src", "<%=request.getContextPath()%>/image/star_off.png");
   }
   $("#fileload").val("");
});


// 수정
function update(rev_seq) {
   //alert(rev_seq);
   $("#rev_seq").val(rev_seq);
   //alert($("#rev_seq").val());
   
   $.ajax({
      url : "getreview.do",
      type : "post",
      data : {
         "rev_seq" : rev_seq
      },
      success : function(data) {
         //alert("success");         
         $("#title1").val(data.title);
         $("#content1").val(data.content);
         $("#starpoint1").val(data.starpoint);
         $("#rev_seq1").val(rev_seq);
         
         var image;
         for(j = 5; j > data.starpoint; j--){
            image = "#st" + j;
            $(image).attr("src", "<%=request.getContextPath()%>/image/star_off.png");
         }
         
         for(i = 1; i <= data.starpoint; i++){
            image = "#st" + i;
            //alert(image);      
            $(image).attr("src", "<%=request.getContextPath()%>/image/star_on.png");
         }
      },
      error : function(r, s, err) {
         alert("error");
      }
   });
   
   $(".modal1").css("display", "block");
   
}

//When the user clicks on <span> (x), close the modal
$(".close1").click(function() {
   var im;
   $(".modal1").css("display", "none");
   $("#title").val("");
   $("#content1").val("");
   for(i = 1; i <=5; i++){
      im = "#st" + i;
      $(im).attr("src", "<%=request.getContextPath()%>/image/star_off.png");
   }
   $("#fileload1").val("");
});

</script>




</body>
</html>