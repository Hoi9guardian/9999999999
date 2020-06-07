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
<title>KIVIEW &mdash; 카페</title>

<%@ include file="../head.jsp"%>

</head>
<body id = "body">
<%@include file="cafe_modal.jsp" %>
   <!-- @@ header 부분 @@ -->
   <%@ include file="../header.jsp"%>
<%@include file="cafe_modal.jsp" %>
   <!-- @@ <h1 class = "mb-2 bread"> sub title 이 부분 우선 header에서 따로 빼놨어요!!! </h1> @@ -->
   <section class="hero-wrap hero-wrap-2"
      style="background-image: url('resources/images/main/board_img03.png');">
     <!--  <div class="overlay"></div> -->
      <div class="container">
         <div
            class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
               <h1 class="mb-2 bread">키뷰 카페</h1>
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


   <section class="ftco-section bg-light">
      <div class="container" style="margin-left: 30px;">
         <div class="row" style="width: 1400px; overflow: auto;">
            <!-- 카페 메뉴 -->
            <div class="col-lg-3 sidebar ftco-animate" style="padding:25px; margin-right:30px;  background-color:white; border:1px solid lightgray;" >


               <%@include file="cafe_sidebar.jsp" %>
               







            </div>

            <!-- 카페 홈  -->

            <div class="col-lg-8 ftco-animate"
               style="padding: 25px; margin-left: 0px; background-color: white; border: 1px solid lightgray ; "> 
               <h2 class="mb-3">
                  <b># ${cafe_list[0].title }</b>
               </h2>
               <hr>

               <p > 
                  <img src="resources/upload/${cafe_list[0].background }" 
                  style="heigth:50%; width:50%; position:relative; left:25%"
                  class="img-fluid">
               </p>

               <p style="text-align:center">${cafe_list[0].intro }</p>  

               <br> <br>
            </div>



         </div>






      </div>
   </section>


   <!-- @@ footer 영역 @@ -->
   <%@ include file="../footer.jsp"%>



   

</body>
</html>