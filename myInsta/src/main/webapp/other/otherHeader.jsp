<%@page import="com.koreait.CommentDTO"%>
<%@page import="com.koreait.Content"%>
<%@page import="insta.member.MemberDTO"%>
<%@page import="insta.member.MemberDAO"%>
<%@page import="com.koreait.ContentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="contentDAO" class="com.koreait.ContentDAO" />
<jsp:useBean id="memberDTO" class="insta.member.MemberDTO" />
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(function () {
    $(".new_div1").click(function () {
        $(".fp").fadeIn();
    });
    $(".exit_btn").click(function () {
        $(".fp").fadeOut();
    });
});

$(function () {
    $(".new_div2").click(function () {
        $(".fp2").fadeIn();
    });
    $(".exit_btn").click(function () {
        $(".fp2").fadeOut();
    });
});

</script>

<c:if test="${empty sessionScope.id }">
	<script>
		alert("로그인 후 이용해주세요.");
		location.href = "./login/login.jsp";
	</script>
</c:if>

<%
	String otherId = request.getParameter("userid");
	if(session.getAttribute("id").equals(otherId)){
		%>
 		<script>
			location.href="../mypage.jsp";
		</script>
		 
		<%
	}else {
		
	
	
	List<MemberDTO> conList = contentDAO.getOtherpage(otherId);
	List<Content> otherConList = contentDAO.getMyContents(conList.get(0).getM_idx());
	String userid = (String)session.getAttribute("id");
	List<Content> TagList = contentDAO.getTageContent(userid);
	int m_idx2 = Integer.parseInt(String.valueOf(session.getAttribute("idx")));
	ContentDAO cdao = new ContentDAO();
	
	System.out.println(otherId);
	System.out.println("userid = " + userid);
	
	
%>
<style>
.p_lText, .p_lText2 {
	font-size: 16px;
	border: none;
	background: none;
	height: 21px;
	cursor: pointer;
}
.new_div1, .new_div2 {
	width: 73px;
	height: 21px;
	font-size: 16px;

}
.otherp{margin-right: 20px;}
.fp {
	width: 100%;
	height: 100%;
	display: none;
	position: fixed;
	top: 0px;
	left: 0px;
	background-color: rgba(0, 0, 0, 0.6);
}

.fp2 {
	width: 100%;
	height: 100%;
	display: none;
	position: fixed;
	top: 0px;
	left: 0px;
	background-color: rgba(0, 0, 0, 0.6);
}

.follower_pop {
	width: 400px;
	height: 400px;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	background: #fff;
	border: 1px solid #ccc;
	border-radius: 12px;
}

.follower_pop .fw_pop {
	width: 100%;
	height: 43px;
	border-bottom: 1px solid #ccc;
}

.follower_pop .fw_pop .pop_header {
	width: 100%;
	height: 100%;
	display: flex;
}

.follower_pop .fw_pop .pop_header .hd_left, .follower_pop .fw_pop .pop_header .hd_right
	{
	height: 42px;
	width: 48px;
}

.follower_pop .fw_pop .hd_h1 {
	font-size: 16px;
	text-align: center;
	margin: 0;
	height: 42px;
	width: 304px;
	font-weight: bold;
	line-height: 24px;
	justify-content: center;
}

.follower_pop .fw_pop .pop_header .hd_right {
	padding: 8px;
	box-sizing: border-box;
	background: 0 0;
}

.follower_pop .fw_pop .pop_body {
	height: 357px;
	min-height: 200px;
	overflow-y: scroll;
	overflow-x: hidden;
}

.follower_pop .fw_pop .pop_body ul {
	margin: 0;
	padding: 0;
}

.follower_pop .fw_pop .pop_body ul .body_ing li {
	height: 46px;
	width: 383px;
	list-style: none;
}

.body_ing .ing_li {
	display: flex;
	height: 46px;
	padding: 8px 16px;
	box-sizing: border-box;
}

.body_ing .ing_li .li_img {
	width: 15%;
}

.body_ing .ing_li .li_id {
	width: 65%;
}

.body_ing .ing_li .li_btn {
	width: 20%;
}

.body_ing .ing_li .li_btn input[type="button"] {
	width: 62px;
	height: 30px;
	background-color: #fff;
	border: 1px solid #ccc;
	color: #000;
	border-radius: 4px;
	font-weight: bold;
}

.body_ing .ing_li .li_img a img {
	width: 30px;
	height: 30px;
	border: 1px solid #ccc;
	border-radius: 50%;
}

.body_ing .ing_li .li_id p {
	font-size: 13px;
	line-height: 10px;
}

.pop_body .body_h1 {
	width: 100%;
	height: 30px;
	padding-left: 16px;
}

.pop_body .body_h1 h1 {
	font-size: 16px;
	font-weight: bold;
}

.body_ing .ing_li .li_btn2 input[type="button"] {
	width: 62px;
	height: 30px;
	background-color: #0095f6;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-weight: bold;
	color: white;
}

.exit_btn {
	border: none;
	backgroun-color: white;
	height: 20px;
	width: 20px;
	cursor: pointer;
}
</style>
<div id="p_myTitle">
         <div id="p_mTimg">
             <div class="p_mTi">
                 <button class="p_mTiBtn" title="프로필사진 ">
                     <img alt="프로필 사진" src="../uploads/profile.jpg">
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
                         <span class="p_lNum"><%=cdao.getCntContentById(Integer.parseInt(String.valueOf(session.getAttribute("idx"))))%></span>
                     </span>
                 </li>
                 <li class="p_myTN1_list">
                 
                     <span class="new_div1">팔로워
                         <span class="p_lNum cntfollower"><%=cdao.getCntFollower(Integer.parseInt(String.valueOf(session.getAttribute("idx"))))%></span>
                     </span>
                    
                 </li>
                 <div class="fp">
				<div class="follower_pop">
					<div class="fw_pop">
						<div class="pop_header">
							<div class="hd_left"></div>
							<h1 class="hd_h1">팔로워</h1>
							<div class="hd_right">
								<span class="exit_btn">&times;</span>
							</div>
						</div>
						
						<div class="pop_body">
							<ul>
								<div class="body_ing myFollower">
<%	
System.out.println("m_idx2 = " + m_idx2);
Connection conn2 = null;
PreparedStatement pstmt2 = null;
ResultSet rs2 = null;

String sql2 = "";
String url2 = "jdbc:mariadb://localhost:3306/insta";
String uid2 = "root";
String upw2 = "1234";
int other_idx = 0; 

try { 
	Class.forName("org.mariadb.jdbc.Driver");
	conn2 = DriverManager.getConnection(url2, uid2, upw2);
	if(conn2 != null) {
		sql2 = "select m_idx from tb_member where m_userid = (?)";
		pstmt2 = conn2.prepareStatement(sql2);
		pstmt2.setString(1, otherId);
		rs2 = pstmt2.executeQuery();
		while(rs2.next()) {
			other_idx = rs2.getInt("m_idx");
			System.out.println("other_idx = " + other_idx);
		}
	}
}catch(Exception e2) {
	e2.printStackTrace();
}


try {
	Class.forName("org.mariadb.jdbc.Driver");
	conn2 = DriverManager.getConnection(url2, uid2, upw2);
	if (conn2 != null) {
		sql2 = "SELECT m2.m_userid AS me , m1.m_userid AS otherfollow, tb_following.fi_useridx  FROM tb_following";
		sql2 += " JOIN tb_member m1 ON tb_following.fi_useridx = m1.m_idx JOIN tb_member m2";
		sql2 += " ON tb_following.fi_followingid = m2.m_idx WHERE fi_followingid = ?";
		pstmt2 = conn2.prepareStatement(sql2);
		pstmt2.setInt(1, other_idx);
		rs2 = pstmt2.executeQuery();
		while (rs2.next()) {
	int followingid2 = rs2.getInt("fi_useridx");
	System.out.println("otherheader페이지 followingid1_1 = " + followingid2);
%>
									<li><input type="hidden" value='<%=rs2.getString("otherfollow")%>'/>
										<div class="ing_li">
											<div class="li_img">
												<a href="#"><img src="../images/person_icon.jpg" alt="프사"></a>
											</div>
											<div class="li_id">
												<p><%=rs2.getString("otherfollow")%></p>
											</div>
											<div class="li_btn">
<%
	if (cdao.getFollowingById(m_idx2, followingid2) > 0) {
%>
												<input type="button" style="cursor: pointer;" value="팔로잉"
													class="fw_btn">

<%
} else {
%>
												<input type="button" value="팔로우" class="fw_btn"
													style="background-color: #0095f6; color: white; cursor: pointer;"/>

<%
}
%>
												<input type="hidden" value="<%=followingid2%>"/>
											</div>
										</div>
									</li>
<%
	}
}
} catch (Exception e2) {
	e2.printStackTrace();
}

%>
								</div>
							</ul>

						</div>
					</div>
				</div>
			</div>
                 <li class="p_myTN1_list">

                     <span class="new_div2">팔로우
                         <span class="p_lNum cntfollow"><%=cdao.getCntFollow(m_idx2)%></span>
                     </span>

                 </li>
                 <div class="fp2">
				<div class="follower_pop">
					<div class="fw_pop">
						<div class="pop_header">
							<div class="hd_left"></div>
							<h1 class="hd_h1">팔로워</h1>
							<div class="hd_right">
								<span class="exit_btn">&times;</span>
							</div>
						</div>
						<div class="pop_body">
							<ul>
								<div class="body_ing myFollow">
<%

	try {
	Class.forName("org.mariadb.jdbc.Driver");
	conn2 = DriverManager.getConnection(url2, uid2, upw2);
	if (conn2 != null) {
		sql2 = "SELECT m1.m_userid AS me , m2.m_userid AS ifollow, tb_following.fi_followingid  FROM tb_following";
		sql2 += " JOIN tb_member m1 ON tb_following.fi_useridx = m1.m_idx JOIN tb_member m2";
		sql2 += " ON tb_following.fi_followingid = m2.m_idx WHERE fi_useridx = ?";
		pstmt2 = conn2.prepareStatement(sql2);
		pstmt2.setInt(1, other_idx);
		rs2 = pstmt2.executeQuery();
		while (rs2.next()) {
	int followingid2 = rs2.getInt("fi_followingid");
	System.out.println("otherheader페이지 followingid1_2 = " + followingid2);
%>
									<li class='<%=rs2.getString("ifollow")%>'><input
										type="hidden" value='<%=rs2.getString("ifollow")%>'/>
										<div class="ing_li">
											<div class="li_img">
												<a href="#"><img src="../images/person_icon.jpg" alt="#"></a>
											</div>
											<div class="li_id">
												<p><%=rs2.getString("ifollow")%></p>
											</div>
											<div class="li_btn">
<%
	if (cdao.getFollowingById(m_idx2, followingid2) > 0) {
%>
												<input type="button" style="cursor: pointer;" value="팔로잉"
													class="fw_btn">
<%
	} else {
%>
												<input type="button" value="팔로우" class="fw_btn"
													style="background-color: #0095f6; color: white; cursor: pointer;">

<%
	}
%>
												<input type="hidden" value="<%=followingid2%>"/>
											</div>
										</div>
									</li>
<%
		
	}
}
} catch (Exception e2) {
	e2.printStackTrace();
}

%>
								</div>
							</ul>

						</div>
					</div>
				</div>
			</div>
             </ul>
             <div id="p_myTN3">
                 <h1 class="rhpdm">안녕하세요.</h1>
             </div>
         </section>
     </div>

