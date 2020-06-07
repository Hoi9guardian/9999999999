<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setContentType("text/html; charset=UTF-8");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>KIVIEW &mdash; Blog</title>

<%@ include file="../head.jsp"%>
<style type="text/css">
</style>
<script>
   $(function() {

      $("input[value='no']").on("click", function() {
         $("#question").show();
      })
      $("input[value='yes']").on("click", function() {
         $("#question").hide();
      })

      $("#select").on("change", function() {

         if ($("#select option:selected").text() == "기본 정보") {

            $("#basic").show();
            $("#member").hide();
            $("#board").hide();
         } else if ($("#select option:selected").text() == "게시판관리") {
            
            $("#basic").hide();
            $("#member").hide();
            $("#board").show();
         } else {
         
            $("#basic").hide();
            $("#member").show();
            $("#board").hide();
         }
      })

   })
</script>
</head>

<body id = "body">
   <%@include file="cafe_modal.jsp"%>
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
               <h1 class="mb-2 bread">키뷰 카페</h1>
               <p class="breadcrumbs">
                  <span class="mr-2"><a href="index.jsp">홈 <i
                        class="ion-ios-arrow-forward"></i></a></span> <span>키뷰카페 <i
                     class="ion-ios-arrow-forward"></i></span>
               </p>
            </div>
         </div>
      </div>
   </section>
   <!-- @@ header 끝 @@ -->


   <section class="ftco-section bg-light">
      <div class="container" style="margin-left: 30px;">
         <div class="row" style="width: 1400px; overflow: auto;">
            <!-- 카페 메뉴 -->
            <div class="col-lg-3 sidebar ftco-animate"
               style="padding: 25px; margin-right: 30px; background-color: white; border: 1px solid lightgray;">


               <%@include file="cafe_sidebar.jsp"%>

            </div>

            <!-- 카페 홈  -->

            <div id="home" class="col-lg-8 ftco-animate"
               style="padding: 25px; margin-left: 0px; background-color: white; border: 1px solid lightgray;">

               


               <!-- 기본 정보 -->
               
               
               
               
               <div id="basic">
                  <h2 class="mb-3">
                     <b>카페 가입 신청</b>
                  </h2>
                  <p>카페 가입을 위한 정보를 입력해주세요.</p>
                                    
                  <br>
                  
                  <form action="cafejoin.do" method="get">
                     <input type="hidden" name="cafe_no" value="${cafe_list[0].cafe_no }" />
                     <input type="hidden" name="member_no" value="${login.member_no }"/>
                     <input type="hidden" name="name" value="${login.member_id }">
                         <div class="form-group">
                           <label>카페명</label><br>
                           <p>${cafe_list[0].title }</p> 
                        </div>
                        <br> 
                        <div class="form-group">
                           <label>한줄 소개</label><br>
                           <p>${cafe_list[0].intro }</p>                           
                        </div>
                        <br>
                        <div class="form-group">
                           <label>${cafe_list[0].question }</label>&nbsp;<span style="color:red">*</span><br> 
                           <input type="text" size="95" placeholder="질문에 답변해주세요." name="answer" minlength="4", maxlength="50" required>   
                        </div>
                        <br>            
                        <div class="form-group" style="position: relative; left: 40%">
                       
                        <c:choose>
                           <c:when test="${cafe_list[0].restriction eq 'Y' }">
	                           <input type="hidden" name="signyn" value="Y"> 
	                           <input type="submit" value="바로 가입"    class="btn btn-primary py-3 px-5">
                           </c:when>
                           <c:when test="${cafe_list[0].restriction eq 'N' }">
	                           <input type="hidden" name="signyn" value="N"> 
	                           <input type="submit" value="가입 신청" class="btn btn-primary py-3 px-5">
                           </c:when>
                          
                        </c:choose>   
                        </div>
   

                  </form>
               </div>
            </div>
         </div>
      </div>
   </section>


   <!-- @@ footer 영역 @@ -->
   <%@ include file="../footer.jsp"%>



   

</body>
</html>