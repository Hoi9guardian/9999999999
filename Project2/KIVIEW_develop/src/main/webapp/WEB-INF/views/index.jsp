<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>KIVIEW &mdash; Main</title>

<jsp:include page="head.jsp"/>

<style type="text/css">

.modal-content {
  position: relative;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
  width: 100%;
  pointer-events: auto;
  background-color: #fff;
  background-clip: padding-box;
  border: 0;
  border-radius: 0.3rem;
  outline: 0; }
.modal-dialog.modal-fullsize {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}

.modal-content.modal-fullsize {
  height: auto;
  min-height: 100%;
  border-radius: 0;
}
h1{
   font-size: 60px;
    font-weight: 800;
}
h3 a{
     color:black;
    }



</style>

<script>
      $(function() {    //화면 다 뜨면 시작
        $("#searchInput").autocomplete({
            source : function( request, response ) {
                 $.ajax({
                        type: "get",
                        url: "autosearch.do",
                        dataType: "json",
                        data: { keyword : request.term },
                        success: function(data) {
                            response(
                                $.map(data, function(item) {
                                   //console.log(item.name);
                                    return {
                                        label: item.name,
                                        value: item.name
                                    }
                                })
                            );
                        }
                   });
                },    // source 는 자동 완성 대상
            select : function(event, ui) {    //아이템 선택시
                console.log(ui);//사용자가 오토컴플릿이 만들어준 목록에서 선택을 하면 반환되는 객체
                console.log(ui.item.label); 
                console.log(ui.item.value);
                
            },
            focus : function(event, ui) {    //포커스 가면
                return false;//한글 에러 잡기용도로 사용됨
            },
            minLength: 1,// 최소 글자수
            autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
            classes: {
                "ui-autocomplete": "highlight"
            },
            delay: 500,    //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
//            disabled: true, //자동완성 기능 끄기
            position: { my : "right top", at: "right bottom" },    //잘 모르겠음
            close : function(event){    //자동완성창 닫아질때 호출
                console.log(event);
            }
        });
      
      //모달위로띄우기
        $("#myFullsizeModal").on("shown.bs.modal", function() { $("#searchInput").autocomplete("option", "appendTo", "#myFullsizeModal") })
        
    });

</script>

</head>


<body id = "body">

   <!-- @@ header 부분 @@ -->
   <jsp:include page="header.jsp"/>

   <!-- @@ Main 이미지 부분 @@ -->
   <section class="home-slider owl-carousel">
      <div class="slider-item" style="background-image: url(resources/images/main/main_07.jpg);">
         <div class="overlay"></div>
         <div class="container">
            <div
               class="row no-gutters slider-text align-items-center justify-content-center"
               data-scrollax-parent="true">
               <div class="col-md-8 text-center ftco-animate">
                  <h1 class="mb-4">
                     우리 아이 좋은 유치원 보내기,<span> 어떻게 할까?</span>
                  </h1>
                  <p>
                     <a href="kindersearch.do" class="btn btn-secondary px-4 py-3 mt-3">더보기</a>
                  </p>
               </div>
            </div>
         </div>
      </div>

      <div class="slider-item" style="background-image: url(resources/images/main/main_06.jpg);">
         <div class="overlay"></div>
         <div class="container">
            <div
               class="row no-gutters slider-text align-items-center justify-content-center"
               data-scrollax-parent="true">
               <div class="col-md-8 text-center ftco-animate">
                  <h1 class="mb-4">
                     유치원 리뷰가 궁금하다면?<span> 바로 여기!</span>
                  </h1>
                  <p>
                     <a href="reviewboard.do" class="btn btn-secondary px-4 py-3 mt-3">더보기</a>
                  </p>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- @@ Main 이미지 부분 끝 @@ -->
   
   <!-- searchBar -->
   <div class="jsx-2460799870 bar-layout">
      <p class="jsx-2460799870">
         어떤 <span class="jsx-2460799870">유치원</span>을 찾으세요?
      </p>
      <div class="jsx-2460799870 search-box">
      <div class="jsx-2460799870 search-bar">
         <input
          type="text" class="search-bar" data-toggle="modal" data-target="#myFullsizeModal"/> 
         <span><img src="resources/images/main/search02.png"></span>
      </div>
   </div>
   </div>
   
   <!-- Fullsize Modal -->
   <div class="modal fade" id="myFullsizeModal" tabindex="-1" role="dialog" aria-labelledby="myFullsizeModalLabel">
		<div class="modal-dialog modal-fullsize" role="document">
			<div class="modal-content modal-fullsize">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="main-modal-closebtn">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="modal-body">
					<div class="jsx-2460799870 bar-layout">
						<h1>SEARCH</h1>
						<p class="jsx-2460799870">
							어떤 <span class="jsx-2460799870">유치원</span>을 찾으세요?
						</p>
						<form action="mainsearch.do" method="post" id="searchform">
							<div class="jsx-2460799870 search-box">
								<div class="jsx-2460799870 search-bar">
									<input type="text" id="searchInput" name="keyword"
										class="search-bar" /> <input type="hidden" name="page"
										value="1" /> <span><a
										href="javascript:searchform.submit();"><img
											src="resources/images/main/search02.png"></a></span>
								</div>
							</div>
						</form>
					</div>
					<jsp:include page="searchbar.jsp" />
				</div>
			</div>
		</div>
	</div>

   <br>
   <br>
   <br>
   <br>
   <br>
   <br>

   <!-- @@ 카운팅 부분  @@ -->
   <section class="ftco-section ftco-counter img" id="section-counter" 
   style="background-image: url(resources/images/bg_4.jpg);" data-stellar-background-ratio="0.5">
       <div class="container">
          <div class="row justify-content-center mb-5 pb-2">

          <div class="col-md-8 text-center heading-section heading-section-black ftco-animate">
            <h2 class="mb-4"><span style = "color:black;">지금</span><span> KIVIEW </span>에서는<br>${reviewcnt }개의 리뷰가 작성되고 있습니다.</h2>
            <p>실시간 작성되고 있는 리뷰와 유치원 소식을 알려드립니다.</p>
          </div>

        </div>   
          <div class="row d-md-flex align-items-center justify-content-center">
             <div class="col-lg-10">
                <div class="row d-md-flex align-items-center">
                <div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
                  <div class="block-18">
                     <div class="icon"><span class="flaticon-doctor"></span></div>
                    <div class="text">
                      <strong class="number" data-number="${reviewcnt }">0</strong>
                      <span id = "cntfont">유치원 리뷰</span>
                    </div>
                  </div>
                </div>
                <div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
                  <div class="block-18">
                     <div class="icon"><span class="flaticon-doctor"></span></div>
                    <div class="text">
                      <strong class="number" data-number="${kindercnt }">0</strong>
                      <span id = "cntfont">등록된 유치원</span>
                    </div>
                  </div>
                </div>
                <div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
                  <div class="block-18">
                     <div class="icon"><span class="flaticon-doctor"></span></div>
                    <div class="text">
                      <strong class="number" data-number="${cafecount }">0</strong>
                      <span id = "cntfont">카페 개설 수</span>
                    </div>
                  </div>
                </div>
                <div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
                  <div class="block-18">
                     <div class="icon"><span class="flaticon-doctor"></span></div>
                    <div class="text">
                      <strong class="number" data-number="${membercount }">0</strong>
                      <span id = "cntfont">키뷰 회원 수</span>
                    </div>
                  </div>
                </div>
                </div>
                </div>
              </div>
          </div>
    </section>
   <!-- @@ 카운팅 끝 @@ -->

   <br>
   <br>
   <br>
   <br>
   <br>
   <br>

   <!-- @@ 리뷰 영역 @@ -->
   <section class="ftco-section testimony-section bg-light">
      <div class="container">
         <div class="row justify-content-center mb-5 pb-2">
            <div class="col-md-8 text-center heading-section ftco-animate">
               <h2 class="mb-4">
                  <span>HOT 리뷰</span> TALK TALK!
               </h2>
               <p>가장 많은 공감을 얻은 리뷰만을 모아 보여드립니다.</p>
            </div>
         </div>
         <div class="row ftco-animate justify-content-center">
            <div class="col-md-12">
               <div class="carousel-testimony owl-carousel">
                  
                  <c:choose>
                  	
                  		<c:when test="${empty review }">
                  			작성된 리뷰가 없습니다.
                  		</c:when>
                  		<c:otherwise>
                  			
                  			<c:forEach items="${review }" var="review" begin="0" end="4"> 
                  				<c:set var="likecnt" value="0"/> 
                  				<c:forEach items="${like }" var="like">
                  					<c:if test="${review.review_no == like.review_no }">
                  						<c:set var="likecnt" value="${likecnt+1 }"/>
                  					</c:if>
                  				</c:forEach>
			                  <div class="item">   
			                     <div class="testimony-wrap d-flex">
			                     
			                        <div class="user-img mr-4"
			                           style="background-image: url(resources/images/main/review_img01.png)"></div>
			                        <div class="text ml-2 bg-light">
			                           <span
			                              class="quote d-flex align-items-center justify-content-center">
			                              <i class="icon-quote-left"></i>
			                           </span>  
			                           <label style="font-weight:bold">${review.review_title }</label>
			                           <p>${review.review_content }</p> 
			                           <p class="name">${fn:substring(review.review_writer,0,3)} <c:forEach begin="0" end="5">*</c:forEach></p>
			                           <span class="position">${review.kinder_name }</span><br>
										
										<!-- 좋아요 -->                  
			                           <div class="jsx-3279357537 buttons" style="float:right">
		                                 <button type="button"  
		                                    class="jsx-693606843 button--voteup" type="button" value="좋아요">
		                                    <svg xmlns="http://www.w3.org/2000/svg" width="20"
		                                       height="20" viewBox="0 0 24 24" fill="none" stroke="#8f8f8f"
		                                       stroke-width="2" stroke-linecap="round"
		                                       stroke-linejoin="round"
		                                       style="position: relative; vertical-align: top;">
		                                    <path d="M14 9V5a3 3 0 0 0-3-3l-4 9v11h11.28a2 2 0 0 0 2-1.7l1.38-9a2 2 0 0 0-2-2.3zM7 22H4a2 2 0 0 1-2-2v-7a2 2 0 0 1 2-2h3"></path></svg>
		
		                                    <span class="jsx-693606843 count">${likecnt }</span>
		                                 </button>
                              			</div>
			                        </div>
			                     </div>
			                  </div> 
			                  </c:forEach>
                  		</c:otherwise>
                  	
                  </c:choose>
                  
                  
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- @@ 리뷰 끝 @@ -->



   <!-- @@ 유치원 추천 영역 @@ -->
   <section class="ftco-section ftco-no-pb">
      <div class="container">
         <div class="row justify-content-center mb-5 pb-2">
            <div class="col-md-8 text-center heading-section ftco-animate">
               <h2 class="mb-4">
                  <span>유치원</span> 추천!
               </h2>
               <p>리뷰가 많은 유치원을 추천해드립니다.</p>
            </div>
         </div>
         <div class="row">
         <c:forEach items="${bestkinder }" var="bestkinder" varStatus="i">
            <div class="col-md-6 col-lg-3 ftco-animate">
               <div class="staff">
                  <div class="img-wrap d-flex align-items-stretch">
                     <div class="img align-self-stretch"
                        style="background-image: url(resources/images/main/kiview_0${i.count}.png);"></div>
                  </div>
                  <div class="text pt-3 text-center">
                     <h3><a href="searchdetail.do?kinder_no=${bestkinder.kinder_no}&page=1">${bestkinder.name }</a></h3>
                     <span class="position mb-2">${bestkinder.addr2 }</span>
                     <div class="faded">
                     </div>
                  </div>
               </div>
            </div> 
         </c:forEach>
         </div>
      </div>
   </section>
   <!-- @@ 끝 @@ -->






   <!-- @@ 카페 영역 @@ --> <!--200308-->
   <section class="ftco-section bg-light">
      <div class="container">
         <div class="row justify-content-center mb-5 pb-2">
            <div class="col-md-8 text-center heading-section ftco-animate">
               <h2 class="mb-4">
                  <span>키뷰</span> 카페
               </h2>
               <p>키뷰 회원님들의 커뮤니티, 키뷰 카페를 소개해드립니다!</p>
            </div>
         </div>
         <div class="row">
         
            <c:choose>
            <c:when test="${!empty best }">
            
               <c:forEach var="best" items="${best }">
            
            
                  <div class="col-md-6 col-lg-4 ftco-animate">
                           <div class="blog-entry">
                              <!-- 썸네일 -->
                              <a href="cafedetail.do?cafe_no=${best.cafe_no }&member_no=${login.member_no }"
                                 class="block-20 d-flex align-items-end"
                                 style="background-image: url('resources/upload/${best.thumb }');">
                                 <!-- 가입제한 -->
                                 <div class="meta-date text-center p-2">
                                    <span class="mos">
                                       <c:if test="${best.restriction eq 'Y'}">
                                                        바로가입
                                       </c:if>
                                       <c:if test="${best.restriction eq 'N'}">
                                                         승인후 가입
                                       </c:if>
   
                                    </span>
                                 </div>
                              </a>
   
                              <div class="text bg-white p-4">
                                 <!-- 카페명 -->
                                 <h3 class="heading">
                                    <a href="cafedetail.do?cafe_no=${best.cafe_no }&member_no=${login.member_no }">${best.title }</a>
                                 </h3>
   
                                 <!-- 카페소개 -->
                                 <p>${best.intro }</p>
                                 <div class="d-flex align-items-center mt-4">
                                    
                                    <p class="ml-auto mb-0">
                                       <!-- 카페장 -->
                                       <a href="#" class="mr-2">${best.admin }</a>
                                       <!-- 카페 회원 수 -->
                                       <c:set var="count" value="0"/>
                                          <c:forEach items="${member }" var="member">
   
                                             <c:if test="${best.cafe_no == member.cafe_no }">
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
              </c:when>
              <c:otherwise>
              
              </c:otherwise>
              
            </c:choose>
           
         </div>
      </div>
   </section>
   <!-- @@ 카페 끝 @@ --><!--200308-->


   <!-- @@ footer 영역 @@ -->
   <jsp:include page="footer.jsp"/>




</body>
</html>