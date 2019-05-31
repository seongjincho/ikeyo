<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/> 

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/ikeyo_v1-front.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/_common.css">
<scirpt src="http://code.jquery.com/jquery-3.3.1.min.js"></scirpt>

<div id="qna">
	<div class="container_c">
		<div class="title">
			상품 Q&A
		</div>
		<br><br><br>
		<div class="bodyy">
			<div>
				<table class="listTbl">
					<c:if test="${not empty qna }">
						<tbody>
							<tr class="noto">
								<td style="width: 50px">번호</td>
								<td style="width: 190px"></td>
								<td style="width: 280px">문의내용</td>
								<td>작성일</td>
								<td>처리상태</td>
							</tr>
							<c:forEach var="i" items="${qna }" varStatus="vs">
								<tr class="subject" onclick="slideDownCts('${vs.index}')">
									<td>
										<span class="noto f16">${vs.index+1 }</span>
									</td>
									<c:forEach var="p" items="${product }" varStatus="pvs">
										<%-- <c:set var="loop_flag" value="false"/>
										<c:if test="${not loop_flag }"> --%>
										<c:if test="${pvs.index eq vs.index }">
											<td class="img_td">
												<img class="w150 h150" src="/img/${p.photo_af1 }">
											</td>
											<td style="text-align: left; padding-left: 40px;">
												<span class="noto f16">${p.p_name }</span>
											</td>
											<%-- <c:set var="loop_flag" value="true"/>
											</c:if> --%>
										</c:if>
									</c:forEach>
									<td class="tct">
										<span class="date">
											<fmt:formatDate value="${i.wdate }" pattern="yyyy.MM.dd"/>
										</span>
									</td>
									<td class="tct">
										<span class="noto f16">
											<c:if test="${i.answer ne null }">
												답변 완료
											</c:if>
											<c:if test="${i.answer eq null }">
												접수
											</c:if>
										</span>
										<br>
										<span></span>
									</td>
								</tr>
								<tr class="subject border_${vs.index } cBottom">
									<td class="tct f20" style="color: #aaaaaa;">Q</td>
									<td colspan="4">
										<p class="noto">${i.title }</p>
										<div style="margin-top: 30px; display: none;" class="cnts f14 div_${vs.index }">
											${i.content }
										</div>
									</td>
								</tr>
								<tr class="contents ${vs.index } cBottom">
									<td class="tct f20" style="color: rgb(170, 170, 170); display: none;">A</td>
									<td colspan="4" style="display: none;">
										
									<c:if test="${i.answer ne null }">
										<div class="cnts f14">
												${i.answer }
										</div>
										<br>
										<span class="date"><fmt:formatDate value="${i.adate }" pattern="yyyy.MM.dd" /></span>
									</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</c:if>
				</table>
			</div>
			<c:if test="${empty qna }">
				<div class="no_list" style="padding: 170px 0; text-align: center;">
					<p style="color: ; font-size: 18px;" class="noto">조회 결과가 없습니다.</p>
				</div>
			</c:if>
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
function slideDownCts(obj){
	$("." + obj + " td").toggle();
	$(".div_" + obj).toggle();
	$("." + obj).toggleClass('cBottom');
	$(".border_" + obj).toggleClass('cBottom');
}
</script>