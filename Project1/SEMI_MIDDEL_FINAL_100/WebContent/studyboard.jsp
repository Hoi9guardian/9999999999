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
    
   <style>
		
		
		/* ===== Horizontal Rule ===== */
.rule {
  margin: 10px 0;
  border: none;
  height: 1.5px;
  background-image: linear-gradient(left, #f0f0f0, #c9bbae, #f0f0f0);
}

/* ===== Select Box ===== */
.sel {
  font-size: 1rem;
  display: inline-block;
  margin: 3em 2em;
  width: 350px;
  background-color: transparent;
  position: relative;
  cursor: pointer;
}

.sel::before {
  position: absolute;
  content: '\f063';
  font-family: 'FontAwesome';
  font-size: 2em;
  color: #FFF;
  right: 20px;
  top: calc(50% - 0.5em);
}

.sel.active::before {
  transform: rotateX(-180deg);
}

.sel__placeholder {
  display: block;
  font-family: 'Quicksand';
  font-size: 1.6em;
  color: #838e95;
  padding: 0.2em 0.5em;
  text-align: left;
  pointer-events: none;
  user-select: none;
  visibility: visible;
  float:left;
}

.sel.active .sel__placeholder {
  visibility: hidden;
}

.sel__placeholder::before {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 0.2em 0.5em;
  content: attr(data-placeholder);
  visibility: hidden;
}

.sel.active .sel__placeholder::before {
  visibility: visible;
}

.sel__box {
  position: absolute;
  top: calc(100% + 4px);
  left: -4px;
  display: none;
  list-style-type: none;
  text-align: left;
  font-size: 1em;
  background-color: #FFF;
  width: calc(100% + 8px);
  box-sizing: border-box;
}

.sel.active .sel__box {
  display: block;
  animation: fadeInUp 500ms;
}

.sel__box__options {
  display: list-item;
  font-family: 'Quicksand';
  font-size: 1.5em;
  color: #838e95;
  padding: 0.5em 1em;
  user-select: none;
}

.sel__box__options::after {
  content: '\f00c';
  font-family: 'FontAwesome';
  font-size: 0.5em;
  margin-left: 5px;
  display: none;
}

.sel__box__options.selected::after {
  display: inline;
}

.sel__box__options:hover {
  background-color: #ebedef;
}

/* ----- Select Box Black Panther ----- */
.sel {
  border-bottom: 4px solid rgba(0, 0, 0, 0.3);
}

.sel--black-panther {
  z-index: 3;
}

/* ----- Select Box Superman ----- */
.sel--superman {
/*   display: none; */
  z-index: 2;
}

/* ===== Keyframes ===== */
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translate3d(0, 20px, 0);
  }

  to {
    opacity: 1;
    transform: none;
  }
}

@keyframes fadeOut {
  from {
    opacity: 1;
  }

  to {
    opacity: 0;
  }
}



	</style>
	
	
    
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
               
              
<%

	if(session.getAttribute("vo")==null||session.getAttribute("vo")==""){

%>              
				<!-- 로그인 이전 -->
                <script>
                	location.href = "login.jsp";
                </script>

<%

	} else {

%>
                 
                 <!-- -------------------------------------------------------------------------------------------------- -->
                <!-- 메인화면의 윗줄 -->
                <!-- 로그인 이전 -->
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
            <!-- 반응형웹버전 -->
<%

	if(session.getAttribute("vo")==null||session.getAttribute("vo")==""){

%>
				<!-- 로그인 이전 -->
                <script>
                	location.href = "login.jsp";
                </script>
                 <!-- ------------------------------------------------------------------------------------------------------------------------- --> 
<% 

	} else {
	
%>
		 <!-- ------------------------------------------------------------------------------------------------------------------------- --> 
		 <!-- 로그인 이전 -->
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
            
              <!-- 마이페이지/ 로그아웃 -->
              <li class="right" style = "margin-top:3%"><a href="controller.do?command=mypage"> 마이페이지 </a></li>
                <li class="right" style = "margin-top:3%"><a href="controller.do?command=logout"> 로그아웃 </a></li>       
            </ul>
            <!-- ------------------------------------------------------------------------------------------------------------------------- --> 
            
<%

	}

%>

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
                <h2 class="product-title">소모임만들기</h2>
                <ol class="breadcrumb">
                  <li><a href="index.jsp"><i class="ti-home"></i> 홈</a></li>
                  <li class="current">소모임만들기</li>
                </ol>
              </div>
            </div>
          </div>
        </div>
      </div>
     <!-- ---------------------------------------------------------------------------------------- -->
     
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

      <div id="content" style = "padding : 0px">
        <div class="container">        
            
            <!-- ---------------------------------------------------------------------------------------- -->
            <div class="job-alerts-item candidates" style = "padding : 1%">
            <!-- 말머리 -->
              <div  style = "padding : 1%">
              
              <div style = "float:left;width:15%;">
	              
	              	<form  method = "post" action = "controller.do" style = "width:80%">
	              	<input type = "hidden" name = "command" value = "headtag">
	              	<input type = "hidden" name = "tabloc" value = "study">
	              		

		              	<select name = "horsehead" id = "select-superpower" onchange="location.href=this.value">
		              	    <option value = "" style = "float:left">말머리</option>
		              		<option value = "controller.do?&command=headtag&tabloc=study&horsehead=horsehead" style = "float:left">전체</option>
		              		  <option value = "controller.do?&command=headtag&tabloc=study&horsehead=C1">건설</option>
	                          <option value = "controller.do?&command=headtag&tabloc=study&horsehead=C2">기계</option>
	                          <option value = "controller.do?&command=headtag&tabloc=study&horsehead=C3">인쇄.목재.가구.공예</option>
	                          <option value = "controller.do?&command=headtag&tabloc=study&horsehead=C4">이용.숙박.여행.오락.스포츠</option>
	                          <option value = "controller.do?&command=headtag&tabloc=study&horsehead=C5">음식서비스</option> 
	                          <option value = "controller.do?&command=headtag&tabloc=study&horsehead=C6">전기.전자</option>
	                          <option value = "controller.do?&command=headtag&tabloc=study&horsehead=C7">정보통신</option>
	                          <option value = "controller.do?&command=headtag&tabloc=study&horsehead=C8">경비.청소</option>
	                          <option value = "controller.do?&command=headtag&tabloc=study&horsehead=C9">경영.회계.사무</option>
	                          <option value = "controller.do?&command=headtag&tabloc=study&horsehead=C10">광업자원</option>
	                          <option value = "controller.do?&command=headtag&tabloc=study&horsehead=C11">농림어업</option>
	                          <option value = "controller.do?&command=headtag&tabloc=study&horsehead=C12">문화.예술.디자인.방송</option>                                    
	                          <option value = "controller.do?&command=headtag&tabloc=study&horsehead=C13">보건.의료</option>
	                          <option value = "controller.do?&command=headtag&tabloc=study&horsehead=C14">섬유.의복</option>
	                          <option value = "controller.do?&command=headtag&tabloc=study&horsehead=C15">식품.가공</option>
	                          <option value = "controller.do?&command=headtag&tabloc=study&horsehead=C16">안전관리</option>
	                          <option value = "controller.do?&command=headtag&tabloc=study&horsehead=C17">운전.운송</option>
	                          <option value = "controller.do?&command=headtag&tabloc=study&horsehead=C18">재료</option>
	                          <option value = "controller.do?&command=headtag&tabloc=study&horsehead=C19">화학</option>
	                          <option value = "controller.do?&command=headtag&tabloc=study&horsehead=C20">환경.에너지</option>
	                          <option value = "controller.do?&command=headtag&tabloc=study&horsehead=C21">언어.교육</option>
		              	</select>  	
		              	
		              	
		             </form>
		              	
              </div>
<!--   검색 -->
              <div style = "float:right;width:30%;margin-bottom:10px;">
	              		<form method="post" action ="controller.do?" style="width:90%">
	              		<input type = "hidden" name = "command" value = "searchboard">
	              		<input type = "hidden" name = "tabloc" value = "study">
	              		<div style="float: left; width: 30%;">
	              			<select name = "searchtag">
	              				<option value="title">제목</option>
	              				<option value="nickname">작성자</option>
	              				<option value="content">내용</option>
	              				<option value="both">제목+내용</option>
	              			</select>
	              		</div>
	              		<div style="float: left; width: 57%;">
	              			<input type="text" name="boardkeyword" style="border: 1px solid #ccc !important; width:100%;">
	              		</div>
	              		<div style="float: right;">
	              			<button type="submit" style="background-color:lightgray; padding: 0 10px;"><i class="ti-search"></i></button>
	              		</div>         		
		
	              		</form>
		              
		      </div> 
                <!-- 1-1 -->
                <div class="freeboard">
                <jsp:include page="real_freeboard.jsp"></jsp:include>

               </div>
               
                 <!-- ---------------------------------------------------------------------------------------- -->
            <!-- ---------------------------------------------------------------------------------------- -->
            
             <!-- 로그인 시에만 가능하게끔 해야함!!!!!!-------------------------------------------------------------------------------------------------- -->
                <div class="collapse navbar-collapse" id="navbar">  
                <!-- -------------------------------------------------------------------------------------------------- -->
               
              
                <!-- -------------------------------------------------------------------------------------------------- -->
                <!-- 글작성 -->
 <%

	if(session.getAttribute("vo")==null||session.getAttribute("vo")==""){

%>            
            <ul class="nav navbar-nav navbar-right" style = "margin-top:2%;">                 
			<li class="active" style = "height:20%"><a href="login.jsp" class="btn btn-common" style = "border-radius:10px"> 글작성 </a></li>
			</ul>
<%

	}else {

%>                 
            <ul class="nav navbar-nav navbar-right" style = "margin-top:2%;">                 
				<li class="active" style = "height:20%"><a href="controller.do?command=writebefore&tabloc=study" class="btn btn-common" style = "border-radius:10px"> 글작성 </a></li>
			</ul>
           
<%
	}
%>  
                 
              </div><!-- 버튼 + post a job + login->>>>>>>>>>>> class = navbar -->                           
            <!-- ---------------------------------------------------------------------------------------------------------------------- -->

         <!-- --------------------------------------------------------------------------------------------------------------------------------------------------------- -->
                       
          
              </div>
   
                 
            <!-- ---------------------------------------------------------------------------------------- -->
        </div>
            <!-- ---------------------------------------------------------------------------------------- -->
 <script type="text/javascript">
	function PageMove(page){
    		location.href = "controller.do?command=study&curpagenum="+page;
    }
</script>             
            
            <!------------------------------------------------------------------------------------------------------------------------------------------ -->
  <!-- 페이징_study게시판 시작---------------------------------------------------------------------------------------------------------------------------------------- -->            
<c:choose>            
		          
		          <c:when test="${page.listCount > 10}">  
		          
		          <div  style = "margin-top:2%;margin-bottom:2%">
		          
		          <ul class="pagination pull-right">
				        <li><a href="javascript:PageMove('1')">맨앞으로</a></li>
				        <c:if test="${page.preve eq true }">
				        <li class="active"><a href="javascript:PageMove(${page.currentPage-1 })">앞으로</a></li>
				        </c:if>
				              <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }" >
				                  <c:choose>
				                      <c:when test="${i eq page.currentPage }">
				               			<li class="active"><a href="javascript:PageMove(${i})">${i}</a></li>
				                      </c:when>
				                      <c:otherwise>
				                        <li><a href="javascript:PageMove(${i})">${i}</a></li>
				                      </c:otherwise>
				                  </c:choose>
				              </c:forEach>
				        <c:if test="${page.next eq true }">    
				        <li class="active"><a href="javascript:PageMove(${page.currentPage+1 })">뒤로</a></li>
				        </c:if>  
				        <li><a href="javascript:PageMove(${page.allPage})">맨뒤로</a></li>
				      </ul> 
 		                  
	            
		          </div>
		          </c:when>
		          
		         <c:otherwise>
		         <div></div>
		         </c:otherwise>
</c:choose>		          
		          
		          
<!-- 페이징_study게시판 끝---------------------------------------------------------------------------------------------------------------------------------------- -->
             
<!-- 페이징_카테고리 ---------------------------------------------------------------------------------------------------------------------------------------- -->
<script type="text/javascript">

	function categoryPageMove(page){
			var horsehead2 = '<c:out value="${horsehead2}"/>';
			location.href = "controller.do?command=headtag&curpagenum="+page+"&tabloc=study&horsehead="+horsehead2 ;
    }
</script> 


<c:choose>
				 
		         <c:when test="${ categorypage.listCount >10 }">
		           
			          <div class="col-md-12" style = "margin-top:2%;margin-bottom:2%">
			             
			               <ul class="pagination pull-right">
					        <li><a href="javascript:categoryPageMove(1)">맨앞으로</a></li>
					        <c:if test="${categorypage.preve eq true }">
					        <li class="active"><a href="javascript:categoryPageMove(${categorypage.currentPage-1 })">앞으로</a></li>
					        </c:if>
					        
					              <c:forEach var="i" begin="${categorypage.startPage }" end="${categorypage.endPage }" >
					                  <c:choose>
					                      <c:when test="${i eq categorypage.currentPage}">
					               			<li class="active"><a href="javascript:categoryPageMove(${i})">${i}</a></li>
					                      </c:when>
					                      <c:otherwise>
					                        <li><a href="javascript:categoryPageMove(${i})">${i}</a></li>
					                      </c:otherwise>
					                  </c:choose>
					              </c:forEach>
					              
					        <c:if test="${categorypage.next eq true }">    
					        <li class="active"><a href="javascript:categoryPageMove(${categorypage.currentPage+1 })">뒤로</a></li>
					        </c:if>  
					        <li><a href="javascript:categoryPageMove(${categorypage.allPage})">맨뒤로</a></li>
					      </ul>     
			         	
			         	
			          </div>
		          
		         </c:when>
		         <c:otherwise>
		         <div></div>
		         </c:otherwise>
</c:choose>	
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->     
<script type="text/javascript">

	function searchPageMove(page){
			var horsehead2 = '<c:out value="${horsehead2}"/>';
			var searchtag = '<c:out value="${searchtag }"/>';
			var boardkeyword = '<c:out value="${boardkeyword }"/>';
			location.href = "controller.do?command=searchboard&curpagenum="+page+"&tabloc=study&searchtag="+searchtag+"&boardkeyword="+boardkeyword ;
    }
</script> 
<c:if test="${searchpage.listCount ne '0' }"> 
<c:choose>
		         <c:when test="${ searchpage.listCount > 10}">
		           
			          <div class="col-md-12" style = "margin-top:2%;margin-bottom:2%">
			             
			               <ul class="pagination pull-right">
					        <li><a href="javascript:searchPageMove(1)">맨앞으로</a></li>
					        <c:if test="${searchpage.preve eq true }">
					        <li class="active"><a href="javascript:searchPageMove(${searchpage.currentPage-1 })">앞으로</a></li>
					        </c:if>
					        
					              <c:forEach var="i" begin="${searchpage.startPage }" end="${searchpage.endPage }" >
					                  <c:choose>
					                      <c:when test="${i eq searchpage.currentPage}">
					               			<li class="active"><a href="javascript:searchPageMove(${i})">${i}</a></li>
					                      </c:when>
					                      <c:otherwise>
					                        <li><a href="javascript:searchPageMove(${i})">${i}</a></li>
					                      </c:otherwise>
					                  </c:choose>
					              </c:forEach>
					              
					        <c:if test="${searchpage.next eq true }">    
					        <li class="active"><a href="javascript:searchPageMove(${searchpage.currentPage+1 })">뒤로</a></li>
					        </c:if>  
					        <li><a href="javascript:searchPageMove(${searchpage.allPage})">맨뒤로</a></li>
					      </ul>     
			         	
			         	
			          </div>
		          
		         </c:when>
		         <c:otherwise>
		         <div></div>
		         </c:otherwise>
</c:choose>
</c:if>
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