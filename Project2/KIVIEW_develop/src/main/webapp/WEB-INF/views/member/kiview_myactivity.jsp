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
<link rel="stylesheet" type="text/css" href="resources/css/star.css">
<link rel="stylesheet" type="text/css"
   href="resources/css/reviewboard.css">
   <script type="text/javascript" src="resources/js/reviewboard.js"></script>

<style>

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

#myactivity{
	color:black;
	font-weight:bold;
}



 

</style>
<script type="text/javascript">



</script>

</head>
<body id = "body">

	<!-- @@ header 부분 @@ -->
	<%@ include file="../header.jsp"%>

	<!-- @@ <h1 class = "mb-2 bread"> sub title 이 부분 우선 header에서 따로 빼놨어요!!! </h1> @@ -->
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('resources/images/main/mypage_img02.png');">
		<!-- <div class="overlay"></div> -->
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-2 bread">내 활동</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.do">홈 
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
						<b>내 활동</b>
					</h2>
					
					<br>  
					<label>내가 쓴 리뷰</label>&nbsp;&nbsp;<span>총 <span style="color:orange">${fn:length(review) }</span>개의 리뷰가 검색되었습니다.</span><br>  
					<col width="20%"> 
					<col width="60%">  
					<col width="20%"> 
					<table class="table table">
					
					<tr><th>유치원명</th><th>제 목</th><th>작성일</th></tr>
					<c:choose>
						<c:when test="${empty review }">
							<tr><td colspan="3">------작성한 리뷰가 없습니다-------</td></tr>
						</c:when>
						
						<c:otherwise>
							<c:forEach var="review" items="${review }" begin="0" end="4">
								<tr><td>${review.kinder_name}</td><td><a class="myBtn" style="cursor:pointer" onclick="update_form(${review.review_no}, ${param.page})">${review.review_title}</a></td><td><fmf:formatDate value='${review.review_date}' pattern='yyyy-MM-dd' /></td></tr>
							</c:forEach>
							 
						</c:otherwise>
					</c:choose>
					
					  
					</table>
					 
					
					 
					
					<a href='reviewsearch.do?type=review_writer&keyword=${login.member_id }' style="position:relative; left:90%;  color:gray"><u>더 보기</u></a>
					
					<br><br><br> 
					<label>내가 쓴 글</label>&nbsp;&nbsp;<span>총 <span style="color:orange">${fn:length(board) }</span>개의 글이 검색되었습니다.</span><br>  
					<col width="20%"> 
					<col width="60%">  
					<col width="20%"> 
					<table class="table table">
					<tr><th>카페명</th><th>제 목</th><th>작성일</th></tr>
					<c:choose>
						<c:when test="${empty board }">
							<tr><td colspan="3">------작성한 글이 없습니다-------</td></tr>
						</c:when>
						
						<c:otherwise>
							<c:forEach var="board" items="${board }" begin="0" end="4">
								<tr><td>
										<c:set var="cafe_no" value="0"/>
										<c:forEach var="menu" items="${menu }">
											<c:if test="${board.cafe_menu_no == menu.cafe_menu_no }">
												<c:forEach var="cafe" items="${cafe }">
													<c:if test="${menu.cafe_no==cafe.cafe_no}">
														${cafe.title }
														<c:set var="cafe_no" value="${cafe.cafe_no }"/>
													</c:if>
												</c:forEach> 
											</c:if>
										</c:forEach>
									
								</td>
								<td><a href="cafeboarddetail.do?cafe_no=${cafe_no}&cafe_board_no=${board.cafe_board_no}&cafe_menu_no=${board.cafe_menu_no}&curpagenum=1">${board.title}</td>
								<td><fmf:formatDate value='${board.regdate}' pattern='yyyy-MM-dd' /></td></tr>
							</c:forEach>
							 
						</c:otherwise>
					</c:choose>  
					
					</table>
					
					<a href='selectmyboard.do?member_id=${login.member_id }&curpagenum=1' style="position:relative; left:90%;  color:gray"><u>더 보기</u></a>
					
					
					
					<br><br><br> 
					<label>즐겨찾기</label>&nbsp;&nbsp;<span>총 <span style="color:orange">${fn:length(favorite) }</span>개의 즐겨찾기가 검색되었습니다.</span><br>  
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
								<c:forEach var="favoriteVo" items="${favorite}" begin="0" end="4">
								<tr>
									<td><a href="searchdetail.do?kinder_no=${favoriteVo.kinder_no}">${favoriteVo.name}</a></td> 
									<td>${favoriteVo.addr1}</td>
									<td>${favoriteVo.phone}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>	
					
					</table>
					<a href='selectmyfavorite.do?member_id=${login.member_id }&curpagenum=1' style="position:relative; left:90%;  color:gray"><u>더 보기</u></a>
				</div>
				
				




			</div>
		
		





		</div>
	</section>
	
	<div id="myModal2" class="modal">

      <!-- Modal content -->
      <div class="modal-content" style="width:40%; padding: 40px;">  
         <span style="width: 5%;" class="close">&times;</span>

         <div>
            <h3>
               <b>${login.member_id }님의 리뷰</b>
            </h3>
            <h6 style="width: 100%">키뷰는 평가자의 익명성을 보장하며 평가내역에 어떠한 개인정보도 노출되지
               않음을 약속드립니다.</h6>
            <br>

            
               
               <div>
                  <label>유치원 명 </label><br> 
                  <input type="text"
                     placeholder="유치원명을 입력하세요." name="kinder_name" style="width: 101%" readonly>
                  <input type="text" name="kinder_addr" readonly> <br> <br>
                  <label> 등원시기 </label><br> <select id="review_year_update"
                     style="width: 101%; height: 35px;" name="review_year" disabled>
                     <option selected="selected">선택</option>
                     <option>2020년</option>
                     <option>2019년</option>
                     <option>2018년</option>
                     <option>2017년</option>
                     <option>2016년</option>
                     <option>2015년</option>
                     <option>2014년</option>
                     <option>2013년</option>
                     <option>2012년</option>
                     <option>2011년</option>
                     <option>2010년</option>
                     <option>2009년</option>
                     <option>2008년</option>
                     <option>2007년</option>
                     <option>2006년</option>
                     <option>2006년 이전</option>
                  </select> <br> <br> <label>제목 </label><br> <input
                     type="text" name="review_title" style="width: 101%"
                     placeholder="제목을 입력하세요." minlength="4" maxlength="30" readonly><br>
                  <br> <label>내용 </label>
                  
                  <textarea cols="60" rows="10" style="width: 100%; height: auto; resize: none;"
                     name="review_content" minlength="200" maxlength="1000" readonly></textarea>
                  <br> <br>
               </div>
               <br>

               <div>
                  <div class="star-input">
                     <h4>
                        <b>평점</b>
                     </h4>
                     <label>원장/교사</label><br>
                     <div class="input">
                        <input type="radio" name="avg_score1" value="1" id="p1" disabled>
                        <label for="p1">1</label> <input type="radio" name="avg_score1"
                           value="2" id="p2" disabled> <label for="p2">2</label> <input
                           type="radio" name="avg_score1" value="3" id="p3" disabled>
                        <label for="p3">3</label> <input type="radio" name="avg_score1"
                           value="4" id="p4" disabled> <label for="p4">4</label> <input
                           type="radio" name="avg_score1" value="5" id="p5" disabled>
                        <label for="p5">5</label>
                     </div>

                  </div>
                  <br> <br>

                  <div class="star-input2">
                     <label>교과/수업</label><br>
                     <div class="input2">
                        <input type="radio" name="avg_score2" value="1" id="p12"
                           disabled> <label for="p12">1</label> <input
                           type="radio" name="avg_score2" value="2" id="p22" disabled>
                        <label for="p22">2</label> <input type="radio" name="avg_score2"
                           value="3" id="p32" disabled> <label for="p32">3</label>
                        <input type="radio" name="avg_score2" value="4" id="p42"
                           disabled> <label for="p42">4</label> <input
                           type="radio" name="avg_score2" value="5" id="p52" disabled>
                        <label for="p52">5</label>
                     </div>
                  </div>
                  <br> <br>

                  <div class="star-input3">
                     <label>시설/청결</label><br>
                     <div class="input3">
                        <input type="radio" name="avg_score3" value="1" id="p13"
                           disabled> <label for="p13">1</label> <input
                           type="radio" name="avg_score3" value="2" id="p23" disabled>
                        <label for="p23">2</label> <input type="radio" name="avg_score3"
                           value="3" id="p33" disabled> <label for="p33">3</label>
                        <input type="radio" name="avg_score3" value="4" id="p43"
                           disabled> <label for="p43">4</label> <input
                           type="radio" name="avg_score3" value="5" id="p53" disabled>
                        <label for="p53">5</label>
                     </div>
                  </div>
                  <br> <br> <br>
               </div>

               <div style="position: relative; left: 40%;">
                  <input id="modal2-close"
                     class="btn btn-primary" style="width: 28%" type="button"
                     value="닫기">
               </div>
            
         </div>
      </div>
   </div> 


	<!-- @@ footer 영역 @@ -->
	<%@ include file="../footer.jsp"%>




</body>
</html>