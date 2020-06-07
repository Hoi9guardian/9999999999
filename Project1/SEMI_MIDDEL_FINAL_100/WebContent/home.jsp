<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html;charset=UTF-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    
    <!-- 
    	이 브라우저의 전반적인 구성은 html파일로 구조만 제작후
    	css, js파일을 따로 만들어 링크를 시켜줌으로써 실행 시킬 수 있다.
     -->   

	<!-- 다른 파일들과의 연결 -->
    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/img/favicon.png">
    <!-- 
    	min이 붙어있는 것은 최소 크기로 압축한 파일을 뜻함   
    	bootstrap을 사용하기 위하여 여러가지 필요한 파일(css)을 링크시킴
     -->
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

        <section id="intro" class="section-intro">
        
           <!-- ---------------------------------------------------------------------------------------------------------------------- -->
           <!-- 메인화면 상단바 -->
          <div class="logo-menu">
            <nav class="navbar navbar-default" role="navigation" data-spy="affix" data-offset-top="50">
            
               <!-- -------------------------------------------------------------------------------------------------- -->
                <div class="container">
                <!-- 메인 화면/ 맨위의 메뉴바-->
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
                <!-- 로그인이 되지 않은 경우  -->
               
<%

	if(session.getAttribute("vo")==null||session.getAttribute("vo")==""){

%>              
                <!-- -------------------------------------------------------------------------------------------------- -->
                <!-- 메인화면의 윗줄 -->
	                <ul class="nav navbar-nav navbar-right">
	                 
	                 <li>
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
            <!-- 로그인이 안된 경우 -->
<%

	if(session.getAttribute("vo")==null||session.getAttribute("vo")==""){

%>
            <ul class="wpb-mobile-menu"> 
            
             <li>
             		<!-- 로고 -->
                    <a href="index.jsp"><img src = "assets/img/bg/red.png" alt ="이미지가 없습니다"> </a>
                    
                    <!--부가메뉴 -->
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
              <li class="btn-m" style = "margin-top:5%"><a href="login.jsp">로그인 </a></li>          
            </ul>
<% 

	} else {
	
%>

		<!-- -------------------------------------------------------------------------------------------------- -->
		<!-- 로그인이 된 경우 -->
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
			<!-- -------------------------------------------------------------------------------------------------- -->


          </nav>
      </div>
      <!-- 메인화면/ 상단바 끝 -->    
	  <!-- ---------------------------------------------------------------------------------------------------------------- --> 
	  
	  
	  <!-- ------------------------------------------------------------------------------------------------------------------------- -->	  
	  <!-- 매인화면 중간 -->
      <div class="search-container">
        <div class="container">
          <div class="row">
          
          <!-- ---------------------------------------------------------------------------------------------------------------- --> 
          <!-- 메인 화면 중간의 문구 + 조건입력  -->
            <div class="col-md-12">
              <h1 style = "text-align : center">"넌 그럴 자격이 있어."</h1><br><h2 style = "text-align : center">원하는 자격증을 검색하세요!<br><br></h2>
              
              <!-- ---------------------------------------------------------------------------------------------------------------- --> 
              <div class="content">
                <form method="post" action="controller.do">
                <input type = "hidden" name = "command" value = "conditionlist">
                  <div class="row">
    
   			  <!-- ---------------------------------------------------------------------------------------------------------------- --> 
                    <!-- 조건(자격증명) -->
                    <div class="col-md-4 col-sm-6">
                      <div class="form-group">
                      	<i class = "fa fa-bookmark"> </i>
                        <input class="form-control" name = "name" type="text" placeholder="자격증명을 입력하세요">                        
                      </div>
                    </div>
                    
                    <!-- 조건(학력/경력)  -->
                    <div class="col-md-4 col-sm-6">
                      <div class="form-group">
                        <div style = "background-color:white;color:black;width:100%;height:54px;border:none"
                        			onclick = "divToggle();">
                        		<i class = "fa fa-bookmark"> </i><p style="text-align:left;margin-left:12%;padding-top:5%">자격증 관련 조건을 선택하세요</p></div>

                      </div>
                    </div>
                    
                    <!-- 조건(소분류)  -->
                                       <div class="col-md-3 col-sm-6">
                      <div class="search-category-container">
                        <label class="styled-select">
                          <select class="dropdown-product selectpicker" name = "smallcategory">
                            <option value = "">원하는 분야를 선택하세요</option>
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
                            <option value = "C14">섬유.의료</option>
                            <option value = "C15">식품.가공</option>
                            <option value = "C16">안전관리</option>
                            <option value = "C17">운전.운송</option>
                            <option value = "C18">재료</option>
                            <option value = "C19">화학</option>
                            <option value = "C20">환경.에너지</option>
                            <option value = "C21">언어.교육</option>
              
                          </select>
                        </label>
                      </div>
                    </div>
                    
                    <!-- 돋보기 버튼 -->
                    <div class="col-md-1 col-sm-6">
                      <button type="submit" class="btn btn-search-icon"><i class="ti-search"></i></button>
                    </div>
                    <!-- ---------------------------------------------------------------------------------------------------------------- --> 
                    
                  </div><!-- class = row 끝 -->
                  <!-- ---------------------------------------------------------------------------------------------------------------- -->
                  
                  
         <!-- ----------------------------------------------------------------------------------------------------------------------------------------------- -->         
      	 <!-- 학력/조건 세부 -->
      	 <div class = "conditionDiv" style = "background-color:white;margin-top:2.5%;margin-left:0.3%;width:95%;height:50%;display:none;position:absolute;border-radius:5px">
        	
        	<!-- ----------------------------------------------------------------------------------------------------------------------------------------------- -->
        	<div style = "border-right:2px solid gray;float:left;width:17%;height:80%;margin-top:1.3%;color:black">
        		
	        		<input type = "radio" class = "bigcategory" name = "bigcategory" value = "A1" style = "margin-left:22%;margin-top:12%" onclick = "categoryToggle();">
	        		<label class = "labelN" style = "font-size:15px;font-weight:bold;margin-left:5%">국가자격증</label>
        		
        		
        		<input type = "radio" class = "bigcategory" name = "bigcategory" value = "A2" style = "margin-left:22%;margin-top:10%" onclick = "categoryToggle2();">
	        	<label class = "labelNON" style = "font-size:15px;font-weight:bold;margin-left:5%">민간자격증</label>
        		
        	</div>
        	<!-- ----------------------------------------------------------------------------------------------------------------------------------------------- -->
        	
        	<!-- ----------------------------------------------------------------------------------------------------------------------------------------------- -->
	        <div class = "middle" id = "middle">
	        
	        	<!-- 세부조건 -->
	        	<div class = "conditionDiv1" style = "float:left;width:16%;height:80%;margin-top:1.3%;margin-left:1%;color:gray;display:none">
	        		<label class = "label1" style = "margin-top:1%;margin-left:22%">
	        			<input type = "radio" name = "middlecategory" value = "B1" style = "margin-top:30%;width:100%" onclick = "boldChange(1);">경력/학력 무관</label>
	        	</div>
	        	
	        	<!-- 세부조건 -->
	        	<div class = "conditionDiv2" style = "float:left;width:16%;height:80%;margin-top:1.3%;margin-left:0.5%;color:gray;display:none">
	        		<label  class = "label2" style = "margin-top:1%;margin-left:23%">
	        			<input type = "radio" name = "middlecategory" value = "B2" style = "margin-top:26%;width:100%" onclick = "boldChange(2);">경력/학력 2년이상</label>
	        	</div>
	        	
	        	<!-- 세부조건 -->
	        	<div class = "conditionDiv2" style = "float:left;width:16%;height:80%;margin-top:1.3%;margin-left:0.5%;color:gray;display:none">
	        		<label  class = "label3" style = "margin-top:1%;margin-left:23%">
	        			<input type = "radio" name = "middlecategory" value = "B3" style = "margin-top:26%;width:100%" onclick = "boldChange(3);">경력/학력 4년이상</label>
	        	</div>
	        	
	        	<!-- 세부조건 -->
	        	<div class = "conditionDiv2" style = "float:left;width:16%;height:80%;margin-top:1.3%;margin-left:0.5%;color:gray;display:none">
	        		<label  class = "label4" style = "margin-top:1%;margin-left:23%">
	        			<input type = "radio" name = "middlecategory" value = "B4" style = "margin-top:26%;width:100%" onclick = "boldChange(4);">경력/학력 8년이상</label>
	        	</div>
	        	
	        	<!-- 세부조건 -->
	        	<div class = "conditionDiv2" style = "float:left;width:16%;height:80%;margin-top:1.3%;margin-left:0.5%;color:gray;display:none">
	        		<label  class = "label5" style = "margin-top:1%;margin-left:21%">
	        			<input type = "radio" name = "middlecategory" value = "B5" style = "margin-top:26%;width:100%" onclick = "boldChange(5);">경력/학력 10년이상</label>
	        	</div>
	        	
	       	</div>	
	       	<!-- ----------------------------------------------------------------------------------------------------------------------------------------------- -->
        
        </div>
        <!-- ----------------------------------------------------------------------------------------------------------------------------------------------- -->
                </form>
              </div><!-- class = content 끝/ 조건 입력받아 폼으로 넘겨 검색 -->
              <!-- ---------------------------------------------------------------------------------------------------------------- --> 
              
            </div><!-- class = col-md-12 끝 -->
          </div>
        </div>
        
        
        
      </div><!-- class = search-container 끝 -->
      
      <!-- -------------------------------------------------------------------------------------------- -->
    <!-- 수치 -->
    <section id="counter" style = "background:none;border-top:5px solid #ff4f57; width:80%;margin-left:10%">
      <div class="container">
        <div class="row">
        
        <!-- jobs -->
          <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="counting">
            
              <div class="icon">
                <i class="ti-briefcase"></i>
              </div>
              
              <div class="desc">                
                <h2>기업수</h2>
                <h1 class="counter">${countlist.get(0)}</h1>
              </div>
              
            </div>
          </div>
          
          <!-- members -->
          <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="counting">
            
              <div class="icon">
                <i class="ti-user"></i>
              </div>
              
              <div class="desc">
                <h2>회원수</h2>
                <h1 class="counter">${countlist.get(1)}</h1>                
              </div>
              
            </div>
          </div>
          
          <!-- resume -->
          <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="counting">
            
              <div class="icon">
                <i class="ti-write"></i>
              </div>
              
              <div class="desc">
                <h2>자격증수</h2>
                <h1 class="counter">${countlist.get(2)}</h1>                
              </div>
              
            </div>
          </div>
          
          <!-- company -->
          <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="counting">
            
              <div class="icon">
                <i class="ti-heart"></i>
              </div>
              
              <div class="desc">
                <h2>방문자수</h2>
                <h1 class="counter">${countlist.get(3)}</h1>                
              </div>
              
            </div>
          </div>
          
        </div>
      </div>
    </section>
    <!-- -------------------------------------------------------------------------------------------- -->
    </section>
    <!-- end intro section -->
    </div><!-- class = header끝 -->
    <!-- --------------------------------------------------------------------------------------------------------------------------------------------------------- --> 
    <!-- 1끝 -->
 
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
        
    <!-- javascript 연결 -->
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
    <script type="text/javascript" src="assets/js/category.js"></script>
    
    
  </body>
</html>