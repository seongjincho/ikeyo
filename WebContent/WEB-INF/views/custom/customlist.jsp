<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!-- content.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/content.css">


<style>
.headtitle p {
    margin-bottom: 70px;
    padding-top: 130px;
    text-align: center;
    font-size: 40px;
    font-weight: 700;
    font-family: 'NanumBarunGothic', 'Nanum Gothic', '돋움', Dotum, sans-serif;
}

table.noti {
    width: 80%;
    border-collapse: collapse;
    display: table;
    border-spacing: 2px;
    border-color: grey;
}

.noti tbody tr{
   text-align: center;
}

.noti tbody tr td{
   border-bottom: 1px solid #f0f0f0;
    height: 70px;
    font-size: 15px;
    cursor: pointer;
}

.noto th {
    font-family: 'Noto Sans KR';
    letter-spacing: -1px;
    border-top: 1px #aaa solid;
    border-bottom: 1px solid #f0f0f0;
    height: 45px;
    font-size: 17px;
    text-align: center;
}


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
   width: 500px;  /* Could be more or less, depending on screen size */
   position: relative;
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

.btnwrite{
    margin-top: 10px;
    margin-bottom: 15px;
    margin-left: auto;
    margin-right: auto;
    width: 100px;
    height: 40px;
    font-size: 16px;
    border: none;
    background-color: #0051ba;
    color: #FFF;
}

.btnsearch{
   margin-top: 15px;
    margin-bottom: 15px;
    margin-left: auto;
    margin-right: auto;
    width: 70px;
    height: 30px;
    font-size: 16px;
    border: 1px solid #000;
    background-color: #f0f0f0;
    color: black;
}

button{
   cursor: pointer;
}
</style>

<%
String category = (String)request.getAttribute("s_category");
if(category == null) category = "";
String keyword = (String)request.getAttribute("s_keyword");
if(keyword == null) keyword = "";
%>


<script>
var category = "<%=category %>";
var keyword = "<%=keyword %>";
$(document).ready(function(){
   $("#_s_category").val( category );
   
   document.frmForm1.s_keyword.value = keyword;
});
</script>


<div class="f_content" style="margin-bottom: 70%;">
<div class="f2_content" style="background-color: white;">

<div class="headtitle" align="center"><br><br>
   <!-- <p style="color: black;">고객의 소리</p> -->
   <h2>고객의 소리</h2><br>
</div>



<!-- arrow생성 -->
<jsp:useBean id="ubbs" class="kh.com.a.util.BbsArrow"/>

<div align="center">
<table class="noti">
<thead>
   <tr class="noto">
      <th>순서</th>
      <th>상품정보</th>
      <th>제목</th>
      <th>작성자</th>
      <th>조회수</th>
      <th>작성일</th>
   </tr>
</thead>
<tbody>
   <c:if test="${empty customlist }">
      <tr>
         <td colspan="6">작성된 글이 없습니다</td>
      </tr>
   </c:if>
   
   <c:set var="tmp" value=""/>
   <c:forEach items="${customlist }" var="cust" varStatus="vs">
   <jsp:setProperty property="depth" name="ubbs" value="${cust.depth }"/>
   
   <tr class="_hover_tr">
      <td>${vs.count }</td>
      <c:choose>
         <c:when test="${cust.del eq 1 }">
            <td></td>
            <td colspan="5" style="text-align: left; padding-left: 15px;">
               <font color="#ff0000">이 글은 삭제되었습니다.</font>
            </td>
         </c:when>
         
         <c:when test="${login.id ne cust.id && cust.lock_ eq 1}">
            <td></td>
            <td style="text-align: left; padding-left: 15px;">
               <img alt="" src="./image/lock_.png" width="25px">
               <c:choose>
                  <c:when test="${login.auth eq 1 || cust.ref eq tmp}">
                     <a href="#none" onclick="titleclick(${cust.cust_seq })">
                        <jsp:getProperty property="arrow" name="ubbs"/>
                        ${cust.title }
                     </a>
                  </c:when>
                  
                  <c:otherwise>
                      비공개 글입니다.
                  </c:otherwise>
               </c:choose>
            </td>
            <td>${cust.id }</td>
            <td>
               <p id="read${vs.index }">${cust.readcount }</p>
               <input type="hidden" id="seq${vs.index }" value="${cust.cust_seq }">
            </td>
            <td>
               <fmt:formatDate value="${cust.wdate }" pattern="yyyy/MM/dd"/>
            </td>
         </c:when>
         
         <c:otherwise>
            <td style="width: 80px; height:80px;">
               <c:if test="${not empty cust.filename && cust.filename ne '' }">
                  <img alt="" src="/img/${cust.filename }" style="width: 80px;">
               </c:if>
            </td>
            <td style="text-align: left; padding-left: 15px;">
               <c:if test="${cust.lock_ eq 1 }">
                  <img alt="" src="./image/lock_.png" width="25px">
                  <c:set var="tmp" value="${cust.ref }"/>
               </c:if>
               <a href="#none" onclick="titleclick(${cust.cust_seq })">
                  <jsp:getProperty property="arrow" name="ubbs"/>
                  ${cust.title }
               </a>
            </td>
            <td>${cust.id }</td>
            <td>
               <p id="read${vs.index }">${cust.readcount }</p>
               <input type="hidden" id="seq${vs.index }" value="${cust.cust_seq }">
            </td>
            <td>
               <fmt:formatDate value="${cust.wdate }" pattern="yyyy/MM/dd"/>
            </td>
         </c:otherwise>
      </c:choose>
   </tr>
   </c:forEach>
   <c:if test="${not empty login }">
      <tr>
         <td colspan="6" style="border: 1px solid #fff">
            <div align="center">
               <span>
                  <br>
                  <button type="button" class="btnwrite" style="border-color: #0051ba;" id="_btnAdd">글쓰기</button>
               </span>
            </div>
         </td>
      </tr>
   </c:if>
</tbody>
</table>


<form id="frmDetail" action="customdetail.do" method="post">
   <input type="hidden" id="hid" name="seq">
</form>

<br><br>
<!-- 페이징 처리 -->
<div id="paging_wrap">
   <jsp:include page="/WEB-INF/views/notice/paging.jsp" flush="false">
      <jsp:param value="${pageNumber }" name="pageNumber"/>
      <jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
      <jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
      <jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
   </jsp:include>
</div>


<div style="margin-top: 5%; margin-bottom: 10px;">

<form action="" name="frmForm1" id="_frmFormSearch" method="post">

<table style="margin-left: auto; margin-right: auto;
      margin-top:   3px; margin-bottom: 3px;">

   <tr>
   <td>검색:&nbsp;&nbsp;</td>
   <td style="padding-left:5px;">
      <select id="_s_category" name="s_category">
         <option value="" selected="selected">선택</option>
         <option value="title">제목</option>
         <option value="contents">내용</option>
         <option value="writer">작성자</option>
      </select>
   </td>
   <td style="padding-left: 5px;">
      <input type="text" id="_s_keyword" name="s_keyword">
   </td>
   <td style="padding-left: 5px;">
      <span class="button blue">
         <button type="button" id="_btnSearch" class="btnsearch">검색</button>
      </span>
   </td>
</tr>
</table>

<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber }">

<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage }">

</form>
</div>

</div>

<div id="myModal" class="modal">
   <!-- Modal content -->
    <div class="modal-content">
       <span class="close" style="text-align: right;">&times;</span>                                                               
        <jsp:include page="/WEB-INF/views/custom/customwrite.jsp" flush="false"/> 
    </div>
</div>




</div>
</div>



<script>
//When the user clicks on the button, open the modal 
$("#_btnAdd").on("click", function() {
   $(".modal").css("display", "block");
});

//When the user clicks on <span> (x), close the modal
$(".close").click(function() {
   var im;
   $(".modal").css("display", "none");
   $("#title").val("");
   $("#content").val("");
   $("#lock_").prop('checked',false);
   $("#fileload").val("");
});
</script>



<script type="text/javascript">
function titleclick(seq) {
   $("#hid").val(seq);
   $("#frmDetail").submit();
}
</script>


<script type="text/javascript">
function goPage(pageNumber) {
   $("#_pageNumber").val(pageNumber);
   $("#_frmFormSearch").attr("action", "customlist.do").submit();
}

/*
$("#_btnAdd").click(function () {
   location.href="customwrite.do";
});
*/

$("#_btnSearch").click(function(){
//   alert("_btnSearch");
   $("#_pageNumber").val("0");
   $("#_frmFormSearch").attr("action","customlist.do").submit();
});
</script>