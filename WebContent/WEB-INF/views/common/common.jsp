<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<c:if test="${(empty login) or (login.id eq '') }">
<%
	session.invalidate();
%>
</c:if>

<script type="text/javascript">
alert("로그인 해 주십시오");
location.href="login.do";
</script>




