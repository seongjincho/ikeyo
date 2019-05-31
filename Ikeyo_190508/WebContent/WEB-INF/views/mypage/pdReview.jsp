<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>


<link rel="stylesheet" href="${pageContext.request.contextPath }/css/_common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/mypage_main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pdReview.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- modal ui -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<div id="mypage_review" class="mypage_body">
	<div id="update_photo_layer" class="modal insert_modal">
		<div class="modal-content">
			<span class="close">
				<img src="image/option_delete.png" alt="x">
			</span>
			<div class="noto tt">포토 상품평</div>
			<br>
			<div class="product_div"></div>
			<form name="update_photo_review_frm" id="_frmForm" autocomplete="off" action="" method="post" enctype="multipart/form-data">
			<c:forEach var="i" items="${review }">
				<input type="hidden" name="rev_seq" value="${i.rev_seq }">
				<input type="hidden" name="id" value="${login.id }">
				<input type="hidden" name="model_id" value="${i.model_id }">
				<input type="hidden" name="starpoint" id="strp" value="${i.starpoint }">
				<div class="insert_div">
					<span class="lb noto f13">제목</span>
					<br>
					<input type="text" name="title" class="inputText" id="title1" value="${i.title }">
					<br>
					<span class="lb noto f13">내용을 작성해주세요</span>
					<br>
					<textarea class="inputText" name="content" id="content1">${i.content }</textarea>
					<br>
					<span class="lb noto f13 lb_side" id="scoreLable">만족도</span>
						<c:forEach var="st" begin="1" end="5" step="1">
							<c:choose>
								<c:when test="${i.starpoint ge st }">
									<img src="<%=request.getContextPath() %>/image/star_on.png" class="starPoint" style="width: 20px;height: 20px;" />
								</c:when>
								<c:when test="${i.starpoint lt st }">
									<img src="<%=request.getContextPath() %>/image/star_off.png" class="starPoint" style="width: 20px;height: 20px;" />
								</c:when>
							</c:choose>
						</c:forEach>
					<br><br>
					<span class="lb noto f13 lb_side">파일첨부</span>
					<input type="text" class="inputText searchFileName" name="fileload" id="fileload1" readonly="readonly">
					<label for="sf2">
						<span class="searchBtn noto f15">찾아보기</span>
						<input type="file" class="searchFile" id="sf2" name="fileload" id="fileload1">
					</label>
					<br>
					<div style="text-align: center;">
						<br>
						<input type="button" value="수정완료" class="f16 redBtn noto" id="updatePhoto"><!-- onclick="updatePhotoReview()" -->
					</div>
				</div>
				</c:forEach>
			</form>
		</div>
	</div>
	<div id="contents">
		<div id="mypage_lnb"></div>
		<div class="right_contents">
			<span class="title noto">상품평 관리</span>
			<br><br><br>
			<div style="margin: 0px auto 40px;">
				<span class="noto f14" style="color: #aaa; line-height: 1.5;">
					*상품과 무관하거나 오해의 소지가 있는 내용의 상품평은 통보 없이 삭제될 수 있습니다.
					<br>
					게시물에 대한 상업적/비상업적 권리는 ikeyo에 귀속됩니다.
				</span>
			</div>
			<table id="review_table">
				<tbody>
					<tr>
						<td class="noto f13" colspan="4">상품정보</td>
					</tr>
					<c:if test="${empty review }">
						<tr>
							<td>조회 결과가 없습니다.</td>
						</tr>
					</c:if>
					
					<c:if test="${not empty review }">
						<input type="hidden" name="id" value="${login.id }">
						<c:forEach var="i" items="${review }">
							<input type="hidden" name="model_id" value="${i.model_id }">
							<c:if test="${i.del eq 0 }">
								<tr>
									<c:if test="${i.photo_af ne null }">
										<td width="150px">
											<img src="/img/${i.photo_af }" class="revImg">
										</td>
									</c:if>
									<td class="w40"></td>
									<td class="noto f16 productTd">
										<c:forEach var="j" items="${product }">
											<span class="prodName noto f16">${j.p_name }</span>
										</c:forEach>
										<br><br><br>
										<c:forEach var="st" begin="1" end="5" step="1">
											<c:choose>
												<c:when test="${i.starpoint ge st }">
													<img src="<%=request.getContextPath() %>/image/star_on.png" class="score" style="width: 20px;height: 20px;" />
												</c:when>
												<c:when test="${i.starpoint lt st }">
													<img src="<%=request.getContextPath() %>/image/star_off.png" class="score" style="width: 20px;height: 20px;" />
												</c:when>
											</c:choose>
										</c:forEach>
										<br>
										<span class="review_title noto f16">${i.title }</span>
										<br>
										<p class="review_contents noto f14">${i.content }</p>
									</td>
									<td width="110px" class="noto f13">
										<span class="f14 noto" style="margin-bottom: 16px; display: inline-block;">
											<fmt:formatDate value="${i.wdate }" pattern="yyyy.MM.dd"/>
										</span>
										<br>
										<input type="button" value="수정" class="grayBtn updateBtn" data-product-cd="${i.model_id }">
										<br>
										<input type="button" value="삭제" class="grayBtn deleteBtn">
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<!-- <div id="cnt_list" class="list_cnt">
				<ul class="list_cnt_ul">
					<li class="selected">1</li>
				</ul>
			</div> -->
			<jsp:include page="/WEB-INF/views/product/paging.jsp" flush="false">
				<jsp:param value="${pageNumber }" name="pageNumber"/>
				<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>	
				<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
				<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
			</jsp:include>
		</div>
	</div>
</div>

<script>
var score = 0;

$(function(){
	$(".updateBtn").click(function(){
		$("#update_photo_layer").modal("show");
	});
	
	$(".modal .close").click(function(){
		/* $(this).parent().parent().fadeOut(); */
		$("#update_photo_layer").modal("hide");
	});
	
	$("#update_photo_layer .insert_div .starPoint").each(function(idx){
		$(this).on("click", function(){
			score = idx + 1;
			$(this).attr('src', '<%=request.getContextPath() %>/image/star_off.png');
			$(this).siblings().attr('src', '<%=request.getContextPath() %>/image/star_off.png');
			$(this).attr('src', '<%=request.getContextPath() %>/image/star_on.png');
			$(this).prevAll().attr('src', '<%=request.getContextPath() %>/image/star_on.png');
			$("#strp").val(score);
		});
	});
	
	$("#update_photo_layer .insert_div .searchFile").change(function(){
		// img File만 가능
		$("#update_photo_layer .insert_div .searchFileName").val($(this).val().slice(12, $(this).val().length));
	});
});

$("#updatePhoto").click(function(){
	if($("#title1").val().trim() == ""){
		alert("제목을 입력하세요");
	}else if($("#content1").val().trim() == ""){
		alert("내용을 입력하세요");
	}else if($("#fileload1").val() == ""){
		alert("파일을 넣어주세요");
	} else {
		alert("상품평을 수정했습니다.");
		$("#_frmForm").attr("action", "reviewUpdateMy.do").submit();	
	}
});

$(".deleteBtn").click(function(){
	if(confirm("선택한 상품평을 삭제하시겠습니까?\n(삭제 시, 상품평 재작성은 불가능합니다.)") == true){
		alert("상품평을 삭제했습니다.");
		$("#_frmForm").attr("action", "reviewDeleteMy.do").submit();
	} else{
		return false;
	}	
});
</script>