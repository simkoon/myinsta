<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="contentDAO" class="com.koreait.ContentDAO" />

<c:if test="${empty sessionScope.id }">
	<script>
		alert("로그인 후 이용해주세요.");
		location.href = "./login/login.jsp";
	</script>
</c:if>

<c:set var="memberLists" value="${contentDAO.getMemberLists(0) }" />
<c:set var="contentList" value="${contentDAO.getContentsForIssue() }" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>header, footer type</title>
<link rel="stylesheet" href="cssmain/common.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="./js/main_script.js">
	
</script>
</head>
<body>
	<div id="wrap">
		<form id="h_reform" action="./main_search.jsp" method="GET"
			name="searchform">
			<%@ include file="mainHead.jsp"%>
			<!-- 내용부분 -->
			<div id="container">
				<div class="main_rolling_pc box_inner">
					<!-- 이 아래부터는 각자알아서 알맞게 -->
					<div id="main_feed">
						<div id="feed_roll">
							<div id="feed_box"></div>
							<div class="widget_box" id="widget_container">
								<div class="widget" id="widget">
									<div class="widget_my_box">
										<div class="widget_my_img">
											<a class="off_story" href="./mypage.jsp"> <a
												class="on_story" href="./mypage.jsp"> <img
													src="https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-19/s150x150/101066874_250369176291217_8457202342863831040_n.jpg?_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_ohc=MIG0PVCGXmkAX_nqjce&oh=340b25f50b734ba354cb0dd7ee994921&oe=5F1DC758"
													alt="" />
											</a>
											</a>
										</div>
										<div class="widget_my_account">
											<div>
												<a id="myaccountId" href="./mypage.jsp">${sessionScope.id }</a>
											</div>
											<div class="my_account_name">${sessionScope.name }</div>
										</div>
									</div>
									<div class="widget_hotissue_box">
										<div class="wget_hotissue_header">
											<a href="#">HOT ISSUE</a>
										</div>
										<div class="wget_hot_categories">
											<div class="hot_category">
												<a href="./main_search.jsp?tag=여행">여행</a>
											</div>
											<div class="hot_category">
												<a href="./main_search.jsp?tag=예술">예술</a>
											</div>
											<div class="hot_category">
												<a href="./main_search.jsp?tag=음식">음식</a>
											</div>
											<div class="hot_category">
												<a href="./main_search.jsp?tag=style">스타일</a>
											</div>
											<div class="hot_category">
												<a href="./main_search.jsp?tag=건축">건축</a>
											</div>
											<div class="hot_category">
												<a href="./main_search.jsp?tag=영화">TV 및 영화</a>
											</div>
											<div class="hot_category">
												<a href="./main_search.jsp?tag=예술">예술</a>
											</div>
											<div class="hot_category">
												<a href="./main_search.jsp?tag=음악">음악</a>
											</div>
										</div>
										<div class="wget_hot_carousel">
											<div class="carousel_imgs" style="right: 0px;">
												<c:forEach var="item" items="${contentList }">
													<div>
														<a href="./contentPage.jsp?b_idx=${item.mc_idx }"><img
															src="uploads/${item.mc_imageurl }"
															alt="" /></a>
													</div>

												</c:forEach>
											</div>

											<div class="carousel_nav">
												<div class="car_nav_btnBefore">
													<span class="nav_btnBefore"></span>
												</div>
												<div class="car_nav_btnNext">
													<span class="nav_btnNext"></span>
												</div>
											</div>
										</div>
									</div>
									<div class="widget_recommend_box">
										<div class="wget_recommend_header">
											<p>회원님을 위한 추천</p>
											<a href="follow.jsp" class="recommend_btnAll">모두 보기</a>
										</div>
										<div class="wget_recommend_list">

											<c:forEach var="item" items="${memberLists }">
												<c:if
													test="${0==contentDAO.getFollowingById(sessionScope.idx,item.m_idx) }">
													<div class="recom_list_item" style="margin-bottom: 5px;">
														<div class="recom_item_img">
															<a class="off_story" href="#"> <a class="on_story"
																href=""> <img
																	src="https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-19/s150x150/101066874_250369176291217_8457202342863831040_n.jpg?_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_ohc=MIG0PVCGXmkAX_nqjce&oh=340b25f50b734ba354cb0dd7ee994921&oe=5F1DC758"
																	alt="" />
															</a>
															</a>
														</div>
														<div class="recom_item_account">
															<div>
																<a href="">${item.m_userid }</a>
															</div>
															<div class="recom_account_reason">회원님을 위한 추천</div>
														</div>
														<div class="recom_item_btnFollow">
															<c:if
																test="${0<contentDAO.getFollowingById(sessionScope.idx,item.m_idx) }">
																<button class="item_btnFollow"
																	style="background-Color: white; color: black;">팔로잉</button>
															</c:if>
															<c:if
																test="${0==contentDAO.getFollowingById(sessionScope.idx,item.m_idx) }">
																<button class="item_btnFollow">팔로우</button>
															</c:if>
															<input type="hidden" name="mIdx" value="${item.m_idx }">
														</div>
													</div>
												</c:if>
											</c:forEach>
										</div>
									</div>
									<footer id="footer">
										<div class="footer_area box_inner clear"
											style="width: 100%; text-align: left; padding: 0px;">
											<div class="f_area1">
												<ul>
													<li><a style="color: rgb(200, 200, 200);"
														href="https://about.instagram.com/about-us">소개</a></li>
													<li><a style="color: rgb(200, 200, 200);"
														href="https://help.instagram.com/">도움말</a></li>
													<li><a style="color: rgb(200, 200, 200);"
														href="https://about.instagram.com/blog/">홍보 센터</a></li>
													<li><a style="color: rgb(200, 200, 200);"
														href="https://www.instagram.com/developer/">API</a></li>
													<li><a style="color: rgb(200, 200, 200);"
														href="https://www.instagram.com/about/jobs/">채용 정보</a></li>
													<li><a style="color: rgb(200, 200, 200);"
														href="https://help.instagram.com/519522125107875">개인정보처리방법</a></li>
													<li><a style="color: rgb(200, 200, 200);"
														href="https://help.instagram.com/581066165581870">약관</a></li>
													<li><a style="color: rgb(200, 200, 200);"
														href="https://www.instagram.com/explore/locations/">위치</a></li>
													<li><a style="color: rgb(200, 200, 200);"
														href="https://www.instagram.com/directory/profiles/">인기계정</a></li>
													<li><a style="color: rgb(200, 200, 200);"
														href="https://www.instagram.com/directory/hashtags/">해시태그</a></li>
													<li><a style="color: rgb(200, 200, 200);" href="">언어</a></li>
												</ul>
											</div>
											<div class="f_area2">© 2020 INSTAGRAM FROM 페스타그램</div>
										</div>
									</footer>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</form>


	</div>
</body>
</html>
