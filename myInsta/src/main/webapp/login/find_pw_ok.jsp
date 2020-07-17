<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="contentDAO" class="com.koreait.ContentDAO" />
<c:if test="${empty sessionScope.id }">
	<script>
		alert("잘못된 경로입니다.");
		location.href = "login.jsp";
	</script>
</c:if>
<jsp:useBean id="mem_dao" class="insta.member.MemberDAO"/>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String email = mem_dao.findPw(id);
	if(email == null){
		%>
		<script>
			alert("입력하신 정보의 회원이 존재하지 않습니다.");
			location.href="find_pw.jsp";
		</script>
		<%
	}else{
		session.setAttribute("j_email", email);
		session.setAttribute("find_pw", "find");
%>
	<script>
		location.href="join_ok.jsp";
	</script>
<%} %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>

</body>
</html>