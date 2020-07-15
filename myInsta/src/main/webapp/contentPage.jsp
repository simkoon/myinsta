<%@page import="com.koreait.CommentDTO"%>
<%@page import="com.koreait.Content"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean class="com.koreait.ContentDAO" id="con_dao" />


<%
	request.setCharacterEncoding("utf-8");
int b_idx = Integer.parseInt(String.valueOf(request.getParameter("b_idx")));
int m_idx = Integer.parseInt(String.valueOf(session.getAttribute("idx")));

List<Content> conList = con_dao.getOneContent(b_idx);
List<CommentDTO> comList = con_dao.getComment(b_idx);

System.out.println(comList);

int cnt = con_dao.getCntLikes(b_idx);

System.out.println(cnt);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="mainTitle.jsp"%>
</head>
<body>
	<ul class="skipnavi">
		<li><a href="#container">본문내용</a></li>
	</ul>
	<!-- wrap -->
	<div id="wrap">
		<form id="h_reform">
			<%@ include file="mainHead.jsp"%>
			<!-- 내용부분 -->
			<div id="container">
				<div class="main_rolling_pc box_inner">
					<!-- 이 아래부터는 각자알아서 알맞게 -->
					<div class="visualRoll">
						<div class="content_box">
							<div class="content_imgbox">
								<img class="content_img"
									src="./uploads/<%=conList.get(0).getMc_imageurl()%>" />
							</div>
							<div class="content_textbox">
								<div class="content_profile">
									<a href="#">
										<div class="profile_img"></div>
										<div class="content_userid"><%=conList.get(0).getMc_useridx()%></div>
									</a> <span>•</span>


									<button class="content_follow">팔로우</button>
									<button class="content_option" id="popbtn5">•••</button>
								</div>
								<div class="content_reply">
									<div class="content_user">
										<a href="#">
											<div class="replyuser_img"></div>
										</a>
										<div class="c_reply">
											<a href="#"><%=conList.get(0).getMc_useridx()%></a>
											<%=conList.get(0).getMc_content()%>
										</div>
									</div>
									<%
										for (int i = 0; i < comList.size(); i++) {
									%>
									<div class="content_user">
										<a href="#">
											<div class="replyuser_img"></div>
										</a>
										<div class="c_reply">
											<a href="#"><%=comList.get(i).getCoUserid()%></a>
											<%=comList.get(i).getCoText()%>
										</div>
									</div>
									<%
										}
									%>
								</div>
								<div class="content_like">

									<input type="hidden" id="content_bidx" value="<%=b_idx%>">
									<input type="hidden" id="content_midx" value="<%=m_idx%>">
									<%
										if (con_dao.getLikeById(b_idx, m_idx)) {
									%>
									<input type="button" class="btn_heart on" />
									<%
										} else {
									%>
									<input type="button" class="btn_heart off" />

									<%
										}
									%>

									<button class="btn_reply"></button>
									<button class="btn_share"></button>
									<button class="btn_keep"></button>
									<p class="like_cun">
										좋아요
										<%=cnt%>개
									</p>
									<p class="contentPage_date"><%=conList.get(0).getMc_regdate()%></p>
								</div>
								<div class="reply_text">
									<textarea class="reply_textarea" placeholder="댓글 달기..."></textarea>
									<button class="reply_button" type="button">게시</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="mainFooter.jsp"%>
		</form>
	</div>
	
	<div id="pop5">
        <div id="pop5_menu">
           <button class="mybtn5" id="mybtn5_1">부적절한 콘텐츠 신고</button>
           <button class="mybtn5" id="mybtn5_2">팔로우 취소</button>
           <button class="">링크복사</button>
           <button class="">취소</button>
        </div>
    </div>
    <div id="pop6">
        <div id="pop6_menu">
            <div class="pop6_header">
                <div class="po6_1">신고</div>
                <div class="pop6_b">
                    <button class="pop6_btn" type="button" class="btn">
                    <svg aria-label="닫기" class="btn_a" fill="#262626" height="24" viewBox="0 0 48 48" width="24">
                    <path clip-rule="evenodd" d="M41.1 9.1l-15 15L41 39c.6.6.6 1.5 0 2.1s-1.5.6-2.1 0L24 26.1l-14.9 15c-.6.6-1.5.6-2.1 0-.6-.6-.6-1.5 0-2.1l14.9-15-15-15c-.6-.6-.6-1.5 0-2.1s1.5-.6 2.1 0l15 15 15-15c.6-.6 1.5-.6 2.1 0 .6.6.6 1.6 0 2.2z" fill-rule="evenodd"/></svg>
                    </button>
                </div>
                <br>
                <button><a href="po6_2">스팸<span class="po6_2_1">></span></a></button>
                <br>
                <button class="po6_2"><a href="./edit/edit3.jsp">부적절합니다<span class="po6_2_1" style="
                line-height: 2.2;
            ">></span></a></button>
            </div>
        </div>
    </div>
    <div id="pop7">
        <div id="pop7_menu">
            <div class="pop7_box"><span class="pop7_id">Gyomin_100</span> 님의 <br>팔로우를 취소하시겠어요?</div>
            <button class="mybtn7">팔로우 취소</button>
            <button class="">취소</button>
        </div>
    </div>
	
	
	
</body>
</html>