<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html lang="en">
<head>

<title>KIVIEW &mdash; Cafe Home</title>

<%@ include file="../head.jsp"%>

<style type="text/css">
a {
	color:black; 
}

li a {
	color:black;
}

.intro {
	width: 500px; /* 너비는 변경될수 있습니다. */
	text-overflow: ellipsis; /* 위에 설정한 100px 보다 길면 말줄임표처럼 표시합니다. */
	white-space: nowrap; /* 줄바꿈을 하지 않습니다. */
	overflow: hidden; /* 내용이 길면 감춤니다 */
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
	function test() {
		var keyword = $('#cafesearch').val().trim();
		location.href = "cafesearch.do?keyword=" + keyword;
	}
	
	function member_out(member_no, cafe_member_no){
		
				
		if(confirm("해당 카페를 탈퇴하시겠습니까?")){
			location.href="memberout.do?member_no="+member_no+"&cafe_member_no="+cafe_member_no
		}
	}
	
	function cafe_delete(member_no, cafe_no){ 
		
		
		if(confirm("해당 카페를 폐쇄하시겠습니까? \n\n주의 : 다시 복구하실 수 없습니다.")){
			location.href="cafedelete.do?member_no="+member_no+"&cafe_no="+cafe_no 
		}
	}
	
	
	
	
</script>

</head>
<body id="body">



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
					<h1 class="mb-2 bread">키뷰 카페</h1>
	               <p class="breadcrumbs">
	                  <span class="mr-2"><a href="index.jsp">홈 <i
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
					
						<h2 class="mb-3" style="font-weight: bold; color: #FFDC00;">
							<span><img src="resources/images/main/chat.png" /></span>&nbsp;&nbsp;
							<span style="color: #9BDAF2;">Kiview</span> Cafe
						</h2>
					
					<hr>
					<p>${login.member_id } 님이 가입한 카페 가입 목록입니다.</p>

					<!-- 여기서부터 반복 -->
					<c:choose>
						<c:when test="${empty cafe }">
							<div class="row">
								<label>가입한 카페가 없습니다.</label>

							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${cafe }" var="cafe">
								

								<div class="row">


									<div class="col-md-12 course d-lg-flex ftco-animate"
										style="padding: 30px; margin: 0px; padding-bottom: 0px;">
										<div style="width: 25%; margin-right: 30px;">
											<a href="cafedetail.do?cafe_no=${cafe.cafe_no }&member_no=${login.member_no}"> <span><img
													style="width: 80%; height: 100%"
													src='http://localhost:8787/img/${cafe.thumb }' /></span></a>



										</div>

										<div style="width: 70%">
											<h3 style="margin: 0px">
												<a href="cafedetail.do?cafe_no=${cafe.cafe_no }&member_no=${login.member_no}"
													style="cursor: pointer">" ${cafe.title } "</a>
											</h3>
											
											
											<p>
												<span>${cafe.admin }</span> | 
												
												
												<c:set var="count" value="0"/>
													<c:forEach items="${member }" var="member">
													
														<c:if test="${cafe.cafe_no == member.cafe_no }">
															<c:set var="count" value="${count+1 }"/>

														</c:if>
													
													</c:forEach>
													<span>${count} 명</span>
												
											</p>
											
											<p class="intro">${cafe.intro }</p>
											

										</div>

									</div>

									<div style="padding: 0px; width: 100%;">
										
										<c:if test="${cafe.admin ne login.member_id }">
											<c:forEach var="member" items="${member }">
												<c:if test="${login.member_no == member.member_no && cafe.cafe_no == member.cafe_no }">
													<input style="position: relative; left: 90%; background-color:black"
														class="btn btn-secondary" type="button" value="탈퇴"
														onclick="member_out(${login.member_no },${member.cafe_member_no})" > 
													<hr>  
												</c:if>
											</c:forEach> 
										</c:if>  
										<c:if test="${cafe.admin eq login.member_id }">
											
													<input style="position: relative; left: 90%; background-color:black"
														class="btn btn-secondary" type="button" value="폐쇄"
														onclick="cafe_delete(${login.member_no },${cafe.cafe_no})" >
													<hr> 
												
										</c:if>
									</div> 


								</div>
								</c:forEach> 
							
						</c:otherwise>

					</c:choose>
					<!-- 여기까지 반복 -->
					
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



					<br> <br>
				</div>

				<div class="col-lg-4 sidebar ftco-animate"
					style="border-left: 0px solid lightgray">

					<div class="sidebar-box">
						<h3>카페 찾기</h3>
						<form action="#" class="search-form" style="padding: 0px">
							<div class="form-group">
								<span class="icon icon-search" style="cursor: pointer"
									onclick="test();"></span> <input type="text" 
									class="form-control" placeholder="카페명을 입력해주세요." id="cafesearch"
									onkeypress="if( event.keyCode == 13 ){test();}">
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
		                           <a href="cafedetail.do?cafe_no=${best.cafe_no }&member_no=${login.member_no }">${best.intro }</a>
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





		</div>



	</section>
	
	<script type="text/javascript">
	function PageMove(page) {
	    var curpagenum = page;
	   
	    
	    location.href = "cafemy.do?member_no=${login.member_no}&curpagenum=" + page
	 }
	 
	</script>
	<style type="text/css">
	
	
	
	</style>


	<!-- @@ footer 영역 @@ -->
	<%@ include file="../footer.jsp"%>





</body>
</html>