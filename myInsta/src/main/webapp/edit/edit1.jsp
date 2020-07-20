<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<jsp:useBean class="insta.member.MemberDAO" id="mem_dao"/>
<jsp:useBean class="insta.member.MemberDTO" id="member"/>
<jsp:setProperty property="*" name="member"/>



<c:if test="${empty sessionScope.id }">   
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");

String userid=(String)session.getAttribute("id");
String intro=(String)session.getAttribute("intro");


	
	%>		
	<script>
		alert("로그인 후 이용해주세요.");
		location.href = "./login/login.jsp";
	</script>
</c:if>
<html>
<head>
<%@ include file="./mainTitle.jsp" %>
</head>
<body>
<script>
function checknumber() {
let hpCheck = RegExp(/^\d{3}-\d{3,4}-\d{4}$/);


if(h_reform.m_number.value!="") {
if(!hpCheck.test($("#m_number").val())){
    alert("휴대폰 형식에 맞게 입력하세요. ('-'포함)");
    $("#m_number").val("");
    $("#m_number").focus();
    return false;
  }
}
  return true;
}

</script>
<div id="wrap">

	<%@ include file="./mainHead.jsp" %>
    <div id="container">
    <form id="h_reform" action="edit1_ok.jsp" onsubmit="return checknumber()">
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
                                
                            
												
													
                               <div class="nav1 item_left"><a href="#"><img src="./uploads/${sessionScope.profile}" alt="" width="200"></a></div>
                                    <div class="nav2 item_right"><br><a href="#" class="a_blue"><p class="profilep">${sessionScope.id}</p></a></div>
                                </div>
                                <div class="price2_main">
                                    <div class="price2_item">
                                        <div class="item_left"><label>이름</label></div>
                                        <div class="item_right"><input type="text" value="${sessionScope.name}" class="price_txt" name="m_username"><br><span class="sub">사람들이 이름, 별명 또는 비즈니스 이름 등 회원님의 알려진 이름을
                                        <br>사용하여 회원님의 계정을 찾을 수 있도록 도와주세요.</span></div>
                                    </div>
                                    <div class="price2_item">
                                        <div class="item_left"><label>사용자 이름</label></div>
                                       
                                        <div class="item_right"><input type="text" value="${sessionScope.id}" class="price_txt" readonly></div>
                                    </div>
                                    <div class="price2_item">
                                        <div class="item_left"><label>웹 사이트</label></div>
                                        <div class="item_right"><input type="text" class="price_txt" value="${sessionScope.site}"  name="m_site"></div>
                                    </div>
                                    <div class="price2_item">
                                        <div class="item_left"><label>소개</label></div>
                                        <div class="item_right"><textarea name="m_intro">${sessionScope.intro}</textarea><br><span class="sub sub_re">개인정보</span><span class="sub sub_re2">비즈니스나 반려동물 등에 사용된 
                                                                          계정인 경우에도 회원님의 개인정보를 입력하세요. 공개프로필에는 포함되지 않습니다.</span></div>
                                        </div>                                   
                                    <div class="price2_item">
                                        <div class="item_left"><label>전화번호</label></div>
                                        <div class="item_right"><input type="text"  placeholder="(-)포함해서 입력해주세요."class="price_txt" name="m_number" id="m_number" value="${sessionScope.number}"></div>
                                    </div>
                                    <div class="price2_item">
                                        <div class="item_left"><label>성별</label></div>
                                        <div class="item_right"><input type="text" placeholder="성별" name="m_gender" value="${sessionScope.gender}" class="price_txt"></div>
                                    </div>                                 
                                    <div class="price2_item">
                                        <div class="item_left"></div>
                                        <div class="item_right last"><input type="submit" class="btn" value="제출"><a href="#" class="a_blue txt">회원 탈퇴</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>                       
                    </div>
            <!-- End -->         
        </div>
        </form>
    </div>
	<%@ include file="./mainFooter.jsp" %>

</div>
</body>
</html>