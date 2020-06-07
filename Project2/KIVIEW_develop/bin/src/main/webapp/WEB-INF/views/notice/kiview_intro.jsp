<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>KIVIEW &mdash; Intro</title>

<!-- css -->
<jsp:include page="../head.jsp"/>
<!-- js -->
<script type="text/javascript" src = "resources/js/notice.js"></script>
<script type="text/javascript" src = "resources/js/kiview_intro.js"></script>

<style type="text/css">
.modal-content {
  position: relative;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
  width: 100%;
  pointer-events: auto;
  background-color: #fff;
  background-clip: padding-box;
  border: 0;
  border-radius: 0.3rem;
  outline: 0; }
.modal-dialog.modal-fullsize {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}
.modal-content.modal-fullsize {
  height: auto;
  min-height: 100%;
  border-radius: 0;
}
</style>

</head>

<body id="body">

	<!-- header 부분 -->
	<jsp:include page="../header.jsp"/>
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('resources/images/main/board_img01.png');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-2 bread">키뷰 소개</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.do">홈 
						<i class="ion-ios-arrow-forward"></i></a>
						</span> <span>키뷰안내 <i class="ion-ios-arrow-forward"></i></span> 
						<span>&nbsp;키뷰 소개</span>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- header 끝  -->
	

	<div class="jsx-903324597 content" style = "min-height:0px;" id = "contentdiv">
		<div class="jsx-3810764099 board-box">
			<div class="jsx-1103591975 sidebar sidebar--kindergarten">
				<h2 class="jsx-1103591975">
				
				<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32"
						viewBox="0 0 24 24" fill="none" stroke="#dfdfdf" stroke-width="2"
						stroke-linecap="round" stroke-linejoin="round"
						style="position: relative;">
						<path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
						<polyline points="14 2 14 8 20 8"></polyline>
						<line x1="16" y1="13" x2="8" y2="13"></line>
						<line x1="16" y1="17" x2="8" y2="17"></line>
						<polyline points="10 9 9 9 8 9"></polyline></svg>
						
					<span class="jsx-1103591975">키뷰 소개</span>
				</h2>
				
				<!-- 사이드 카테고리  -->
				<ul class="jsx-1103591975">
					<li class="jsx-1103591975">
					<a class="jsx-1103591975" style = "cursor:pointer;"
					 id = "menu01">공지사항</a></li>
					<li class="jsx-1103591975 active">
					<a class="jsx-1103591975" style = "cursor:pointer;"
					id = "menu02">키뷰소개</a></li>
					<li class="jsx-1103591975">
					<a class="jsx-1103591975" style = "cursor:pointer;"
					id = "menu03">FAQ</a></li>
				</ul>
			</div>
				
				<!-- intro 본문 -->
        		<div class="pricing-entry bg-light pb-4 text-center"
        			style = "position:relative; right:25%; width:35%;">
	        		<div class="img" 
	        			style="background-image: url('resources/images/main/intro-main01.jpg'); height: 100%;
	        					border:1px solid lightgray"></div>
	        		<div class="px-4" style = "background:#fafafa;">
	        			<h3>유치원의 모든 리뷰 
	        			<span style = "color:#FFDC00">KIVIEW</span></h3>
	        			<br>
	        			<p class="button text-center">
	        			<a style = "cursor:pointer;" data-toggle="modal" data-target="#myFullsizeModal" 
							class="btn btn-primary px-4 py-3">눌러보세요!</a></p>
        			</div>
        		</div>
        		<!-- intro 본문 끝 -->
        		
        	 <!-- Full Size Modal -->	
        	 <div class="modal fade" id="myFullsizeModal" tabindex="-1" role="dialog" 
        		 aria-labelledby="myFullsizeModalLabel" style = "display:none;">
			  <div class="modal-dialog modal-fullsize" role="document">
			    <div class="modal-content modal-fullsize">
			      <!-- <div class="modal-header"> -->
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style = "outline:none;">
			        <span aria-hidden="true" id = "modal-btnclo">&times;</span></button>
			      <!-- </div> -->
			      <!-- modal body -->
			      <div class="modal-body">
			       <img src ="resources/images/main/intro_img01.png" id = "introimg01">
			       <img src = "resources/images/main/intro_text01.png" id = "introimg02" 
			       onclick = "location.href='index.do'" style = "position:absolute; left:41%; top:18%">
			       <img src = "resources/images/main/intro_text02.png" id = "introimg02" 
			        style = "position:absolute; left: 31.5%; top: 32%;">
			        
			       <img src = "resources/images/main/intro_btn01.png" id = "introimg02" 
			        style = "position:absolute; left: 38%; top: 49%;" onclick = "location.href='reviewboard.do'">
			        
			       <c:choose>
			       <c:when test="${!empty login}">
			       <img src = "resources/images/main/intro_btn02.png" id = "introimg02" 
			        style = "position:absolute; left: 52%; top: 49%;" onclick = "cafe();">
			       </c:when>
			       <c:otherwise>
			       <img src = "resources/images/main/intro_btn02.png" id = "introimg02" 
			        style = "position:absolute; left: 52%; top: 49%;" onclick = "cafe_not();">
			       </c:otherwise>
			       </c:choose>
			      </div>
			      <!-- modal body 끝 -->
			    </div>
			  </div>
			</div>
			<!-- modal 끝 -->
			
		</div>
	</div>
	<br>
	<br>
	<br>
	
	<!-- footer랑 띄우기 -->
	<section style = "background:#fff;">
		<div class="container">
			<br><br><br><br><br><br><br><br>
		</div>
	</section>
	


	<!-- @@ footer 영역 @@ -->
	<jsp:include page="../footer.jsp"/>

	

</body>
</html>