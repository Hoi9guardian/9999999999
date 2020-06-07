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
<title>KIVIEW &mdash; Mypage</title>

<style>
input {
   border-top: 0px;
   border-left: 0px;
   border-right: 0px;
   outline: none;
}

label {
   color: black;
   font-weight: bold;
}

#mypage{
	color:black;
	font-weight:bold;
}

.mypageUpdateMsg{
   color:red;
   font-size:15px;
}
</style>

<%@ include file="../head.jsp"%>

</head>
<body id="body">


   <!-- @@ header 부분 @@ -->
   <%@ include file="../header.jsp"%>

   <!-- header 밑 이미지 -->
   <section class="hero-wrap hero-wrap-2"
      style="background-image: url('resources/images/main/mypage_img02.png');">
      <!-- <div class="overlay"></div> -->
      <div class="container">
         <div
            class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
               <h1 class="mb-2 bread">마이페이지</h1>
               <p class="breadcrumbs">
                  <span class="mr-2"><a href="index.jsp">홈 <i class="ion-ios-arrow-forward"></i></a></span>
                  <span>마이페이지 <i class="ion-ios-arrow-forward"></i></span>
                  <span>내 정보 <i class="ion-ios-arrow-forward"></i></span>
               </p>
            </div>
         </div>
      </div>
   </section>
   <!-- @@ header 끝 @@ -->


   <section class="ftco-section bg-light">
      <div class="container">
         <div class="row" style="width: 100%">
            <!-- 사이드 메뉴 -->
            <%@include file="kiview_my_sidebar.jsp" %>

            <!-- 마이페이지  -->

            <div class="col-lg-8 ftco-animate"
               style="padding: 40px; background-color: white; border: 1px solid lightgray;">
               <h2>
                  <b>내 정보</b>
               </h2>
               <p style="font-size: 13px;">회원정보는 개인정보처리방침에 따라 안전하게 보호되며, 동의없이 공개 또는 제 3자에게 제공되지 않습니다.</p>
               <form method="post" action="kiviewdelete.do" id="deleteform">
                  <label>이 름</label><br>
                  <input type="text" value="${login.member_name}" readonly="readonly"
                     style="width: 80%" readonly id="member_name"> <br> <br>
                  <label>아이디</label><br>
                  <input type="text" value="${login.member_id}" readonly="readonly"
                     style="width: 80%" readonly id="member_id"> <br> <br>
                  <input type="button" onclick="memberDel();" class="btn btn-secondary"
                     style="position: relative; left: 35%; width: 30%" value="회원 탈퇴">
               </form>
            </div>

 
            <div class="col-lg-8 ftco-animate"
               style="padding: 40px; background-color: white; border: 1px solid lightgray; margin-top: 30px; margin-left: 318px">
               <h2>
                  <b>개인정보수정</b>
               </h2>
               <p style="font-size: 13px;">회원정보는 개인정보처리방침에 따라 안전하게 보호되며, 동의없이 공개 또는 제 3자에게 제공되지 않습니다.</p>
  

               <form method="post" action="kiviewupdate.do" id="mypageUpdateForm">
                  <input type="hidden" name="member_id" value="${login.member_id}">
                  <br>
                  <label>비밀번호</label><span class="mypageUpdateMsg" id="mypagePwdMsg" style="color: red;"></span><br>
                  <input type="password" name="member_pwd" placeholder="비밀번호" style="width: 80%" id="mypagePwd">
                  <br><br>
                  <label>비밀번호 확인</label><span class="mypageUpdateMsg" id="mypagePwdChkMsg" style="color: red;"></span><br>
                  <input type="password" placeholder="비밀번호 확인" style="width: 80%" id="mypagePwdChk"  onkeyup="pwdCkMsgClear()" >
                  <br><br>
                  <label>주소</label><span class="mypageUpdateMsg" id="mypageAddrMsg" style="color: red;"></span><br>
                  <input type="text" value="${login.member_addr}" name="member_addr" style="width: 65%" id="mypageAddr">
                  <input type="button" class="btn btn-primary" value="주소 검색" onclick="addrPopup()">
                  <br><br>
                   <label>연락처</label><span class="mypageUpdateMsg" id="mypagePhoneMsg" style="color: red;"></span><br>
                  <input type="text" name="member_phone" value="${login.member_phone}" style="width: 80%" id="mypagePhone">
                  <br><br>
                  <label>이메일</label><span class="mypageUpdateMsg" id="mypageEmailMsg" style="color: red;"></span><br>
                  <input type="text" name="member_email" value="${login.member_email}" style="width: 80%" id="mypageEmail">
                  <br><br><br>
                  <input type="button" class="btn btn-secondary" style="position: relative; left: 35%; width: 30%" value="수정" onclick="mypageUpdate()">
                  
               </form>

            </div>

         </div>

 
      </div>

   </section> 

   <!-- @@ footer 영역 @@ -->
   <%@ include file="../footer.jsp"%>


   <!-- @@ script 영역 @@ -->
   <script type="text/javascript" src="resources/js/mypage.js?version=1.0"></script>




</body>
</html>