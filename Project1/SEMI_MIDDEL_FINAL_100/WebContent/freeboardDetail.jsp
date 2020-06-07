<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setContentType("text/html;charset=UTF-8");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="com.team3.vo.member"%>

<%
   member membervo = (member) (session.getAttribute("vo"));
   

   String writer = String.valueOf(request.getAttribute("nickname"));
 
   
   pageContext.setAttribute("br", "<br>");
   pageContext.setAttribute("cn", "\n");
   
%>
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
    <script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script type="text/javascript" src="assets/js/jquery-min.js"></script>
    
  </head>

  <body>  
  
            <div class="logo-menu" style = "background :url(assets/img/bg/black2.jpg)">
            <nav class="navbar navbar-default" role="navigation" data-spy="affix" data-offset-top="50">
            
               <!-- -------------------------------------------------------------------------------------------------- -->
                <div class="container">
                <!-- 메인 화면/ 맨위의 메뉴바(logo, home, pages, cadidates, employers, blog) -->
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
                  
                  <li class="btn-m" style = "margin-top:5%"><a href="login.jsp">로그인 </a></li>  
                 </ul>
                 <!-- -------------------------------------------------------------------------------------------------- -->

<%

   } else {

%>
                 
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
                  
              <!-- logout -->
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
              <li class="btn-m" style = "margin-top:5%"><a href="login.jsp">로그인 </a></li>   
            </ul>
<% 

   } else {
   
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
            
              <!-- logout -->
             <li class="right" style = "margin-top:3%"><a href="controller.do?command=mypage"> 마이페이지 </a></li>
                <li class="right" style = "margin-top:3%"><a href="controller.do?command=logout"> 로그아웃 </a></li>     
            </ul>
            
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
                <h2 class="product-title">글내용</h2>
                <ol class="breadcrumb">
                  <li><a href="index.jsp"><i class="ti-home"></i> 홈</a></li>
                  <li class="current">글내용</li>
                </ol>
              </div>
            </div>
          </div>
        </div>
      </div>
     <!-- ---------------------------------------------------------------------------------------- -->


<div id="content">
      <div class="container">

         <!-- ---------------------------------------------------------------------------------------- -->
         <div class="job-alerts-item candidates">

            <div>
               <p class="alerts-title"
                  style="text-align: right; color: gray; font-size: 10" id="time">
                  <img src="assets/img/logo.png" style="width: 12%; height: 12%">
               </p>
            </div>
            <!-- ---------------------------------------------------------------------------------------- -->
            <!-- 1-1 -->
            <div style="padding: 1%; border: 1px solid rgb(234, 234, 234);">
               <div class="freeboard">
                  <div>
                     <div
                        style="width: 100%; height: 40px; background-color: #ff4f57; border-radius: 3px; box-shadow: 3px 3px rgb(234, 234, 234)">
                        <div
                           style="color: white; font-size: 20px; padding-top: 1%; padding-left: 2%">
<c:choose>
   <c:when test="${bvo.tabloc eq 'qna' }">
                           <b>${bvo.title }</b>   
   </c:when>
   <c:otherwise>
                           <b>[ ${bvo.headtag } ]&nbsp;&nbsp;&nbsp;&nbsp;${bvo.title }</b>
   </c:otherwise>               
   
</c:choose>                           
                        </div>
                     </div>

                     <div style="margin-top: 3%;">

                        <p id="id" style="float: left; margin-left: 3%">
                           <img src = "assets/img/glogo/b${bvo.gradeCount}.png">
                           <b>작성자</b> : ${bvo.nickname }
                        </p>
                        <p style="float: left; margin-left: 10%">
                           <b>작성일</b> : ${bvo.regdate }
                        </p>
                         <p style="float: right; margin-right: 10%">
                           <b>글번호</b> : ${bvo.boardno }
                        </p>
                        <p style="float: right; margin-right: 10%">
                           <b>조회수</b> : ${bvo.count }
                        </p>
                        <br>
                        <hr>
                     </div>

                     <div style="width: 100%; height: 250px;">${fn:replace(bvo.content, cn, br)}</div>
                     <hr color="#ff4f57">


                  </div>
                  <div id="commentBox" style="margin-top: 1%; margin-left: 3%">
                     <c:forEach var="rlist" items="${rlist}" begin="${rpage.startRow }" end="${rpage.startRow+9 }">
                        <div id="${rlist.commentno}">
                           <img src = "assets/img/glogo/b${rlist.gradeCount}.png">
                           <b>${rlist.nickname}</b>&nbsp;&nbsp;<br> <span>${rlist.comments }</span>&nbsp;&nbsp;
                           <sub>${rlist.regdate }</sub>&nbsp;&nbsp;
                           <!-- 수정,삭제는 본인 아이디와 일치하는 댓글에만 표시되도록 처리 -->
                           <c:if
                              test="${vo.nickname eq rlist.nickname || vo.nickname eq '관리자'}">
                              <input type="button" id="replyupdate"
                                 onclick="updateComment('${rlist.commentno }','${rlist.comments}');"
                                 value="수정" />
                              <input type="button" id="updatecomplte" value="수정완료"
                                 style="display: none" />
                                 
<script>
   function updateComment(cNo,cContent) {
      //alert(cNo);
      //alert(cContent);
      //수정 버튼을 클릭하면, 댓글 내용이 textarea로 바뀌고 수정 가능하게 바뀌어야함.
      var ta = $('<textarea>').val(cContent);
      
      var p = $("#" + cNo).children('span');
      p.html(ta);

      //$("#replyupdate").hide();
      //$("#delbtn").hide();
      $("#" + cNo).children('#replyupdate').hide();
      $("#" + cNo).children('#delbtn').hide();

      //수정완료 클릭하면, 해당 내용을 들고  백단으로 가서 처리함.
      
      $("#" + cNo).children("#updatecomplte").show().click(function() {
         var text = ta.val();
         location.href = 'controller.do?command=replyupdate&commentno='+ cNo
                     + '&comments='+ text
                     + '&boardno='+ ${bvo.boardno}
                   + '&curpagenum='+ ${curpagenum }
                   + '&rcurpagenum='+ ${rpage.currentPage }
                   ;
         alert("수정완료");
      });
   }
</script>                                 

                              <button id="delbtn" onclick="location.href='controller.do?command=replydelete&commentno=${rlist.commentno}&boardno=${bvo.boardno }&curpagenum=${curpagenum }&rcurpagenum=${rpage.currentPage }'">삭제</button>
                              <br>
                           </c:if>
                        </div>
                     </c:forEach>
                     
                  </div>
                  
<script type="text/javascript">
   function PageMove(page){
      var categoryname ='<c:out value="${bvo.headtag }"/>';
      var count ='<c:out value="${count}"/>';
      var curpagenum ='<c:out value="${curpagenum}"/>';
      var boardno ='<c:out value="${bvo.boardno}"/>';      
          location.href = "controller.do?command=boarddetail&rcurpagenum="+page+"&categoryname="+categoryname+"&count="+count+"&curpagenum="+curpagenum+"&boardno="+boardno;
    }
</script> 
                 <!-- ---------------------------------------------------------------------------------------- -->
            <!-- ---------------------------------------------------------------------------------------- -->
            
             <!------------------------------------------------------------------------------------------------------------------------------------------ -->
                 <!-- 페이지 번호 -->
<c:choose>
             
              <c:when test="${ rpage.listCount > 10 }">                 
              <c:if test="${rpage.listCount ne '0' }">  
                <div class="col-md-12" style = "margin-top:2%;margin-bottom:2%">
                    <ul class="pagination pull-right">
                    <li><a href="javascript:PageMove(1)">맨앞으로</a></li>
                    <c:if test="${page.preve eq true }">
                    <li class="active"><a href="javascript:PageMove(${rpage.currentPage-1 })">앞으로</a></li>
                    </c:if>
                          <c:forEach var="i" begin="${rpage.startPage }" end="${rpage.endPage }" >
                              <c:choose>
                                  <c:when test="${i eq rpage.currentPage }">
                                    <li class="active"><a href="javascript:PageMove(${i})">${i}</a></li>
                                  </c:when>
                                  <c:otherwise>
                                    <li><a href="javascript:PageMove(${i})">${i}</a></li>
                                  </c:otherwise>
                              </c:choose>
                          </c:forEach>
                    <c:if test="${rpage.next eq true }">    
                    <li class="active"><a href="javascript:PageMove(${rpage.currentPage+1 })">뒤로</a></li>
                    </c:if>  
                    <li><a href="javascript:PageMove(${rpage.allPage})">맨뒤로</a></li>
                  </ul>    
                    
               
                  
              </div>
              </c:if>
              </c:when>
</c:choose>                     
                  
                  <div
                     style="width: 100%; height: 89px; background-color: #ff4f57; padding: 3%; margin-top: 6%; border-radius: 3px; box-shadow: 3px 3px rgb(234, 234, 234)">

                     <form action="controller.do" method="post">
                        <input type="hidden" name="command" value="replyinsert">
                        <input type="hidden" name="nickname" value=${vo.nickname }>
                        <input type="hidden" name="boardno" value=${bvo.boardno }>
                        <input type="hidden" name="curpagenum" value=${curpagenum }>
                  <input type="hidden" name="rcurpagenum" value=${rpage.currentPage }>
                        <div
                           style="background-color: white; width: 85%; height: 170%; float: left; border-radius: 3px; margin-top: -2%;">
                           <textarea
                              style="width: 100%; height: 100%; border-radius: 3px; resize: none; border: none"
                              name="comments" placeholder = "내용을 반드시 입력하세요"></textarea>
                        </div>

                        <div>
                           <button type="submit" style="background-color: #ff4f57; color: white; border: none; float: left; font-size: 20px; margin-top: -15px; margin-left: 8%; width: 7%;">
                              <img src="assets/img/save1.png"   style="width: 100%; height: 100%"></button>
                        </div>
                        
                     
                        
<script type="text/javascript">
   $(document).ready(function() {
         $("textarea[name=comments]").click(function() {
            if (<%=session.getAttribute("vo") == null || session.getAttribute("vo") == ""%>   ) {
                  alert("로그인 후 댓글을 이용할 수 있습니다.");
                  location.href = "login.jsp";
            }
         });
   });
</script>

                     </form>




                  </div>
               </div>
            </div>
         </div>

         <!-- ---------------------------------------------------------------------------------------- -->
         <!-- ---------------------------------------------------------------------------------------- -->

         <!-- -------------------------------------------------------------------------------------------------- -->
         <!-- 여기서 부터 분리한 이유는 로고는 반응형웹이나 기존이나 같은 것을 쓰기에 두번 반복해서 사용하지 않음 -->
         <!-- 메인화면의 메뉴바 시작 -->
         <!-- 메인화면/ 맨위의 메뉴바에 출력될 데이터 -->
         <div class="collapse navbar-collapse" id="navbar">
            <!-- -------------------------------------------------------------------------------------------------- -->



            <!-- -------------------------------------------------------curpagenum 추가 !!!!!!!------------------------------------------- -->
            <!-- 메인화면의 윗줄의 post a job, log in -->
            <ul class="nav navbar-nav navbar-right">
               <li class="right"><a href="controller.do?command=${bvo.tabloc }&curpagenum=${curpagenum }"> <b> 글목록 </b></a></li>



               <%-- 
               로그인 하지 않었을 때 [JSTL 형식]
                <c:if test="${!empty vo}" >         
                  <li class="right"><a href="controller.do?command=beforeupdate&boardno=${bvo.boardno }&tabloc=${bvo.tabloc }&category=${category }"> <b> 글수정 </b> </a></li>
                    <li class="right"><a href="controller.do?command=delete&boardno=${bvo.boardno}&tabloc=${bvo.tabloc } "> <b> 글삭제 </b></a></li>
               </c:if>    
--%>
<!-- curpagenum 추가!!!!!!! 수정 삭제...... -->
               <c:if test="${vo.nickname eq bvo.nickname || vo.nickname eq '관리자'}">
                  <!-- 작성자 닉네임이 관리자 일때, 수정,삭제 버튼 활성화.-->
                  <li class="right"><a
                     href="controller.do?command=beforeupdate&boardno=${bvo.boardno }&tabloc=${bvo.tabloc }&categoryname=${bvo.headtag }&curpagenum=${curpagenum }">
                        <b> 글수정 </b>
                  </a></li>
                  <li class="right"><a
                     href="controller.do?command=delete&boardno=${bvo.boardno}&tabloc=${bvo.tabloc }&curpagenum=${curpagenum } ">
                        <b> 글삭제 </b>
                  </a></li>                  
               </c:if>
               <c:if test="${vo.nickname eq '관리자' }">
                  <c:choose>
                     <c:when test="${bvo.notice eq 'Y' }">
                        <li class="right"><a
                           href="controller.do?command=boardnotice&boardno=${bvo.boardno}&notice=${bvo.notice }&tabloc=${bvo.tabloc } ">
                              <b> 공지삭제</b>
                        </a></li>
                     </c:when>
                     <c:otherwise>
                        <li class="right"><a
                           href="controller.do?command=boardnotice&boardno=${bvo.boardno}&notice=${bvo.notice }&tabloc=${bvo.tabloc } ">
                              <b> 공지등록 </b>
                        </a></li>
                     </c:otherwise>   
                  </c:choose>
               </c:if>
            </ul>

         </div>
         <!-- 버튼 + post a job + login->>>>>>>>>>>> class = navbar -->
         <!-- ---------------------------------------------------------------------------------------------------------------------- -->

         <!-- --------------------------------------------------------------------------------------------------------------------------------------------------------- -->


      </div>
   </div>
   <!-- ---------------------------------------------------------------------------------------- -->
      
      

    <footer>
    
       <!-- 2-1 -->
        <!-- ---------------------------------------------------------------------------------------------------------------------------------------- --> 
       <section class="footer-Content">
          <div class="container">
             <div class="row">
             
                 <!-- ---------------------------------------------------------------------------------------------------------------- --> 
                <div class="col-md-3 col-sm-6 col-xs-12" >
                
                  <!-- job board의 아이콘 -->
                    <div class="widget">
                     <br><br>
                     
                     <img src="assets/img/logo.png" class="img-responsive" alt="Footer Logo">
                      <!-- job board 밑의 문자 -->
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