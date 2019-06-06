<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>


<link rel="stylesheet" href="${pageContext.request.contextPath }/css/p_review_up_wr.css">

<div id="r_container">
<div align="center" style="padding: 60px 60px 35px 60px;">
<h3>포토 상품평</h3>
<br/>
<hr/>

<div id="frm_container" align="left">

<form id="_frmForm1" method="post" enctype="multipart/form-data">
<span class="noto f13">제목</span>
<br/>
<input type="text" name="title" id="title"/>
<br/>
<span class="noto f13">내용을 입력해 주세요</span>
<br/>
<textarea rows="10" cols="50" name="content" id="review_content" style="max-width: 338px; resize: none;"
>
</textarea>
<br/>
<span class="noto f13">만족도</span>
<img id="star1" src="<%=request.getContextPath() %>/image/star_off.png" alt="" onclick="mark(1)" />
<img id="star2" src="<%=request.getContextPath() %>/image/star_off.png" alt="" onclick="mark(2)"/>
<img id="star3" src="<%=request.getContextPath() %>/image/star_off.png" alt="" onclick="mark(3)"/>
<img id="star4" src="<%=request.getContextPath() %>/image/star_off.png" alt="" onclick="mark(4)"/>
<img id="star5" src="<%=request.getContextPath() %>/image/star_off.png" alt="" onclick="mark(5)"/>
<br/><br/>
<input type="hidden" name="model_id" value="${pdto.model_id }" />
<input type="hidden" name="id" value="${login.id }" />
<input type="hidden" name="parent" value="${pdto.prod_seq }" />
<input type="hidden" name="starpoint" id="starpoint" value="" />
<!-- <span class="noto f13">파일첨부</span>
<input type="file" name="fileload" id="fileload" /> -->
<span class="lb noto f13 lb_side">파일첨부</span>
   <input type="text" class="inputText searchFileName" name="fileload" id="fileload2" readonly="readonly">
   <label for="sf2">
      <span class="searchBtn noto f15">찾아보기</span>
      <input type="file" class="searchFile" id="sf2" name="fileload">
   </label>
<br/>
<br/>
<br/>
<div align="center">
   <input type="button" value="작성 완료" onclick="goWrite()" class="redBtn"/>
</div>

</form>

</div>
</div>

</div>
<script>
function mark(st) {
   var image;
   // alert(st);
   $("#starpoint").val(st);   
   for(j = 5; j > st; j--){
      image = "#star" + j;
      $(image).attr("src", "<%=request.getContextPath()%>/image/star_off.png");
   }
   
   for(i = 1; i <= st; i++){
      image = "#star" + i;
      //alert(image);      
      $(image).attr("src", "<%=request.getContextPath()%>/image/star_on.png");
   }
}

function goWrite() {
   
   if($("#title").val().trim() == ""){
      alert("제목을 입력하세요");
      $("#title").focus();
   }else if($("#review_content").val().trim() == ""){
      alert("내용을 입력하세요");
      $("#review_content").focus();
   }else if($("#starpoint").val() == ""){
      alert("만족도를 설정해 주세요");
   }else if($("#fileload2").val() == ""){
      alert("사진을 넣어주세요");
   }else if(${login.id eq null}){
      alert("로그인을 해야 작성할 수 있습니다.");
   }else{
      $("#_frmForm1").attr("action", "reviewWriteAf.do").submit();
   }
}

</script>