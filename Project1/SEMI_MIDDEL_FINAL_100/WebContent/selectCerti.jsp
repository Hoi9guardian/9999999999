<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html;charset=UTF-8"); %>
<%@ page import="com.team3.vo.zzim" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
               
              
                <!-- -------------------------------------------------------------------------------------------------- -->
                <!-- 메인화면의 윗줄 -->
                <!-- 로그인이 되어야 되기 때문에 조건이 필요없음 -->
                <ul class="nav navbar-nav navbar-right">
                
                  <li>
                  	<!-- 로고 -->
                    <a href="index.jsp"><img src = "assets/img/bg/red.png" alt ="이미지가 없습니다"> </a>
                    
                    <!-- 부가기능 -->
                    <ul class="dropdown">
                    
                      <li><a href="allcerti.jsp"><img src = "assets/img/certilist.png" alt ="이미지가 없습니다">&nbsp;&nbsp;<b>자격증 백과사전</b></a></li>
					<li><a href="controller.do?command=top"><img src = "assets/img/top10.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;TOP10</b></a></li>
					<li><a href="controller.do?command=qna"><img src = "assets/img/qa.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;Q & A</b></a></li>
					<li><a href="controller.do?command=study"><img src = "assets/img/community.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;소모임 모집</b></a></li>
					<li><a href="aptitude.jsp"><img src = "assets/img/heart.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;심리검사</b></a></li>
					<li><a href="contactus.jsp"><img src = "assets/img/contact.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;넌그자와만난다</b></a></li>

                    </ul>
                  </li> 
                  
                  <!-- 로그아웃 -->
                  <li class="right" style = "margin-top:3%"><a href="controller.do?command=logout"> 로그아웃 </a></li>
                 </ul>
                 
              </div><!-- 버튼 + post a job + login->>>>>>>>>>>> class = navbar -->                           
            </div><!-- 메인 화면 상단 바 -> 로그 + 버튼  + post a job + login ->>>>>>> class = container-->
            <!-- ---------------------------------------------------------------------------------------------------------------------- -->
            
            
           <!-- ------------------------------------------------------------------------------------------------------------------------- --> 
            <!-- ------------------------------------------------------------------------------------------------------------ -->
            <!-- 반응형웹버전 -->
            <ul class="wpb-mobile-menu">
            
             <li>
					<!-- 로고 -->             
                    <a href="index.jsp"><img src = "assets/img/bg/red.png" alt ="이미지가 없습니다"> </a>
                    
                    <!-- 부가기능 -->
                    <ul class="dropdown">
                    
                      <li><a href="allcerti.jsp"><img src = "assets/img/certilist.png" alt ="이미지가 없습니다">&nbsp;&nbsp;<b>자격증 백과사전</b></a></li>
					<li><a href="controller.do?command=top"><img src = "assets/img/top10.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;TOP10</b></a></li>
					<li><a href="controller.do?command=qna"><img src = "assets/img/qa.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;Q & A</b></a></li>
					<li><a href="controller.do?command=study"><img src = "assets/img/community.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;소모임 모집</b></a></li>
					<li><a href="aptitude.jsp"><img src = "assets/img/heart.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;심리검사</b></a></li>
					<li><a href="contactus.jsp"><img src = "assets/img/contact.png" alt ="이미지가 없습니다"><b>&nbsp;&nbsp;넌그자와만난다</b></a></li>

                    </ul>
                  </li> 
                  <li class="right" style = "margin-top:3%"><a href="controller.do?command=logout"> 로그아웃 </a></li>      
            </ul>
          </nav><!-- class = navbar navbar-default 끝 -->
      </div><!-- class = logo-menu 끝 -->
      <!-- 메인화면/ 상단바 끝 -->    
	  <!-- ---------------------------------------------------------------------------------------------------------------- --> 
     
      <!-- ---------------------------------------------------------------------------------------- -->
      <!-- 상단 메뉴바 -->
      <div class="page-header" style="background:  url(assets/img/bar_bg2.jpg);">
        <div class="container">
          <div class="row">         
            <div class="col-md-12">
              <div class="breadcrumb-wrapper">
              <br><br>
                <h2 class="product-title">마이페이지-찜목록</h2>
                <ol class="breadcrumb">
                  <li><a href="index.jsp"><i class="ti-home"></i> 홈</a></li>
                  <li class="current">마이페이지-찜목록</li>
                </ol>
              </div>
            </div>
          </div>
        </div>
      </div>
     <!-- ---------------------------------------------------------------------------------------- -->

      <!-- ---------------------------------------------------------------------------------------- -->
      <div id="content">
        <div class="container">        
          <div class="row">
          
          <!-- ---------------------------------------------------------------------------------------- -->
          <!-- 왼쪽 메뉴바 -->
            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="right-sideabr">
                <div class="inner-box">
                
                  <!-- 내정보 -->
                  <h4 >내정보</h4>
                  <ul class="lest item">
                  	<li><a href="controller.do?command=mypage">- 내 정보 보기</a></li>  
                  	<li><a href="updateInfo.jsp">- 내 정보 수정 </a></li>  
                  	<li><a href="deleteChk.jsp" onclick="window.open(this.href, '내 정보 삭제', 'width=400, height=150, top=200, left=300, location=no, scrollbars=no, status=no, resizable=no'); return false;">- 내 정보 삭제</a></li>  
                  </ul>
                  
                  <!-- 찜목록 -->
                  <h4>찜목록</h4>
                  <ul class="lest item">
                  	<li><a class="active" href="controller.do?command=zzim">- 내 찜목록 보기</a></li>  
                  </ul>
                  
                  <!-- 내일정 -->
                  <h4>내일정</h4>
                  <ul class="lest item">
                  	<li><a href="controller.do?command=calendar&userid=${vo.userid}">- 내 달력 보기</a></li>  
                  </ul>                  

                </div>
              </div>
            </div>
            <!-- ---------------------------------------------------------------------------------------- -->
            
            <!-- ---------------------------------------------------------------------------------------- -->
<!-- ---------------------------------------------------------------------------------------- -->
            <div class="col-md-8 col-sm-8 col-xs-12">
                
                
                 <!-- ------------------------------------------curpagenum 추가 zzimdelete!!!!!! 버튼---------------------------------------------- -->
                <!-- 1-1 -->
              <!-- 찜목록 출력 반복문 사용 -->
              <c:if test="${empty zzimlist}">
              	<div><p style = "font-size : 20px; font-weight:bold;text-align:center;margin-top:10%"><a style = "color:#ff4f57">${vo.nickname}</a> 님의 찜리스트가 없습니다.</p></div>
              </c:if>
              
              <c:forEach var="list" items="${zzimlist }" begin="${zzimpage.startRow }" end="${zzimpage.startRow + 3 }">
              <div class="job-list job-list2" style = "margin-left:5%;width:90%;margin-bottom:3%">
                <div class="thumb">
                  <a href="controller.do?command=detail&lcode=${list.lcode }"><img src="assets/img/ca/${list.ccodeimg }.png" alt=""></a>
                </div>
                <div class="job-list-content">
                <div class="item-body action-btn" style = "float:right">

                  	<a class="btn btn-xs btn-danger" href="controller.do?command=zzimdelete&lcode=${list.lcode }&curpagenum=${zzimpage.currentPage}">Delete</a>
                  </div>
                  <h4><a href="controller.do?command=detail&lcode=${list.lcode }">${list.lname }</a><span class="full-time">${list.ccode1 }</span></h4>
                  <div class="job-tag">
                    <div class="pull-left">
                      <div class="meta-tag">
                        <span><a href="controller.do?command=all&ccode=${list.ccodeimg}"><i class="ti-brush"></i>${list.ccode3 } </a></span>
                      </div>
                    </div>
                   
                  </div>
                  </div>
                </div>
				</c:forEach>
               <!-- ---------------------------------------------------------------------------------------- --> 

<script type="text/javascript">
	function PageMove(page){
    		location.href = "controller.do?command=zzim&curpagenum="+page;
    		
    }
</script> 
             <!------------------------------------------------------------------------------------------------------------------------------------------ -->
		           <!-- 페이지 번호 -->
		        <c:if test="${zzimpage.listCount > 4 }">  
		       	<div class="col-md-12" style = "margin-top:2%;margin-bottom:2%">
		       	 	<ul class="pagination pull-right">
				        <li><a href="javascript:PageMove(1)">맨앞으로</a></li>
				        <c:if test="${zzimpage.preve eq true }">
				        <li class="active"><a href="javascript:PageMove(${zzimpage.currentPage-1 })">앞으로</a></li>
				        </c:if>
				              <c:forEach var="i" begin="${zzimpage.startPage }" end="${zzimpage.endPage }" >
				                  <c:choose>
				                      <c:when test="${i eq zzimpage.currentPage }">
				               			<li class="active"><a href="javascript:PageMove(${i})">${i}</a></li>
				                      </c:when>
				                      <c:otherwise>
				                        <li><a href="javascript:PageMove(${i})">${i}</a></li>
				                      </c:otherwise>
				                  </c:choose>
				              </c:forEach>
				        <c:if test="${zzimpage.next eq true }">    
				        <li class="active"><a href="javascript:PageMove(${zzimpage.currentPage+1 })">뒤로</a></li>
				        </c:if>  
				        <li><a href="javascript:PageMove(${zzimpage.allPage})">맨뒤로</a></li>
				      </ul>    
                    
	            
		            
		        </div>
		        </c:if>
		        <!-- -------------------------------------------------------------------------------------- -->
                 
            </div>
            <!-- ---------------------------------------------------------------------------------------- -->
            
          </div>
        </div>      
      </div>
      <!-- ---------------------------------------------------------------------------------------- -->

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
    				
		    		  <!-- 로고의 아이콘 -->
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


</body>
</html>