<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setContentType("text/html; charset=UTF-8");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>

<title>KIVIEW &mdash; 카페 검색</title>

<%@ include file="../head.jsp"%>
<style type="text/css">
#paging a {
	color:black!important; 
}


#paging{ 
	
  	text-align:center!important;
  	width:100%;
	margin-top:15px;  
	margin:0 auto; 
	
}

#paging ul{
	
	display:inline-block!important;

}

#paging li {
	display:inline-block!important;
}
</style>
<script type="text/javascript">

function test(){
   var keyword = $('#cafesearch').val().trim();
   location.href="cafesearch.do?curpagenum=1&keyword="+keyword;
}

function PageMove(page) {
    var curpagenum = page;
    
    location.href = "cafesearch.do?curpagenum=" + page + "&keyword=${keyword}" ;
 }

</script>



</head>
<body id = "body">


<%@include file="cafe_modal.jsp" %>
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
               <h1 class="mb-2 bread">키뷰 검색</h1>
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
         

            
         
            <div class="col-lg-4 sidebar ftco-animate" >
            <c:choose>
            <c:when test="${!empty keyword  }">
            <span style="font-size:20px; color:black"><span style="color:#fda638">${keyword }</span>으로 검색한 결과입니다.             
            <br><br>            
            </span>
            </c:when>
            <c:otherwise>
            <span style="font-size:20px; color:black"><span style="color:#fda638"></span>카페 전체 목록             
            <br><br>            
            </span>
            </c:otherwise>  
            </c:choose>
            <form action="cafe_search.do" class="search-form" style="padding:0px; display:inline" onsubmit="return false">
                     <div class="form-group"  >
                        <span class="icon icon-search" style="cursor:pointer" onclick="test();"></span> 
                        <input type="text" class="form-control" placeholder="카페명을 입력해주세요." id="cafesearch" onkeypress="if( event.keyCode == 13 ){test();}" >   
                           
                     </div>
            </form>

            </div>

         


         
         
         
         <hr style="margin-top: 20px;">
   
         <div class="row" style="padding:10px; border:0px solid lightgray">
         
            <!-- 카페 리스트 단위 -->
            
         <c:choose>
            <c:when test="${empty Slist }">
            
            
              <div class="col-md-6 col-lg-4 ftco-animate"
                     style="position: relative; left: 40%">
                     <br>
                     <br> 검색 된 카페가 없습니다.<br>
                     <br>
                  </div>         
            
            </c:when>
            
            <c:otherwise>
            
            <c:forEach items="${Slist}" var="Slist">
            <div class="col-md-6 col-lg-4 ftco-animate">
               <div class="blog-entry">
                  <!-- 썸네일 -->
                  <a href="cafedetail.do?cafe_no=${Slist.cafe_no }&member_no=${login.member_no }" class="block-20 d-flex align-items-end"
                     style="background-image: url('resources/upload/${Slist.thumb }');"> <!-- 가입제한 -->
                     <div class="meta-date text-center p-2">
                        <span class="mos"> 
                                    <c:if test="${Slist.restriction eq 'Y'}">                           
                                                     바로가입                           
                                    </c:if> 
                                    <c:if test="${Slist.restriction eq 'N'}">
                                                      승인후 가입
                                    </c:if>

                                 </span>
                     </div>
                  </a>
                  <div class="text bg-white p-4">
                     <!-- 카페명 -->
                     <h3 class="heading">
                        <a href="cafedetail.do?cafe_no=${Slist.cafe_no}&member_no=${login.member_no }">${Slist.title }</a>
                     </h3>

                     <!-- 카페소개 -->
                     <p>${Slist.intro }</p>
                     <div class="d-flex align-items-center mt-4">
                        
                        <p class="ml-auto mb-0">
                           <!-- 카페장 -->
                           <a href="#" class="mr-2">${Slist.admin }</a>
                           <!-- 카페 회원 수 -->
                           <c:set var="count" value="0"/>
													<c:forEach items="${member }" var="member">
													
														<c:if test="${Slist.cafe_no == member.cafe_no }">
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
            <!-- 카페 반복 끝! -->


         </div>
         
         <div id="paging">
			  
        		 <c:if test="${pagevo.totallistcount ne '0' }">
                    
                        <ul class="pagination pull-right">
                           <li><a href="javascript:PageMove(1)"> &nbsp;&nbsp;<< &nbsp;&nbsp; </a> </li>
                           <c:if test="${pagevo.pagepre eq true }">
                              <li><a
                                 href="javascript:PageMove(${pagevo.curpagenum-1 })">&nbsp;&nbsp; < &nbsp;&nbsp;</a></li>
                           </c:if>
                           
                           <c:forEach var="i" begin="${pagevo.startpage }" end="${pagevo.endpage }">
                              <c:choose>
                                 <c:when test="${i eq pagevo.curpagenum }">
                                    <li class="active"><a href="javascript:PageMove(${i})">&nbsp;&nbsp;${i}&nbsp;&nbsp;</a></li>
                                 </c:when>
                                 <c:otherwise>
                                    <li><a href="javascript:PageMove(${i})">&nbsp;&nbsp;${i}&nbsp;&nbsp;</a></li>
                                 </c:otherwise>
                              </c:choose>
                           </c:forEach>
                           <c:if test="${pagevo.pagenext eq true }">
                              <li><a
                                 href="javascript:PageMove(${pagevo.curpagenum+1 })">&nbsp;&nbsp; >&nbsp;&nbsp;</a></li>
                           </c:if>
                           <li><a
                              href="javascript:PageMove(${pagevo.totalpagecount})"> &nbsp;&nbsp;>>&nbsp;&nbsp; </a></li>
                        </ul>


 
                      
                  </c:if>
         
         	</div>
         
         

         


      </div>



   </section>


   <!-- @@ footer 영역 @@ -->
   <%@ include file="../footer.jsp"%>



   

</body>
</html>