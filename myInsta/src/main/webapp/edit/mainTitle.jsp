<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="contentDAO" class="com.koreait.ContentDAO" />
<c:if test="${empty sessionScope.id }">
	<script>
		alert("로그인 후 이용해주세요.");
		location.href = "../login/login.jsp";
	</script>
</c:if>
<meta charset="UTF-8">
<title>Instagram</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./js/script.js"></script>
<link rel="stylesheet" href="../cssAll/commonAll.css">
