<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./mainTitle.jsp" %>
</head>
<body>
<div id="wrap">
<form id="h_reform">
	<%@ include file="./mainHead.jsp" %>
    <div id="container">
        <div class="main_rolling_pc box_inner">
            <!-- 이 아래부터는 각자알아서 알맞게 -->
            <div class="content">
                        <ul class="price1">
						    <li><a href="./edit1.jsp" class="price1_choice">프로필 편집</a></li>
						    <li><a href="./edit2.jsp" class="price1_not_choice">비밀번호 변경</a></li>
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
                                    <div class="nav1 item_left"><a href="#"><img src="images/search_icon.png" alt=""></a></div>
                                    <div class="nav2 item_right"><span>kakaotalk</span><br><a href="#" class="a_blue">프로필 사진 바꾸기</a></div>
                                </div>
                                <div class="price2_main">
                                    <div class="price2_item">
                                        <div class="item_left"><label>이름</label></div>
                                        <div class="item_right"><input type="text" class="price_txt"><br><span class="sub">사람들이 이름, 별명 또는 비즈니스 이름 등 회원님의 알려진 이름을
                                        <br>사용하여 회원님의 계정을 찾을 수 있도록 도와주세요.</span><span class="sub">이름은 14일 안에 두 번만 변경할 수 있습니다.</span></div>
                                    </div>
                                    <div class="price2_item">
                                        <div class="item_left"><label>사용자 이름</label></div>
                                        <div class="item_right"><input type="text" class="price_txt"></div>
                                    </div>
                                    <div class="price2_item">
                                        <div class="item_left"><label>웹 사이트</label></div>
                                        <div class="item_right"><input type="text" class="price_txt"></div>
                                    </div>
                                    <div class="price2_item">
                                        <div class="item_left"><label>소개</label></div>
                                        <div class="item_right"><textarea></textarea><br><span class="sub sub_re">개인정보</span><span class="sub sub_re2">비즈니스나 반려동물 등에 사용된 
                                            계정인 경우에도 회원님의 개인정보를 입력하세요. 공개프로필에는 포함되지 않습니다.</span></div>
                                        </div>
                                    <div class="price2_item">
                                        <div class="item_left"><label>이메일</label></div>
                                        <div class="item_right"><input type="text" class="price_txt"></div>
                                    </div>
                                    <div class="price2_item">
                                        <div class="item_left"><label>전화번호</label></div>
                                        <div class="item_right"><input type="text" class="price_txt"></div>
                                    </div>
                                    <div class="price2_item">
                                        <div class="item_left"><label>성별</label></div>
                                        <div class="item_right"><input type="text" placeholder="성별" class="price_txt"></div>
                                    </div>
                                    <div class="price2_item">
                                        <div class="item_left"><label>비슷한 계정 추천</label></div>
                                        <div class="item_right"><input type="checkbox"><span class="sub sub_re3">팔로우 할만한 비슷한 계정을 추천할 때 회원님의 계정을 포함합니다.</span></div>
                                    </div>
                                    <div class="price2_item">
                                        <div class="item_left"></div>
                                        <div class="item_right last"><button class="btn">제출</button><a href="#" class="a_blue txt">계정을 일시적으로 비활성화</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            <!-- End -->   
        </div>
    </div>
	<%@ include file="./mainFooter.jsp" %>
</form>
</div>
</body>
</html>