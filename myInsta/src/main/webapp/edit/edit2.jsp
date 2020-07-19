<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./mainTitle.jsp" %>
</head>
<body>
<div id="wrap">
<form id="h_reform" action="changePassword.jsp?password=" >
	<%@ include file="./mainHead.jsp" %>
    <div id="container">
        <div class="main_rolling_pc box_inner">
            <!-- 이 아래부터는 각자알아서 알맞게 -->
            <div class="content">
                        <ul class="price1">
						    <li><a href="./edit1.jsp" class="price1_not_choice">프로필 편집</a></li>
						    <li><a href="./edit2.jsp" class="price1_choice">비밀번호 변경</a></li>
						    <li><a href="./edit3.jsp" class="price1_not_choice">앱 및 웹사이트</a></li>
						    <li><a href="./edit4.jsp" class="price1_not_choice">이메일 및 SMS</a></li>
						    <li><a href="./edit5.jsp" class="price1_not_choice">푸시 알림</a></li>
						    <li><a href="./edit6.jsp" class="price1_not_choice">연락처 관리</a></li>
						    <li><a href="./edit7.jsp" class="price1_not_choice">공개 범위 및 보안</a></li>
						    <li><a href="./edit8.jsp" class="price1_not_choice">로그인 활동</a></li>
						    <li><a href="./edit9.jsp" class="price1_not_choice">Instagram에서 보낸 이메일</a></li>
						</ul>
                        <div class="price2">
                            <div>
                                <div class="price2_nav">
                                    <div class="nav1 item_left"><a href="#"><img src="../jquery/Day1/images/sunny1.png" alt=""></a></div>
                                    <div class="nav2 item_right nav2_ft"><span>kakaotalk</span></div>
                                </div>
                                <div class="price2_main">
                                    
                                    <div class="price2_item">
                                        <div class="item_left"><label>이전 비밀번호</label></div>
                                        <div class="item_right"><input type="text" class="price_txt"></div>
                                    </div>
                                    <div class="price2_item">
                                        <div class="item_left"><label>새 비밀번호</label></div>
                                        <div class="item_right"><input type="text" class="price_txt"></div>
                                    </div>
                                    <div class="price2_item">
                                        <div class="item_left"><label>새 비밀번호 확인</label></div>
                                        <div class="item_right"><input type="text" class="price_txt"></div>
                                    </div>
                                    <div class="price2_item">
                                        <div class="item_left"></div>
                                        <div class="item_right last"><button class="btn">비밀번호 변경</button></div>
                                    </div>
                                    <div class="price2_item">
                                        <div class="item_left"></div>
                                        <div class="item_right last"><a href="#" class="a_blue txt2">비밀번호를 잊으셨나요?</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
            <!-- End -->   
		    </div>
        </div>
    </div>
	<%@ include file="./mainFooter.jsp" %>
</form>
</div>
</body>
</html>