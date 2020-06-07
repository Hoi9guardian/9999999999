<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html;charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="author" content="Jobboard">
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    
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
    
    <script type="text/javascript">
    
    var idres = true;
    var pwchkres = true
    var nickres = true;
    var emailres = true;
    
      //아이디 중복체크
       $(document).ready(function() {

          $("input[name=regId]").focusout(function() { 
             var inputed = $("input[name=regId]").val(); 
 
             $.ajax({ 
                   
                data: {
                      regId : inputed
                   },
                   
                   url : "controller.do?command=IdChk",
                   dataType : "json",
                   success : function(data) { 
                      

                      if(data.res) { 
                          $("#hideSpan1").css("display", "");
                          $("#hideSpan2").css("display", "none");
                          idres = true;
                          reschk();
                          
                          
                      } else { 
                          $("#hideSpan1").css("display", "none");
                          $("#hideSpan2").css("display", "");
                          idres = false;
                          reschk();
                          
                      }
                   },
                   error:function(){
                       alert("에러입니다");
               }
               });
          });
       });
       
      
       //닉네임 중복체크
       $(document).ready(function() {
          $("input[name=nick]").focusout(function() { 
             var inputed = $("input[name=nick]").val(); 
 
             $.ajax({ 
                   
                data: {
                   nick : inputed
                   },
                   
                   url : "controller.do?command=NickChk",
                   dataType : "json",
                   success : function(data) { 
                      

                      if(data.res) { 
                          $("#hideSpan5").css("display", "");
                          $("#hideSpan6").css("display", "none");
                          nickres = true;
                          reschk();
                      } else { 
                          $("#hideSpan5").css("display", "none");
                          $("#hideSpan6").css("display", "");
                          nickres = false;
                          reschk();
                      }
                   },
                   error:function(){
                       alert("에러입니다");
               }
               });
          });
       });
      
       //이메일 중복체크
       $(document).ready(function() {
          $("input[name=email]").focusout(function() { 
             var inputed = $("input[name=email]").val(); 
 
             $.ajax({ 
                   
                data: {
                   email : inputed
                   },
                   
                   url : "controller.do?command=EmailChk",
                   dataType : "json",
                   success : function(data) { 
                      

                      if(data.res) { 
                          $("#hideSpan7").css("display", "");
                          $("#hideSpan8").css("display", "none");
                          emailres = true;
                          reschk();
                      } else { 
                          $("#hideSpan7").css("display", "none");
                          $("#hideSpan8").css("display", "");
                          emailres = false;
                          reschk();
                      }
                   },
                   error:function(){
                       alert("에러입니다");
               }
               });
          });
       });
      


      
      
        //비밀번호 중복체크
       $(function() {
           $("input[name='regPwdChk']").blur(function() {
              
        	  
              if($("input[name='regPwd']").val() != $("input[name='regPwdChk']").val() ){
                       $("#hideSpan3").css("display", "none");
                       $("#hideSpan4_1").css("display", "none");
                       $("#hideSpan4").css("display", "");
                    $("input[name='regPwdChk']").val('');
                    pwchkres=false;
                    reschk();
              }else{
            	  if($("input[name='regPwd']").val() == '' && $("input[name='regPwdChk']").val() == ''){
            		  $("#hideSpan4_1").css("display", "");
            		  $("#hideSpan3").css("display", "none");
            		  $("#hideSpan4").css("display", "none");
            		  pwchkres=false;
                      reschk();
            	  } else {
                      $("#hideSpan3").css("display", "");
                      $("#hideSpan4").css("display", "none");
                      $("#hideSpan4_1").css("display", "none");
                      pwchkres=true;
                      reschk();
            	  }
              }
           })
           
           
           
        });
      
        function reschk(){
           if(idres==true && pwchkres==true && nickres==true && emailres==true){
               $("#RegisterBtn").attr("disabled",false);
           }else{
               $("#RegisterBtn").attr("disabled",true);
           }
        }
       
       
    </script>
    
  </head>

  <body>  
    		
      <!-- Header Section Start -->
      <div class="header">    
        <div class="logo-menu" style="background: url(assets/img/bg/black2.jpg);">
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
				
				<!-- 로그인시에는 조건이 필요없다 -->
                <div class="collapse navbar-collapse" id="navbar">  
                <!-- -------------------------------------------------------------------------------------------------- -->
               
              
                <!-- -------------------------------------------------------------------------------------------------- -->
                <!-- 메인화면의 윗줄의 post a job, log in -->
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
            </ul>
          </nav><!-- class = navbar navbar-default 끝 -->
      </div><!-- class = logo-menu 끝 -->
      <!-- 메인화면/ 상단바 끝 -->    
	  <!-- ---------------------------------------------------------------------------------------------------------------- --> 

     <!-- ---------------------------------------------------------------------------------------------------------------- --> 
      <div class="page-header" style="background: url(assets/img/bar_bg2.jpg);">
        <div class="container">
          <div class="row">         
            <div class="col-md-12">
              <div class="breadcrumb-wrapper">
                <h2 class="product-title"><br>로그인-회원가입</h2>
                <ol class="breadcrumb">
                  <li><a href="index.jsp"><i class="ti-home"></i> 홈 </a></li>
                  <li class="current">로그인-회원가입</li>
                </ol>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- ---------------------------------------------------------------------------------------------------------------- --> 

	<!-- ---------------------------------------------------------------------------------------------------------------- --> 
      <div id="content" class="my-account">
        <div class="container">
          <div class="row">
            <div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-6 cd-user-modal">  
              <div class="my-account-form">
               
               <!-- login/register 창 -->
                <ul class="cd-switcher">
                  <li><a class="selected" href="#0">로그인</a></li>
                  <li><a href="#0">회원가입</a></li>
                </ul>
                
                <!-- ---------------------------------------------------------------------------------------------------------------- --> 
                <!-- Login -->
                <div id="cd-login" class="is-selected">
                  <div class="page-login-form">
                    
                    <input type = "hidden" name = "command" value = "login">
                      
                      <!-- id -->
                      <div class="form-group">
                        <div class="input-icon">
                          <i class="ti-user" style = "padding-top:1%"></i>
                          <input type="text" id="sender-email" class="form-control" name="loginId" placeholder="아이디를 입력하세요">
                          <span style="display:none; color:red;" id="idChkSpan">아이디를 확인해주세요.</span>
                        </div>
                      </div> 
                      
                      <!-- pwd -->
                      <div class="form-group">
                        <div class="input-icon">
                          <i class="ti-lock" style = "padding-top:1%"></i>
                          <input type="password" class="form-control" name = "loginPwd" placeholder="비밀번호를 입력하세요">
                          <span style="display:none; color:red;" id="pwChkSpan">패스워드를 확인해주세요.</span>
                        </div>
                      </div> 
                      
                      <!-- login button -->
                      <button class="btn btn-common log-btn" id="loginBtn" onclick="loginChk();">로그인</button>
                      <!-- 아이디 비밀번호 찾기 -->
                      <a href = "idfind.jsp" style = "margin-left:22%"><i class="ti-user"></i>&nbsp;<b>아이디 찾기</b></a>
                      <a href = "pwdfind.jsp"  style = "margin-left:20%"><i class="ti-lock"></i>&nbsp;<b> 비밀번호 찾기 </b></a>
                      

                    
                  </div>
                </div>
                <!-- ---------------------------------------------------------------------------------------------------------------- --> 

				<!-- ---------------------------------------------------------------------------------------------------------------- --> 
                <!-- Register -->
                <div id="cd-signup">
                  <div class="page-login-form register">
                    <form name = "registerform" role="form" class="login-form" action="controller.do" onSubmit="return checkPwd(this)">
                    <input type = "hidden" name = "command" value = "sign">
                    
                    <!-- id -->
                      <div class="form-group">
                        <div class="input-icon">
                          <i class="ti-user"></i>
                          <input type="text" id="sender-email" class="form-control" name="regId" required="required" placeholder="아이디를 입력하세요">
                          <span style="display:none; color:green;" id="hideSpan1">사용 가능한  아이디 입니다.</span>
                          <span style="display:none; color:red;" id="hideSpan2">사용 불가능한 아이디 입니다.</span>
                        </div>
                      </div>
                      
                      <!-- pwd --> 
                      <div class="form-group">
                        <div class="input-icon">
                           <i class="ti-lock"></i>
                          <input type="password" id="sender-email" class="form-control" name = "regPwd" required="required" placeholder="비밀번호를 입력하세요">
                        </div>
                      </div>
                      
                      <!-- pwdChk -->
                      <div class="form-group">
                        <div class="input-icon">
                          <i class="ti-lock"></i>
                          <input type="password" id="sender-email" class="form-control" name="regPwdChk" required="required" placeholder="비밀번호 확인">
                          <span style="display:none; color:green;" id="hideSpan3">비밀번호가 동일합니다</span>
                          <span style="display:none; color:red;" id="hideSpan4">비밀번호가 다릅니다</span>
                          <span style="display:none; color:red;" id="hideSpan4_1">비밀번호를 입력하세요</span>
                        </div>
                      </div>
                      
                      <!-- 닉네임 --> 
                      <div class="form-group">
                        <div class="input-icon">
                         <i class="ti-user"></i>
                          <input type="text" id="sender-email" class="form-control" name="nick" required="required" placeholder="닉네임을 입력하세요">
                          <span style="display:none; color:green;" id="hideSpan5">사용 가능한 닉네임 입니다</span>
                          <span style="display:none; color:red;" id="hideSpan6">사용 불가능한 닉네임 입니다</span>
                        </div>
                      </div>
                      
                      <!-- 이메일 -->
                      <div class="form-group">
                        <div class="input-icon">
                          <i class="ti-email"></i>
                          <input type="email" class="form-control" name = "email" placeholder="이메일을 입력하세요" required="required">
                          <span style="display:none; color:green;" id="hideSpan7">사용 가능한 이메일 입니다</span>
                          <span style="display:none; color:red;" id="hideSpan8">사용 불가능한 이메일 입니다</span>
                        </div>
                      </div> 
                     
                      <button class="btn btn-common log-btn" id = "RegisterBtn" onclick = "RegisterChk();">회원가입</button> 
                    </form>
                  </div>
                </div>
                <!-- ---------------------------------------------------------------------------------------------------------------- --> 
                
              </div>
            </div>
          </div>
        </div>
      </div>     

	<script>
		function loginChk() {
			
			var id = $("input[name='loginId']").val();
			var pw = $("input[name='loginPwd']").val();
			
			$.ajax({

			    url: "controller.do?command=login&id="+id+"&pw="+pw ,

			    dataType: "json",

			    success: function(data){
					if(data.res){
						//alert("아이디 확인");
						$("#idChkSpan").css("display", "");
						$("#pwChkSpan").css("display", "none");
					} else {
						//alert("비밀번호 확인");
						$("#idChkSpan").css("display", "none");
						$("#pwChkSpan").css("display", "");
						
					}

			    },

			    error: function (){        
					location.href = "index.jsp";

			    }

			  });
		}
		
		function RegisterChk() {
	         theForm = document.registerform;
	         if(theForm.regId.value==""||theForm.regPwd.value==""||theForm.regPwdChk.value==""||theForm.nick.value==""||theForm.email.value==""){
	            alert("필수 입력란이 비어있습니다. 확인해주세요");
	            if(theForm.regId.value==""){
	               return theForm.regId.focus();
	            }else if(theForm.regPwd.value==""){
	               return theForm.regPwd.focus();
	            }else if(theForm.regPwdChk.value==""){
	               return theForm.regPwdChk.focus();
	            }else if(theForm.nick.value==""){
	               return theForm.nick.focus();
	            }else if(theForm.email.value==""){
	               return theForm.email.focus();
	            }
	         }
	      }
		
		
	</script>
     

      <!-- --------------------------------------------------------------------------------------------------------------------------------------------------------- --> 
    <!-- 2 -->

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
   <!-- ------------------------------------------------------------------------------------------------------------------------------------------------------->
      
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
      
  </body>
</html>