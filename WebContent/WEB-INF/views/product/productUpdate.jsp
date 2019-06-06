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
<title>productUpdate</title>
</head>
<body>

<div id="pro_container">
<div align="center" style="padding: 60px 60px 35px 60px;">
<h3>상품 수정</h3>
<hr/>

<div id="pro_up_container" align="left">
<form action="productupdate.do" id="pro_frm_update" method="post" enctype="multipart/form-data">
<input type="hidden" name="model_id" value="${pdto.model_id }"/>
<input type="hidden" name="prod_seq" value="${pdto.prod_seq }"/>
<span class="noto f13">상품명</span>
<br/>
<input type="text" name="p_name" value="${pdto.p_name }"/>
<br/>
<span class="noto f13">내용을 입력해 주세요</span>
<br/>
<textarea rows="10" cols="50" name="content" style="max-width: 338px; resize: none;"
>${pdto.content }
</textarea>
<br/>
<span class="noto f13">메뉴얼</span>
<input type="file" name="pdf_bs" id="" />
<br/>
<span class="noto f13">사진등록1</span>
<input type="file" name="photo_bs1" id="" />
<br/>
<span class="noto f13">사진등록2</span>
<input type="file" name="photo_bs2" id="" />
<br/>
<span class="noto f13">사진등록3</span>
<input type="file" name="photo_bs3" id="" />
<br/><br/>
<div align="center">
	<input type="submit" value="수정 완료" class="redBtn" />
</div>

</form>


</div>

</div>
</div>


</body>
</html>