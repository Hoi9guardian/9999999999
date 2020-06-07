<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmf" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html> 
<html lang="en">
<head>
<title>KIVIEW &mdash; Blog</title>

<%@ include file="../head.jsp"%>
<style>

#myactivity{
	color:black;
	font-weight:bold;
}
input[type=text] {
	border-top: 0px;
	border-left: 0px;
	border-right: 0px;
	outline: none;
}

label {
	color: black;
	font-weight: bold;
}

th, td{
	text-align:center 
}

table{
	border-top:2px solid black;
	border-bottom:1px solid;
}

a{
	color:rgba(0, 0, 0, 0.5);
	
}

a:hover{
	text-decoration:underline;
}

</style>
<script type="text/javascript">
	function PageMove(page) {
	    var curpagenum = page;
	   
	    
	    location.href = 'selectmyfavorite.do?member_id=${login.member_id }&curpagenum='+page;
	 }
	 
</script>

</head>
<body id = "body">

	<!-- @@ header 부분 @@ -->
	<%@ include file="../header.jsp"%>

	<!-- @@ <h1 class = "mb-2 bread"> sub title 이 부분 우선 header에서 따로 빼놨어요!!! </h1> @@ -->
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('images/bg_2.jpg');">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-2 bread">내 활동</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.jsp">홈 
						<i class="ion-ios-arrow-forward"></i></a></span> 
						<span>마이페이지 <i class="ion-ios-arrow-forward"></i></span>
						<span>내 활동 <i class="ion-ios-arrow-forward"></i></span>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- @@ header 끝 @@ -->


	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row" style="width:100%">  
				<!-- 사이드 메뉴 -->
				<%@include file="kiview_my_sidebar.jsp" %>

				<!-- 마이페이지 -->

				<div class="col-lg-8 ftco-animate"
					style="padding: 40px; background-color: white; border: 1px solid lightgray;">
					<h2>
						<b>즐겨찾기</b>
					</h2>
					
					
					<br><br><br> 
					<label>즐겨찾기</label>&nbsp;&nbsp;<span>총 <span style="color:orange">${size}</span>개의 즐겨찾기가 검색되었습니다.</span><br>  
					<col width="20%"> 
					<col width="60%">  
					<col width="20%"> 
					<table class="table table">
					<tr><th>유치원명</th><th>주 소</th><th>전화 번호</th></tr>
					<c:choose>
						<c:when test="${empty favorite }">
							<tr><td colspan="3">------즐겨찾기를 클릭한 유치원이 없습니다-------</td></tr>  
						</c:when>
							<c:otherwise>
								<c:forEach var="favoriteVo" items="${favorite}">
								<tr>
									<td><a href="searchdetail.do?kinder_no=${favoriteVo.kinder_no}">${favoriteVo.name}</a></td> 
									<td>${favoriteVo.addr1}</td>
									<td>${favoriteVo.phone}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>	
					
					</table>
					
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
				
				




			</div>
		
		





		</div>
	</section>


	<!-- @@ footer 영역 @@ -->
	<%@ include file="../footer.jsp"%>




</body>
</html>