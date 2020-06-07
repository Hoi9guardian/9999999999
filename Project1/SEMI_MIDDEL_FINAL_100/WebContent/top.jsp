<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="assets/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="assets/css/jasny-bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="assets/css/bootstrap-select.min.css"
	type="text/css">
<!-- Material CSS -->
<link rel="stylesheet" href="assets/css/material-kit.css"
	type="text/css">
<!-- Font Awesome CSS -->
<link rel="stylesheet" href="assets/fonts/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="assets/fonts/themify-icons.css">

<!-- Animate CSS -->
<link rel="stylesheet" href="assets/extras/animate.css" type="text/css">
<!-- Owl Carousel -->
<link rel="stylesheet" href="assets/extras/owl.carousel.css"
	type="text/css">
<link rel="stylesheet" href="assets/extras/owl.theme.css"
	type="text/css">
<!-- Rev Slider CSS -->
<link rel="stylesheet" href="assets/extras/settings.css" type="text/css">
<!-- Slicknav js -->
<link rel="stylesheet" href="assets/css/slicknav.css" type="text/css">
<!-- Main Styles -->
<link rel="stylesheet" href="assets/css/main.css" type="text/css">
<!-- Responsive CSS Styles -->
<link rel="stylesheet" href="assets/css/responsive.css" type="text/css">

<!-- Color CSS Styles  -->
<link rel="stylesheet" type="text/css" href="assets/css/colors/red.css"
	media="screen" />

</head>

<body>

	<!-- 1 -->
	<!-- --------------------------------------------------------------------------------------------------------------------------------------------------------- -->
	<div class="header">
		<!-- Start intro section -->
		<section id="intro" class="section-intro">

			<!-- ---------------------------------------------------------------------------------------------------------------------- -->
			<!-- 메인화면 상단바 -->
			<div class="logo-menu"
				style="background: url(assets/img/bg/black2.jpg)">
				<nav class="navbar navbar-default" role="navigation"
					data-spy="affix" data-offset-top="50">

					<!-- -------------------------------------------------------------------------------------------------- -->
					<div class="container">
						<!-- 메인 화면/ 맨위의 메뉴바(logo, home, pages, cadidates, employers, blog) -->
						<div class="navbar-header">
							<!-- button -> 클릭시 id(navbar)인 부분의 데이터 출력 -->
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target="#navbar">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<!-- 로고 -> 클릭시에 다시 main으로 -->
							<a class="navbar-brand logo" href="index.jsp"><img
								src="assets/img/logo.png" alt=""></a>
						</div>
						<!-- class = navbar-header -->

						<!-- -------------------------------------------------------------------------------------------------- -->
						<!-- 여기서 부터 분리한 이유는 로고는 반응형웹이나 기존이나 같은 것을 쓰기에 두번 반복해서 사용하지 않음 -->
						<!-- 메인화면의 메뉴바 시작 -->
						<!-- 메인화면/ 맨위의 메뉴바에 출력될 데이터 -->
						<div class="collapse navbar-collapse" id="navbar">
							<!-- -------------------------------------------------------------------------------------------------- -->


							<%
								if (session.getAttribute("vo") == null || session.getAttribute("vo") == "") {
							%>
							<!-- -------------------------------------------------------------------------------------------------- -->
							<!-- 메인화면의 윗줄의 post a job, log in -->
							<ul class="nav navbar-nav navbar-right">

								<li><a href="index.jsp"><img
										src="assets/img/bg/red.png" alt="이미지가 없습니다"> </a> <!-- home 밑의 li(home1, home2, home3, home4) -->
									<ul class="dropdown">

										<li><a href="allcerti.jsp"><img
												src="assets/img/certilist.png" alt="이미지가 없습니다">&nbsp;&nbsp;<b>자격증
													백과사전</b></a></li>
										<li><a href="controller.do?command=top"><img
												src="assets/img/top10.png" alt="이미지가 없습니다"><b>&nbsp;&nbsp;TOP10</b></a></li>
										<li><a href="controller.do?command=qna"><img
												src="assets/img/qa.png" alt="이미지가 없습니다"><b>&nbsp;&nbsp;Q
													& A</b></a></li>
										<li><a href="controller.do?command=study"><img
												src="assets/img/community.png" alt="이미지가 없습니다"><b>&nbsp;&nbsp;소모임
													모집</b></a></li>
										<li><a href="aptitude.jsp"><img
												src="assets/img/heart.png" alt="이미지가 없습니다"><b>&nbsp;&nbsp;심리검사</b></a></li>
										<li><a href="contactus.jsp"><img
												src="assets/img/contact.png" alt="이미지가 없습니다"><b>&nbsp;&nbsp;넌그자와만난다</b></a></li>
									</ul></li>

								<li class="right" style="margin-top: 5%"><a
									href="login.jsp"> 로그인 </a></li>
							</ul>
							<!-- -------------------------------------------------------------------------------------------------- -->

							<%
								} else {
							%>

							<!-- -------------------------------------------------------------------------------------------------- -->
							<!-- 메인화면의 윗줄의 post a job, log in -->
							<ul class="nav navbar-nav navbar-right">

								<li><a href="index.jsp"><img
										src="assets/img/bg/red.png" alt="이미지가 없습니다"> </a> <!-- home 밑의 li(home1, home2, home3, home4) -->
									<ul class="dropdown">

										<li><a href="allcerti.jsp"><img
												src="assets/img/certilist.png" alt="이미지가 없습니다">&nbsp;&nbsp;<b>자격증
													백과사전</b></a></li>
										<li><a href="controller.do?command=top"><img
												src="assets/img/top10.png" alt="이미지가 없습니다"><b>&nbsp;&nbsp;TOP10</b></a></li>
										<li><a href="controller.do?command=qna"><img
												src="assets/img/qa.png" alt="이미지가 없습니다"><b>&nbsp;&nbsp;Q
													& A</b></a></li>
										<li><a href="controller.do?command=study"><img
												src="assets/img/community.png" alt="이미지가 없습니다"><b>&nbsp;&nbsp;소모임
													모집</b></a></li>
										<li><a href="aptitude.jsp"><img
												src="assets/img/heart.png" alt="이미지가 없습니다"><b>&nbsp;&nbsp;심리검사</b></a></li>
										<li><a href="contactus.jsp"><img
												src="assets/img/contact.png" alt="이미지가 없습니다"><b>&nbsp;&nbsp;넌그자와만난다</b></a></li>
									</ul></li>

								<li class="right" style="margin-top: 3%"><a
									href="controller.do?command=mypage"> 마이페이지 </a></li>
								<li class="right" style="margin-top: 3%"><a
									href="controller.do?command=logout"> 로그아웃 </a></li>
							</ul>
							<!-- -------------------------------------------------------------------------------------------------- -->

							<%
								}
							%>


						</div>
						<!-- 버튼 + post a job + login->>>>>>>>>>>> class = navbar -->
					</div>
					<!-- 메인 화면 상단 바 -> 로그 + 버튼  + post a job + login ->>>>>>> class = container-->
					<!-- ---------------------------------------------------------------------------------------------------------------------- -->


					<!-- ------------------------------------------------------------------------------------------------------------------------- -->
					<!-- ------------------------------------------------------------------------------------------------------------ -->
					<!-- 반응형웹버전 -->
					<%
						if (session.getAttribute("vo") == null || session.getAttribute("vo") == "") {
					%>
					<ul class="wpb-mobile-menu">

						<li><a href="index.jsp"><img src="assets/img/bg/red.png"
								alt="이미지가 없습니다"> </a> <!-- home 밑의 li(home1, home2, home3, home4) -->
							<ul class="dropdown">

								<li><a href="allcerti.jsp"><img
										src="assets/img/certilist.png" alt="이미지가 없습니다">&nbsp;&nbsp;<b>자격증
											백과사전</b></a></li>
								<li><a href="controller.do?command=top"><img
										src="assets/img/top10.png" alt="이미지가 없습니다"><b>&nbsp;&nbsp;TOP10</b></a></li>
								<li><a href="controller.do?command=qna"><img
										src="assets/img/qa.png" alt="이미지가 없습니다"><b>&nbsp;&nbsp;Q
											& A</b></a></li>
								<li><a href="controller.do?command=study"><img
										src="assets/img/community.png" alt="이미지가 없습니다"><b>&nbsp;&nbsp;소모임
											모집</b></a></li>
								<li><a href="aptitude.jsp"><img
										src="assets/img/heart.png" alt="이미지가 없습니다"><b>&nbsp;&nbsp;심리검사</b></a></li>
								<li><a href="contactus.jsp"><img
										src="assets/img/contact.png" alt="이미지가 없습니다"><b>&nbsp;&nbsp;넌그자와만난다</b></a></li>

							</ul></li>

						<!-- login -->
						<li class="right" style="margin-top: 5%"><a href="login.jsp">
								로그인 </a></li>
					</ul>
					<%
						} else {
					%>

					<ul class="wpb-mobile-menu">

						<li><a href="index.jsp"><img src="assets/img/bg/red.png"
								alt="이미지가 없습니다"> </a> <!-- home 밑의 li(home1, home2, home3, home4) -->
							<ul class="dropdown">

								<li><a href="allcerti.jsp"><img
										src="assets/img/certilist.png" alt="이미지가 없습니다">&nbsp;&nbsp;<b>자격증
											백과사전</b></a></li>
								<li><a href="controller.do?command=top"><img
										src="assets/img/top10.png" alt="이미지가 없습니다"><b>&nbsp;&nbsp;TOP10</b></a></li>
								<li><a href="controller.do?command=qna"><img
										src="assets/img/qa.png" alt="이미지가 없습니다"><b>&nbsp;&nbsp;Q
											& A</b></a></li>
								<li><a href="controller.do?command=study"><img
										src="assets/img/community.png" alt="이미지가 없습니다"><b>&nbsp;&nbsp;소모임
											모집</b></a></li>
								<li><a href="aptitude.jsp"><img
										src="assets/img/heart.png" alt="이미지가 없습니다"><b>&nbsp;&nbsp;심리검사</b></a></li>
								<li><a href="contactus.jsp"><img
										src="assets/img/contact.png" alt="이미지가 없습니다"><b>&nbsp;&nbsp;넌그자와만난다</b></a></li>

							</ul></li>

						<!-- logout -->
						<li class="right" style="margin-top: 3%"><a
							href="controller.do?command=mypage"> 마이페이지 </a></li>
						<li class="right" style="margin-top: 3%"><a
							href="controller.do?command=logout"> 로그아웃 </a></li>

					</ul>

					<%
						}
					%>
				</nav>



			</div>
		</section>
	</div>
	<!-- Header Section End -->

	<!-- ---------------------------------------------------------------------------------------- -->
	<!-- 상단 메뉴바 -->
	<div class="page-header"
		style="background: url(assets/img/bar_bg2.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="breadcrumb-wrapper">
						<br>
						<br>
						<h2 class="product-title">TOP10</h2>
						<ol class="breadcrumb">
							<li><a href="index.jsp"><i class="ti-home"></i> 홈</a></li>
							<li class="current">TOP10</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ---------------------------------------------------------------------------------------- -->

	<!-- Job Browse Section Start -->
	<section class="job-browse section">
		<div class="container" style="margin: 0; padding: 0; width: 100%">

			<div class="row">

				<div style="width: 30%; height: 21%; position: fixed; margin-left:5%" id = "cloud" >

					

				</div>


				<div class="col-md-9 col-sm-8"
					style="float: right; width: 70%; padding-left: 15%">

					<!-- -------------------------------------------------------------------------------------------------------------------------------- -->


					<c:forEach items="${tList}" var="tlist" varStatus="status"
						begin="0" end="10" step="1">
						<c:set var="cnt" value="${step}" />

						<!-- --------------------------- 1 등    -------------------------- -->
						<div class="job-list" style="width: 80%">
							<div class="thumb">
								<a href="controller.do?command=detail&lcode=${tlist.lcode}"><img
									src="${tlist.cimg}" alt=""></a>
							</div>
							<div class="job-list-content">
								<h4>
									<a href="controller.do?command=detail&lcode=${tlist.lcode}"><c:out
											value="${tlist.lname}" /></a><span class="full-time"><c:out
											value="${status.count}" />등</span>
								</h4>

								<div class="job-tag">
									<div class="pull-left">
										<div class="meta-tag">
											<span><a
												href="controller.do?command=all&ccode=${tlist.ccode3}"><i
													class="ti-desktop"></i>
												<c:out value="${tlist.cname}" /></a></span>
										</div>
									</div>
									<div class="pull-right">
										<div class="icon">
											<button
												style="background: none; border: none; width: 48px; margin: -6px; padding: 0;"
												onclick="heartFunc(${tlist.lcode });">
												<c:set var="istrue" value="false" />
												<c:forEach items="${zzimlist }" var="zzimlist">
													<c:if test="${zzimlist.lcode eq tlist.lcode }">
														<c:set var="istrue" value="true" />
													</c:if>
												</c:forEach>
												<c:choose>
													<c:when test="${istrue eq true }">
														<img id="zzimheart${tlist.lcode }"
															src="assets/img/icons/zheart.png">
													</c:when>
													<c:when test="${istrue eq false }">
														<img id="zzimheart${tlist.lcode }"
															src="assets/img/icons/zzheart.png">
													</c:when>
												</c:choose>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- --------------------------- 1 등    -------------------------- -->
					</c:forEach>
					<!-- -------------------------------------------------------------------------------------------------------------------------------- -->

				</div>
			</div>

		</div>
		</div>
	</section>
	<!-- Job Browse Section End -->

	<!-- --------------------------------------------------------------------------------------------------------------------------------------------------------- -->
	<!-- wordcloud -->
	<script src="https://d3js.org/d3.v3.min.js" charset = "utf-8"></script>
	<script src="d3.layout.cloud.js"></script>
	<script
		src="https://rawgit.com/jasondavies/d3-cloud/master/build/d3.layout.cloud.js"
		type="text/JavaScript"></script>
	<script>
    	
	var arr = new Array();
	<c:forEach items = "${tList}" var = "tlist">
	
		arr.push({name : "${tlist.lname}",
					count : "${tlist.conut}"});
	
	</c:forEach>
	
    var width = 600, height = 400;

	var svg = d3.select("#cloud").append("svg")
	    .attr("width", width)
	    .attr("height", height);
	
		d3.csv("assets/csv/wordcloud.csv", function (data) {
			
		console.log(data);

	    showCloud(data)
	    setInterval(function(){
	         showCloud(data)
	    },2000) 
	});
	//scale.linear: 선형적인 스케일로 표준화를 시킨다. 
	//domain: 데이터의 범위, 입력 크기
	//range: 표시할 범위, 출력 크기 
	//clamp: domain의 범위를 넘어간 값에 대하여 domain의 최대값으로 고정시킨다.
	
	wordScale = d3.scale.linear().domain([0, 30]).range([0, 70]).clamp(true);
	
	var keywords = [arr[0]["name"], arr[1]["name"], arr[2]["name"]];
	console.log(keywords);
	
	var svg = d3.select("svg")
	            .append("g")
	            .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
	
	function showCloud(data) {
		
	    d3.layout.cloud().size([width, height])
	        //클라우드 레이아웃에 데이터 전달
	        .words(data)
	        .rotate(function (d) {
	            return d.name.length > 0 ? 0 : 90;
	        })	        
	        //스케일로 각 단어의 크기를 설정
	        .fontSize(function (d) {
	            return wordScale(d.freq);
	        })
	        //클라우드 레이아웃을 초기화 > end이벤트 발생 > 연결된 함수 작동  
	        .on("end", draw)
	        .start();
	
	    function draw(words) { 
	        var cloud = svg.selectAll("text").data(words)
	        //Entering words
	        cloud.enter()
	            .append("text")
	            .style("fill", function (d) {
	            	console.log(keywords.indexOf(d.name) + d.name);
	                return (keywords.indexOf(d.name) > -1 ? (keywords.indexOf(d.name)>0? ((keywords.indexOf(d.name)>1)?"#FFCBCB":"#FF8C78") :"#FF4F57") : "lightgray");
	            })
	            .style("fill-opacity", .5)
	            .style("font-weight","bold")
	            .attr("text-anchor", "middle") 
	            .attr('font-size', 1)
	            .text(function (d) {
	                return d.name;
	            }); 
	        cloud
	            .transition()
	            .duration(600)
	            .style("font-size", function (d) {
	                return d.size + "px";
	            })
	            .attr("transform", function (d) {
	                return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
	            })
	            .style("fill-opacity", 1); 
	    }
	}
    	
    </script>
	<!-- --------------------------------------------------------------------------------------------------------------------------------------------------------- -->

	<!-- --------------------------------------------------------------------------------------------------------------------------------------------------------- -->
	<!-- 2 -->
	<footer>

		<!-- 2-1 -->
		<!-- ---------------------------------------------------------------------------------------------------------------------------------------- -->
		<section class="footer-Content" style="background-color: white;">
			<div class="container">
				<div class="row">

					<!-- ---------------------------------------------------------------------------------------------------------------- -->
					<div class="col-md-3 col-sm-6 col-xs-12">

						<!-- job board의 아이콘 -->
						<div class="widget">
							<br>
							<br>


							<!-- job board 밑의 문자 -->
						</div>
						<!-- widget -->

					</div>
					<!--  class = "col-md-3 col-sm-6 col-xs-12" 끝 -->
					<!-- ---------------------------------------------------------------------------------------------------------------- -->

					<div class="col-md-3 col-sm-6 col-xs-12">

						<div class="widget" style="text-align: center"></div>
						<!-- widget -->

					</div>

					<!-- ---------------------------------------------------------------------------------------------------------------- -->

					<div class="col-md-3 col-sm-6 col-xs-12">

						<div class="widget" style="text-align: center"></div>
						<!-- widget -->

					</div>

					<%
						if (session.getAttribute("vo") == null || session.getAttribute("vo") == "") {
					%>

					<!-- ---------------------------------------------------------------------------------------------------------------- -->
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="widget " style="text-align: center">

							<p class="block-title" style="color: #ff4f57; font-size: 15px">
								<a href="login.jsp"><b> 더 많은 정보를 얻고 싶다면 </b>&nbsp; <i
									class="fa fa-lock" style="font-size: 22px"></i></a>
							</p>


						</div>
						<!-- widget 끝 -->
					</div>
					<!-- class = col-md-3 col-sm-6 col-xs-12 끝 -->
					<!-- ---------------------------------------------------------------------------------------------------------------- -->
					<%
						} else {
					%>

					<!-- ---------------------------------------------------------------------------------------------------------------- -->
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="widget " style="text-align: center"></div>
						<!-- widget 끝 -->
					</div>
					<!-- class = col-md-3 col-sm-6 col-xs-12 끝 -->
					<!-- ---------------------------------------------------------------------------------------------------------------- -->




					<%
						}
					%>

				</div>
			</div>
		</section>
		<!-- class = footer-Content 끝 -->
		<!-- -------------------------------------------------------------------------------------------------------------------------------- -->

		<!-- 2-2 -->
		<!-- -------------------------------------------------------------------------------------------------------------------------------- -->
		<div id="copyright">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="site-info text-center">
							<p>
								All Rights reserved &copy; 2019 - Designed & Developed by <a
									rel="nofollow" href="#">넌그자</a>
							</p>
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
	<script type="text/javascript"
		src="assets/js/jquery.themepunch.revolution.min.js"></script>
	<script type="text/javascript"
		src="assets/js/jquery.themepunch.tools.min.js"></script>

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