<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>
<br/>

<h3>제품 정보</h3>
<br/>

<pre>
${pdto.content }
</pre>
<br/>

<h4>다운로드</h4>
<font style="font-size: 14px;">최신 버전의 문서만 다운로드할 수 있습니다. 제품에 포함된 문서와 내용이 다를 수 있습니다.</font>
<br/><br/>
<b>PDF 파일 : </b> <a href="#none" onclick="filedowns('${pdto.pdf_af}', '${pdto.model_id }')">${pdto.pdf_bf }</a>

<!-- 다운로드 버튼 클릭시  -->
<form name="file_Down" action="productfileDownload.do" method="post">
	<input type="hidden" name="pdf_af" />
	<input type="hidden" name="model_id" />
</form>
<script>
function filedowns(pdf_af, model_id) {
	var doc = document.file_Down;	// name으로 접근하는 방법!
	doc.pdf_af.value = pdf_af;
	doc.model_id.value = model_id;
	doc.submit();	
}

</script>

</body>
</html>