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

<div class="headtitle">
	<p>공지사항</p>
</div>


<!-- arrow생성 -->
<jsp:useBean id="ubbs" class="kh.com.a.util.BbsArrow"/>

<table class="noti">

<thead>
	<tr class="noto">
		<th width="10%">순서</th>
		<th width="50%">제목</th>
		<th width="10%">작성자</th>
		<th width="15%">조회수</th>
		<th width="15%">등록일</th>
	</tr>
</thead>
<tbody>
	<c:if test="${empty noticelist }">
		<tr>
			<td colspan="5">작성된 글이 없습니다</td>
		</tr>
	</c:if>
	
	<c:forEach items="${noticelist }" var="bbs" varStatus="vs">
	<%-- <jsp:setProperty property="depth" name="ubbs" value="${bbs.depth }"/> --%>
	
	<tr class="_hover_tr">
		<td>${vs.count }</td>
		<td style="text-align: left; padding-left: 15px;">	
			<a href="#none" onclick="titleclick(${vs.index})">
				${bbs.title }
			</a>
		</td>
		<td>${bbs.id }</td>
		<td>
			<font id="read${vs.index }">${bbs.readcount }</font>
			<input type="hidden" id="seq${vs.index }" value="${bbs.noti_seq }">
		</td>
		<td><fmt:formatDate value="${bbs.rdate }" 
     			 pattern="yyyy/MM/dd"/>
      	</td>
	</tr>
	<tr id="content${vs.index }" class="content" style="display:none;">
		<td colspan="5">
			<div id="slide${vs.index }" class="slide" style="padding: 10% 10% 10% 10%; text-align:left;">
				<pre><font size="3px">${bbs.content }</font></pre>
				<c:if test="${login.auth == 1 }">
					<div>
						<button id="updateBtn" onclick="location.href='noticeUpdate.do?seq=${bbs.noti_seq }'">수정</button>
						<button id="deleteBtn" onclick="location.href='noticeDelete.do?seq=${bbs.noti_seq }'">삭제</button>
					</div>
				</c:if>
			</div>
		</td>
	</tr>
	</c:forEach>
</tbody>
</table>

<!-- 페이징 처리 -->
<div id="paging_wrap">
	<jsp:include page="/WEB-INF/views/notice/paging.jsp" flush="false">
		<jsp:param value="${pageNumber }" name="pageNumber"/>
		<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
		<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
		<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
	</jsp:include>
</div>


<div style="margin-top: 5px; margin-bottom: 10px;">

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
				<!-- <option value="writer">작성자</option> -->
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


<div id="buttons_wrap">
	<span>
		<button type="button" id="_btnAdd">글쓰기</button>
	</span>
</div>


<script type="text/javascript">
function titleclick(seq) {
	
	var status = $("#content" + seq).css("display");
	
	if(status == "none"){
		
		for(i = 0; i < 10; i++){
			// if(i == seq)break;
			$("#content" + i).css("display", "none");
		}
		
		$("#content" + seq).css("display", "");
		
		$.ajax({
			url:"noticeRead.do",
			type:"get",
			data:"seq=" + $("#seq" + seq).val(),
			// data:{ id:$("#fid").val() },
			success:function(data){
			//	alert("success");
			//	alert(data);
				$("#read" + seq).text(data);
			},
			error:function(r,s,err){
				alert("error");
			}
		});
		
	}else{
		$("#content" + seq).css("display", "none");
	}
	
}
</script>

<script type="text/javascript">

function goPage(pageNumber) {
	
	$("#_pageNumber").val(pageNumber);
	$("#_frmFormSearch").attr("action", "noticelist.do").submit();
	
}


$("#_btnAdd").click(function () {
	
	location.href="noticewrite.do";
	
});


$("#_btnSearch").click(function(){
//	alert("_btnSearch");
	$("#_pageNumber").val("0");
	$("#_frmFormSearch").attr("action","noticelist.do").submit();
});

/*
$("#_btnSearch").on("click", function () {
	
});
$(document).on("#_btnSearch", "click", function () {
	
});
*/
</script>

