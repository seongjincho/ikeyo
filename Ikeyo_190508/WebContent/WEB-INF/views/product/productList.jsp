<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
.uul{
	display: block;
	/* list-style-type: disc; */
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
	
	margin: 0;
	padding: 0;
	list-style: none;
}
.text {
	float: left;
	
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.text span:nth-child(3) {
	font-size: 14px;
	color: #c80a1e;
	display: inline-block;
	padding-top: 5px;
}

.icon {
	float: right;
	overflow: hidden;
	height: 16px;
	margin-top: 14px;
	cursor: pointer;
}

.exist img {
	margin-top: -14px !important;
}

.empty img {
	margin-top: 2px !important;
}

.container_2 {
	max-width: 1410px;
	min-width: 1200px;
	margin-left: auto;
	margin-right: auto;
}

.list_all {
	min-height: 1000px;
	padding-top: 30px;
	margin: 0 20px 0 20px;
}
.list_all .image img {
	width: 100%;
	cursor: pointer;
}
.lii {
	margin: 0;
	padding: 0;
	list-style: none;
	
	
}

.lii:nth-child(-n+3) {
	width: 23.62%;
	display: inline-block;
	margin: 0 1.4% 40px 0px;
}
.lii:nth-child(4) {
	width: 23.62%;
	display: inline-block;
	margin: 0 0 40px 0px;
}
.lii p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}
</style>
<!-- 
<style>
* {
	margin: 0px;
	padding: 0px;
	letter-spacing: -1.5px;
}

div {
	margin: 0;
	padding: 0;
	display: block;
}

ul {
	display: block;
	/* list-style-type: disc; */
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

.container_2 {
	max-width: 1410px;
	min-width: 1200px;
	margin-left: auto;
	margin-right: auto;
}

.list_all {
	min-height: 1000px;
	padding-top: 30px;
	margin: 0 20px 0 20px;
}

li:nth-child(-n+3) {
	width: 23.62%;
	display: inline-block;
	margin: 0 1.4% 40px 0px;
}
li:nth-child(4) {
	width: 23.62%;
	display: inline-block;
	margin: 0 0 40px 0px;
}
ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
}

p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.list_all .image img {
	width: 100%;
	cursor: pointer;
}

img {
	border-style: none;
}

.text {
	float: left;
}

.text span:nth-child(3) {
	font-size: 14px;
	color: #c80a1e;
	display: inline-block;
	padding-top: 5px;
}

.icon {
	float: right;
	overflow: hidden;
	height: 16px;
	margin-top: 14px;
	cursor: pointer;
}

.exist img {
	margin-top: -14px !important;
}

.empty img {
	margin-top: 2px !important;
}
</style>
-->

<form action="" name="frmForm1" id="_frmFormSearch" method="get">
<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber }">
<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?8:recordCountPerPage }">
<input type="hidden" name="category" value="${category }">
</form>

<div id="product_list" style="margin-top: 5%;">
	<div class="container_2">
		<div class="list_all">
			<form action="productAdd.do" method="post">
				<div style="margin: 0;padding: 0;display: block;">
					<c:if test="${empty productList }">
						<ul class="uul">
							<li>목록이 없습니다</li>
						</ul>
					</c:if>
					
					<c:if test="${not empty productList }">
						<input type="hidden" id="_id" value="${login.id }">
						<ul class="uul">
							<c:forEach var="i" items="${productList }" varStatus="vs">
								<c:if test="${vs.index % 4 eq 0 }">
									</ul>
									<ul class="uul">
								</c:if>
								<li data-product-cd="${i.model_id }" class="lii">												
									<p class="image">
										<a href="productDetail.do?model_id=${i.model_id }"><img src="/img/${i.photo_af1 }"></a> 
									</p>
									<p class="text">
										<span>${i.p_name }</span> <br>
										<span><fmt:formatNumber value="${i.price }" pattern="#,###"/>&nbsp;원</span>
									</p>
									<c:if test="${empty cartList }">
										<p class="icon wish_icon empty">
											<img src="image/icon_wish.svg">
										</p>
									</c:if>									
									<c:if test="${!empty cartList }">
									<c:set var="loop_flag" value="false"/>									
										<c:forEach var="j" items="${cartList }">																			
											<c:if test="${i.model_id eq j.model_id && login.id eq j.id }">
												<c:set var="loop_flag" value="true"/>
											</c:if>																
										</c:forEach>
										<c:if test="${loop_flag eq true }">
											<p class="icon wish_icon exist">									
												<img src="image/icon_wish.svg">		
											</p>
										</c:if>
										<c:if test="${loop_flag eq false }">
											<p class="icon wish_icon empty">
												<img src="image/icon_wish.svg">		
											</p>
										</c:if>
									</c:if>						
									<label class="wishCnt" style="float: right; margin-top: 15px; margin-right: 4px; font-size: 12px; display: block;">										
										<c:if test="${i.likecount ne 0 }">
											${i.likecount }	
										</c:if>								
									</label>										
								</li>
							</c:forEach>
						</ul>
					</c:if>
					<c:if test="${login.auth eq 1 }">
					<span style="margin: auto;">
						<input type="submit" value="글쓰기">
					</span>
					</c:if>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/product/paging.jsp" flush="false">
			<jsp:param value="${pageNumber }" name="pageNumber"/>
			<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>	
			<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
			<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
	</jsp:include>
</div>

<script>
$(document).on("click", "#product_list .wish_icon", function(event){
	var id = $('#_id').val();
	
	if(id == null || id == "") {
		alert("로그인 후 이용 가능합니다.");
		return false;
	}
	
	var model_id = $(this).parent().attr('data-product-cd');
	
	$.ajax({
		url: "updateWish.do",
		cache: false,
		method: "post",
		dataType: "json",
		data: {"model_id" : model_id, "id" : id},
		success:function(data){
			console.log(data.result);
			console.log(data.isExist);
			console.log(data.wishCnt);
			
			if(data.result == "SUCCESS"){
				if(data.isExist == true) {
					alert("위시리스트에 등록되었습니다.");
					$(event.target).parent().addClass('exist');
					$(event.target).parent().removeClass('empty');	
				} else {
					alert("위시리스트에서 삭제되었습니다.");
					$(event.target).parent().addClass('empty');
					$(event.target).parent().removeClass('exist');
				}
				
				if(data.wishCnt == 0) {
					$(event.target).parent().parent().find('.wishCnt').css("display", "none");
				} else {
					$(event.target).parent().parent().find('.wishCnt').css("display", "block");
					$(event.target).parent().parent().find('.wishCnt').text(data.wishCnt);
				}
			}
		},
		error:function(xhr, textStatus, err){
			console.log("ajax 에러가 발생했습니다.: " + xhr.responseText);
			console.log("textStatus: " + textStatus);
			console.log("error: " + error);
		}
	});
});

function goPage(pageNumber) {
	
	$("#_pageNumber").val(pageNumber);
	$('#_frmFormSearch').attr("action", "productList.do").submit();
}
</script>