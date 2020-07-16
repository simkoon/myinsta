<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="contentDAO" class="com.koreait.ContentDAO" />
<c:set var="tag" value="${param.tag }" />
<c:set var="cntTag" value="${contentDAO.getCntTag(tag) }" />
<c:if test="${empty sessionScope.id }">
	<script>
		alert("로그인 후 이용해주세요.");
		location.href = "./login/login.jsp";
	</script>
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>header, footer type</title>
<link rel="stylesheet" href="./cssforsearch/common.css" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="./js/main_search_script.js"></script>
<script>
	$(function() {
		$("#f_btn").on(
				"click",
				function() {
					if ($(this).val() == "팔로우") {
						$(this).css("background-color", "#fff");
						$(this).val("팔로잉").css("color", "#000").css("border",
								"1px solid #ccc");
					} else {
						$(this).css("background-color", "#0095f6");
						$(this).val("팔로우").css("color", "#fff");
					}
				});
	});
	$(function() {
		$(".boxs").on("mouseover", function() {
			$(this).children(".popup_box").addClass("on");
		});
		$(".boxs").on("mouseout", function() {
			$(this).children(".popup_box").removeClass("on");
		});
	});
	(()={})();
	
</script>
</head>
<body>
	<ul class="skipnavi">
		<li><a href="#container">본문내용</a></li>
	</ul>
	<!-- wrap -->
	<div id="wrap" class="search_wrap">
		<form id="h_reform" action="./main_search.jsp" method="GET"
			name="searchform">
			<!-- 해더부분 -->
			<%@ include file="mainHead.jsp"%>
			<!-- 내용부분 -->
			<div id="container" class="search_container">
				<div class="main_rolling_pc box_inner">
					<!-- 이 아래부터는 각자알아서 알맞게 -->
					<div class="search_content">
						<div class="search_header">
							<div class="search_img">
								<a href="#"><div class="search_img1"></div></a>
							</div>
							<div class="search_name">
								<h1 class="search_name_h1">#하늘</h1>
								<p class="search_name_p1">
									게시물 <span>${cntTag }</span> 개
								</p>
								<p class="search_name_p2"></p>
								<p class="search_name_p3"></p>
							</div>
						</div>
						<div class="search_images">
							<div class="images_items">
								<div class="items_box">
									<h2 class="box_h2">최근 사진</h2>
								</div>
							</div>
						</div>
					</div>
				</div>
				<footer id="footer">
					<div class="footer_area box_inner clear">
						<div class="f_area1">
							<ul>
								<li><a href="https://about.instagram.com/about-us">소개</a></li>
								<li><a href="https://help.instagram.com/">도움말</a></li>
								<li><a href="https://about.instagram.com/blog/">홍보 센터</a></li>
								<li><a href="https://www.instagram.com/developer/">API</a></li>
								<li><a href="https://www.instagram.com/about/jobs/">채용
										정보</a></li>
								<li><a href="https://help.instagram.com/519522125107875">개인정보처리방법</a></li>
								<li><a href="https://help.instagram.com/581066165581870">약관</a></li>
								<li><a href="https://www.instagram.com/explore/locations/">위치</a></li>
								<li><a href="https://www.instagram.com/directory/profiles/">인기계정</a></li>
								<li><a href="https://www.instagram.com/directory/hashtags/">해시태그</a></li>
								<li><a href="">언어</a></li>
							</ul>
						</div>
					</div>
					<div class="f_area2">© 2020 INSTAGRAM FROM 페스타그램</div>
				</footer>
		</form>
	</div>
</body>
</html>
