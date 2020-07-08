<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="insta.member.MemberDTO"/>
<% 
member.setM_userid((String)session.getAttribute("j_id"));
member.setM_password((String)session.getAttribute("j_pw"));
member.setM_username((String)session.getAttribute("j_name"));
member.setM_email((String)session.getAttribute("j_email"));
%>
<jsp:useBean id="mem_dao" class="insta.member.MemberDAO"/>
<%
if(mem_dao.join(member) == 0){
	%>
	<script>
	alert("회원가입 실패하였습니다.");
	location.href="login.jsp";
	</script>
	<%
}else{
%>
	<script>
	alert("회원가입 성공하였습니다.");
	location.href="login.jsp";
	</script>
<% 
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>