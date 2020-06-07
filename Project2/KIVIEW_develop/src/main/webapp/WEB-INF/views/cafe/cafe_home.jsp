<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setContentType("text/html; charset=UTF-8");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html lang="en">
<head>

<title>KIVIEW &mdash; 카페 홈</title>

<%@ include file="../head.jsp"%>

<style type="text/css">
a {
   text-decoration: none;
}
</style>

<script type="text/javascript">

function test(){
   var keyword = $('#cafesearch').val().trim();
   location.href="cafesearch.do?curpagenum=1&keyword="+keyword;
}

</script>

</head>
<body id="body">

   <%@include file="cafe_modal.jsp"%>

   <!-- @@ header 부분 @@ -->
   <%@ include file="../header.jsp"%>

   <!-- @@ <h1 class = "mb-2 bread"> sub title 이 부분 우선 header에서 따로 빼놨어요!!! </h1> @@ -->
   <section class="hero-wrap hero-wrap-2"
      style="background-image: url('resources/images/main/board_img03.png');">
      <!-- <div class="overlay"></div> -->
      <div class="container">
         <div
            class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
               <h1 class="mb-2 bread">키뷰 홈</h1>
               <p class="breadcrumbs">
                  <span class="mr-2"><a href="index.do">홈 <i
                        class="ion-ios-arrow-forward"></i></a></span> <span>키뷰카페 <i
                     class="ion-ios-arrow-forward"></i></span>
               </p>
            </div>
         </div>
      </div>
   </section>
   <!-- @@ header 끝 @@ -->

   <!-- 여기서부터 작업 -->
   <section class="ftco-section bg-light">
      <div class="container">
         <div class="row">

            <!-- 카페 홈 소개 -->
            <div class="col-lg-8 ftco-animate">
               <a href="cafehome.do?member_no=${login.member_no}&member_id=${login.member_id}">
                  <h2 class="mb-3" style="font-weight: bold; color: #FFDC00;">
                     <span><img src="resources/images/main/chat.png" /></span>&nbsp;&nbsp;
                     <span style="color: #9BDAF2;">Kiview</span> Cafe
                  </h2>
               </a>
               <hr>
               <p></p>
               <p>
                  <img src="resources/images/main/cafe_img01.jpg" alt="" class="img-fluid">
               </p>

               <p>
           		키뷰 안에서 카페를 만들고 새로운 커뮤니티를 만들어보세요. 키뷰에서는 누구든지 카페를 개설할 수 있고 키뷰
                  회원들과 친목을 도모할 수 있습니다. 또한, 다른 키뷰인이 만든 카페의 회원이 되어 활동하실 수 있습니다. 키뷰 카페는 여러분들을 위한 공간입니다. 아름다운 키뷰가 되도록 많은 도움 부탁드립니다.  
               </p>

               <br> <br>
            </div>

            <div class="col-lg-4 sidebar ftco-animate"
               style="border-left: 0px solid lightgray">

               <div class="sidebar-box">
                  <h3>카페 찾기</h3>
                  <form action="cafe_search.do" class="search-form" style="padding: 0px" onsubmit="return false">
                     <div class="form-group"  >
                        <span class="icon icon-search" style="cursor: pointer" onclick="test();"></span>
                        <input type="text"  
                        class="form-control" placeholder="카페명을 입력해주세요." id="cafesearch" onkeypress="if( event.keyCode == 13 ){test();}">

                     </div>
                  </form>
               </div>



               <!-- 카페 추천 -->
               <div class="sidebar-box ftco-animate">

                  <h3>추천 카페</h3>

                  <c:choose>
                  	<c:when test="${!empty best }">
                  		<c:forEach var="best" items="${best }">

		                  <div class="block-21 mb-4 d-flex">
		                     <a class="blog-img mr-4"
		                        style="background-image: url('resources/upload/${best.thumb }')"></a>

		                     <div class="text">
		                        <h3 class="heading">
		                           <a href="cafedetail.do?cafe_no=${best.cafe_no }&member_no=${login.member_no }">${best.title }</a>
		                        </h3>
		                        <div class="meta">

		                           <div>
		                              <span class="icon-person">${best.admin }</span>
		                           </div>
		                           <div>

		                           		<c:set var="count" value="0"/>

		                           				<c:forEach	var="member" items="${member }">
		                           					<c:if test="${member.cafe_no == best.cafe_no }">
		                           						<c:set var="count" value="${count+1 }"/>

		                           					</c:if>
		                           				</c:forEach>

		                              <span>${count } 명</span>

		                           </div>
		                        </div>
		                     </div>
		                  </div>

                  		</c:forEach>
                  	</c:when>
                  	<c:otherwise>
                  		 <div class="block-21 mb-4 d-flex">
                  		 	카페가 존재하지 않습니다.
                  		 </div>
                  	</c:otherwise>

                  </c:choose>
                  <p class="mb-0">
                     <a href="cafeadmin.do?member_no=${login.member_no }&member_id=${login.member_id }" class="btn btn-secondary"
                        style="width: 300px">카페 개설하기 </a>
                  </p>
               </div>
            </div>
         </div>


         <!-- 카페 리스트 단위 -->
         <span><h3 style="display: inline">가입한 카페</h3>&nbsp;[${fn:length(Ulist)}]<!-- 카페 수 --></span>
         <!-- **20/02/07 내 카페 관리 버튼형식으로 변경  -->
         <span><a href="cafemy.do?member_no=${login.member_no }&curpagenum=1"
            class="btn btn-secondary2"
            style="width: 160px; position: relative; left: 77%;">내 카페 관리</a></span>
         <hr style="margin-top: 5px;">

         <div class="row">
            <c:choose>
               <c:when test="${empty Ulist }">


                  <div class="col-md-6 col-lg-4 ftco-animate"
                     style="position: relative; left: 40%">
                     <br>
                     <br> 가입한 카페가 없습니다. <br>
                     <br>
                  </div>

               </c:when>


               <c:otherwise>
                  <c:forEach var="Ulist" items="${Ulist }" begin="0" end="5">




                     <div class="col-md-6 col-lg-4 ftco-animate">
                        <div class="blog-entry">
                           <!-- 썸네일 -->
                           <a href="cafedetail.do?cafe_no=${Ulist.cafe_no }&member_no=${login.member_no }"
                              class="block-20 d-flex align-items-end"
                              style="background-image: url('resources/upload/${Ulist.thumb }');">
                              <!-- 가입제한 -->
                              <div class="meta-date text-center p-2">
                                 <span class="mos">
                                    <c:if test="${Ulist.restriction eq 'Y'}">
                                                     바로가입
                                    </c:if>
                                    <c:if test="${Ulist.restriction eq 'N'}">
                                                      승인후 가입
                                    </c:if>

                                 </span>
                              </div>
                           </a>

                           <div class="text bg-white p-4">
                              <!-- 카페명 -->
                              <h3 class="heading">
                                 <a href="cafedetail.do?cafe_no=${Ulist.cafe_no }&member_no=${login.member_no }">${Ulist.title }</a>
                              </h3>

                              <!-- 카페소개 -->
                              <p>${Ulist.intro }</p>
                              <div class="d-flex align-items-center mt-4">
                                 
                                 <p class="ml-auto mb-0">
                                    <!-- 카페장 -->
                                    <a href="#" class="mr-2">${Ulist.admin }</a>
                                    <!-- 카페 회원 수 -->
                                    <c:set var="count" value="0"/>
													<c:forEach items="${member }" var="member">

														<c:if test="${Ulist.cafe_no == member.cafe_no }">
															<c:set var="count" value="${count+1 }"/>

														</c:if>

													</c:forEach>

                                    <a href="#" class="meta-chat">${count } 명</a>
                                 </p>
                              </div>
                           </div>
                        </div>
                        <br>
                     </div>








                  </c:forEach>

               </c:otherwise>
            </c:choose>

         </div>

         <!-- list size가 6개 이상일 경우 더보기 버튼 -->
         <c:if test="${fn:length(Ulist) > 5}">

            <div>
               <span><a href="cafemy.do?member_no=${login.member_no }&curpagenum=1"
                  class="btn btn-secondary2"
                  style="width: 25%; position: relative; left: 40%;">더 보기</a></span>
            </div>

         </c:if>
         <br>
         <br>




         <!-- 카페 리스트 단위 -->
         <span><h3 style="display: inline">운영중 카페</h3></span>



         <hr style="margin-top: 5px;">


         <div class="row">
            <c:choose>
               <c:when test="${empty Alist  }">
                  <div class="col-md-6 col-lg-4 ftco-animate"
                     style="position: relative; left: 40%">
                     <br>
                     <br> 운영중인 카페가 없습니다. <br>
                     <br>
                  </div>
               </c:when>
               <c:otherwise>

                  <c:forEach var="Alist" items="${Alist }">





                        <div class="col-md-6 col-lg-4 ftco-animate">
                           <div class="blog-entry">
                              <!-- 썸네일 -->
                              <a href="cafedetail.do?cafe_no=${Alist.cafe_no }&member_no=${login.member_no }"
                                 class="block-20 d-flex align-items-end"
                                 style="background-image: url('resources/upload/${Alist.thumb }');">
                                 <!-- 가입제한 -->
                                 <div class="meta-date text-center p-2">
                                    <span class="mos">
                                    <c:if test="${Alist.restriction eq 'Y'}">
                                                      바로가입
                                             </c:if>
                                             <c:if test="${Alist.restriction eq 'N'}">
                                                      승인후 가입
                                             </c:if>
                                    </span>
                                 </div>
                              </a>

                              <div class="text bg-white p-4">
                                 <!-- 카페명 -->
                                 <h3 class="heading">
                                    <a href="cafe_detail.do?cafe_no=${Alist.cafe_no }&member_no=${login.member_no }">${Alist.title }</a>
                                 </h3>

                                 <!-- 카페소개 -->
                                 <p>${Alist.intro }</p>
                                 <div class="d-flex align-items-center mt-4">
                                    
                                    <p class="ml-auto mb-0">
                                       <!-- 카페장 -->
                                       <a href="#" class="mr-2">${Alist.admin }</a>
                                       <!-- 카페 회원 수 -->
                                       <c:set var="count" value="0"/>
													<c:forEach items="${member }" var="member">

														<c:if test="${Alist.cafe_no == member.cafe_no }">
															<c:set var="count" value="${count+1 }"/>

														</c:if>

													</c:forEach>

                                   	 <a href="#" class="meta-chat">${count } 명</a>

                                    </p>
                                 </div>
                              </div>
                           </div>
                           <br>
                        </div>
                        <br>


                  </c:forEach>

               </c:otherwise>


            </c:choose>

         </div>


      </div>


      </div>
   </section>


   <!-- @@ footer 영역 @@ -->
   <%@ include file="../footer.jsp"%>





</body>
</html>
