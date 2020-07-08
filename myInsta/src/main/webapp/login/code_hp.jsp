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
  	<div id="container">
        <div class="main_rolling_pc box_inner">
            <!-- 이 아래부터는 각자알아서 알맞게 -->
            <article class="aut_main">
                <div class="aut_container">
                    <div class="aut_box">
                        <div class="aut_imgphone"></div>
                        <h3>마지막 단계</h3>
                        <p class="txtalert"></p>
                        <p><span class="phonenumber"></span>번으로 전송된 6자리 코드를 입력하세요</p>
                        <div class="authentication">
                            <div class="txtinput">
                                <input class="aut_txt" type="text" placeholder="######" maxlength="6">
                                <input type="button" class="aut_btn" value="확인">
                            </div>
                        </div>
                        <a class="aut_newcode">새 코드 요청하기</a>
                        </div>
                    </div>
                    <div class="aut_back">
                        <a href="./join.jsp">돌아가기</a>
                    </div>
            </article>
        </div>
    </div>
	<%@ include file="./mainFooter.jsp" %>
</form>
</div>
</body>
