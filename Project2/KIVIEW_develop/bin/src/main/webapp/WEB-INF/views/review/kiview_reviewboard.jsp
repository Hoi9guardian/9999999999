<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmf" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>KIVIEW &mdash;리뷰게시판</title>

<!-- **승혜:reviewboard.css로 임포트 -->
<jsp:include page="../head.jsp" />
<link rel="stylesheet" type="text/css" href="resources/css/star.css">
<link rel="stylesheet" type="text/css"
   href="resources/css/reviewboard.css">

<!-- **승혜:reviewboard.js로 임포트 -->
<script type="text/javascript" src="resources/js/reviewboard.js"></script>
<script type="text/javascript">


function Searchchk(){
   if($("#SearchId").val()==''){
      alert("검색어를 입력해 주세요.")
      return false;
   }
}


$(function(){
   $('textarea.content').keyup(function(){
      bytesHandler(this);
   });
});

function getTextLength(str) {
   var len = 0;
   for (var i = 0; i < str.length; i++) {
      if (escape(str.charAt(i)).length == 6) {
         len++;
      } else {
            len++;
      }
   }
   return len;
}

function bytesHandler(obj){
   var text = $(obj).val();
   $('span.bytes').text(getTextLength(text));
}

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

</script>

   

</head>

<body>

   <!-- header 부분 -->
   <jsp:include page="../header.jsp" />

   <section class="hero-wrap hero-wrap-2"
      style="background-image: url('resources/images/main/review_img03.png');">
     <!--  <div class="overlay"></div> -->
      <div class="container">
         <div
            class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
               <h1 class="mb-2 bread">리뷰 게시판</h1>
               <p class="breadcrumbs">
                  <span class="mr-2"><a href="index.do">홈 <i
                        class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a
                     href="kiview_reviewboard.jsp">리뷰 게시판 <i
                        class="ion-ios-arrow-forward"></i></a></span>
               </p>
            </div>
         </div>
      </div>
   </section>
   <!-- header 끝 -->

   <section class="ftco-section"
      style="padding: 0; background-color: #fafafa; padding-top: 60px">
      <div class="container">
         <!-- 리뷰 게시판 작성  -->

         <!-- 검색영역 -->
         <div class="text px-4 ftco-animate"
            style="background-color: white; padding: 40px; border: 1px solid lightgray;">
            <h1>
               <label>유치원 리뷰 </label>
            </h1>
            <br>
            <!-- 검색 기능 -->
            <form action="reviewsearch.do" onsubmit="return Searchchk()">
               <select name="type">
                  <option value="kinder_name">유치원명</option>
                  <option value="review_writer">작성자</option>
                  <option value="review_title">제　목</option>
               </select> &nbsp;&nbsp; <input type="text" name="keyword" id="SearchId"
                  placeholder="검색어를 입력하세요." style="height: 40px; width: 40%">
               <input class="btn btn-secondary"
                  style="width: 10%; border-radius: 0px" type="submit" value="검색">
               <br>
            </form>
            <br>
         </div>
         <div class="ftco-animate" style="margin: 40px; margin-bottom: 0px;">
            <c:choose>
               <c:when test="${keyword != null && keyword!=''}">
                  <h2>
                     <label><span style="color: #fda638">${keyword}</span>에 대한
                        <span style="color: #fda638">${fn:length(list)} </span>건의 리뷰가
                        검색되었습니다.</label>
                  </h2>
               </c:when>
               <c:otherwise>

               </c:otherwise>
            </c:choose>

         </div>

         <!-- 리뷰리스트 영역 -->
         <div class="text px-4 ftco-animate"
            style="background-color: white; margin-top: 20px; padding: 20px; border: 1px solid lightgray;">
            <c:choose>
               <c:when test="${login.member_id != null}">
                  <input
                     style="position: relative; left: 45%; width: 15%; top: 10px;"
                     class="btn btn-secondary" id="myBtn" type="button" value="리뷰쓰기">
               </c:when>
               <c:otherwise>
                  <input
                     style="position: relative; left: 45%; width: 15%; top: 10px;"
                     class="btn btn-secondary" type="button" value="리뷰쓰기"
                     onclick="confirmLogin();">
               </c:otherwise>
            </c:choose>
            <br> <br>

            <!-- 여기서부터 반복 -->
            <c:forEach items="${list}" var="review">
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
                           <span id="writer"> ${review.review_writer} </span> | <span>${review.review_year}</span>
                           | <span><fmf:formatDate value="${review.review_date}"
                                 pattern='yyyy-MM-dd HH:mm' /> </span>
                        </p>
                        <!-- **승혜 : 블러 이미지 수정 -->
                        <c:if test="${login.member_id==null }">
                           <jsp:include page="blur.jsp" />
                        </c:if>
                        <c:if test="${login.member_id!=null }">
                           <p>${review.review_content}</p>
                        </c:if>
                     </div>
                  </div>

                  <div class="reviewBtn" style="padding: 30px; width: 100%;">
                     <c:if test="${review.review_writer eq login.member_id}">
                        <!-- **승혜: 현재 페이지 번호(param.page)매개변수로 보내기 -->
                        <input class="btn btn-secondary" type="button" value="수정"
                           id="reviewedit"
                           onclick="update_form(${review.review_no}, ${param.page})">
                        <input class="btn btn-primary" type="button" value="삭제"
                           id="reviewdel"
                           onclick="reviewDel(${review.review_no}, ${param.page})">
                     </c:if>
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


            <!--============ **승혜 페이징** ============= -->

            <%-- <c:if test="${pageMaker.totalCount > 5}"> 
                  요 부분 리뷰 갯수가 총 5개 이상이면 페이지 번호 보이게 설정해주는 부분인데 
                  이렇게 말고 계속 페이지 번호 보여주고싶으면 주석 안풀면 돼요!
            --%>
            <div class="jsx-1407906967 board-list-footer"
               style="position: relative; bottom: 25px;">
               <ul class="jsx-2419612476 pagination pagination--kindergarten">
                  <c:if test="${pageMaker.prev}">
                     <li class="jsx-3635512122 prev disabled"><a
                        href="${pageMaker.makeQuery(pageMaker.startPage - 1)}"> <svg
                              xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                              viewBox="0 0 24 24" fill="none" stroke="#dfdfdf"
                              stroke-width="2" stroke-linecap="round"
                              stroke-linejoin="round" style="position: relative;">
                     <polyline points="11 17 6 12 11 7"></polyline>
                     <polyline points="18 17 13 12 18 7"></polyline>
                     </svg>
                     </a> <span class="jsx-3635512122 alt-text">앞으로</span></li>
                  </c:if>

                  <c:forEach begin="${pageMaker.startPage}"
                     end="${pageMaker.endPage}" var="idx">
                     <li class="jsx-3635512122 " id="page${idx}"><c:choose>
                           <c:when test="${idx eq param.page}">
                              <a href="${pageMaker.makeQuery(idx)}" class="on"
                                 id="pageclick${idx}">${idx}</a>
                           </c:when>
                           <c:otherwise>
                              <a href="${pageMaker.makeQuery(idx)}" class="off"
                                 id="pageclick${idx}">${idx}</a>
                           </c:otherwise>
                        </c:choose></li>
                  </c:forEach>

                  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                     <li class="jsx-3635512122 next"><a
                        href="${pageMaker.makeQuery(pageMaker.endPage + 1)}"> <svg
                              xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                              viewBox="0 0 24 24" fill="none" stroke="#dfdfdf"
                              stroke-width="2" stroke-linecap="round"
                              stroke-linejoin="round" style="position: relative;">
                     <polyline points="13 17 18 12 13 7"></polyline>
                     <polyline points="6 17 11 12 6 7"></polyline>
                     </svg> <span class="jsx-3635512122 alt-text">뒤로</span>
                     </a></li>
                  </c:if>
               </ul>
            </div>
            <!-- =============== 페이징 끝  =============== -->
            <%-- </c:if> --%>
         </div>
      </div>
   </section>

   <!-- **20/02/07 리뷰게시판 section footer랑 띄우기** -->
   <section style="background: #fafafa;">
      <div class="container">
         <br> <br> <br> <br>
      </div>
   </section>

   <!-- 리뷰 글 작성 시 모달 페이지 -->
   <!-- Trigger/Open The Modal -->
   <!--<button id="myBtn">Open Modal</button>-->

   <!-- The Modal -->
   <div id="myModal" class="modal">

      <!-- Modal content -->
      <div class="modal-content" style="padding: 40px;">
         <span style="width: 5%;" class="close">&times;</span>

         <div>
            <h3>
               <b>유치원 리뷰쓰기</b>
            </h3>
            <h6 style="width: 100%">키뷰는 평가자의 익명성을 보장하며 평가내역에 어떠한 개인정보도 노출되지
               않음을 약속드립니다.</h6>
            <br>

            <form action="reviewInsert.do" onsubmit="return insertchk()">
               <div>
                  <label>유치원 명 </label><br> <input type="hidden"
                     name="review_writer" value="${login.member_id}"> <input
                     type="hidden" name="kinder_no"> <input type="hidden"
                     name="page" value="${pageMaker.cri.page}"> <input
                     id="kinder_search" type="text" placeholder="유치원을 검색해 주세요."
                     name="kinder_name" style="width: 50%" minlength="4"
                     maxlength="20" required> <input type="button"
                     onclick="kinder_search2()" value="선택"> <input
                     style="width: 100%" type="text" name="kinder_addr"
                     placeholder="유치원 주소" readonly> <br> <br> <label>
                     등원시기 </label><br> <select id="review_year"
                     style="width: 101%; height: 35px;" name="review_year">
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
                     type="text" placeholder="제목을 입력하세요" name="review_title"
                     style="width: 101%" minlength="4" maxlength="30" required><br>
                  <br> <label>내용 </label><span style="position: relative; left: 85%" class="bytes">0</span><br>
                  <textarea class="content" style="width: 100%; height: auto; resize: none;"
                     placeholder="200자 이상, 500자 이하의 글자수만 작성이 가능합니다."
                     name="review_content" minlength="200" maxlength="500" required></textarea>
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
                        <input type="radio" name="avg_score1" value="1" id="p1" required>
                        <label for="p1">1</label> <input type="radio" name="avg_score1"
                           value="2" id="p2" required> <label for="p2">2</label> <input
                           type="radio" name="avg_score1" value="3" id="p3" required>
                        <label for="p3">3</label> <input type="radio" name="avg_score1"
                           value="4" id="p4" required> <label for="p4">4</label> <input
                           type="radio" name="avg_score1" value="5" id="p5" required>
                        <label for="p5">5</label>
                     </div>
                  </div>
                  <br> <br>

                  <div class="star-input2">
                     <label>교과/수업</label><br>
                     <div class="input2">
                        <input type="radio" name="avg_score2" value="1" id="p12"
                           required> <label for="p12">1</label> <input
                           type="radio" name="avg_score2" value="2" id="p22" required>
                        <label for="p22">2</label> <input type="radio" name="avg_score2"
                           value="3" id="p32" required> <label for="p32">3</label>
                        <input type="radio" name="avg_score2" value="4" id="p42"
                           required> <label for="p42">4</label> <input
                           type="radio" name="avg_score2" value="5" id="p52" required>
                        <label for="p52">5</label>
                     </div>
                  </div>
                  <br> <br>

                  <div class="star-input3">
                     <label>시설/청결</label><br>
                     <div class="input3">
                        <input type="radio" name="avg_score3" value="1" id="p13"
                           required> <label for="p13">1</label> <input
                           type="radio" name="avg_score3" value="2" id="p23" required>
                        <label for="p23">2</label> <input type="radio" name="avg_score3"
                           value="3" id="p33" required> <label for="p33">3</label>
                        <input type="radio" name="avg_score3" value="4" id="p43"
                           required> <label for="p43">4</label> <input
                           type="radio" name="avg_score3" value="5" id="p53" required>
                        <label for="p53">5</label>
                     </div>
                  </div>
                  <br> <br> <br>

               </div>
               <div style="position: relative; left: 38%;">
                  <input class="btn btn-secondary" style="width: 15%" type="submit"
                     value="작성"> &nbsp;&nbsp;&nbsp; <input id="modal-close"
                     class="btn btn-primary" style="width: 15%" type="button"
                     value="취소"
                     onclick="location.href='reviewboard.do?page=${pageMaker.cri.page}'">
               </div>
            </form>
         </div>
      </div>
   </div>


   <!-- 리뷰 수정 시 모달 페이지  -->
   <!-- 수정 부분에서 별평점 수정 시 //////// 기존 작성 된 별 점수를 별점수로 output 하는 부분은 따로 구현이 필요 -->
   <!-- 현재 별 평점 수정 모달에서는 선택 불가 상태임. -->
   <!-- Trigger/Open The Modal -->
   <!--<button id="myBtn">Open Modal</button>-->

   <!-- The Modal -->
   <div id="myModal2" class="modal">

      <!-- Modal content -->
      <div class="modal-content" style="padding: 40px;">
         <span style="width: 5%;" class="close">&times;</span>

         <div>
            <h3>
               <b>유치원 리뷰수정</b>
            </h3>
            <h6 style="width: 100%">키뷰는 평가자의 익명성을 보장하며 평가내역에 어떠한 개인정보도 노출되지
               않음을 약속드립니다.</h6>
            <br>

            <form id="reviewUpdate" action="reviewUpdate.do" method="get">
               <input type="hidden" name="review_no"> <input type="hidden"
                  name="kinder_no"> <input type="hidden" name="page"
                  value="${pageMaker.cri.page}">
               <div>
                  <label>유치원 명 </label><br> <input type="hidden"
                     name="review_writer"> <input type="text"
                     placeholder="유치원명을 입력하세요." name="kinder_name" style="width: 101%">
                  <input type="text" name="kinder_addr"> <br> <br>
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
                     placeholder="제목을 입력하세요." minlength="4" maxlength="30" required><br>
                  <br> <label>내용 </label>
                  <span style="position: relative; left: 85%" class="bytes">0</span><br>
                  <textarea style="width: 100%; height: auto; resize: none;"
                     name="review_content" minlength="200" maxlength="1000" required></textarea>
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

               <div style="position: relative; left: 38%;">
                  <input class="btn btn-secondary" style="width: 15%" type="submit"
                     value="수정"> &nbsp;&nbsp;&nbsp; <input id="modal2-close"
                     class="btn btn-primary" style="width: 15%" type="button"
                     value="취소">
               </div>
            </form>
         </div>
      </div>
   </div> 

   <!-- @@ footer 영역 @@ -->
   <jsp:include page="../footer.jsp" />


</body>
</html>