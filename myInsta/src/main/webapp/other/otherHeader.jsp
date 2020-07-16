<%@page import="com.koreait.CommentDTO"%>
<%@page import="com.koreait.Content"%>
<%@page import="insta.member.MemberDTO"%>
<%@page import="insta.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<jsp:useBean id="contentDAO" class="com.koreait.ContentDAO" />
<jsp:useBean id="memberDTO" class="insta.member.MemberDTO" />
<%
	String otherId = request.getParameter("userid");
	if(session.getAttribute("id").equals(otherId)){
		%>
 		<script>
			location.href="../mypage.jsp";
		</script>
		 
		<%
	}else{

	List<MemberDTO> conList = contentDAO.getOtherpage(otherId);
	List<Content> otherConList = contentDAO.getMyContents(conList.get(0).getM_idx());
	String userid = (String)session.getAttribute("id");
	List<Content> TagList = contentDAO.getTageContent(userid);
%>
<div id="p_myTitle">
         <div id="p_mTimg">
             <div class="p_mTi">
                 <button class="p_mTiBtn" title="프로필사진 ">
                     <img alt="프로필 사진" src="https://scontent-iad3-1.cdninstagram.com/v/t51.2885-19/44884218_345707102882519_2446069589734326272_n.jpg?_nc_ht=scontent-iad3-1.cdninstagram.com&_nc_ohc=ZMRBdU8i2AoAX-ijcJe&oh=203ab59c04f149c10ed366b8f365a578&oe=5F13AC8F&ig_cache_key=YW5vbnltb3VzX3Byb2ZpbGVfcGlj.2">
                 </button>
             </div>
         </div>
         <section id="p_myTName">
             <div id="p_myTN1">
             	<div class="otherp">
                 <h2><%=otherId %></h2>   
                 <input class="p_myTNpa p_myTNBtn otherbtn btnFolloing"  type="button" onclick="Color(event)" value="팔로우">
             	</div>
             </div>
             <ul id="p_myTN1">
                 <li class="p_myTN1_list">
                     <span class="p_lText">게시물
                         <span class="p_lNum">0</span>
                     </span>
                 </li>
                 <li class="p_myTN1_list">
                     <a class="p_lText" href="#">팔로워
                         <span class="p_lNum">19</span>
                     </a>
                 </li>
                 <li class="p_myTN1_list">
                     <a class="p_lText" href="#">팔로우
                         <span class="p_lNum">7</span>
                     </a>
                 </li>
             </ul>
             <div id="p_myTN3">
                 <h1 class="rhpdm">안녕하세요.</h1>
             </div>
         </section>
     </div>
