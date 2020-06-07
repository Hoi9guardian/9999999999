<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html;charset=UTF-8"); %>
<!DOCTYPE html>
<html lang="ko">
   <!-- head -->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="author" content="Jobboard">
    
<title>넌 그럴 자격이 있어-넌그자</title>


 <!-- Favicon -->
    <link rel="shortcut icon" href="assets/img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css">    
    <link rel="stylesheet" href="assets/css/jasny-bootstrap.min.css" type="text/css">  
    <link rel="stylesheet" href="assets/css/bootstrap-select.min.css" type="text/css">  
    <!-- Material CSS -->
    <link rel="stylesheet" href="assets/css/material-kit.css" type="text/css">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css" type="text/css"> 
    <link rel="stylesheet" href="assets/fonts/themify-icons.css"> 

    <!-- Animate CSS -->
    <link rel="stylesheet" href="assets/extras/animate.css" type="text/css">
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="assets/extras/owl.carousel.css" type="text/css">
    <link rel="stylesheet" href="assets/extras/owl.theme.css" type="text/css">
    <!-- Rev Slider CSS -->
    <link rel="stylesheet" href="assets/extras/settings.css" type="text/css"> 
    <!-- Slicknav js -->
    <link rel="stylesheet" href="assets/css/slicknav.css" type="text/css">
    <!-- Main Styles -->
    <link rel="stylesheet" href="assets/css/main.css" type="text/css">
    <!-- Responsive CSS Styles -->
    <link rel="stylesheet" href="assets/css/responsive.css" type="text/css">

    <!-- Color CSS Styles  -->
    <link rel="stylesheet" type="text/css" href="assets/css/colors/red.css" media="screen" />



</head>



<body>

 <!-- 1 -->
      <!-- --------------------------------------------------------------------------------------------------------------------------------------------------------- --> 
      <div class="header">    
        <!-- Start intro section -->
        <section id="intro" class="section-intro">
        
           <!-- ---------------------------------------------------------------------------------------------------------------------- -->
           <!-- 메인화면 상단바 -->
          <div class="logo-menu" style = "background : url('assets/img/bg/black.jpg')">
            <nav class="navbar navbar-default" role="navigation" data-spy="affix" data-offset-top="50">
            
               <!-- -------------------------------------------------------------------------------------------------- -->
                <div class="container">
                <!-- 메인 화면/ 맨위의 메뉴바 -->
                <div class="navbar-header">
                  <!-- button -> 클릭시 id(navbar)인 부분의 데이터 출력 -->
                  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                  <!-- 로고 -> 클릭시에 다시 main으로 -->
                  <a class="navbar-brand logo" href="index.jsp"><img src="assets/img/logo.png" alt=""></a>
                </div><!-- class = navbar-header -->

            <!-- -------------------------------------------------------------------------------------------------- -->
            <!-- 여기서 부터 분리한 이유는 로고는 반응형웹이나 기존이나 같은 것을 쓰기에 두번 반복해서 사용하지 않음 -->
            <!-- 메인화면의 메뉴바 시작 -->
            <!-- 메인화면/ 맨위의 메뉴바에 출력될 데이터 -->
                <div class="collapse navbar-collapse" id="navbar">  
                <!-- -------------------------------------------------------------------------------------------------- -->
               
              
<%

   if(session.getAttribute("vo")==null||session.getAttribute("vo")==""){

%>              
                <!-- -------------------------------------------------------------------------------------------------- -->
                <!-- 로그인 -->
                <!-- 메인화면의 윗줄 -->
                <ul class="nav navbar-nav navbar-right">
                 
                 <li>
                 	<!-- 로고 -->
                    <a href="index.jsp"><img src = "assets/img/bg/red.png" alt ="이미지가 없습니다"> </a>
                    
                    <!-- 부가메뉴 -->
                    <ul class="dropdown">
                    
                      <li><a href="allcerti.jsp"><img src = "assets/img/certilist.png" alt ="이미지가 없습니다">&nbsp;&nbsp;<b>자격증 백과사전</b></a></li>
                	  <li><a href="controller.do?command=top"><img src = "assets/img/top10.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;TOP10</b></a></li>
                      <li><a href="controller.do?command=qna"><img src = "assets/img/qa.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;Q & A</b></a></li>
                      <li><a href="controller.do?command=study"><img src = "assets/img/community.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;소모임 모집</b></a></li>
                      <li><a href="aptitude.jsp"><img src = "assets/img/heart.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;심리검사</b></a></li>
                      <li><a href="contactus.jsp"><img src = "assets/img/contact.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;넌그자와만난다</b></a></li>
                    </ul>
                  </li>                   
                  
                  <!-- 로그인 -->
                  <li class="right" style = "margin-top:5%"><a href="login.jsp"> 로그인 </a></li>
                 </ul>
                 <!-- -------------------------------------------------------------------------------------------------- -->

<%

   } else {

%>
                 
                 <!-- -------------------------------------------------------------------------------------------------- -->
                <!-- 메인화면의 윗줄n -->
                <ul class="nav navbar-nav navbar-right">
                 
                 <li>
                 	<!-- 로고 -->
                    <a href="index.jsp"><img src = "assets/img/bg/red.png" alt ="이미지가 없습니다"> </a>
                    
                    <!-- 부가메뉴 -->
                    <ul class="dropdown">
                    
                      <li><a href="allcerti.jsp"><img src = "assets/img/certilist.png" alt ="이미지가 없습니다">&nbsp;&nbsp;<b>자격증 백과사전</b></a></li>
                	  <li><a href="controller.do?command=top"><img src = "assets/img/top10.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;TOP10</b></a></li>
                      <li><a href="controller.do?command=qna"><img src = "assets/img/qa.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;Q & A</b></a></li>
                      <li><a href="controller.do?command=study"><img src = "assets/img/community.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;소모임 모집</b></a></li>
                      <li><a href="aptitude.jsp"><img src = "assets/img/heart.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;심리검사</b></a></li>
                      <li><a href="contactus.jsp"><img src = "assets/img/contact.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;넌그자와만난다</b></a></li>
                    </ul>
                  </li>                   
                  
                  <!-- 마이페이지/ 로그아웃 -->
                  <li class="right" style = "margin-top:3%"><a href="controller.do?command=mypage"> 마이페이지 </a></li>
                  <li class="right" style = "margin-top:3%"><a href="controller.do?command=logout"> 로그아웃 </a></li>
                 </ul>
                 <!-- -------------------------------------------------------------------------------------------------- -->

<%

   }

%>                
                 
                 
              </div>                   
            </div>
            <!-- ---------------------------------------------------------------------------------------------------------------------- -->
            
            
           <!-- ------------------------------------------------------------------------------------------------------------------------- --> 
            <!-- ------------------------------------------------------------------------------------------------------------ -->
            <!-- 반응형웹버전 -->
<%

   if(session.getAttribute("vo")==null||session.getAttribute("vo")==""){

%>
			 <!-- ---------------------------------------------------------------------------------------------------------------------- -->
            <ul class="wpb-mobile-menu"> 
            
             	 <li>
             	 	<!-- 로고 -->
                    <a href="index.jsp"><img src = "assets/img/bg/red.png" alt ="이미지가 없습니다"> </a>
                    
                    <!-- 부가메뉴 -->
                    <ul class="dropdown">
                    
                      <li><a href="allcerti.jsp"><img src = "assets/img/certilist.png" alt ="이미지가 없습니다">&nbsp;&nbsp;<b>자격증 백과사전</b></a></li>
                	  <li><a href="controller.do?command=top"><img src = "assets/img/top10.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;TOP10</b></a></li>
                      <li><a href="controller.do?command=qna"><img src = "assets/img/qa.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;Q & A</b></a></li>
                      <li><a href="controller.do?command=study"><img src = "assets/img/community.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;소모임 모집</b></a></li>
                      <li><a href="aptitude.jsp"><img src = "assets/img/heart.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;심리검사</b></a></li>
                      <li><a href="contactus.jsp"><img src = "assets/img/contact.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;넌그자와만난다</b></a></li>
                      
                    </ul>
                  </li>     
            
              <!-- 로그인 -->
              <li class="right" style = "margin-top:5%"><a href="login.jsp"> 로그인 </a></li>   
            </ul>
             <!-- ---------------------------------------------------------------------------------------------------------------------- -->
<% 

   } else {
   
%>

			 <!-- ---------------------------------------------------------------------------------------------------------------------- -->
			<ul class="wpb-mobile-menu"> 
            
             <li>
             		<!-- 로고 -->
                    <a href="index.jsp"><img src = "assets/img/bg/red.png" alt ="이미지가 없습니다"> </a>
                    
                    <!-- 부가메뉴 -->
                    <ul class="dropdown">
                    
                      <li><a href="allcerti.jsp"><img src = "assets/img/certilist.png" alt ="이미지가 없습니다">&nbsp;&nbsp;<b>자격증 백과사전</b></a></li>
                	  <li><a href="controller.do?command=top"><img src = "assets/img/top10.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;TOP10</b></a></li>
                      <li><a href="controller.do?command=qna"><img src = "assets/img/qa.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;Q & A</b></a></li>
                      <li><a href="controller.do?command=study"><img src = "assets/img/community.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;소모임 모집</b></a></li>
                      <li><a href="aptitude.jsp"><img src = "assets/img/heart.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;심리검사</b></a></li>
                      <li><a href="contactus.jsp"><img src = "assets/img/contact.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;넌그자와만난다</b></a></li>
                      
                    </ul>
                  </li>     
            
              <!-- 로그아웃/ 마이페이지 -->
                <li class="right" style = "margin-top:3%"><a href="controller.do?command=mypage"> 마이페이지 </a></li>
                <li class="right" style = "margin-top:3%"><a href="controller.do?command=logout"> 로그아웃 </a></li>        
            </ul>
             <!-- ---------------------------------------------------------------------------------------------------------------------- -->
            
<%

   }

%>
          </nav>


        </div>
        </section>
      </div>
      <!-- -------------------------------------------------------------------------------------------------------------------------------- -->


 	<!-- ---------------------------------------------------------------------------------------------------------------------- -->
 	<!-- 페이지 상단 -->
	<div class="page-header" style="background:  url(assets/img/bar_bg2.jpg);">
        <div class="container">
          <div class="row">         
            <div class="col-md-12">
              <div class="breadcrumb-wrapper">
              <br><br>
                <h2 class="product-title">자격증 백과사전</h2>
                <ol class="breadcrumb">
                  <li><a href="index.jsp"><i class="ti-home"></i> 홈</a></li>
                  <li class="current">자격증 백과사전</li>
                </ol>
              </div>
            </div>
          </div>
        </div>
      </div>
       <!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- ---------------------------------------------------------------------------------------------------------------------- -->
      <section class="section" >
      
        <div class="container">
          <h2 class="section-title" style = "text-align : center;margin:2%">자격증 카테고리</h2>  
          <div class="row">
            <div class="col-md-12" >
            
             <!-- ---------------------------------------------------------------------------------------------------------------------- -->
             <div class="col-md-3 col-sm-3 col-xs-12 f-category" style = "width:20%">
             
                <a href = "controller.do?command=all&ccode=C1">
                
                  <div class="icon">
                    <img src = "assets/img/ca/C1.png">
                  </div>
                  
                  <h3>건설</h3>
                  <p> 103 sub </p>
                </a>
                
              </div>
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              <div class="col-md-3 col-sm-3 col-xs-12 f-category" style = "width:20%">
              
                <a href = "controller.do?command=all&ccode=C2">
                
                  <div class="icon">
                    <img src = "assets/img/ca/C2.png">
                  </div>
                  
                  <h3>기계</h3>
                  <p> 79 sub </p>
                </a>
                
              </div>
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              <div class="col-md-3 col-sm-3 col-xs-12 f-category" style = "width:20%">
               <a href = "controller.do?command=all&ccode=C3">
                  <div class="icon">
                   <img src = "assets/img/ca/C3.png">
                  </div>
                  <h3>인쇄.목재.가구.공예</h3>
                  <p>19 sub</p>
                </a>
              </div>
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
               
                <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              <div class="col-md-3 col-sm-3 col-xs-12 f-category" style = "width:20%">
                <a href = "controller.do?command=all&ccode=C4">
                  <div class="icon">
                   <img src = "assets/img/ca/C4.png">
                  </div>
                  <h3>이용.숙박.여행.오락.스포츠</h3>
                  <p>7 sub</p>
                </a>
              </div>
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
               
                <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              <div class="col-md-3 col-sm-3 col-xs-12 f-category" style = "width:20%">
               <a href = "controller.do?command=all&ccode=C5">
                  <div class="icon">
                   <img src = "assets/img/ca/C5.png">
                  </div>
                  <h3>음식서비스</h3>
                  <p>14 sub</p>
                </a>
              </div>
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
               
                <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              <div class="col-md-3 col-sm-3 col-xs-12 f-category" style = "width:20%">
                <a href = "controller.do?command=all&ccode=C6">
                  <div class="icon">
                   <img src = "assets/img/ca/C6.png">
                  </div>
                  <h3>전기.전가</h3>
                  <p>42 sub</p>
                </a>
              </div>   
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
               
                <!-- ---------------------------------------------------------------------------------------------------------------------- -->         
              <div class="col-md-3 col-sm-3 col-xs-12 f-category" style = "width:20%">
                <a href = "controller.do?command=all&ccode=C7">
                  <div class="icon">
                   <img src = "assets/img/ca/C7.png">
                  </div>
                  <h3>정보통신</h3>
                  <p>28 sub</p>
                </a>
              </div>
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
               
                <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              <div class="col-md-3 col-sm-3 col-xs-12 f-category" style = "width:20%">
                <a href = "controller.do?command=all&ccode=C8">
                  <div class="icon">
                   <img src = "assets/img/ca/C8.png">
                  </div> 
                  <h3>경비.청소</h3>
                  <p>1 sub</p> 
                </a>
              </div>    
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
               
                <!-- ---------------------------------------------------------------------------------------------------------------------- -->        
              <div class="col-md-3 col-sm-3 col-xs-12 f-category" style = "width:20%">
                <a href = "controller.do?command=all&ccode=C9">
                  <div class="icon">
                   <img src = "assets/img/ca/C9.png">
                  </div>
                  <h3>경영.회계.사무</h3>
                  <p>40 sub</p>
                </a>
              </div>
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              <div class="col-md-3 col-sm-3 col-xs-12 f-category" style = "width:20%">
                <a href = "controller.do?command=all&ccode=C10">
                  <div class="icon">
                   <img src = "assets/img/ca/C10.png">
                  </div>
                  <h3>광업자원</h3>
                  <p>4 sub</p>
                </a>
              </div>
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
             <div class="col-md-3 col-sm-3 col-xs-12 f-category" style = "width:20%">
                <a href = "controller.do?command=all&ccode=C11">
                  <div class="icon">
                   <img src = "assets/img/ca/C11.png">
                  </div>
                  <h3>농림어업</h3>
                  <p>42 sub</p>
                </a>
              </div>
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              <div class="col-md-3 col-sm-3 col-xs-12 f-category" style = "width:20%">
                <a href = "controller.do?command=all&ccode=C12">
                  <div class="icon">
                   <img src = "assets/img/ca/C12.png">
                  </div>
                  <h3>문화.예술.디자인.방송</h3>
                  <p>11 sub</p>
                </a>
              </div>
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
               <div class="col-md-3 col-sm-3 col-xs-12 f-category" style = "width:20%">
                <a href = "controller.do?command=all&ccode=C13">
                  <div class="icon">
                   <img src = "assets/img/ca/C13.png">
                  </div>
                  <h3>보건.의료</h3>
                  <p>5 sub</p>
                </a>
              </div>
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
             <div class="col-md-3 col-sm-3 col-xs-12 f-category" style = "width:20%">
                <a href = "controller.do?command=all&ccode=C14">
                  <div class="icon">
                   <img src = "assets/img/ca/C14.png">
                  </div>
                  <h3>섬유.의료</h3>
                  <p>15 sub</p>
                </a>
              </div>
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
             <div class="col-md-3 col-sm-3 col-xs-12 f-category" style = "width:20%">
                <a href = "controller.do?command=all&ccode=C15">
                  <div class="icon">
                   <img src = "assets/img/ca/C15.png">
                  </div>
                  <h3>식품.가공</h3>
                  <p>9 sub</p>
                </a>
              </div>
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              <div class="col-md-3 col-sm-3 col-xs-12 f-category" style = "width:20%">
                <a href = "controller.do?command=all&ccode=C16">
                  <div class="icon">
                   <img src = "assets/img/ca/C16.png">
                  </div>
                  <h3>안전관리</h3>
                  <p>46 sub</p>
                </a>
              </div>
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
               <div class="col-md-3 col-sm-3 col-xs-12 f-category" style = "width:20%">
                <a href = "controller.do?command=all&ccode=C17">
                  <div class="icon">
                   <img src = "assets/img/ca/C17.png">
                  </div>
                  <h3>운전.운송</h3>
                  <p>2 sub</p>
                </a>
              </div>
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
               <div class="col-md-3 col-sm-3 col-xs-12 f-category" style = "width:20%">
                <a href = "controller.do?command=all&ccode=C18">
                  <div class="icon">
                   <img src = "assets/img/ca/C18.png">
                  </div>
                  <h3>재료</h3>
                  <p>38 sub</p>
                </a>
              </div>
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
               <div class="col-md-3 col-sm-3 col-xs-12 f-category" style = "width:20%">
                <a href = "controller.do?command=all&ccode=C19">
                  <div class="icon">
                   <img src = "assets/img/ca/C19.png">
                  </div>
                  <h3>화학</h3>
                  <p>11 sub</p>
                </a>
              </div>
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
               <div class="col-md-3 col-sm-3 col-xs-12 f-category" style = "width:20%">
                <a href = "controller.do?command=all&ccode=C20">
                  <div class="icon">
                   <img src = "assets/img/ca/C20.png">
                  </div>
                  <h3>환경.에너지</h3>
                  <p>34 sub</p>
                </a>
              </div>
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
              <div class="col-md-3 col-sm-3 col-xs-12 f-category" style = "width:20%">
                <a href = "controller.do?command=all&ccode=C21">
                  <div class="icon">
                   <img src = "assets/img/ca/C21.png">
                  </div>
                  <h3>언어.교육</h3>
                  <p>25 sub</p>
                </a>
              </div>
               <!-- ---------------------------------------------------------------------------------------------------------------------- -->
            </div> 
          </div>
        </div>
        
      </section>
      <!-- Category Section End -->  


<!-- --------------------------------------------------------------------------------------------------------------------------------------------------------- --> 
    <!-- 2 -->
    <footer>
    
       <!-- 2-1 -->
        <!-- ---------------------------------------------------------------------------------------------------------------------------------------- --> 
       <section class="footer-Content">
          <div class="container">
             <div class="row">
             
                 <!-- ---------------------------------------------------------------------------------------------------------------- --> 
                <div class="col-md-3 col-sm-6 col-xs-12" >
                
                  <!-- 로고-->
                    <div class="widget">
                     <br><br>
                     
                     <img src="assets/img/logo.png" class="img-responsive" alt="Footer Logo">
                      
                    </div><!-- widget -->
              
                  </div><!--  class = "col-md-3 col-sm-6 col-xs-12" 끝 -->
                  <!-- ---------------------------------------------------------------------------------------------------------------- --> 
                   
                   <div class="col-md-3 col-sm-6 col-xs-12"> 
                   
                        <div class="widget" style = "text-align:center">
                        
                           <br>
                           <b>넌그자 고객센터 : 02-1234-1234 <br>(평일 09:00 ~ 18:00, 주말 공휴일 휴무)<br><br></b>
                               	이메일 : help@ngza.co.kr Fax : 02-1111-111
                                                  
                    </div><!-- widget -->
                   
                   </div>
                   
                   <!-- ---------------------------------------------------------------------------------------------------------------- --> 
                   
                    <div class="col-md-3 col-sm-6 col-xs-12"> 
                   
                        <div class="widget" style = "text-align:center">
                               
                               <br>
                               (주)넌그자HR, 우:11111<br> 
				                               경기도 화성시 청계동 동탄순환대로 21길 54<br><br> 
				                               대표 : 난그자 , 사업자 등록 : 111-11-1111
                                  
                    </div><!-- widget -->
                   
                   </div>
                   
                    <!-- ---------------------------------------------------------------------------------------------------------------- -->
                <div class="col-md-3 col-sm-6 col-xs-12">
                   <div class="widget" style = "text-align:center">
                   
                      <!-- follow us -->
                      <h3 class="block-title" >Follow Us</h3>
                         <div class="bottom-social-icons social-icon">  
                           <a class="twitter" href="https://twitter.com"><i class="ti-twitter-alt"></i></a>
                           <a class="facebook" href="https://web.facebook.com"><i class="ti-facebook"></i></a>                   
                           <a class="google" href="https://google.com"><i class="ti-dribbble"></i></a>
                         </div>   
                         
                   </div><!-- widget 끝 -->
                </div><!-- class = col-md-3 col-sm-6 col-xs-12 끝 -->
                <!-- ---------------------------------------------------------------------------------------------------------------- -->
                
             </div>
          </div>
       </section><!-- class = footer-Content 끝 -->
       <!-- -------------------------------------------------------------------------------------------------------------------------------- -->
       
       <!-- 2-2 -->
       <!-- -------------------------------------------------------------------------------------------------------------------------------- -->
       <div id="copyright">
          <div class="container">
             <div class="row">
                <div class="col-md-12">
                    <div class="site-info text-center">
                      <p>All Rights reserved &copy; 2019 - Designed & Developed by <a rel="nofollow" href="#">넌그자</a></p>
                    </div>   
                </div>
             </div>
          </div>
       </div>
       <!-- -------------------------------------------------------------------------------------------------------------------------------- -->
    </footer>
   <!-- --------------------------------------------------------------------------------------------------------------------------------------------------------- -->
    
    <!-- 가장 위로 올라가기 -->
    <a href="#" class="back-to-top"><i class="ti-arrow-up"></i></a>

    <div id="loading">
      <div id="loading-center">
        <div id="loading-center-absolute">
          <div class="object" id="object_one"></div>
          <div class="object" id="object_two"></div>
          <div class="object" id="object_three"></div>
          <div class="object" id="object_four"></div>
          <div class="object" id="object_five"></div>
          <div class="object" id="object_six"></div>
          <div class="object" id="object_seven"></div>
          <div class="object" id="object_eight"></div>
        </div>
      </div>
    </div>
        
    <!-- Main JS  -->
    <script type="text/javascript" src="assets/js/jquery-min.js"></script>      
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>    
    <script type="text/javascript" src="assets/js/material.min.js"></script>
    <script type="text/javascript" src="assets/js/material-kit.js"></script>

    <script type="text/javascript" src="assets/js/jquery.parallax.js"></script>
    <script type="text/javascript" src="assets/js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.slicknav.js"></script>
    <script type="text/javascript" src="assets/js/main.js"></script>
    <script type="text/javascript" src="assets/js/jquery.counterup.min.js"></script>
    <script type="text/javascript" src="assets/js/waypoints.min.js"></script>

    <script type="text/javascript" src="assets/js/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="assets/js/form-validator.min.js"></script>
    <script type="text/javascript" src="assets/js/contact-form-script.js"></script>    
    <script type="text/javascript" src="assets/js/jquery.themepunch.revolution.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.themepunch.tools.min.js"></script>
      
    <script>
    
    function fnMove(data){

        var offset = $("."+data).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
        
    }

    
    </script>


</body>
</html>