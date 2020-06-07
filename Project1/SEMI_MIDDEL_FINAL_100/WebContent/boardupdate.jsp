<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html;charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
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
          
      <!-- Header Section Start -->
      <div class="header">    
        <div class="logo-menu" style = "background :url(assets/img/bg/black2.jpg)">
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
         <!-- 로그인이 안된 경우 -->
                <script>
                   location.href = "login.jsp";
                </script>
            <!-- -------------------------------------------------------------------------------------------------- -->

<%

   } else {

%>
                 
                <!-- -------------------------------------------------------------------------------------------------- -->
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
         <!-- ------------------------------------------------------------------------------------------------------------ -->
         <!-- 로그인 안된 경우 -->
            <script>
                   location.href = "login.jsp";
            </script>
            <!-- ------------------------------------------------------------------------------------------------------------ -->

<% 

   } else {
   
%>
         
         <!-- ------------------------------------------------------------------------------------------------------------ -->
         <!-- 로그인 된 경우 -->
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
            
<%

   }

%>

          </nav>
      </div>
      <!-- 메인화면/ 상단바 끝 -->    
     <!-- ---------------------------------------------------------------------------------------------------------------- --> 

      <!-- 메인화면/ 상단바 끝 -->    
     <!-- ---------------------------------------------------------------------------------------------------------------- --> 

       <!-- ---------------------------------------------------------------------------------------------------------------- --> 
      <div class="page-header" style="background:  url(assets/img/bar_bg2.jpg);">
        <div class="container">
          <div class="row">         
            <div class="col-md-12">
              <div class="breadcrumb-wrapper">
                <h2 class="product-title"><br>글수정</h2>
                <ol class="breadcrumb">
                  <li><a href="index.jsp"><i class="ti-home"></i> 홈 </a></li>
                  <li class="current">글수정</li>
                </ol>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- ---------------------------------------------------------------------------------------------------------------- --> 
      
      
      <!-- -------------------------------------------------------------------------------------------------- -->
            <!-- 여기서 부터 분리한 이유는 로고는 반응형웹이나 기존이나 같은 것을 쓰기에 두번 반복해서 사용하지 않음 -->
            <!-- 메인화면의 메뉴바 시작 -->
            <!-- 메인화면/ 맨위의 메뉴바에 출력될 데이터 -->
                <div class="collapse navbar-collapse" id="navbar">  
                <!-- -------------------------------------------------------------------------------------------------- -->
               
              
                <!-- -------------------------------------------------------------------------------------------------- -->
                <!-- 메인화면의 윗줄의 post a job, log in -->
                <ul class="nav navbar-nav navbar-right" style = "margin-right : 12%">                 
                  <li class="right"><a href="controller.do?command=qna" > <b> Q & A </b></a></li>
                  <li class="right"><a href="controller.do?command=community"> <b> 커뮤니티 </b> </a></li>
                  <li class="right"><a href="controller.do?command=study" style = "color:#ff4f57"> <b> 소모임만들기 </b></a></li>
                 </ul>
                 
              </div><!-- 버튼 + post a job + login->>>>>>>>>>>> class = navbar -->                           
            <!-- ---------------------------------------------------------------------------------------------------------------------- -->

     <!-- ---------------------------------------------------------------------------------------------------------------- --> 
      <div id="content" class="my-account">
        <div class="container">
          <div class="row">
            <div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-6 cd-user-modal" style = "margin-left:15%">  
              <div class="my-account-form" style = "width:800px">
               
               <!-- 라벨 -->
                <ul class="cd-switcher">
                  <li><a class="selected" href="#0"><b>기존의 글 수정</b></a></li>
                </ul>
                
                 <!-- ---------------------------------------------------------------------------------------------------------------- --> 
                <div id="cd-board" class="is-selected">
                  <div class="page-login-form register">
                    <form role="form" class="login-form" action="controller.do">
                    <input type = "hidden" name = "command" value = "update">
                    <input type= "hidden" name ="boardno" value="${bvo.boardno }">
                      <!--  curpagenum 추가 -->
                    <input type= "hidden" name ="curpagenum" value="${curpagenum }">
                                  
                      <!-- 말머리 -->
                      <div class="form-group" >
                        <div class="input-icon">  
                        <c:if test = "${bvo.tabloc ne 'qna'}">                       
                          <select id="sender-email" class="form-control dropdown" name="categorycode" style = "color:gray">
                               <option value ="${categorycode }" selected="selected" >${bvo.headtag }</option>
                               <option value = "C1">건설</option>
                             <option value = "C2">기계</option>
                             <option value = "C3">인쇄.목재.가구.공예</option>
                             <option value = "C4">이용.숙박.여행.오락.스포츠</option>
                             <option value = "C5">음식서비스</option>
                             <option value = "C6">전기.전자</option>
                             <option value = "C7">정보통신</option>
                             <option value = "C8">경비.청소</option>
                             <option value = "C9">경영.회계.사무</option>
                             <option value = "C10">광업자원</option>
                             <option value = "C11">농림어업</option>
                             <option value = "C12">문화.예술.디자인.방송</option>                                    
                             <option value = "C13">보건.의료</option>
                             <option value = "C14">섬유.의복</option>
                             <option value = "C15">식품.가공</option>
                             <option value = "C16">안전관리</option>
                             <option value = "C17">운전.운송</option>
                             <option value = "C18">재료</option>
                             <option value = "C19">화학</option>
                             <option value = "C20">환경.에너지</option>
                             <option value = "C21">언어.교육</option>
                          </select>
                          </c:if>
                        </div>
                      </div> 
                      
                       <!-- 게시판 - 고정 -->
                      <div class="form-group" >
                        <div class="input-icon"> 
                           <i class="ti-search"></i>
                           
                       <!-- value 값 해당 글 값 가져와라!!!!!! -->                            
                           <input type="text" class="form-control" name = "tabloc" value="${bvo.tabloc }" readonly="readonly">                          
                        </div>
                      </div> 
                      
                      <!-- 제목 -->
                      <div class="form-group">
                        <div class="input-icon">
                        
                          <i class="ti-user"></i>
                          <input type="text" class="form-control" name = "title" placeholder="수정할 제목을 입력하세요" value="${bvo.title }">
                                                    
                        </div>
                      </div> 
                      
                      <!-- 글내용 -->
                      <div class="form-group">
                        <div class="input-icon">
                         <textarea class="form-control" placeholder="         수정할 내용을 입력하세요" style = "height:200px" name="content">${bvo.content }</textarea>
                        </div>
                       </div>
                       <!--  curpagenum 추가 -->
                      <!-- 글수정 -->
                      <button class="btn btn-common log-btn" style = "width:42%;float:left;margin-left:5%">글수정</button>
                      <input type = "button" value = "글수정취소" class="btn btn-common log-btn" style = "width:42%;margin-left:6%" onclick = "returnfunc('${bvo.boardno}','${bvo.headtag}','${curpagenum }')">

                    </form>
                  </div>
                </div>


              </div>
            </div>
          </div>
        </div>
      </div>     

     

     <!-- ---------------------------------------------------------------------------------------------------------------- -->  
    <!-- 2 -->
    <footer>
    
       <!-- 2-1 -->
        <!-- ---------------------------------------------------------------------------------------------------------------------------------------- --> 
       <section class="footer-Content">
          <div class="container">
             <div class="row">
             
                 <!-- ---------------------------------------------------------------------------------------------------------------- --> 
                <div class="col-md-3 col-sm-6 col-xs-12" >
                
                  <!-- 로고 -->
                    <div class="widget">
                     <br><br>
                     
                  <img src="assets/img/logo.png" class="img-responsive" alt="Footer Logo">
                      <!-- 로고 밑의 문자 -->
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
      
   <!-- --------------------------------------------------------------------------------------------------------------------------------------------------------- -->
      <a href="#" class="back-to-top">
        <i class="ti-arrow-up"></i>
      </a>
        
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
    <!--  curpagenum 추가 -->
    <script type = "text/javascript">
    
    function returnfunc(boardno,category,curpagenum){
       
       location.href = "controller.do?command=boarddetail&boardno="+boardno+"&category="+category+"&curpagenum="+curpagenum;
       
    }
    
    </script>
      
  </body>
</html>