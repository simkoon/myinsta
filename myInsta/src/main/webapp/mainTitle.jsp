<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<title>Instagram</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./js/script.js"></script> 
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
        $(() => {
     	   
            const setbtnActions1 = function () {
                console.log($(".btnFolloing"))
                $(".btnFolloing").on("click", function () {
                        if ($(this).val()=="팔로우") {
                            $(this).val("팔로잉").css("backgroundColor","white").css("color","black");

                        } else if($(this).val()=="팔로잉") {
                            $(this).val("팔로우").css("backgroundColor","#3897f0").css("color","white").css("border","1px solid #3897f0");
                        }
                    });
             
            };
            setbtnActions1();
        }  );  
        	   
    </script>