<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<style>
.headtitle p {
    font-size: 35px;
    margin-bottom: 50px;
    padding-top: 80px;
}

table.noti {
    width: 70%;
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
    /* cursor: pointer; */
}

.noto th {
    font-family: 'Noto Sans KR';
    letter-spacing: -1px;
    border-top: 1px #aaa solid;
    border-bottom: 1px solid #f0f0f0;
    height: 25px;
    font-size: 13px;
    color: #aaa;
    text-align: center;
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



<!-- arrow생성 -->
<jsp:useBean id="ubbs" class="kh.com.a.util.BbsArrow"/>

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
</tbody>
</table>


<form id="frmDetail" action="customdetail.do" method="post">
	<input type="hidden" id="hid" name="seq">
</form>
<c:if test="${not empty login }">
	<div align="center">
		<span>
			<button type="button" id="_btnAdd">글쓰기</button>
		</span>
	</div>
</c:if>
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
		margin-top:	3px; margin-bottom: 3px;">

	<tr>
	<td>검색:</td>
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
			<button type="button" id="_btnSearch">검색</button>
		</span>
	</td>
</tr>
</table>

<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber }">

<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage }">

</form>
</div>


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


$("#_btnAdd").click(function () {
	location.href="customwrite.do";
});


$("#_btnSearch").click(function(){
//	alert("_btnSearch");
	$("#_pageNumber").val("0");
	$("#_frmFormSearch").attr("action","customlist.do").submit();
});
</script>













