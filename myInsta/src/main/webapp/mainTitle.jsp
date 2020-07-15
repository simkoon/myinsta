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
        	   
    </script>