<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean class="insta.member.MemberDAO" id="mem_dao"/>
<jsp:useBean class="insta.member.MemberDTO" id="member"/>
<jsp:setProperty property="*" name="member"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%
String userid=(String)session.getAttribute("id");
request.setCharacterEncoding("UTF-8");
String m_username=request.getParameter("m_username");
String m_site=request.getParameter("m_site");
String m_intro=request.getParameter("m_intro");
String m_number=request.getParameter("m_number");
String m_gender=request.getParameter("m_gender");
System.out.println(userid);
member.setM_username(m_username);
member.setM_site(m_site);
member.setM_intro(m_intro);
member.setM_number(m_number);
member.setM_gender(m_gender);
member.setM_userid(userid);

session.setAttribute("intro", member.getM_intro());
session.setAttribute("site", member.getM_site());
session.setAttribute("number", member.getM_number());
session.setAttribute("gender", member.getM_gender());
session.setAttribute("email", member.getM_email());	


int cnt=mem_dao.profiledit(member);

if(cnt==0){ 
	
}else{ 
	
	
out.println("<script>"); 
out.println(" alert(' 포로필이 수정되었습니다');"); 
out.println(" location.href='../edit/edit1.jsp';"); 
out.println("</script>"); }

%>

</body>
</html>