<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<div id="q_container">
<div align="center" style="padding: 60px 60px 35px 60px;">
<h3>상품 Q&amp;A</h3>
<br/>
<hr/>

<div id="frm_container2" align="left">

<form id="_frmForm3" method="post">
<span class="noto f13">제목</span>
<br/>
<input type="text" name="title" id="title2"/>
<br/>
<span class="noto f13">내용을 입력해 주세요</span>
<br/>
<textarea rows="10" cols="50" name="content" id="content2" style="max-width: 288px; resize: none;"
>
</textarea>
<br/><br/>
<input type="hidden" name="model_id" value="${pdto.model_id }" />
<input type="hidden" name="id" value="${login.id }" />
<input type="hidden" name="parent" value="${pdto.prod_seq }" />

<br/>
<br/>
<div align="center">
	<input type="button" value="작성 완료" class="redBtn" onclick="qnaWrite()" />
</div>

</form>

</div>
</div>

</div>
<script>
function qnaWrite() {
	
	if($("#title2").val().trim() == ""){
		alert("제목을 입력하세요");
		$("#title2").focus();
	}else if($("#content2").val().trim() == ""){
		alert("내용을 입력하세요");
		$("#content2").focus();
	}else if(${login.id eq null}){
		alert("로그인을 해야 작성할 수 있습니다.");
	}else{
		$("#_frmForm3").attr("action", "qnaWrite.do").submit();
	}
}


</script>
</body>
</html>