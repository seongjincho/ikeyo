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
<title>reviewWrite</title>
<style type="text/css">
.noto { font-family: 'Noto Sans KR'; letter-spacing: -1px;}
.f13 {
	font-size:13px;	/* 10pt */
	margin-bottom: 5px; 
}
</style>
</head>
<body>

<div id="r_u_container">
<div align="center" style="padding: 60px 60px 35px 60px;">
<h3>포토 상품평 수정</h3>
<br/>
<hr/>

<div id="up_frm_container" align="left">

<form id="_frmForm2" method="post" enctype="multipart/form-data">
<span class="noto f13">제목</span>
<br/>
<input type="text" name="title" id="title1" value=""/>
<br/>
<span class="noto f13">내용을 입력해 주세요</span>
<br/>
<textarea rows="10" cols="50" name="content" id="content1" style="max-width: 338px;"
>
</textarea>
<br/>
<span class="noto f13">만족도</span>			
<img id="st1" src="<%=request.getContextPath() %>/image/star_off.png" alt="" onclick="mark1(1)" />
<img id="st2" src="<%=request.getContextPath() %>/image/star_off.png" alt="" onclick="mark1(2)"/>
<img id="st3" src="<%=request.getContextPath() %>/image/star_off.png" alt="" onclick="mark1(3)"/>
<img id="st4" src="<%=request.getContextPath() %>/image/star_off.png" alt="" onclick="mark1(4)"/>
<img id="st5" src="<%=request.getContextPath() %>/image/star_off.png" alt="" onclick="mark1(5)"/>
<br/><br/>
<input type="hidden" name="model_id" value="${pdto.model_id }" />
<input type="hidden" name="id" value="${login.id }" />
<input type="hidden" name="parent" value="${pdto.prod_seq }" />
<input type="hidden" name="starpoint" id="starpoint1" value="" />
<input type="hidden" name="rev_seq" id="rev_seq1" value=""/>
<span class="noto f13">파일첨부</span>
<input type="file" name="fileload" id="fileload1" />
<br/>
<br/>
<br/>
<div align="center">
	<input type="button" value="작성 완료" onclick="goUpdate()" />
</div>

</form>

</div>
</div>

</div>
<script>
function mark1(st) {
	var image;
	// alert(st);
	$("#starpoint1").val(st);	
	for(j = 5; j > st; j--){
		image = "#st" + j;
		$(image).attr("src", "<%=request.getContextPath()%>/image/star_off.png");
	}
	
	for(i = 1; i <= st; i++){
		image = "#st" + i;
		//alert(image);		
		$(image).attr("src", "<%=request.getContextPath()%>/image/star_on.png");
	}
}

function goUpdate() {
	
	if($("#title1").val().trim() == ""){
		alert("제목을 입력하세요");
	}else if($("#content1").val().trim() == ""){
		alert("내용을 입력하세요");
	}else if($("#fileload1").val() == ""){
		alert("파일을 넣어주세요");
	}else{
		$("#_frmForm2").attr("action", "reviewUpdate.do").submit();
	}
	
}

</script>
</body>
</html>