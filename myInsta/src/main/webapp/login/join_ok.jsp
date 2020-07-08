<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="insta.member.MemberDTO" %>

<jsp:useBean id="mem_dao" class="insta.member.MemberDAO"/>
<jsp:useBean id="member" class="insta.member.MemberDTO"/>

	
<%
	request.setCharacterEncoding("UTF-8");
	
	if(mem_dao.idCheck((String)request.getParameter("m_userid"),(String)request.getParameter("m_email")) == 0){
%>
	<script>
		alert("아이디가 중복됩니다.");		
		history.back();
	</script>		
<%
	}

	session.setAttribute("j_id", request.getParameter("m_userid"));
	session.setAttribute("j_pw", request.getParameter("m_password"));
	session.setAttribute("j_name", request.getParameter("m_username"));
	session.setAttribute("j_email", request.getParameter("m_email") );
	//out.println(request.getParameter("m_userid"));

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 정보 DTO저장 </title>
</head>
<body>

<script>
location.href="code_email.jsp";
</script>
	
</body>
</html>