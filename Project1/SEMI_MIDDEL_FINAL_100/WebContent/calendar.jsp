<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html;charset=UTF-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

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
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
	<link rel="stylesheet" href="assets/css/calendar.css" type="text/css"> 

<script>

	$(document).ready(function() {
	    var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		var clist = new Array();
		
		<c:forEach items = "${clist}" var = "clist2">
			clist.push("${clist2}");
		</c:forEach>
	
		$('#external-events div.external-event').each(function(){
		
			// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			// it doesn't need to have a start or end
			var eventObject = {
				title: $.trim($(this).text()) // use the element's text as the event title
			};
			
			// store the Event Object in the DOM element so we can get to it later
			$(this).data('eventObject', eventObject);
			
			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex: 999,
				revert: true,      // will cause the event to go back to its
				revertDuration: 0  //  original position after the drag
			});
			
		});
	
	
		/* initialize the calendar-----------------------------------------------------------------*/
		
		
		var calendar =  $('#calendar').fullCalendar({
			header: {
				left: 'title',
				center: 'agendaDay,agendaWeek,month',
				right: 'prev,next today'
			},
			editable: true,
			firstDay: 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
			selectable: true,
			defaultView: 'month',
			
			axisFormat: 'h:mm',
			columnFormat: {
                month: 'ddd',    // Mon
                week: 'ddd d', // Mon 7
                day: 'dddd M/d',  // Monday 9/7
                agendaDay: 'dddd d'
            },
            titleFormat: {
                month: 'MMMM yyyy', // September 2009
                week: "MMMM yyyy", // September 2009
                day: 'MMMM yyyy'                  // Tuesday, Sep 8, 2009
            },
			allDaySlot: false,
			selectHelper: true,
			select: function(start, end, allDay) {
				var title = prompt('Event Title:');
				if (title) {
					calendar.fullCalendar('renderEvent',
						{
							title: title,
							start: start,
							end: end,
							allDay: allDay
						},
						true // make the event "stick"
					);
				}
				calendar.fullCalendar('unselect');
			},
			droppable: true, // this allows things to be dropped onto the calendar !!!
			drop: function(date, allDay) { // this function is called when something is dropped
			
				// retrieve the dropped element's stored Event Object
				var originalEventObject = $(this).data('eventObject');
				
				// we need to copy it, so that multiple events don't have a reference to the same object
				var copiedEventObject = $.extend({}, originalEventObject);
				
				// assign it the date that was reported
				copiedEventObject.start = date;
				copiedEventObject.allDay = allDay;
				
				// render the event on the calendar
				// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
				$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
				
				// is the "remove after drop" checkbox checked?
				if ($('#drop-remove').is(':checked')) {
					// if so, remove the element from the "Draggable Events" list
					$(this).remove();
				}
				
			},
			
		
		events: [
			
			<c:forEach var = "clist2" items = "${clist}">

					<c:if test = "${clist2.w_period ne '-' and clist2.nth ne '-'}">
					{
						title: "${clist2.nth}" +" ${clist2.lname}"+" 필기 접수 기간",
						start: new Date("${clist2.w_period}".split("~")[0].substr(0,4), "${clist2.w_period}".split("~")[0].substr(4,2)-1, "${clist2.w_period}".split("~")[0].substr(6,2), 12, 0),
						end: new Date("${clist2.w_period}".split("~")[1].substr(0,4), "${clist2.w_period}".split("~")[1].substr(4,2)-1, "${clist2.w_period}".split("~")[1].substr(6,2), 12, 0)
					},
					</c:if>

						
					<c:if test = "${fn:length(clist2.w_test) eq '8' and clist2.nth ne '-'}">
					{
	
						title: "${clist2.nth}" + " ${clist2.lname}"+" 필기 시험",
						start: new Date("${clist2.w_test}".substr(0,4), "${clist2.w_test}".substr(4,2)-1, "${clist2.w_test}".substr(6,2), 12, 0)
					},
					</c:if>
					
					<c:if test = "${fn:length(clist2.w_test) eq '17' and clist2.nth ne '-'}">
					{
	
						title: "${clist2.nth}" + " ${clist2.lname}"+" 필기 시험",
						start: new Date("${clist2.w_test}".split("~")[0].substr(0,4), "${clist2.w_test}".split("~")[0].substr(4,2)-1, "${clist2.w_test}".split("~")[0].substr(6,2), 12, 0),
						end: new Date("${clist2.w_test}".split("~")[1].substr(0,4), "${clist2.w_test}".split("~")[1].substr(4,2)-1, "${clist2.w_test}".split("~")[1].substr(6,2), 12, 0)
					},
					</c:if>

					<c:if test = "${clist2.w_pass ne '-' and clist2.nth ne '-'}">		
					{
	
						title: "${clist2.nth}"+" ${clist2.lname}"+" 필기 발표",
						start: new Date("${clist2.w_pass}".substr(0,4), "${clist2.w_pass}".substr(4,2)-1, "${clist2.w_pass}".substr(6,2), 12, 0)
					},
					</c:if>

					<c:if test = "${clist2.p_period ne '-' and clist2.nth ne '-'}">
					{
	
						title: "${clist2.nth}" +" ${clist2.lname}"+" 실기 접수 기간",
						start: new Date("${clist2.p_period}".split("~")[0].substr(0,4), "${clist2.p_period}".split("~")[0].substr(4,2)-1, "${clist2.p_period}".split("~")[0].substr(6,2), 12, 0),
						end: new Date("${clist2.p_period}".split("~")[1].substr(0,4), "${clist2.p_period}".split("~")[1].substr(4,2)-1, "${clist2.p_period}".split("~")[1].substr(6,2), 12, 0)
					},
					</c:if>

					<c:if test = "${fn:length(clist2.p_test) eq '8' and clist2.nth ne '-'}">
					{
	
						title: "${clist2.nth}" +" ${clist2.lname}"+" 실기 시험",
						start: new Date("${clist2.p_test}".substr(0,4), "${clist2.p_test}".substr(4,2)-1, "${clist2.p_test}".substr(6,2), 12, 0)
					},
					</c:if>
					
					<c:if test = "${fn:length(clist2.p_test) eq '17' and clist2.nth ne '-'}">
					{
	
						title: "${clist2.nth}" +" ${clist2.lname}"+" 실기 시험",
						start: new Date("${clist2.p_test}".split("~")[0].substr(0,4), "${clist2.p_test}".split("~")[0].substr(4,2)-1, "${clist2.p_test}".split("~")[0].substr(6,2), 12, 0),
						end: new Date("${clist2.p_test}".split("~")[1].substr(0,4), "${clist2.p_test}".split("~")[1].substr(4,2)-1, "${clist2.p_test}".split("~")[1].substr(6,2), 12, 0)
					},
					</c:if>

					<c:if test = "${clist2.p_pass ne '-' and clist2.nth ne '-'}">	
					{
	
						title: "${clist2.nth}"+" ${clist2.lname}"+" 실기 발표",
						start: new Date("${clist2.p_pass}".substr(0,4), "${clist2.p_pass}".substr(4,2)-1, "${clist2.p_pass}".substr(6,2), 12, 0)
					},
					</c:if>
					
				
					<c:if test = "${clist2.w_period ne '-' and clist2.nth eq '-'}">
					{
						title:" ${clist2.lname}"+" 필기 접수 기간",
						start: new Date("${clist2.w_period}".split("~")[0].substr(0,4), "${clist2.w_period}".split("~")[0].substr(4,2)-1, "${clist2.w_period}".split("~")[0].substr(6,2), 12, 0),
						end: new Date("${clist2.w_period}".split("~")[1].substr(0,4), "${clist2.w_period}".split("~")[1].substr(4,2)-1, "${clist2.w_period}".split("~")[1].substr(6,2), 12, 0)
					},
					</c:if>

					<c:if test = "${fn:length(clist2.w_test) eq '8' and clist2.nth eq '-'}">
					{
	
						title:" ${clist2.lname}"+" 필기 시험",
						start: new Date("${clist2.w_test}".substr(0,4), "${clist2.w_test}".substr(4,2)-1, "${clist2.w_test}".substr(6,2), 12, 0)
					},
					</c:if>
					
					<c:if test = "${fn:length(clist2.w_test) eq '17' and clist2.nth eq '-'}">
					{
	
						title:" ${clist2.lname}"+" 필기 시험",
						start: new Date("${clist2.w_test}".split("~")[0].substr(0,4), "${clist2.w_test}".split("~")[0].substr(4,2)-1, "${clist2.w_test}".split("~")[0].substr(6,2), 12, 0),
						end: new Date("${clist2.w_test}".split("~")[1].substr(0,4), "${clist2.w_test}".split("~")[1].substr(4,2)-1, "${clist2.w_test}".split("~")[1].substr(6,2), 12, 0)
					},
					</c:if>

					<c:if test = "${clist2.w_pass ne '-' and clist2.nth eq '-'}">		
					{
	
						title:" ${clist2.lname}"+" 필기 발표",
						start: new Date("${clist2.w_pass}".substr(0,4), "${clist2.w_pass}".substr(4,2)-1, "${clist2.w_pass}".substr(6,2), 12, 0)
					},
					</c:if>

					<c:if test = "${clist2.p_period ne '-' and clist2.nth eq '-'}">
					{
	
						title:" ${clist2.lname}"+" 실기 접수 기간",
						start: new Date("${clist2.p_period}".split("~")[0].substr(0,4), "${clist2.p_period}".split("~")[0].substr(4,2)-1, "${clist2.p_period}".split("~")[0].substr(6,2), 12, 0),
						end: new Date("${clist2.p_period}".split("~")[1].substr(0,4), "${clist2.p_period}".split("~")[1].substr(4,2)-1, "${clist2.p_period}".split("~")[1].substr(6,2), 12, 0)
					},
					</c:if>

					<c:if test = "${fn:length(clist2.p_test) eq '8' and clist2.nth eq '-'}">
					{
	
						title:" ${clist2.lname}"+" 실기 시험",
						start: new Date("${clist2.p_test}".substr(0,4), "${clist2.p_test}".substr(4,2)-1, "${clist2.p_test}".substr(6,2), 12, 0)
					},
					</c:if>
					
					<c:if test = "${fn:length(clist2.p_test) eq '17' and clist2.nth eq '-'}">
					{
	
						title: " ${clist2.lname}"+" 실기 시험",
						start: new Date("${clist2.p_test}".split("~")[0].substr(0,4), "${clist2.p_test}".split("~")[0].substr(4,2)-1, "${clist2.p_test}".split("~")[0].substr(6,2), 12, 0),
						end: new Date("${clist2.p_test}".split("~")[1].substr(0,4), "${clist2.p_test}".split("~")[1].substr(4,2)-1, "${clist2.p_test}".split("~")[1].substr(6,2), 12, 0)
					},
					</c:if>

					<c:if test = "${clist2.p_pass ne '-' and clist2.nth eq '-'}">	
					{
	
						title: " ${clist2.lname}"+" 실기 발표",
						start: new Date("${clist2.p_pass}".substr(0,4), "${clist2.p_pass}".substr(4,2)-1, "${clist2.p_pass}".substr(6,2), 12, 0)
					},
					</c:if>
				</c:forEach>
		],	
			
		});

	});

</script>
<style>

		
	#wrap {
		width: 100%;
		margin: 10 0 10 0;
		}
		
	#external-events {
		float: left;
		width: 150px;
		padding: 0 10px;
		text-align: left;
		}
		
	#external-events h4 {
		font-size: 16px;
		margin-top: 0;
		padding-top: 1em;
		}
		
	.external-event { /* try to mimick the look of a real event */
		margin: 10px 0;
		padding: 2px 4px;
		background: #3366CC;
		color: #fff;
		font-size: .85em;
		cursor: pointer;
		}
		
	#external-events p {
		margin: 1.5em 0;
		font-size: 11px;
		color: #666;
		}
		
	#external-events p input {
		margin: 0;
		vertical-align: middle;
		}

	#calendar {
/* 		float: right; */
        margin: 0 auto;
		width: 100%;
		height:100%
		background-color: #FFFFFF;
		  border-radius: 6px;
        box-shadow: 0 1px 2px #C3C3C3;
		-webkit-box-shadow: 0px 0px 21px 2px rgba(0,0,0,0.18);
-moz-box-shadow: 0px 0px 21px 2px rgba(0,0,0,0.18);
box-shadow: 0px 0px 21px 2px rgba(0,0,0,0.18);
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
              
              
              <!-- --------------------------------------------------------------------------------------------------- -->
              <!-- 무조건 로그인이 되어야 사용되는 메인페이지 안의 내용 --> 
              
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
                  
                  <!-- 로그아웃 -->
                  <li class="right" style = "margin-top:3%"><a href="controller.do?command=logout"> 로그아웃 </a></li>
                 </ul>
                 
              </div>                          
            </div>
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
            
              <!-- login -->
               <li class="right" style = "margin-top:3%"><a href="controller.do?command=logout"> 로그아웃 </a></li>        
            </ul>
          </nav><!-- class = navbar navbar-default 끝 -->
      </div><!-- class = logo-menu 끝 -->
      <!-- 메인화면/ 상단바 끝 -->    
	  <!-- ---------------------------------------------------------------------------------------------------------------- --> 
     
      <!-- ---------------------------------------------------------------------------------------- -->
      <!-- 상단 메뉴바 -->
      <div class="page-header" style="background: url(assets/img/bar_bg2.jpg);">
        <div class="container">
          <div class="row">         
            <div class="col-md-12">
              <div class="breadcrumb-wrapper">
              <br><br>
                <h2 class="product-title">내달력</h2>
                <ol class="breadcrumb">
                  <li><a href="index.jsp"><i class="ti-home"></i> 홈</a></li>
                  <li class="current">내달력</li>
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
                  	<li><a href="controller.do?command=zzim">- 내 찜목록 보기</a></li>  
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
            <div class="col-md-8 col-sm-8 col-xs-12">
              <div class="job-alerts-item candidates">
                
                 <!-- ---------------------------------------------------------------------------------------- -->
                <!-- 1-1 -->
                
               <div class="manager-resumes-item">
               	<div class="manager-content">
               	<!-- ---------------------------------------------------------------------------------------------- -->
               	<div id='wrap'>

					<div id='calendar'></div>
					
					<div style='clear:both'></div>
					
				</div>
				<!-- ---------------------------------------------------------------------------------------------- -->

                </div>
                </div>          	
  
              <!-- ---------------------------------------------------------------------------------------- -->
              </div>
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
    <script type="text/javascript" src="assets/js/calendar.js"></script>
      
  </body>
</html>