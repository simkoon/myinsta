<%@page import="com.koreait.ContentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.sql.*"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="./js/myPageHeader_script.js"></script>
<style>
.p_lText, .p_lText2 {
	font-size: 16px;
	border: none;
	background: none;
	height: 21px;
}
</style>
<div id="p_myTitle">
	<div id="p_mTimg">
		<div class="p_mTi">
			<button class="p_mTiBtn" title="프로필사진 추가">
				<img alt="프로필 사진추가"
					src="https://scontent-iad3-1.cdninstagram.com/v/t51.2885-19/44884218_345707102882519_2446069589734326272_n.jpg?_nc_ht=scontent-iad3-1.cdninstagram.com&_nc_ohc=ZMRBdU8i2AoAX-ijcJe&oh=203ab59c04f149c10ed366b8f365a578&oe=5F13AC8F&ig_cache_key=YW5vbnltb3VzX3Byb2ZpbGVfcGlj.2">
			</button>
		</div>
	</div>
	<section id="p_myTName">
		<div id="p_myTN1">
			<h2>${sessionScope.id}</h2>
			<a class="p_myTN" href="./edit/edit1.jsp"><button
					class="p_myTNpa p_myTNBtn" type="button">프로필 편집</button></a>
			<div class="p_myTNpa2">
				<button class="p_myTNpa2Btn" type="button" id="mybtn">
					<svg aria-label="옵션" class="ico_btn" fill="#262626" height="24"
						viewBox="0 0 48 48" width="24">
                             <path clip-rule="evenodd"
							d="M46.7 20.6l-2.1-1.1c-.4-.2-.7-.5-.8-1-.5-1.6-1.1-3.2-1.9-4.7-.2-.4-.3-.8-.1-1.2l.8-2.3c.2-.5 0-1.1-.4-1.5l-2.9-2.9c-.4-.4-1-.5-1.5-.4l-2.3.8c-.4.1-.8.1-1.2-.1-1.4-.8-3-1.5-4.6-1.9-.4-.1-.8-.4-1-.8l-1.1-2.2c-.3-.5-.8-.8-1.3-.8h-4.1c-.6 0-1.1.3-1.3.8l-1.1 2.2c-.2.4-.5.7-1 .8-1.6.5-3.2 1.1-4.6 1.9-.4.2-.8.3-1.2.1l-2.3-.8c-.5-.2-1.1 0-1.5.4L5.9 8.8c-.4.4-.5 1-.4 1.5l.8 2.3c.1.4.1.8-.1 1.2-.8 1.5-1.5 3-1.9 4.7-.1.4-.4.8-.8 1l-2.1 1.1c-.5.3-.8.8-.8 1.3V26c0 .6.3 1.1.8 1.3l2.1 1.1c.4.2.7.5.8 1 .5 1.6 1.1 3.2 1.9 4.7.2.4.3.8.1 1.2l-.8 2.3c-.2.5 0 1.1.4 1.5L8.8 42c.4.4 1 .5 1.5.4l2.3-.8c.4-.1.8-.1 1.2.1 1.4.8 3 1.5 4.6 1.9.4.1.8.4 1 .8l1.1 2.2c.3.5.8.8 1.3.8h4.1c.6 0 1.1-.3 1.3-.8l1.1-2.2c.2-.4.5-.7 1-.8 1.6-.5 3.2-1.1 4.6-1.9.4-.2.8-.3 1.2-.1l2.3.8c.5.2 1.1 0 1.5-.4l2.9-2.9c.4-.4.5-1 .4-1.5l-.8-2.3c-.1-.4-.1-.8.1-1.2.8-1.5 1.5-3 1.9-4.7.1-.4.4-.8.8-1l2.1-1.1c.5-.3.8-.8.8-1.3v-4.1c.4-.5.1-1.1-.4-1.3zM24 41.5c-9.7 0-17.5-7.8-17.5-17.5S14.3 6.5 24 6.5 41.5 14.3 41.5 24 33.7 41.5 24 41.5z"
							fill-rule="evenodd"></path>
                         </svg>
				</button>
				<div id="popup">
					<div id="popmenu">
						<button class="">
							<a href="./edit/edit2.jsp">비밀번호 변경</a>
						</button>
						<button class="">
							<a href="">네임 태그</a>
						</button>
						<button class="">
							<a href="./edit/edit3.jsp">앱 및 웹사이트</a>
						</button>
						<button class="">
							<a href="./edit/edit4.jsp">알림</a>
						</button>
						<button class="">
							<a href="./edit/edit7.jsp">공개 범위 및 보안</a>
						</button>
						<button class="">
							<a href="./edit/edit8.jsp">로그인 활동</a>
						</button>
						<button class="">
							<a href="./edit/edit9.jsp">이메일</a>
						</button>
						<button class="mybtn2">
							<a href="#">문제신고</a>
						</button>
						<button class="">
							<a href="./login/login.jsp">로그 아웃</a>
						</button>
						<button class="">
							<a href="#">취소</a>
						</button>
					</div>
				</div>

				<div id="popup2">
					<div id="popmenu2">
						<div class="pop2_header">
							<div class="pop2_h1">
								<h1>문제 신고</h1>
							</div>
							<div class="pop2_b">
								<button class="pop2_btn" type="button" class="btn">
									<svg aria-label="닫기" class="btn_a" fill="#262626" height="24"
										viewBox="0 0 48 48" width="24">
					                <path clip-rule="evenodd"
											d="M41.1 9.1l-15 15L41 39c.6.6.6 1.5 0 2.1s-1.5.6-2.1 0L24 26.1l-14.9 15c-.6.6-1.5.6-2.1 0-.6-.6-.6-1.5 0-2.1l14.9-15-15-15c-.6-.6-.6-1.5 0-2.1s1.5-.6 2.1 0l15 15 15-15c.6-.6 1.5-.6 2.1 0 .6.6.6 1.6 0 2.2z"
											fill-rule="evenodd"></path></svg>
								</button>
							</div>
						</div>
						<div class="pop2_box">
							<div class="texta_box">
								<textarea class="P1TbB" placeholder="발생한 문제를 간단하게 설명해주세요."></textarea>
							</div>
							<div class="pop2_btns">
								<button class="pop2_b1" type="button">신고 보내기</button>
								<div class="pop2_b2box">
									<form enctype="multipart/form-data" method="POST"
										role="presentation">
										<button class="pop2_b2" type="button">파일 추가</button>
										<input accept="image/*,video/*" class="tb_sK" multiple
											type="file">
									</form>
								</div>
							</div>
							<div class="pop2_text">
								<div class="t">회원님의 Instagram 사용자 이름과 브라우저 정보가 자동으로 신고에
									포함됩니다.</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<%
			ContentDAO cdao = new ContentDAO();
		%>
		<ul id="p_myTN1">
			<li class="p_myTN1_list"><span class="p_lText0">게시물 <span
					class="p_lNum"><%=cdao.getCntContentById(Integer.parseInt(String.valueOf(session.getAttribute("idx"))))%></span>
			</span></li>
			<li class="p_myTN1_list"><button class="p_lText" href="#"
					style="cursor: pointer;">
					팔로워 <span class="p_lNum cntfollower"> <%=cdao.getCntFollower(Integer.parseInt(String.valueOf(session.getAttribute("idx"))))%>
					</span>
				</button></li>
			<div class="fp">
				<div class="follower_pop">
					<div class="fw_pop">
						<div class="pop_header">
							<div class="hd_left"></div>
							<h1 class="hd_h1">팔로워</h1>
							<div class="hd_right">
								<button class="exit_btn">&times;</button>
							</div>
						</div>
						<div class="pop_body">
							<ul>
								<div class="body_ing">
									<%
										request.setCharacterEncoding("UTF-8");
									int m_idx = Integer.parseInt(String.valueOf(session.getAttribute("idx")));

									System.out.println("m_idx = " + m_idx);
									Connection conn = null;
									PreparedStatement pstmt = null;
									ResultSet rs = null;

									String sql = "";
									String url = "jdbc:mariadb://localhost:3306/insta";
									String uid = "root";
									String upw = "1234";

									try {
										Class.forName("org.mariadb.jdbc.Driver");
										conn = DriverManager.getConnection(url, uid, upw);
										if (conn != null) {
											sql = "SELECT m2.m_userid AS me , m1.m_userid AS otherfollow, tb_following.fi_useridx  FROM tb_following";
											sql += " JOIN tb_member m1 ON tb_following.fi_useridx = m1.m_idx JOIN tb_member m2";
											sql += " ON tb_following.fi_followingid = m2.m_idx WHERE fi_followingid = ?";
											pstmt = conn.prepareStatement(sql);
											pstmt.setInt(1, m_idx);
											rs = pstmt.executeQuery();
											while (rs.next()) {
										int followingid = rs.getInt("fi_useridx");
										System.out.println("followingid = " + followingid);
									%>
									<li>
										<div class="ing_li">
											<div class="li_img">
												<a href="#"><img src="./images/person_icon.jpg" alt="프사"></a>
											</div>
											<div class="li_id">
												<p><%=rs.getString("otherfollow")%></p>
											</div>
											<div class="li_btn">
												<%
													if (cdao.getFollowingById(m_idx, followingid) > 0) {
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
												<input type="hidden" value="<%=followingid%>">
											</div>
										</div>
									</li>
									<%
										}
									}
									} catch (Exception e) {
										e.printStackTrace();
									}
									%>
								</div>
							</ul>

							<!--	<div class="body_h1">
								 <h1>회원님을 위한 추천</h1>
							</div>
							<ul>
								<div class="body_ing">
									<li>
										<div class="ing_li">
											<div class="li_img">
												<a href="#"><img src="./images/person_icon.jpg" alt="프사"></a>
											</div>
											<div class="li_id">
												<p>id</p>
											</div>
											<div class="li_btn li_btn2">
												<input type="button" value="팔로우" class="fw_btn">
											</div>

										</div>
									</li>
								</div>
							</ul>-->

						</div>
					</div>
				</div>
			</div>
			<li class="p_myTN1_list"><button class="p_lText2" href="#"
					style="cursor: pointer;">
					팔로우 <span class="p_lNum cntfollow"> <%=cdao.getCntFollow(m_idx)%></span>
				</button></li>
			<div class="fp2">
				<div class="follower_pop">
					<div class="fw_pop">
						<div class="pop_header">
							<div class="hd_left"></div>
							<h1 class="hd_h1">팔로워</h1>
							<div class="hd_right">
								<button class="exit_btn">&times;</button>
							</div>
						</div>
						<div class="pop_body">
							<ul>
								<div class="body_ing">
									<%
										try {
										Class.forName("org.mariadb.jdbc.Driver");
										conn = DriverManager.getConnection(url, uid, upw);
										if (conn != null) {
											sql = "SELECT m1.m_userid AS me , m2.m_userid AS ifollow, tb_following.fi_followingid  FROM tb_following";
											sql += " JOIN tb_member m1 ON tb_following.fi_useridx = m1.m_idx JOIN tb_member m2";
											sql += " ON tb_following.fi_followingid = m2.m_idx WHERE fi_useridx = ?";
											pstmt = conn.prepareStatement(sql);
											pstmt.setInt(1, m_idx);
											rs = pstmt.executeQuery();
											while (rs.next()) {
										int followingid = rs.getInt("fi_followingid");
										System.out.println("followingid = " + followingid);
									%>
									<li><input type="hidden" value="">
										<div class="ing_li">
											<div class="li_img">
												<a href="#"><img src="./images/person_icon.jpg" alt="#"></a>
											</div>
											<div class="li_id">
												<p><%=rs.getString("ifollow")%></p>
											</div>
											<div class="li_btn">
												<%
													if (cdao.getFollowingById(m_idx, followingid) > 0) {
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
												<input type="hidden" value="<%=followingid%>">
											</div>
										</div></li>
									<%
										}
									}
									} catch (Exception e) {
										e.printStackTrace();
									}
									%>
								</div>
							</ul>
							<!--  
                <div class="body_h1">
                    <h1>회원님을 위한 추천</h1>
                </div>
                <ul>
                    <div class="body_ing">
                        <li>
                            <div class="ing_li">
                                <div class="li_img">
                                    <a href="#"><img src="./images/person_icon.jpg" alt="#"></a>
                                </div>
                                <div class="li_id">
                                    <p>id</p>
                                </div>
                                <div class="li_btn li_btn2">
                                    <button class="fw_btn">팔로우</button>
                                </div>
                            </div>
                        </li>
                    </div>
                </ul>
                -->
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