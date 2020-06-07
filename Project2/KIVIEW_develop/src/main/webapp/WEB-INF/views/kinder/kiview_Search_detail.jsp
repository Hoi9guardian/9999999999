<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

   
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
   <%@ taglib prefix="fmf" uri="http://java.sun.com/jsp/jstl/fmt" %>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>KIVIEW &mdash; Search detail</title>
    
    <!-- **승혜:reviewboard.css로 임포트 -->
	<jsp:include page="../head.jsp" />
	<link rel="stylesheet" type="text/css" href="resources/css/star.css">
	<link rel="stylesheet" type="text/css"
		href="resources/css/reviewboard.css">
	
	<!-- **승혜:reviewboard.js로 임포트 -->
	<script type="text/javascript" src="resources/js/reviewboard.js"></script>
    
    <jsp:include page="../head.jsp"/>
    
    <style type="text/css">
    label {

   font-weight: bold;
   color: black;
   margin-bottom: 5px;
   }
   .reviewBtn input {
   position: relative;
   left: 80%;
   
   }

.buttons.jsx-3279357537 {
    float: right;
    position: relative;
    bottom: 40px;
}
.buttons.jsx-3279357537 .button--voteup {
    margin-left: 8px;
}

.buttons.jsx-3279357537 button {
    float: left;
}



    table{
       color:black;
       text-align:center;
    }
    th{
       background-color: rgb(244, 241, 238);;
    }
    td a{
       color:black;
    }
    td a{
    	color:black;
    }
    #box {
    background-color: white;
    border: solid 1px lightgray;
    padding: 5%;
    }
    .auth-popup.jsx-182210165 {
    position: absolute;
    top: 50%;
    left: 58%;
    transform: translate(-50%, -50%);

   }
   .content.jsx-2941005022 {

    width: 400px;
    display: flex;
    text-align: center;
    flex-direction: column;
    background-color: rgb(255, 255, 255);
    box-shadow: rgba(0, 0, 0, 0.2) 0px 2px 10px;
    border-radius: 8px;
    padding: 35px;
   }
   .btn-box.jsx-2941005022 {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;

   }
   
   #favoriteBtn{
   	cursor:pointer;
   }
    </style>

<script type="text/javascript">
 ///////////////////////////지민like//////////////////////////////
var likeSubmit = function(review_no){
   if(${login!=null}){
      var member_no = '${login.member_no}';
      console.log(member_no);
         $.ajax({
            url: "likeSubmit.do",
            dataType:"json",
            type: "post",
            contentType:"application/json",  
            data: JSON.stringify({
               "review_no":review_no,
               "member_no":member_no       
            }),
            success:function(data){
               
               var resultFlag = data.resultFlag;
               var resultMsg = data.resultMsg;
               if(resultFlag > 0){
                   if(resultMsg == "insert"){ 
                     $("#likeBtn"+review_no).css("background-color","rgb(63, 96, 204)"); 
                     $("#likeCount"+review_no).css("color","white"); 
                     
                      
                  }else if(resultMsg == "delete"){
                     $("#likeBtn"+review_no).css("background-color","white"); 
                     $("#likeCount"+review_no).css("color","rgb(63, 96, 204)"); 
                  }
               }
               
               $("#likeCount"+review_no).html(data.reviewCnt);
               
            },
            error : function(request,status,error){
               console.log("code = "+request.status + "message = " + request.responseText + "error  =   "+ error);
            }
         });
      
   } else {
      alert("로그인이 필요한 서비스입니다.");
   }
   
   
   }
///////////////////////////지민like 끝//////////////////////////////

///////////////////////////지민favorite//////////////////////////////
$(function(){
	if(${login != null}){
		var data = {"kinder_no":'${kindervo.kinder_no}', "member_no":'${login.member_no}'}
		
		$.ajax({
			url:"selectFavorite.do",
			type:"post",
			data: JSON.stringify(data),
			dataType:"json",
			contentType:"application/json",
			success:function(data){
				
				if(data.bool == true ){
					$('#favoriteBtn').empty();
                    $('#favoriteBtn').append('<img src="resources/images/favorite_insert.png" style="float:right;" width="50" height="50"/>');
					
				} else {
					 $('#favoriteBtn').empty();
                     $('#favoriteBtn').append('<img src="resources/images/favorite_basic.png" style="float:right;" width="50" height="50"/>')
				}
			},
			error:function(){
				alert("명령 실행 중 오류"); 
			}
			
		})
		
		
	}
	
	
})

var favoriteSubmit = function(kinder_no){
   if(${login != null}){
      var member_no = '${login.member_no}';
      console.log(member_no);
         $.ajax({
            url: "favoriteSubmit.do",
            dataType:"json",
            type: "post",
            contentType:"application/json",  
            data: JSON.stringify({
               "kinder_no":kinder_no,
               "member_no":member_no   
            }),
            success:function(data){
               
               
               var resultSubmit = data.resultSubmit;
               var resultMsg = data.resultMsg;
               if(resultSubmit > 0){
                   if(resultMsg == "insert"){
                     $('#favoriteBtn').empty();
                     $('#favoriteBtn').append('<img src="resources/images/favorite_insert.png" style="float:right;" width="50" height="50"/>')
                   }else if(resultMsg == "delete"){
                      $('#favoriteBtn').empty();
                      $('#favoriteBtn').append('<img src="resources/images/favorite_basic.png" style="float:right;" width="50" height="50"/>')
                  }
               }
               
            },
            error : function(request,status,error){
               console.log("code = "+request.status + "message = " + request.responseText + "error  =   "+ error);
            }
      });
   } else {
	   alert("로그인이 필요한 서비스입니다.");
   }
}
///////////////////////////지민 favorite 끝//////////////////////////////

   </script>

  </head>
<body id = "body">
<!-- @@ header 부분 @@ -->
     <%@ include file = "../header.jsp" %>
    
     <!-- @@ <h1 class = "mb-2 bread"> sub title 이 부분 우선 header에서 따로 빼놨어요!!! </h1> @@ -->
    <section class="hero-wrap hero-wrap-2" style="background-image: url('resources/images/main/board_img02.png');">
      <!-- <div class="overlay" style = "background:#fff;"></div> -->
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">검색 결과</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.do">홈 
            <i class="ion-ios-arrow-forward"></i></a></span> 
            <span>검색 결과 <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>
     <!-- @@ header 끝 @@ -->
     
     <section class="ftco-section bg-light">

         <div class="container">
            <div class="row" id="box">
                  <div style="width:100%;margin:0 auto;" class="col-md-15 heading-section ftco-animate fadeInUp ftco-animated">
                     <h2 class="mb-4"><span><img id = "kinder" 
                     style = "height: 45px; position:relative; bottom: 5px;"
                     src = "resources/images/main/kindergarden.png"/></span>
                     
                        <span> ${kindervo.name}</span><a id="favoriteBtn" onclick="favoriteSubmit('${kindervo.kinder_no}')">
                        <img src="resources/images/favorite_basic.png" style="float:right;" width="50" height="50"/></a>
                        <!-- <span style = "color:#FFDC00;"> 유치원</span> --></h2><br>
                     <button class="btn btn-secondary px-4 py-3">${kindervo.type} </button>
                     <button class="btn btn-secondary px-4 py-3"><i class="icon icon-map-marker"></i>   ${kindervo.addr2}</button>
                     <c:set var = "sum" value = "0" />
                     <c:forEach items="${reviewvo}" var="review" varStatus="status">
                     <c:set var="sum" value="${sum+((review.avg_score1+review.avg_score2+review.avg_score3)/3) }"/>
                     <c:set var="cnt" value="${status.count}"/>
                     </c:forEach>
                     <%-- <c:out value="${cnt}"/> --%>
                     <c:choose>
                        <c:when test="${empty reviewvo}">
                           <button id="star" class="btn btn-secondary px-4 py-3">0/5.00</button>
                        </c:when>
                        <c:otherwise>                        
                           <button id="star" class="btn btn-secondary px-4 py-3"><fmt:formatNumber value="${sum/cnt}" pattern=".00"/>/5.00</button>
                        </c:otherwise>
                     </c:choose>
                  <hr>
                  <div style="padding: 20px">
                  <h4><b>항목별 평가</b></h4>
                      <div style="width:100%;margin:0 auto;" class="ftco-animate fadeInUp ftco-animated">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th scope="col">선생님 평가</th>
                        <th scope="col">교육 평가</th>
                        <th scope="col">시설 평가</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                      <c:set var = "tscore" value = "0" />
                      <c:set var = "eduscore" value = "0" />
                      <c:set var = "fscore" value = "0" />
                        <c:forEach items="${reviewvo}" var="review" varStatus="status">
                        <c:set var="tscore" value="${tscore+review.avg_score1 }"/>
                        <c:set var="eduscore" value="${eduscore+review.avg_score2 }"/>
                        <c:set var="fscore" value="${fscore+review.avg_score3 }"/>
                        <c:set var="cnt" value="${status.count}"/>
                        </c:forEach>
                        <c:choose>
                           <c:when test="${empty reviewvo}">
                              <td>0</td>
                              <td>0</td>
                              <td>0</td>
                           </c:when>
                           <c:otherwise>
                              <td><fmt:formatNumber value="${tscore/cnt}" pattern=".0"/></td>
                              <td><fmt:formatNumber value="${eduscore/cnt}" pattern=".0"/></td>
                              <td><fmt:formatNumber value="${fscore/cnt}" pattern=".0"/></td>                     
                           </c:otherwise>
                        </c:choose>
                      </tr>
                    </tbody>
                  </table>
                  <c:choose>
                  <c:when test="${empty reviewvo}">
                  <p>총 0명이 평가하였습니다.</p>
                  </c:when>
                  <c:otherwise>
                  <p>총 ${cnt }명이 평가하였습니다.</p>
                  </c:otherwise>
                  </c:choose>
                  </div>
                  </div>
                   </div>
              </div>
         </div>
      </section>
<!--        <section class="ftco-section bg-light">
         <div class="container">
            <div class="row" id="box">
                  <div style="width:100%;margin:0 auto;" class="col-md-15 heading-section ftco-animate fadeInUp ftco-animated">
                     <h2 class="mb-4"><span>항목별 평가</span></h2>
                     <hr>
                     </div>
                 </div>
              </div>
          </section> -->
          <section class="ftco-section bg-light">
         <div class="container">
            <div class="row" id="box">
                  <div style="width:100%;margin:0 auto;" class="col-md-15 heading-section ftco-animate fadeInUp ftco-animated">
                     <h2 class="mb-4"><span>유치원 정보</span></h2>
                     <hr>
                     </div>
                     <div id="map" style="width:100%;margin:0 auto;height:20%;height:400px;" class="col-md-15 text-center heading-section ftco-animate fadeInUp ftco-animated">
                     </div>
                     <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=194487849edd2decd3a36dbefacead0d"></script>
                  <script type="text/javascript">
                     var latitude = ${kindervo.latitude};
                     var longitude = ${kindervo.longitude};
                     //console.log(latitude);
                     var container = document.getElementById('map');
                     var options = {
                           center: new kakao.maps.LatLng(longitude,latitude),
                           level: 2
                        };
               
                     var map = new kakao.maps.Map(container, options);
                     
                     var imageSrc = 'resources/images/main/marker.png',    
                      imageSize = new kakao.maps.Size(64, 64),
                      imageOption = {offset: new kakao.maps.Point(27, 69)};
                        
                     var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                         markerPosition = new kakao.maps.LatLng(longitude, latitude);
   
                     var marker = new kakao.maps.Marker({
                         position: markerPosition, 
                         image: markerImage
                     });
   
                     marker.setMap(map);
                  </script>
                     <div style="width:100%;margin:0 auto;padding:20px;" class="col-md-15 heading-section ftco-animate fadeInUp ftco-animated">
                      <h4><b>기본정보</b></h4>
                      <div style="width:100%;margin:0 auto;" class="ftco-animate fadeInUp ftco-animated">
                   <table class="table table-bordered">
                 <tbody>
                   <tr>
                     <th scope="row">개원일</th>
                     <td><fmt:formatDate value="${kindervo.opendate}" pattern="yyyy.MM.dd"/></td>
                     <th>전화번호</th>
                     <td>${kindervo.phone }</td>
                   </tr>
                   <tr>
                     <th scope="row">원장명</th>
                     <td>${kindervo.director }</td>
                     <th>홈페이지</th>
                     <c:choose>
                        <c:when test="${kindervo.homepage != null && kindervo.homepage != ' ' }">
                           <td><a href="${kindervo.homepage }" target="_blank">${kindervo.homepage }</a></td>
                        </c:when>
                        <c:otherwise>
                           <td>X</td>
                        </c:otherwise>
                     </c:choose>
                   </tr>
                   <tr>
                     <th scope="row">구주소</th>
                     <td>${kindervo.addr2 }</td>
                     <th>도로명주소</th>
                     <td>${kindervo.addr1 }</td>
                   </tr>
                 </tbody>
               </table>
               </div>
                    </div>
                    <div style="width:100%;margin:0 auto;padding:20px;" class="col-md-15 heading-section ftco-animate fadeInUp ftco-animated">
                      <h4><b>학급정보</b></h4>
                      <div style="width:100%;margin:0 auto;" class="ftco-animate fadeInUp ftco-animated">
                   <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th scope="col">학급수</th>
                        <th scope="col">유아수</th>
                        <th scope="col">교직원수</th>
                        <th scope="col">차량운영</th>
                        <th scope="col">급식운영방식</th>
                        <th scope="col">CCTV</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>${kindervo.class_num }</td>
                        <td>${kindervo.children_num }</td>
                        <td>${kindervo.staff_num }</td>
                        <c:choose>
                           <c:when test="${kindervo.drive_yn == 'Y' }">
                              <td>O</td>
                           </c:when>
                           <c:otherwise>
                              <td>X</td>
                           </c:otherwise>
                        </c:choose>
                        <td>${kindervo.meal_yn }</td>
                        <c:choose>
                           <c:when test="${kindervo.cctv_yn == 'Y' }">
                              <td>O</td>
                           </c:when>
                           <c:otherwise>
                              <td>X</td>
                           </c:otherwise>
                        </c:choose>
                      </tr>
                    </tbody>
                  </table>
               </div>
                    </div>
                 </div>
              </div>
          </section>
       <section class="ftco-section bg-light">
         <div class="container">
             <!-- <div class="text px-4 ftco-animate" style="background-color: white; margin-top: 20px; padding: 40px; border: 1px solid lightgray;"> -->
             <div class="row" id="box">
               <div style="width:100%;margin:0 auto;" class="col-md-15 heading-section ftco-animate fadeInUp ftco-animated">
                     <h2 class="mb-4"><span>리뷰</span></h2>
                     <hr>
                     </div>
                   <c:choose>
                        <c:when test="${empty reviewvo}">
                      <h4><b>아직 작성된 리뷰가 없어요. 리뷰 쓰러 갈까요?</b></h4>
                     <input style="position: relative;left:10px; width: 20%" class="btn btn-secondary" type="button" value="리뷰쓰러 가기!"
                     onclick="location.href='reviewboard.do?page=1'">
                      </c:when>
            
                  <c:otherwise>
                  
           <!-- 여기서부터 반복 -->
				<c:forEach items="${reviewvo}" var="review">
					<div class="row">
						<div class="col-md-12 course d-lg-flex ftco-animate"
							style="padding: 30px; margin: 0;">
							<input type="hidden" name="review_no" value="${review.review_no}">
							<div class="review"
								style="width: 25%; margin-right: 30px; border-right: 1px solid lightgray">
								<label style="font-size: 20px"> ${review.kinder_name} </label>
								<p style="font-size: 14px;">${review.kinder_addr}</p>

								<!-- **승혜: 별모양 수정  -->
								<br> <label style="font-size: 18px;">원장/교사</label>
								<div class="jsx-2162317864 stars">
									<span
										style="font-size: 18px; position: relative; left: 36%; bottom: 32px;">
										<c:forEach begin="1" end="${review.avg_score1}">
											<div class="jsx-2162317864 star star-2"></div>
										</c:forEach>
									</span>
								</div> 
								<br> <label style="font-size: 18px;">교과/수업</label>
								<div class="jsx-2162317864 stars">
									<span
										style="font-size: 18px; position: relative; left: 36%; bottom: 32px;">
										<c:forEach begin="1" end="${review.avg_score2}">
											<div class="jsx-2162317864 star star-2"></div>
										</c:forEach>
									</span>
								</div>
								<br> <label style="font-size: 18px;">시설/청결</label>
								<div class="jsx-2162317864 stars">
									<span
										style="font-size: 18px; position: relative; left: 36%; bottom: 32px;">
										<c:forEach begin="1" end="${review.avg_score3}">
											<div class="jsx-2162317864 star star-2"></div>
										</c:forEach>
									</span>
								</div>
								<br>
								<!-- **별모양 수정 끝  -->
								<h3>
									<c:set var="score"
										value="${(review.avg_score1+review.avg_score2+review.avg_score3)/3 }" />
									<label>총점</label>&nbsp;&nbsp;&nbsp; <span><fmt:formatNumber
											value="${score}" pattern=".00" /></span> / 5.00 <br>
								</h3>
							</div>

							<div style="width: 70%; overflow: auto">
								<h3>
									<label>“ ${review.review_title} ”</label>
								</h3>
								<p class="subheading">
									<span id="writer"> ${fn:substring(review.review_writer,0,3)} <c:forEach begin="0" end="5">*</c:forEach> </span> | <span>${review.review_year}</span>
									| <span><fmf:formatDate value="${review.review_date}"
											pattern='yyyy-MM-dd HH:mm' /> </span>
								</p>
								<!-- **승혜 : 블러 이미지 수정 -->
								<c:if test="${login.member_id==null }">
									<jsp:include page="../review/blur.jsp" />
								</c:if>
								<c:if test="${login.member_id!=null }">
									<p>${review.review_content}</p>
								</c:if>
							</div>
						</div>

						<div class="reviewBtn" style="padding: 30px; width: 100%;">
									<c:set var="likeChk" value="0"/>
									<c:forEach var="like" items="${likeAll }">								
										<c:if test="${review.review_no==like.review_no}">
											<c:if test="${like.member_no==login.member_no }">
												<c:set var="likeChk" value="${likeChk+1 }"/>
											</c:if>
										</c:if>
									</c:forEach>
									<c:if test="${likeChk>0 }">
										<!-- **승혜: 좋아요 버튼 -->
										<div class="jsx-3279357537 buttons">
											<button type="button" id="likeBtn${review.review_no }" style="background-color:rgb(63, 96, 204)"
												class="jsx-693606843 button--voteup" type="button"
												value="좋아요"
												onclick="likeSubmit('${review.review_no}')">
												<svg xmlns="http://www.w3.org/2000/svg" width="20"
													height="20" viewBox="0 0 24 24" fill="none" stroke="#8f8f8f"
													stroke-width="2" stroke-linecap="round"
													stroke-linejoin="round"
													style="position: relative; vertical-align: top;">
												<path
														d="M14 9V5a3 3 0 0 0-3-3l-4 9v11h11.28a2 2 0 0 0 2-1.7l1.38-9a2 2 0 0 0-2-2.3zM7 22H4a2 2 0 0 1-2-2v-7a2 2 0 0 1 2-2h3"></path></svg>
												<!-- ** 요 span부분에 좋아요 갯수 카운팅 한거 넣어주면 될 것 같아요! **-->
	
												<!-- 좋아요 수 카운트 -->
												<c:set var="count" value="0" /> <!-- count란 변수를 선언하겠다. 초기값은 0 -->
												<c:if test="${!empty likeAll }"> <!-- 좋아요 리스트가 비어있지 않았을때 -->
													<c:forEach var="likeAll" items="${likeAll }"> <!-- 좋아요 리스트를 반복문으로 실행해라 -->
														<c:if test="${review.review_no==likeAll.review_no }"> <!-- 단, 리뷰리스트와 좋아요리스트의 리뷰번호가 같은게 있다면 -->
															<c:set var="count" value="${count+1 }" /> <!-- count변수에 +1을 해주어라 -->
														</c:if>
													</c:forEach>
												</c:if>
						
	
												<span id="likeCount${review.review_no }" style="color:white"
													class="jsx-693606843 count">${count }</span>
											</button>
										</div>
									</c:if>
									<c:if test="${likeChk==0 }">
										<!-- **승혜: 좋아요 버튼 -->
										<div class="jsx-3279357537 buttons">
											<button type="button" id="likeBtn${review.review_no }"
												class="jsx-693606843 button--voteup" type="button"
												value="좋아요"
												onclick="likeSubmit('${review.review_no}')">
												<svg xmlns="http://www.w3.org/2000/svg" width="20"
													height="20" viewBox="0 0 24 24" fill="none" stroke="#8f8f8f"
													stroke-width="2" stroke-linecap="round"
													stroke-linejoin="round"
													style="position: relative; vertical-align: top;">
												<path
														d="M14 9V5a3 3 0 0 0-3-3l-4 9v11h11.28a2 2 0 0 0 2-1.7l1.38-9a2 2 0 0 0-2-2.3zM7 22H4a2 2 0 0 1-2-2v-7a2 2 0 0 1 2-2h3"></path></svg>
												<!-- ** 요 span부분에 좋아요 갯수 카운팅 한거 넣어주면 될 것 같아요! **-->
	
												<!-- 좋아요 수 카운트 -->
												<c:set var="count" value="0" /> <!-- count란 변수를 선언하겠다. 초기값은 0 -->
												<c:if test="${!empty likeAll }"> <!-- 좋아요 리스트가 비어있지 않았을때 -->
													<c:forEach var="likeAll" items="${likeAll }"> <!-- 좋아요 리스트를 반복문으로 실행해라 -->
														<c:if test="${review.review_no==likeAll.review_no }"> <!-- 단, 리뷰리스트와 좋아요리스트의 리뷰번호가 같은게 있다면 -->
															<c:set var="count" value="${count+1 }" /> <!-- count변수에 +1을 해주어라 -->
														</c:if>
													</c:forEach>
												</c:if>
						
	
												<span id="likeCount${review.review_no }"
													class="jsx-693606843 count">${count }</span>
											</button>
										</div>
									</c:if>
									
									<hr>
								
								
						</div>
					</div>
				</c:forEach>
				<!-- 여기까지 반복 -->
            
            <div class="jsx-1407906967 board-list-footer" style="width:100%">
               <ul class="jsx-3635512122 pagination pagination--kindergarten" id = "n_paging">
                  
                  <c:if test = "${pageMaker.prev}">
                  <li class="jsx-3635512122 prev disabled" >
                  <a href = "${pageMaker.makeQuery(pageMaker.startPage - 1)}&kinder_no=${kindervo.kinder_no}">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                        viewBox="0 0 24 24" fill="none" stroke="#dfdfdf"
                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        style="position: relative;">
                        <polyline points="11 17 6 12 11 7"></polyline>
                        <polyline points="18 17 13 12 18 7"></polyline></svg> 
                  </a>
                  <span class="jsx-3635512122 alt-text">앞으로</span>
                  </li>
                  </c:if>
                  
                  <c:forEach begin = "${pageMaker.startPage}" 
                     end = "${pageMaker.endPage}" var = "idx">
                  <li class="jsx-3635512122 " id = "page${idx}">
                  <c:choose>
                  <c:when test="${idx eq param.page}">
                  <a href = "${pageMaker.makeQuery(idx)}&kinder_no=${kindervo.kinder_no}" class = "on" id = "pageclick${idx}">${idx}</a>
                  </c:when>
                  <c:otherwise>
                  <a href = "${pageMaker.makeQuery(idx)}&kinder_no=${kindervo.kinder_no}" class = "off" id = "pageclick${idx}">${idx}</a>
                  </c:otherwise>
                  </c:choose>
                  </li>
                  </c:forEach>
                  
                  <c:if test = "${pageMaker.next && pageMaker.endPage > 0}">
                  <li class="jsx-3635512122 next">
                  <a href = "${pageMaker.makeQuery(pageMaker.endPage + 1)}&kinder_no=${kindervo.kinder_no}">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                        viewBox="0 0 24 24" fill="none" stroke="#dfdfdf"
                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        style="position: relative;">
                        <polyline points="13 17 18 12 13 7"></polyline>
                        <polyline points="6 17 11 12 6 7"></polyline>
                  </svg> 
                  <span class="jsx-3635512122 alt-text">뒤로</span>
                  </a>
                  </li>
                  </c:if>
               </ul>

            </div>
            
            </c:otherwise>
            </c:choose>

         </div>
         </div>
      </section>

     
      <!-- @@ footer 영역 @@ -->
   <jsp:include page="../footer.jsp"/>
   

</body>
</html>