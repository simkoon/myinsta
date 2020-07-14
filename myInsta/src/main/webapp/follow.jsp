<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <jsp:useBean id="contentDAO" class="com.koreait.ContentDAO"/>
<!DOCTYPE html>
<html>
<head>
<%@ include file="mainTitle.jsp" %>
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
					<div class="visualRoll">


						<main class="explore">
							<h2 class=extitle>활동</h2>
							<section class="people">
								<ul class="people__list">

									<li class="people__person">
										<div class="people__column">
											<div class="people__avatar-container">
												<a href="#"> <img src="images/follower.png"
													class="people__avatar" />
												</a>
											</div>
											<div class="people__info">
												<span class="people__username"> <a href="#">
														davidbeckham </a> <img src="" />
												</span> <span class="people__full-name">David Beckham 님이
													회원님을 팔로우하기 시작했습니다. 3일</span>
											</div>
										</div>
										<div class="people__column">
											<input type="button" id="columnbutton" value="팔로우"
												class="btnFolloing" />
										</div>
									</li>
									<li class="people__person">
										<div class="people__column">
											<div class="people__avatar-container">
												<a href="#"> <img src="images/follower.png"
													class="people__avatar" />
												</a>
											</div>
											<div class="people__info">
												<span class="people__username"> <a href="#">
														davidbeckham </a> <img src="" />
												</span> <span class="people__full-name">David Beckham 님이
													회원님을 팔로우하기 시작했습니다. 3일</span>
											</div>
										</div>
										<div class="people__column">
											<input type="button" id="columnbutton" value="팔로우"
												class="btnFolloing" />
										</div>
									</li>
									<li class="people__person">
										<div class="people__column">
											<div class="people__avatar-container">
												<a href="#"> <img src="images/follower.png"
													class="people__avatar" />
												</a>
											</div>
											<div class="people__info">
												<span class="people__username"> <a href="#">
														davidbeckham </a> <img src="" />
												</span> <span class="people__full-name">David Beckham 님이
													회원님을 팔로우하기 시작했습니다. 3일</span>
											</div>
										</div>
										<div class="people__column">
											<input type="button" id="columnbutton" value="팔로우"
												class="btnFolloing" />
										</div>
									</li>
									<li class="people__person">
										<div class="people__column">
											<div class="people__avatar-container">
												<a href="#"> <img src="images/follower.png"
													class="people__avatar" />
												</a>
											</div>
											<div class="people__info">
												<span class="people__username"> <a href="#">
														davidbeckham </a> <img src="" />
												</span> <span class="people__full-name">David Beckham 님이
													회원님을 팔로우하기 시작했습니다. 3일</span>
											</div>
										</div>
										<div class="people__column">
											<input type="button" id="columnbutton" value="팔로우"
												class="btnFolloing" />
										</div>
									</li>
									<li class="people__person">
										<div class="people__column">
											<div class="people__avatar-container">
												<a href="#"> <img src="images/follower.png"
													class="people__avatar" />
												</a>
											</div>
											<div class="people__info">
												<span class="people__username"> <a href="#">
														davidbeckham </a> <img src="" />
												</span> <span class="people__full-name">David Beckham 님이
													회원님을 팔로우하기 시작했습니다. 3일</span>
											</div>
										</div>
										<div class="people__column">
											<input type="button" id="columnbutton" value="팔로우"
												class="btnFolloing" />
										</div>
									</li>
									<li class="people__person">
										<div class="people__column">
											<div class="people__avatar-container">
												<a href="#"> <img src="images/follower.png"
													class="people__avatar" />
												</a>
											</div>
											<div class="people__info">
												<span class="people__username"> <a href="#">
														davidbeckham </a> <img src="" />
												</span> <span class="people__full-name">David Beckham 님이
													회원님을 팔로우하기 시작했습니다. 3일</span>
											</div>
										</div>
										<div class="people__column">
											<input type="button" id="columnbutton" value="팔로우"
												class="btnFolloing" />
										</div>
									</li>
									<li class="people__person">
										<div class="people__column">
											<div class="people__avatar-container">
												<a href="#"> <img src="images/follower.png"
													class="people__avatar" />
												</a>
											</div>
											<div class="people__info">
												<span class="people__username"> <a href="#">
														davidbeckham </a> <img src="" />
												</span> <span class="people__full-name">David Beckham 님이
													회원님을 팔로우하기 시작했습니다. 3일</span>
											</div>
										</div>
										<div class="people__column">
											<input type="button" id="columnbutton" value="팔로우"
												class="btnFolloing" />
										</div>
									</li>
									<li class="people__person">
										<div class="people__column">
											<div class="people__avatar-container">
												<a href="#"> <img src="images/follower.png"
													class="people__avatar" />
												</a>
											</div>
											<div class="people__info">
												<span class="people__username"> <a href="#">
														davidbeckham </a> <img src="" />
												</span> <span class="people__full-name">David Beckham 님이
													회원님을 팔로우하기 시작했습니다. 3일</span>
											</div>
										</div>
										<div class="people__column">
											<input type="button" id="columnbutton" value="팔로우"
												class="btnFolloing" />
										</div>
									</li>

									<li class="people__person">
										<div class="people__column">
											<a href="./mainfeed.jsp"> <input type="button"
												id="startbutton" value="시작하기" />
											</a>
										</div>
									</li>
								</ul>
							</section>
						</main>

					</div>
				</div>
			</div>
			<!-- End -->
	</div>
	</div>
    </div>
	<%@ include file="mainFooter.jsp" %>
</form>
</div>
</body>
</html>