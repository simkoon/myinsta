<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="mainTitle.jsp" %>
</head>
<script type="text/javascript">
$(document).ready(function (e){
    $("input[type='file']").change(function(e){

      //div 내용 비워주기
      $('.u_Bimg').empty();

      var files = e.target.files;
      var arr =Array.prototype.slice.call(files);
      
      //업로드 가능 파일인지 체크
      for(var i=0;i<files.length;i++){
        if(!checkExtension(files[i].name,files[i].size)){
          return false;
        }
      }
      
      preview(arr);
      
      
    });//file change
    
    function checkExtension(fileName,fileSize){

      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 20971520;  //20MB
      
      if(fileSize >= maxSize){
        alert('파일 사이즈 초과');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      
      if(regex.test(fileName)){
        alert('업로드 불가능한 파일이 있습니다.');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      return true;
    }
    
   
    
    function preview(arr){
      arr.forEach(function(f){      
        //div에 이미지 추가
        var str = '<div style="display: inline-flex; padding: 5px;"><li>';
        
        //이미지 파일 미리보기
        if(f.type.match('image.*')){
          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100% height=100% />';
            str += '</li></div>';
            $(str).appendTo('.u_Bimg');
          } 
          reader.readAsDataURL(f);
        }else{
          str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100% height=100% />';
          $(str).appendTo('.imgboxs');
        }
      });//arr.forEach
    }
  });
  
$(function(){
	
	const setbtnAction = function(){
		$(".modal2_close").on("click", function(){
			$("#madallist").remove();
			$(".taglist").css("display","block");
		});
	};
	$("body").keyup(function(){
		if($("#utextarea").val() != ""){
			$(".upbtn_on").addClass("on");
		}else{
			$(".upbtn_on").removeClass("on");
		}
	});
	$("#a_add").click(function(){
		if($("#utextarea").val() != ""){
			$(".upbtn_on").addClass("on");
		}else{
			$(".upbtn_on").removeClass("on");
		}
	});
	
	$(".taglist").click(function(){
		$(".modal2__content").addClass("on");
	});
	
	
	let data;	
	$(".taglist").on("click", function(){
			$(".taglist").css("display","none");
			data = $(".modal2__content.on").append('<p id="madallist" class="madallist">@ '+($(this).val())+'  <button type="button" class="modal2_close"> &times;</button></p>');
			setbtnAction();
			
		$("#tagaddtn").click(function() {
			$("#taglistvalue").append(data);
			$(".modal2__content").removeClass("on");
			if (data !=null) {
				$(".upbtn_on").addClass("on");
			}else {
				$(".upbtn_on").removeClass("on");
			}
		});
		
	});
	
});

</script>
<body>
<div id="wrap">
	<%@ include file="mainHead.jsp" %>
    <div id="container">
        <div class="main_rolling_pc box_inner">
            <!-- 이 아래부터는 각자알아서 알맞게 -->
            <div id="page_myPage"> 
     			<%@ include file="myPageHeader.jsp" %>
     			<div id="p_myList">
                            <a class="p_myL" href="./mypage.jsp">
                                <span class="p_mLimg">
                                    <svg aria-label="게시물" class="ico_btn" fill="#262626" height="12" viewBox="0 0 48 48" width="12">
                                        <path clip-rule="evenodd" d="M45 1.5H3c-.8 0-1.5.7-1.5 1.5v42c0 .8.7 1.5 1.5 1.5h42c.8 0 1.5-.7 1.5-1.5V3c0-.8-.7-1.5-1.5-1.5zm-40.5 3h11v11h-11v-11zm0 14h11v11h-11v-11zm11 25h-11v-11h11v11zm14 0h-11v-11h11v11zm0-14h-11v-11h11v11zm0-14h-11v-11h11v11zm14 28h-11v-11h11v11zm0-14h-11v-11h11v11zm0-14h-11v-11h11v11z" fill-rule="evenodd"></path>
                                    </svg>
                                    <span class="p_mLText">게시물</span>
                                </span>
                            </a>
                            <a class="p_myL p_Using" href="./myupdate.jsp">
                                <span class="p_mLimg">
                                    <svg aria-label="게시물올리기" class="ico_btn" fill="#262626" height="12" viewBox="0 0 48 48" width="12">
                                        <path d="M41 10c-2.2-2.1-4.8-3.5-10.4-3.5h-3.3L30.5 3c.6-.6.5-1.6-.1-2.1-.6-.6-1.6-.5-2.1.1L24 5.6 19.7 1c-.6-.6-1.5-.6-2.1-.1-.6.6-.7 1.5-.1 2.1l3.2 3.5h-3.3C11.8 6.5 9.2 7.9 7 10c-2.1 2.2-3.5 4.8-3.5 10.4v13.1c0 5.7 1.4 8.3 3.5 10.5 2.2 2.1 4.8 3.5 10.4 3.5h13.1c5.7 0 8.3-1.4 10.5-3.5 2.1-2.2 3.5-4.8 3.5-10.4V20.5c0-5.7-1.4-8.3-3.5-10.5zm.5 23.6c0 5.2-1.3 7-2.6 8.3-1.4 1.3-3.2 2.6-8.4 2.6H17.4c-5.2 0-7-1.3-8.3-2.6-1.3-1.4-2.6-3.2-2.6-8.4v-13c0-5.2 1.3-7 2.6-8.3 1.4-1.3 3.2-2.6 8.4-2.6h13.1c5.2 0 7 1.3 8.3 2.6 1.3 1.4 2.6 3.2 2.6 8.4v13zM34.6 25l-9.1 2.8v-3.7c0-.5-.2-.9-.6-1.2-.4-.3-.9-.4-1.3-.2l-11.1 3.4c-.8.2-1.2 1.1-1 1.9.2.8 1.1 1.2 1.9 1l9.1-2.8v3.7c0 .5.2.9.6 1.2.3.2.6.3.9.3.1 0 .3 0 .4-.1l11.1-3.4c.8-.2 1.2-1.1 1-1.9s-1.1-1.2-1.9-1z"></path>
                                    </svg>
                                    <span class="p_mLText">게시물올리기</span>
                                </span>
                            </a>
                            <a class="p_myL" href="./mysaved.jsp">
                                <span class="p_mLimg">
                                    <svg aria-label="저장됨" class="ico_btn" fill="#262626" height="12" viewBox="0 0 48 48" width="12">
                                        <path d="M43.5 48c-.4 0-.8-.2-1.1-.4L24 29 5.6 47.6c-.4.4-1.1.6-1.6.3-.6-.2-1-.8-1-1.4v-45C3 .7 3.7 0 4.5 0h39c.8 0 1.5.7 1.5 1.5v45c0 .6-.4 1.2-.9 1.4-.2.1-.4.1-.6.1zM24 26c.8 0 1.6.3 2.2.9l15.8 16V3H6v39.9l15.8-16c.6-.6 1.4-.9 2.2-.9z"></path>
                                    </svg>
                                    <span class="p_mLText">저장됨</span>
                                </span>
                            </a>
                            <a class="p_myL" href="./mytagged.jsp">
                                <span class="p_mLimg">
                                    <svg aria-label="태그됨" class="ico_btn" fill="#262626" height="12" viewBox="0 0 48 48" width="12">
                                        <path d="M41.5 5.5H30.4c-.5 0-1-.2-1.4-.6l-4-4c-.6-.6-1.5-.6-2.1 0l-4 4c-.4.4-.9.6-1.4.6h-11c-3.3 0-6 2.7-6 6v30c0 3.3 2.7 6 6 6h35c3.3 0 6-2.7 6-6v-30c0-3.3-2.7-6-6-6zm-29.4 39c-.6 0-1.1-.6-1-1.2.7-3.2 3.5-5.6 6.8-5.6h12c3.4 0 6.2 2.4 6.8 5.6.1.6-.4 1.2-1 1.2H12.1zm32.4-3c0 1.7-1.3 3-3 3h-.6c-.5 0-.9-.4-1-.9-.6-5-4.8-8.9-9.9-8.9H18c-5.1 0-9.4 3.9-9.9 8.9-.1.5-.5.9-1 .9h-.6c-1.7 0-3-1.3-3-3v-30c0-1.7 1.3-3 3-3h11.1c1.3 0 2.6-.5 3.5-1.5L24 4.1 26.9 7c.9.9 2.2 1.5 3.5 1.5h11.1c1.7 0 3 1.3 3 3v30zM24 12.5c-5.3 0-9.6 4.3-9.6 9.6s4.3 9.6 9.6 9.6 9.6-4.3 9.6-9.6-4.3-9.6-9.6-9.6zm0 16.1c-3.6 0-6.6-2.9-6.6-6.6 0-3.6 2.9-6.6 6.6-6.6s6.6 2.9 6.6 6.6c0 3.6-3 6.6-6.6 6.6z"></path>
                                    </svg>
                                    <span class="p_mLText">태그됨</span>
                                </span>
                            </a>
                        </div>
                        <form method="post" action="myupdate_ok.jsp" enctype="multipart/form-data">
                        <div id="p_myContent">
                            <div class="udDate_Box">
                                <div class="u_Box">
                                    <div class="u_Bimg">
                                            <div class="imgBox">
                                                <img src="images/camera.png" id="display" alt="사진 추가">
                                            </div>
                                           	<div class="tbox">
                                            <label for="ex_filename" name="mc_file">사진 추가하기</label>
                           					<input type="file" id="ex_filename" name="mc_file"/>
                                           	</div>
                                    </div>
                                    <div class="imgboxs">
                                    </div>
                                    <div class="u_text">
                                        <textarea id="utextarea" name="mc_content"  placeholder="What's happening?"></textarea>
                                    </div>
                                    <!-- 팝업 -->
                                    <a href="#modal" class="modal-open">
                                    <div class="a_add" name="mc_taggedid" id="a_add">
                                        <div class="a_imgBox1">
                                            <img src="images/tag_icon2.PNG" alt="사람태그하기">
                                        </div>
                                        <p class="ap_text">사람 태그하기</p>
                                        <div class="ap_imgBox2">
                                            <img src="images/arrow_icon.png" alt="화살표 사람태그하기">
                                        </div>
                                    </div>
                                    </a>
                                    
                                    <!-- 팝업창  -->
                                    <div class="modal" id="modal">
									    <div class="modal__content">
									        <div class="modal__haad">
									            <div class="modal__heading">
									                <input type="text" placeholder="사람검색..." class="modal__heading2">
									                <a href="#" class="modal__close">&times;</a>
									            </div>
									        </div>
									        <!-- 사람 목록 -->
									        <div class="modal__paragraph">
									            <ul>
									                <li>
									                	<button class="taglist" type="button" value="gyomin_s">
									                    <div class="tag_userimg"><img src="./images/person_icon.jpg" alt="사람이미지"></div>
									                    <p class="tag_userid">gyomin_s</p>
									                    <p class="tag_username">백교민</p>
									                    </button>
									                </li>
									            </ul>
									        </div>
									        <div class="modal2__content">
									        <input class="tagvalue" type="hidden" >
									        </div>
									        <div class="tagadd"> 
									        <a href="#">
									        <input type="button" value="태그하기" id="tagaddtn">
									        </a>
									        </div>
									    </div>
									</div>
                                    
                                    
                                    <div id="taglistvalue" class="taglistvalue"></div>
                                    <div class="upbtn"><input type="submit" value="게시물 올리기" class="upbtn_on" ></div>
                                </div>
                            </div>
                        </div>
                        </form>
     			
             <!-- End -->   
            </div>
        </div>
    </div>
	<%@ include file="mainFooter.jsp" %>
</div>
</body>
</html>