<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
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
                 <!-- 로그인이 된 경우 -->
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
                  
                  <!-- 마이페이지/로그아웃 -->
                  <li class="right" style = "margin-top:3%"><a href="controller.do?command=mypage"> 마이페이지 </a></li>
                <li class="right" style = "margin-top:3%"><a href="controller.do?command=logout"> 로그아웃 </a></li> 
                 </ul>
                 <!-- -------------------------------------------------------------------------------------------------- -->

<%

	}

%>                
                 
                 
              </div><!-- 버튼 + post a job + login->>>>>>>>>>>> class = navbar -->                           
            </div><!-- 메인 화면 상단 바 -> 로그 + 버튼  + post a job + login ->>>>>>> class = container-->
            <!-- ---------------------------------------------------------------------------------------------------------------------- -->
            
            
           <!-- ------------------------------------------------------------------------------------------------------------------------- --> 
            <!-- ------------------------------------------------------------------------------------------------------------ -->
            <!-- 로그인이 안된 경우 -->
            <!-- 반응형웹버전 -->
<%

	if(session.getAttribute("vo")==null||session.getAttribute("vo")==""){

%>
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
            <!-- ------------------------------------------------------------------------------------------------------------------------- --> 
<% 

	} else {
	
%>
			<!-- ------------------------------------------------------------------------------------------------------------------------- --> 
			<!-- 로그인이 된 경우 -->
			<ul class="wpb-mobile-menu"> 
            
             <li>
                    <a href="index.jsp"><img src = "assets/img/bg/red.png" alt ="이미지가 없습니다"> </a>
                    <!-- home 밑의 li(home1, home2, home3, home4) -->
                    <ul class="dropdown">
                    
                      <li><a href="allcerti.jsp"><img src = "assets/img/certilist.png" alt ="이미지가 없습니다">&nbsp;&nbsp;<b>자격증 백과사전</b></a></li>
					<li><a href="controller.do?command=top"><img src = "assets/img/top10.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;TOP10</b></a></li>
					<li><a href="controller.do?command=qna"><img src = "assets/img/qa.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;Q & A</b></a></li>
					<li><a href="controller.do?command=study"><img src = "assets/img/community.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;소모임 모집</b></a></li>
					<li><a href="aptitude.jsp"><img src = "assets/img/heart.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;심리검사</b></a></li>
                    <li><a href="contactus.jsp"><img src = "assets/img/contact.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;넌그자와만난다</b></a></li>  
                    </ul>
                  </li>     
            
              <!-- logout -->
             <li class="right" style = "margin-top:3%"><a href="controller.do?command=mypage"> 마이페이지 </a></li>
                <li class="right" style = "margin-top:3%"><a href="controller.do?command=logout"> 로그아웃 </a></li>     
            </ul>
            <!-- ------------------------------------------------------------------------------------------------------------------------- --> 
            
<%

	}

%>

          </nav><!-- class = navbar navbar-default 끝 -->
      </div><!-- class = logo-menu 끝 -->
     </div>
      <!-- 메인화면/ 상단바 끝 -->    
	  <!-- ---------------------------------------------------------------------------------------------------------------- --> 

     <!-- ------------------------------------------------------------------------------------------------------------------------- --> 
	<div class="page-header" style="background: url(assets/img/bar_bg2.jpg);">
        <div class="container">
          <div class="row">         
            <div class="col-md-12">
              <div class="breadcrumb-wrapper">
              <br><br>
                <h2 class="product-title">자격증 세부정보</h2>
                <ol class="breadcrumb">
                  <li><a href="index.jsp"><i class="ti-home"></i> 홈</a></li>
                  <li class="current">자격증 세부정보</li>
                </ol>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- ------------------------------------------------------------------------------------------------------------------------- --> 

      <!-- ------------------------------------------------------------------------------------------------------------------------- --> 
      <section class="job-detail section">
        <div class="container">
          <div class="row">

 		<!-- ------------------------------------------------------------------------------------------------------------------------- --> 
		<c:forEach items = "${dlist}" var ="dlist" begin = "0" end = "0" step="1">		
			<!-- ------------------------------------------------------------------------------------------------------------------------- --> 
			<!-- 기본정보 -->
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="header-detail">               
                  <div class="header-content pull-left" style = "margin-left : 10%;margin-top:2%;"><br>
                    <h3><a style = "color:#ff4f57"><c:out value = "${dlist.lname}"/></a></h3>
                    
                     <div class="pull-right">
                      <div class="icon">
                      	<button style = "background:none;border:none; width: 48px; margin: -6px; padding: 0;" onclick = "heartFunc(${dlist.lcode });">
                      	 
	                       	<c:set var="istrue" value="false" />
	                      	<c:forEach items="${zzimlist }" var="zzimlist">
		                      	<c:if test="${zzimlist.lcode eq dlist.lcode }">
		                      		<c:set var="istrue" value="true" />
		                      	</c:if>
	                      	</c:forEach>
	                      	
	                      	<c:choose>
		                      	<c:when test="${istrue eq true }">
		               	   			<img id="zzimheart${dlist.lcode }" src="assets/img/icons/zheart.png" style = "margin-top:-157%;margin-left:100%">
		                      	</c:when>
		                      	<c:when test="${istrue eq false }">
		                      		<img id="zzimheart${dlist.lcode }" src="assets/img/icons/zzheart.png" style = "margin-top:-157%;margin-left:100%">
		                      	</c:when>
	                      	</c:choose>
                      	</button>
                      </div>
                    </div>                   

                    <p><span>-&nbsp;<c:out value = "${dlist.cname}"/></span></p>
                     <p><span> <b>관련부처</b>: <c:out value = "${dlist.institute}"/> </span></p>
                     <br><br>
                     <p>시험 수수료 : <strong class="price">필기 : <c:out value = "${dlist.price_w}"/>원 / - 실기 : <c:out value = "${dlist.price_p}"/>원</strong></p>
                     
                     <c:if test = "${dlist.price_w eq 0}">
                     	<p style = "color:#ff4f57"> *&nbsp;0원은 해당 시험이 존재하지 않습니다. </p>
                     </c:if>
                     
                     <c:if test = "${dlist.price_p eq 0}">
                     	<p style = "color:#ff4f57"> *&nbsp;0원은 해당 시험이 존재하지 않습니다. </p>
                     </c:if>
                     
                      
                  </div>
                  
                  <div class="detail-company pull-right text-right" style = "width:40%">
                      <img class="img-responsive" src="assets/img/jobs/jobkorea2.jpg" alt="" style = "padding-right : 20%">                    
                  </div>
                  
             
                  
                  <div class="clearfix">
                </div>
              </div>
            </div>
                 
           <!--   상세 정보     -->
            <div class="col-md-8 col-sm-12 col-xs-12">
              <div class="content-area">
                <div class="clearfix">
                <div class="box">        
                    <h4>개요</h4>
                    <p><c:out value = "${dlist.summary}"/></p>
                    <br>
                    <h4>수행직무</h4>
                    <p><c:out value = "${dlist.jobs}"/></p>
                    <br>
                    <h4>실시기관 홈페이지</h4>
                    <p><a href = "${dlist.urls}"><c:out value = "${dlist.urls}"/></a></p>
                    <br>
                    <h4>실시기관명</h4>
                    <p><c:out value = "${dlist.institute}"/></p>                   
                    <br>
                    <h4>진로 및 전망</h4>
                    <ul>
                    <li><i class="ti-check-box"></i><c:out value = "${dlist.outlook}"/></li>
                    </ul>
                    
                  </div>
                </div>
              </div>
              
              
              <!--  기업정보 커뮤니티 박스  -->
               <h2 class="medium-title">기업정보 / 커뮤니티 </h2>
              <div class="job-post-wrapper">
                <div class="row">
                  <div class="col-md-12">
                    <div class="job-list">
                    
                      <div class="thumb">
                        <a href="controller.do?command=company&ccode3=${dlist.ccode3}"><img src="assets/img/company.png" alt=""></a>
                      </div>
                      
                      <div class="job-list-content">
                        <h4><a href="controller.do?command=company&ccodee=${dlist.ccode3}">기업</a></h4>
                        <p>자격증 관련 기업정보 페이지</p>
                        <div class="job-tag">
                          <div class="pull-left">
                          </div>
                          <div class="pull-right">

                            <div class="btn btn-common btn-rm">
                            	<a href = "controller.do?command=company&ccode3=${dlist.ccode3}" style = "color:white">바로가기</a>
                            </div>
                          </div>
                        </div>
                      </div>
                      
                    </div>
                    
                    <div class="job-list">
                      <div class="thumb">
                        <a href="controller.do?command=community"><img src="assets/img/person.png" alt=""></a>
                      </div>
                      <div class="job-list-content">
                        <h4><a href="controller.do?command=community">커뮤니티 </a></h4>
                        <p>자격증 정보를얻을수있는 공간</p>
                        <div class="job-tag">
                          <div class="pull-left">
                          </div>
                          <div class="pull-right">

                            <div class="btn btn-common btn-rm">
                            	<a href = "controller.do?command=community" style = "color:white">바로가기</a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                  </div>
                </div>
              </div>
            </div>
            
            <!--    자격증 요건? 정보박스         -->
             <div class="col-md-4 col-sm-12 col-xs-12">
            <aside>
              <div class="sidebar">
                  <div class="box">
                    <h2 class="small-title">합격 정보</h2>
                    <ul class="detail-list">
                      <li>
                        <a href="#" >필기과목</a>
                        <span class="type-posts" style = "text-align:right;font-size:5px"><c:out value = "${dlist.subject_w}"/></span>
                      </li>

                      <li>
                        <a href="#">실기과목</a>
                        <span class="type-posts" style = "font-size:9px"><c:out value = "${dlist.subject_p}"/></span>
                      </li>

                      <li>
                        <a href="#">합격기준</a>
                        <span class="type-posts" style = "font-size:9px"><c:out value = "${dlist.pass}"/></span>
                      </li>
                      
                    </ul>
                  </div>
             </c:forEach>


                  <!--  자격증 시험 일정 박스    -->
                  <div class="sidebar-jobs box">
                    <h2 class="small-title">시험 일정</h2>
                    <ul>
                    
                    
	                    <c:forEach items="${dlist}" var = "dlist">
	                    <c:choose>
	                    
	                    <c:when test = "${dlist.nth ne '-'}">
	                      <li> 
		                      <a href="#"><b><c:out value = "${dlist.nth}"/></b></a> 
		                      <span><i class="fa fa-map-marker"></i><b>필기원서접수</b></span>
		                      <span><i class="fa fa-calendar"></i><c:out value = "${dlist.w_period }" /></span> 
		                      <span><i class="fa fa-map-marker"></i><b>필기 시험</b></span>
		                      <span><i class="fa fa-calendar"></i><c:out value = "${dlist.w_test }" /></span> 
		                      <span><i class="fa fa-map-marker"></i><b>필기 합격발표</b></span>
		                      <span><i class="fa fa-calendar"></i><c:out value = "${dlist.w_pass }" /></span>                       
		                      
		                      <span><i class="fa fa-map-marker"></i><b>실기원서접수</b></span>
		                      <span><i class="fa fa-calendar"></i><c:out value = "${dlist.p_period }" /></span> 
		                      <span><i class="fa fa-map-marker"></i><b>실기 시험</b></span>
		                      <span><i class="fa fa-calendar"></i><c:out value = "${dlist.p_test }" /></span> 
		                      <span><i class="fa fa-map-marker"></i><b>최종 합격자 발표</b></span>
		                      <span><i class="fa fa-calendar"></i><c:out value = "${dlist.p_pass }" /></span> 
	                      
	                      </li>
	                      </c:when>
	                      
	                      <c:when test = "${dlist.nth eq '-'}">
	                      	<i class="ti-check-box" style = "color:#ff4f57"></i><a href="#">&nbsp;&nbsp;<b>시험일정이 없습니다.</b></a> 
	                      </c:when>
	                      
	                      </c:choose>
	                      </c:forEach>
                      
                  
                    </ul>
                  </div>
                </div>
              </aside>
            </div>
          </div>
        </div>
      </section>
      <!-- 자격증 상세페이지 종료  --> 


        
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
    				
		    		  <!-- 로고 -->
		              <div class="widget">
		               <br><br>
							
							<img src="assets/img/logo.png" class="img-responsive" alt="Footer Logo">
		                <!--로고 밑의 문자 -->
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
	function heartFunc(lcode){

 		$.ajax({

		    url: "controller.do?command=zzimheart&lcode="+lcode ,

		    dataType: "json",

		    success: function(data){
				if(data.res){
					$("#zzimheart"+lcode).attr("src","assets/img/icons/zheart.png");
					
				} else {
					$("#zzimheart"+lcode).attr("src","assets/img/icons/zzheart.png");
					
				}

		    },

		    error: function (){        
				alert("로그인이 필요합니다.");
				location.href = "login.jsp";

		    }

		  });
 
		/* location.href = "controller.do?command=zzimheart&lcode="+lcode; */
	}
	</script>
      
  </body>
</html>