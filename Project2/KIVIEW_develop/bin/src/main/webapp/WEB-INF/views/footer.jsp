<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<footer class="ftco-footer ftco-bg-dark ftco-section" id = "footer">
      <div class="container">
        <div class="row mb-5">
         <div class="col-md-6 col-lg-3">
            <div class="ftco-footer-widget mb-5">
            	<h2 class="ftco-heading-2">질문 Talk Talk !</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">서울 강남구 테헤란로14길 6 남도빌딩</span></li>
	                <li><span class="icon icon-phone"></span><span class="text">02-7979-4242</span></li>
	                <li><span class="icon icon-envelope"></span><span class="text">kiview@kiview.com</span></li>
	              </ul>
	            </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3" style="position:relative;left:6%;">
            <div class="ftco-footer-widget mb-5">
              <h2 class="ftco-heading-2">개발자 소개</h2>
              <div class="block-21 mb-4 d-flex">
                <div class="text">
                  <div class="block-23 mb-3">
	              <ul>
	                <li><span class="text">구남현 김지민</span></li>
	                <li><span class="text">박도영 박상아</span></li>
	                <li><span class="text">전해인 최성훈 최승혜</span></li>
	              </ul>
	            </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3">
            <div class="ftco-footer-widget mb-5 ml-md-4">
              <h2 class="ftco-heading-2">카테고리</h2>
              <ul class="list-unstyled">
                <li><a href="index.do"><span class="ion-ios-arrow-round-forward mr-2"></span>홈</a></li>
                <li><a href="kiviewnotice.do?page=1"><span class="ion-ios-arrow-round-forward mr-2"></span>키뷰안내</a></li>
                <li><a href="kindersearch.do"><span class="ion-ios-arrow-round-forward mr-2"></span>유치원</a></li>
                <li><a href="cafehome.do?member_no=${login.member_no }&member_id=${login.member_id}"><span class="ion-ios-arrow-round-forward mr-2"></span>키뷰 카페</a></li>
                <li><a href="login.do"><span class="ion-ios-arrow-round-forward mr-2"></span>로그인</a></li>
              </ul>
            </div>
          </div>
           <div class="col-md-6 col-lg-3">
            <div class="ftco-footer-widget mb-5">
            	<h2 class="ftco-heading-2">KIVIEW가 참고한 사이트</h2> 
                <div class="form-group">
                  <button style="background-color:#fda638; color:white; cursor:pointer;" onclick = "location.href='https://www.starteacher.co.kr/'" class="form-control submit px-3" >별별선생</button><br>
                  <button style="background-color:#fda638; color:white; cursor:pointer;" onclick = "location.href='https://www.behance.net/'" class="form-control submit px-3" >Behance.net</button>
                </div>
            </div>
          </div>
        </div>
        <br>
        <div class="row">
          <div class="col-md-12 text-center">
            <p>
			  Copyright &copy;<script>document.write(new Date().getFullYear());</script> 
			  All rights reserved | by <a href="#" target="_blank">KIVIEW</a>
          </div>
        </div>
        
      </div>
    </footer>
    
    
	<script src="resources/js/main.kiview.js"></script>
	<!-- <script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/jquery-migrate-3.0.1.min.js"></script> -->
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.easing.1.3.js"></script>
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<script src="resources/js/jquery.stellar.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/aos.js"></script>
	<script src="resources/js/jquery.animateNumber.min.js"></script>
	<script src="resources/js/scrollax.min.js"></script>
	<script src="resources/js/main.js"></script>