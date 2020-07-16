<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<title>Instagram</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./js/script.js"></script>
<style>
.p_myCBox label {
	display: inline-block;
	padding: 8px;
	color: #fff;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #0095f6;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: 4px;
}

.p_myCBox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
.fp { width: 100%; height: 100%;   display: none;
position: fixed; top:0px; left:0px; background-color: rgba(0,0,0,0.6);}
.fp2 { width: 100%; height: 100%;   display: none;
position: fixed; top:0px; left:0px; background-color: rgba(0,0,0,0.6);}
.follower_pop { width: 400px; height: 400px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%); background: #fff;
border: 1px solid #ccc; border-radius: 12px;}
.follower_pop .fw_pop { width: 100%; height: 43px; border-bottom: 1px solid #ccc;}
.follower_pop .fw_pop .pop_header { width: 100%; height: 100%; display: flex;}
.follower_pop .fw_pop .pop_header .hd_left, .follower_pop .fw_pop .pop_header .hd_right { height: 42px; width: 48px;}
.follower_pop .fw_pop .hd_h1 { font-size: 16px; text-align: center; margin: 0; height: 42px; width: 304px; font-weight: bold;
line-height: 24px; justify-content: center;}
.follower_pop .fw_pop .pop_header .hd_right { padding: 8px; box-sizing: border-box; background: 0 0;}
.follower_pop .fw_pop .pop_body { height: 357px; min-height: 200px; overflow-y: scroll; overflow-x: hidden;}
.follower_pop .fw_pop .pop_body ul { margin: 0; padding: 0;}
.follower_pop .fw_pop .pop_body ul .body_ing li { height: 46px; width: 383px; list-style: none;}
.body_ing .ing_li { display: flex; height: 46px; padding: 8px 16px; box-sizing: border-box;}
.body_ing .ing_li .li_img { width: 15%;}
.body_ing .ing_li .li_id { width: 65%; }
.body_ing .ing_li .li_btn { width: 20%;}
.body_ing .ing_li .li_btn input[type="button"] { width: 62px; height: 30px; background-color: #fff; border: 1px solid #ccc; 
color: #000; border-radius: 4px; font-weight: bold;}
.body_ing .ing_li .li_img a img { width: 30px; height: 30px; border: 1px solid #ccc; border-radius: 50%;}
.body_ing .ing_li .li_id p { font-size: 13px; line-height: 10px;}
.pop_body .body_h1 { width: 100%; height: 30px; padding-left: 16px;}
.pop_body .body_h1 h1 { font-size: 16px; font-weight: bold;}
.body_ing .ing_li .li_btn2 input[type="button"] { width: 62px; height: 30px; background-color: #0095f6; border: 1px solid #ccc; 
border-radius: 4px; font-weight: bold; color: white;}
.exit_btn { border: none; backgroun-color: white; height: 20px; width: 20px;}
</style> 
<link rel="stylesheet" href="cssAll/commonAll.css">
    <script>
        $(function(){
                $("#mybtn").click(function(){
                    $("#popup").fadeIn();
                });
                $("#popup").click(function(){
                    $("#popup").fadeOut();
                });
                $(".mybtn2").click(function(){
                    $("#popup2").fadeIn();
                });
                $(".pop2_btn").click(function(){
                    $("#popup2").fadeOut();
                });
            }); 
        	   
    </script>