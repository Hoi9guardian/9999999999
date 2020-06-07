<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="author" content="Jobboard">
    
    <title>JobBoard - Bootstrap HTML5 Job Portal Template</title>    

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
    
    <style>
    	.career:hover{
    		color:#ff4f57;
    		-webkit-transition: 0.5s;
    	}
    	
    	select {
		width: 200px;
		padding: .8em .5em;
		border: 1px solid #999;
		font-family: inherit;
		background: url('assets/img/arrow.jpg') no-repeat 95% 50%;
		border-radius: 0px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
		}
		
		select::-ms-expand {
		    display: none;
		}
		

    </style>
    
  </head>

  <body>  
      <!-- Header Section Start -->
      <div class="header" >    
        <div class="logo-menu" style = "background :url(assets/img/bg/black2.jpg)">
          <nav class="navbar navbar-default" role="navigation" data-spy="affix" data-offset-top="50">
            <div class="container">
              <!-- Brand and toggle get grouped for better mobile display -->
              <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand logo" href="index.jsp"><img src="assets/img/logo.png" alt=""></a>
              </div>

              <div class="collapse navbar-collapse" id="navbar">              
                 <!-- Start Navigation List -->
                 
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
      <!-- --------------------------------------------------------------------------------------------------------------->  

       <!-- --------------------------------------------------------------------------------------------------------------->  
      <div class="page-header" style="background:  url(assets/img/bar_bg2.jpg);">
        <div class="container">
          <div class="row">         
            <div class="col-md-12">
              <div class="breadcrumb-wrapper">
                <h2 class="product-title"><br>심리검사</h2>
                <ol class="breadcrumb">
                  <li><a href="index.jsp"><i class="ti-home"></i> 홈 </a></li>
                  <li class="current">심리검사</li>
                </ol>
              </div>
            </div>
          </div>
        </div>
      </div>
       <!-- --------------------------------------------------------------------------------------------------------------->    

       <!-- Start Content -->
      <div id="content">
        <div class="container">
          <div class="row">
          
            <!-- --------------------------------------------------------------------------------------------------------------->    
            <div class="col-md-9" style = "margin:0;width:100%">             

             <!-- --------------------------------------------------------------------------------------------------------------->    
              <div>
                <!-- Post thumb -->
                
                <div>
                	<h2 style = "color:#ff4f57;text-align:center"><i class="ti-check-box"></i> 검사자에게 맞는 연령을 선택하세요 </h2>
                	
                	<div class="collapse navbar-collapse" id="navbar">  
                <!-- -------------------------------------------------------------------------------------------------- -->
               
              
                <!-- -------------------------------------------------------------------------------------------------- -->
                <!-- 보드이름 -->
                <ul class="nav navbar-nav" style = "margin-left:42%;margin-top:2%;font-size:20px">                 
                  <li><a onclick = "career1()"> <i class= "fas fa-school"></i><b> 청소년 </b></a></li>
                  <li><a onclick = "career2()"> <b> 성인 </b> </a></li>
                 </ul>
                 
              </div>  
                	
                </div>
                
                <!-- --------------------------------------------------------------------------------------------------------------->   
                <div class="post-thumb" id = "career1" style = "display:none;height:100%;width:100%">
                	<iframe src = "http://inspct.career.go.kr/web/psycho/interest" style = "width:140%;height: 140vh;border:none;margin-left:-17%"> </iframe>
                  
                </div>
                <!-- --------------------------------------------------------------------------------------------------------------->   
                
                <!-- --------------------------------------------------------------------------------------------------------------->   
                <div class="post-thumb" id = "career2" style = "display:none;height:200%;width:100%">
                	<iframe src = "http://inspct.career.go.kr/web/psycho/effect" style = "width:140%;height: 140vh;border:none;margin-left:-17%"> </iframe>
                </div>
                <!-- --------------------------------------------------------------------------------------------------------------->   

                

              </div>
              <!-- --------------------------------------------------------------------------------------------------------------->  
              
                

            </div>
            <!-- --------------------------------------------------------------------------------------------------------------->    


           <!-- --------------------------------------------------------------------------------------------------------------->    
              
              <!-- --------------------------------------------------------------------------------------------------------------->   
           
           
            <!-- --------------------------------------------------------------------------------------------------------------->    

          </div>
        </div>
      </div>
      <!-- --------------------------------------------------------------------------------------------------------------->
      
      <div id="sidebar2" class="right-sidebar" style = "display:none;margin-bottom:7%">
              
         <h2 style = "color:#ff4f57;text-align:center"> 결과에 맞는 자격증을 보시겠습니까? &nbsp;
         <button style = "background-color:#ff4f57;border:none;color:white;border-radius:30px" onclick = "career3()">
         	<b><i class="ti-search" style = "font-size : 30px;" onclick="career3()" ></i></b>
         </button></h2>

     </div>
      
      <!-- --------------------------------------------------------------------------------------------------------------->
       <div id="sidebar" class="right-sidebar" style = "display:none;margin-bottom:5%">
              <!-- --------------------------------------------------------------------------------------------------------------->    
              <div class="widget widget-search" style = "width:50%;margin-left:25%">
                <h2 class="widget-title" style = "color:#ff4f57;text-align:center"><b>결과와 관련된 분야를 선택하세요</b></h2>
                <form action="controller.do" method = "post">
                <input type = "hidden" name = "command" value = "conditionlist">
                <div style = "float:left">
				  <select name = "smallcategory">
				    <option value="C1">건설</option>
				    <option value="C2">기계</option>
				    <option value="C3">인쇄.목재.가구.공예</option>
				    <option value="C4">이용.숙박.여행.오락.스포츠</option>
				    <option value="C5">음식서비스</option>
				    <option value="C6">전기.전자</option>
				    <option value="C7">정보통신</option>
				    <option value="C8">경비.청소</option>
				    <option value="C9">경영.회계.사무</option>
				    <option value="C10">광업자원</option>
				    <option value="C11">농림어업</option>
				    <option value="C12">문화.예술.디자인.방송</option>
				    <option value="C13">보건.의료</option>
				    <option value="C14">섬유.의복</option>
				    <option value="C15">식품.가공</option>
				    <option value="C16">안전관리</option>
				    <option value="C17">운전.운송</option>
				    <option value="C18">재료</option>
				    <option value="C19">화학</option>
				    <option value="C20">환경.에너지</option>
				    <option value="C21">언어.교육</option>
				  </select>
				  </div>
				  
				  <div style = "float:left;margin-left:43%;margin-top:1%">
				  <button id = "goName" style = "border:none;background-color:#ff4f57;color:white;border-radius:3px">
				  	<b> 해당분야의 자격증을 검색합니다.&nbsp;<i class="ti-search"></i></b> </button>
				  </div>
                </form>
                
              </div>
              <!-- --------------------------------------------------------------------------------------------------------------->      

            </div>
     <!-- --------------------------------------------------------------------------------------------------------------->


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
    				
		    		  <!-- 로고 아이콘 -->
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
      
      <!-- Go To Top Link -->
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
    <script>
    	function career1(){
    		$("#career1").slideDown(1000);
    		$("#career2").hide();
    		$("#sidebar").hide();
    		$("#sidebar2").slideDown(1000);
    	}
    	function career2(){
    		$("#career1").hide();
    		$("#career2").slideDown(1000);
    		$("#sidebar").hide();
    		$("#sidebar2").slideDown(1000);
    	}
    	function career3(){
    		
    		$("#sidebar2").hide();
    		$("#sidebar").show("slow");
    		
    	}
    </script>
      
  </body>
</html>