
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html;charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Table V02</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="assets/img/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
   href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
   href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
   href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
   href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="assets/css/util.css">
<link rel="stylesheet" type="text/css" href="assets/css/board.css">
<!--===============================================================================================-->
<script type="text/javascript" src="assets/js/jquery-min.js"></script>
</head>
<body>

   <!-- --------------------------------------------------------------------------------------------------------------- -->
   <!-- 테이블 컬럼 -->
   <div class="table">

      <div class="row3 header" id="tableheader">
         <div class="cell" style="width: 10%">글번호</div>
         <c:if test="${tabloc ne 'qna' }">
            <div class="cell" style="width: 20%">말머리</div>
         </c:if>
         <div class="cell" style="width: 40%">글제목</div>
         <div class="cell" style="width: 10%">작성자</div>
         <div class="cell" style="width: 10%">작성일자</div>
         <div class="cell" style="width: 10%">조회수</div>
         <c:if test="${tabloc eq 'qna' }">
            <div class="cell" style="width: 20%">답변여부</div>
         </c:if>
      </div>
      <!-- 공지사항  -->

      <c:forEach var="noticevo" items="${noticelist }">


         <div class="row3 row2" style="background-color: #FFE6E6;">
            <div id="num" class="cell" data-title="Full Name" style="width: 10%">
               공지사항</div>
            <c:if test="${tabloc ne 'qna' }">
               <div class="cell" data-title="Age" style="width: 20%"></div>
            </c:if>
            <div class="cell" data-title="Job Title" style="width: 40%">
               <a
                  href="controller.do?command=boarddetail&boardno=${noticevo.boardno }&category=${noticevo.headtag }&count=${noticevo.count }">${noticevo.title }</a>
            </div>
            <div class="cell" style="width: 10%">${noticevo.nickname }</div>
            <div class="cell" data-title="Location" class="currentMonth"
               style="width: 10%">${noticevo.regdate }</div>
            <div class="cell" style="width: 10%">${noticevo.count }</div>
            <c:if test="${tabloc eq 'qna' }">
               <div class="cell" style="width: 20%"></div>
            </c:if>
         </div>

      </c:forEach>



      <!--  -->



<!-- 게시글 목록 리스트ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
      <c:if test="${listsize>=0 }">
      <c:choose>
         
         <c:when test="${listsize == 0}">
            <script>
               $("#tableheader").hide();
            </script>
            <div class="row3 row2">
               <div class="cell" style="width: 100%">검색 결과가 존재하지 않습니다.</div>
            </div>
         </c:when>
         <c:otherwise>
      
      <c:forEach var="vo" items="${list}" begin="${page.startRow}" end="${page.startRow+9}" >   

         <div class="row3 row2">
            <div id="num" class="cell" data-title="Full Name" style="width: 10%">${vo.boardno}</div>
            <c:if test="${tabloc ne 'qna' }">
               <div class="cell" data-title="Age" style="width: 20%">${vo.headtag}</div>
            </c:if>
            <div class="cell" data-title="Job Title" style="width: 40%">
               <a href="controller.do?command=boarddetail&boardno=${vo.boardno }&category=${vo.headtag }&count=${vo.count }&curpagenum=${page.currentPage }">${vo.title }&nbsp;&nbsp;<b style="color:#ff4f57;">[&nbsp;${vo.countComment }&nbsp;]</b></a>
            </div>
            <div class="cell" style="width: 10%"><img src = "assets/img/glogo/b${vo.gradeCount}.png">${vo.nickname }</div>
            <div class="cell" data-title="Location" class="currentMonth" style="width: 10%">${vo.regdate }</div>
            <div class="cell" style="width: 10%">${vo.count }</div>
            <c:if test="${tabloc eq 'qna' }">
               <div class="cell" style="width: 20%">
                  <c:choose>
                     <c:when test="${vo.qnareplyyn eq 0}">
                        <div>답변예정</div>
                     </c:when>
                     <c:otherwise>
                        <div style="background-color: pink;padding-top:5%;padding-bottom:5%;width:50%;border-radius:2px;margin-left:24%;color:white;font-weight:bold">답변완료</div>
                     </c:otherwise>
                  </c:choose>
               </div>
            </c:if>
         </div>
      </c:forEach>
      </c:otherwise>
      </c:choose>      
      </c:if>

<!-- 카테고리 목록 리스트ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
      <c:if test="${clistsize>=0 }">
      <c:choose>
         
         <c:when test="${clistsize == 0}">
            <script>
               $("#tableheader").hide();
            </script>
            <div class="row3 row2">
               <div class="cell" style="width: 100%">검색 결과가 존재하지 않습니다.</div>
            </div>
         </c:when>
         <c:otherwise>
      
         <c:forEach var="vo" items="${categorylist }" begin="${categorypage.startRow }" end="${categorypage.startRow+9 }">

            <div class="row3 row2">
               <div id="num" class="cell" data-title="Full Name"
                  style="width: 10%">${vo.boardno}</div>
               <c:if test="${tabloc ne 'qna' }">
                  <div class="cell" data-title="Age" style="width: 20%">
                     ${vo.headtag}</div>
               </c:if>
               <div class="cell" data-title="Job Title" style="width: 40%">
                  <a href="controller.do?command=boarddetail&boardno=${vo.boardno }&category=${vo.headtag }&count=${vo.count }">${vo.title }&nbsp;&nbsp;<b style="color:#ff4f57;">[&nbsp;${vo.countComment }&nbsp;]</b></a>
               </div>
               <div class="cell" style="width: 10%"><img src = "assets/img/glogo/b${vo.gradeCount}.png">${vo.nickname }</div>
               <div class="cell" data-title="Location" class="currentMonth"style="width: 10%">${vo.regdate }</div>
               <div class="cell" style="width: 10%">${vo.count }</div>
               <c:if test="${tabloc eq 'qna' }">
                  <div class="cell" style="width: 20%">
                     <c:choose>
                        <c:when test="${vo.qnareplyyn eq 0}">
                           <div>답변예정</div>
                        </c:when>
                        <c:otherwise>
                           <div style="hight: 50px; background-color: pink">답변완료</div>
                        </c:otherwise>
                     </c:choose>
                  </div>
               </c:if>
            </div>
         </c:forEach>
         
      </c:otherwise>
      </c:choose>
      </c:if>
<!-- 검색 목록 리스트ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->      
      <c:if test="${slistsize>=0 }">
      <c:choose>
         
         <c:when test="${slistsize == 0}">
            <script>
               $("#tableheader").hide();
            </script>
            <div class="row3 row2">
               <div class="cell" style="width: 100%">검색 결과가 존재하지 않습니다.</div>
            </div>
         </c:when>
         <c:otherwise>
   
      
      
         <c:forEach var="vo" items="${slist }" begin="${searchpage.startRow }" end="${searchpage.startRow+9}">
            <div class="row3 row2">
               <div id="num" class="cell" data-title="Full Name"
                  style="width: 10%">${vo.boardno}</div>
               <c:if test="${tabloc ne 'qna' }">
                  <div class="cell" data-title="Age" style="width: 20%">
                     ${vo.headtag}</div>
               </c:if>
               <div class="cell" data-title="Job Title" style="width: 40%">
                  <a href="controller.do?command=boarddetail&boardno=${vo.boardno }&category=${vo.headtag }&count=${vo.count }">${vo.title }&nbsp;&nbsp;<b style="color:#ff4f57;">[&nbsp;${vo.countComment }&nbsp;]</b></a>
               </div>
               <div class="cell" style="width: 10%"><img src = "assets/img/glogo/b${vo.gradeCount}.png">${vo.nickname }</div>
               <div class="cell" data-title="Location" class="currentMonth"
                  style="width: 10%">${vo.regdate }</div>
               <div class="cell" style="width: 10%">${vo.count }</div>
               <c:if test="${tabloc eq 'qna' }">
                  <div class="cell" style="width: 20%">
                     <c:choose>
                        <c:when test="${vo.qnareplyyn eq 0}">
                           <div>답변예정</div>
                        </c:when>
                        <c:otherwise>
                           <div style="hight: 50px; background-color: pink">답변완료</div>
                        </c:otherwise>
                     </c:choose>
                  </div>
               </c:if>
            </div>
         </c:forEach>
      
   </c:otherwise>
   </c:choose>
   </c:if>
      

      <!-- 검색 결과 없을 시, 출력..... -->

      </div>

      <!-- 카테고리 검색 결과 출력 테이블 끝ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
      <!-- --------------------------------------------------------------------------------------------------------------- -->




      <!--===============================================================================================-->
      <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
      <!--===============================================================================================-->
      <script src="vendor/bootstrap/js/popper.js"></script>
      <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
      <!--===============================================================================================-->
      <script src="vendor/select2/select2.min.js"></script>
      <!--===============================================================================================-->
      <script src="assets/js/main2.js"></script>
      <!--===============================================================================================-->
      <script>
      function goDeatio(data){
         
         alert(data);
         
      }
   </script>
</body>
</html>