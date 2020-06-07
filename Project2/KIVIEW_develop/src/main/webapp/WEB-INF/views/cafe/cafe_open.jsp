<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>KIVIEW &mdash; 카페 개설</title>

<%@ include file="../head.jsp"%>
<style type="text/css">
label{
   color:black;
   font-weight:bold;
}
</style>
<script>
$(function(){
   $("input[value='no']").on("click",function(){
      $("#question").show();
   })
   $("input[value='yes']").on("click",function(){
      $("#question").hide();
   })
})

function check(){
	if(${login==null}){
		alert("로그인이 필요합니다.");
		
		return false;
	
	}
	
	if(do_chk()==false){
		alert("해당 카페명은 이미 사용중입니다.")
		return false;
	}
	
	
	function do_chk(){
		
		var submit = true;
	
		$.ajax({
			url:"cafechk.do",
			type:"post",
			async : false,
			data:{"title":$("input[name='title']").val()},
			dataType:"JSON",
			success:function(data){
				
				if(data.check==false){
					$("#check").append("<a>카페명이 중복됩니다.</a>")
					submit = false;
				} 
				
				
			},
			error:function(error){
				alert(error)
			}
		})
		
		return submit;
	
	}
	
	return true;
}

</script>
</head>
<body id = "body">

   <!-- @@ header 부분 @@ -->
   <%@ include file="../header.jsp"%>

   <!-- @@ <h1 class = "mb-2 bread"> sub title 이 부분 우선 header에서 따로 빼놨어요!!! </h1> @@ -->
   <section class="hero-wrap hero-wrap-2"
      style="background-image: url('resources/images/main/board_img03.png');">
      <!-- <div class="overlay"></div> -->
      <div class="container">
         <div
            class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
               
               <h1 class="mb-2 bread">키뷰 개설</h1>
               <p class="breadcrumbs">
                  <span class="mr-2"><a href="index.do">홈 <i
                        class="ion-ios-arrow-forward"></i></a></span> <span>키뷰카페 <i
                     class="ion-ios-arrow-forward"></i></span>
               </p>
            </div>
         </div>
      </div>
   </section>
   <!-- @@ header 끝 @@ -->




   <section class="ftco-section">
      <div class="container">
         <a href="cafehome.do">
               <h2 class="mb-3" style="font-weight: bold; color: #FFDC00;">
                  <span><img src="resources/images/main/chat.png" /></span>&nbsp;&nbsp;
                  <span style="color: #9BDAF2;">Kiview</span> Cafe
               </h2>
               </a>
         <hr>

         
         <div class="row d-flex align-items-stretch no-gutters">
            <div class="col-md-6 p-4 p-md-5 order-md-last bg-light">
               
               <!-- 카페 개설 폼 -->
               <form:form action="cafeinsert.do" onsubmit="return check();" method="post" enctype="multipart/form-data">
               	<input type="hidden" name="admin" value="${login.member_id }">
               	<input type="hidden" name="member_no" value="${login.member_no }">
                  <div class="form-group">
                     <label>카페명</label><br>
                     <input name="title" type="text" class="form-control" placeholder="카페명을 입력하세요."
                      minlength="4" maxlength="30" required><span id="check"></span>
                  </div>
                  <div class="form-group">
                     <label>대표 썸네일</label><br>
                     <input type="file"  name="file1" accept="image/*" required>
                  </div>
               
                  <div class="form-group">
                     <label>배경 이미지</label><br> 
                     <input type="file"  name="file2" accept="image/*" required>
                  </div>
                  
                  <div id="restriction" class="form-group">
                     <label>가입 방식</label><br>
                     
                     <input type="radio" value="Y" name="restriction" checked="true"> 바로 가입 
                     <br>
                     <input type="radio" value="N" name="restriction"> 승인 후 가입
                      
                  </div>
                  
                  <div id="question" class="form-group" >
                        <label>가입 질문</label><br> <input type="text" name="question"
                           size="55" placeholder="가입시 질문을 입력하세요."
                           minlength="4" maxlength="100" required>


                  </div>
                  
                  
                   
               
                  <div class="form-group">
                     <label>한줄 소개</label><br>
                     <textarea name="intro" id="" cols="30" rows="7" class="form-control"
                        placeholder="간단한 소개글을 입력하세요."  minlength="4" maxlength="100" required></textarea>
                  </div>
                  
                  
                  <div class="form-group">
                     <br>
                     <input type="submit" value="개  설" 
                        class="btn btn-secondary py-3 px-5"
                        style="position:relative; left:18%"
                        >
                        
                     <input type="button" value="취  소"
                        class="btn btn-primary py-3 px-5"
                        onclick="location.href='cafehome.do'"
                           style="position:relative; left:22%"
                        >
                  </div>
               </form:form>
            </div>
            <div class="col-md-6 d-flex align-items-stretch">
               <img src="resources/images/main/kiview_01.png" alt="" class="img-fluid">
            </div>
         </div>

      </div>
   </section>


   <!-- @@ footer 영역 @@ -->
   <%@ include file="../footer.jsp"%>


   

</body>
</html>