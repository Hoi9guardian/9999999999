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
<html>
<head>
<meta charset="UTF-8">
<title>KIVIEW &mdash; Resister_Option</title>

<link rel="stylesheet" href="resources/css/signup-option.css">
<!-- KIVIEW FAVICON-->
<link rel="icon" href="resources/images/main/logo01.png"
   type="image/x-icon">
</head>
<body>

   <div id="__next">
      <div class="jsx-253692965 join-page">
         <div class="jsx-596849754 join-user-step-one">
            <!-- 로고 타이틀 -->
            <div class="jsx-669562709 join-title">
               <div class="jsx-669562709 join-title-wrap">
                  <a class="jsx-669562709" href="index.do"> 
                  <img src="resources/images/main/login-logo01.png" alt="Kiview로고" class="jsx-669562709">
                  </a>
                  <h2 class="jsx-669562709">
                     <span class="jsx-669562709">Kiview</span>
                     <span class="jsx-669562709">회원가입</span>
                     <span class="jsx-669562709 mobile-service">회원가입</span>
                  </h2>
               </div>
               <p class="jsx-669562709">가입방법을 선택해주세요.</p>
            </div>
            <!-- /로고 타이틀 -->

            <ul class="jsx-596849754">
               <!-- 일반 회원가입 -->
               <li class="jsx-500558648 email">
                  <a href="kiviewsignup.do" tabindex="0" class="jsx-500558648">
                     <div class="jsx-500558648 flex-wrap">
                        <img src="https://d1ta1myjmiqbpz.cloudfront.net/static/images/join_login/img_join_email01.png"
                           alt="" class="jsx-500558648">
                        <h3 class="jsx-500558648">KIVIEW로 회원가입</h3>
                        <p class="jsx-500558648">Kiview 아이디로 가입하기</p>
                     </div>
                  </a>
               </li>
               <!-- /일반 회원가입 -->

               <!-- 네이버 회원가입 -->
               <li class="jsx-500558648 naver">
                  <a href="${naver_url }" tabindex="0" class="jsx-500558648">
                        <div class="jsx-500558648 flex-wrap">
                           <img src="https://d1ta1myjmiqbpz.cloudfront.net/static/images/join_login/img_join_naver01.png"
                              alt="네이버 로고" class="jsx-500558648">
                           <h3 class="jsx-500558648">네이버 간편회원가입</h3>
                           <p class="jsx-500558648">사용하는 네이버 계정으로 가입하기</p>
                           <span class="jsx-500558648 arrow"> </span>
                        </div>
                  </a>
               </li>
               <li class="jsx-500558648 kakao">
                  <a href="${kakao_url }" tabindex="0" class="jsx-500558648">
                     <div class="jsx-500558648 flex-wrap">
                        <img src="https://d1ta1myjmiqbpz.cloudfront.net/static/images/join_login/img_join_kakao01.png"
                           alt="카카오톡 로고" class="jsx-500558648">
                        <h3 class="jsx-500558648">카카오톡 간편회원가입</h3>
                        <p class="jsx-500558648">사용하는 카카오톡 계정으로 가입하기</p>
                        <span class="jsx-500558648 arrow"> </span>
                     </div>
                  </a>
               </li>
               <!--
               <li class="jsx-500558648 facebook">
                  <a href="${google_url }" tabindex="0" class="jsx-500558648">
                     <div class="jsx-500558648 flex-wrap">
                        <img src=""
                           alt="페이스북 로고" class="jsx-500558648">
                        <h3 class="jsx-500558648">구글 간편회원가입</h3>
                        <p class="jsx-500558648">사용하는 구글 계정으로 가입하기</p>
                        <span class="jsx-500558648 arrow"></span>
                     </div>
                  </a>
               </li>
                 -->
            </ul>
            <div class="jsx-596849754 login-link">이미 계정이 있으신가요?
               <a class="jsx-596849754" href="login.do">로그인</a>
            </div>
         </div>
         <address class="jsx-253692965">Copyright © Kiview Corp. All Rights Reserved.</address>
      </div>
      <div class="jsx-2567582721 reviews"></div>
      <div id="topmost" class="jsx-2567582721"></div>
   </div>




</body>
</html>






