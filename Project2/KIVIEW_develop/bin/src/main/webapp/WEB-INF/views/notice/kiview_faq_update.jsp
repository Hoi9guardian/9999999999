<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KIVIEW &mdash; 수정하기</title>

<!-- css -->
<link rel="stylesheet" href="resources/css/notice_write.css">
<jsp:include page="../head.jsp" />

<!-- js -->


<!-- SmartEditor2 라이브러리  -->
<script type="text/javascript" src="se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

</head>
<body>

	<!-- header 부분 -->
	<jsp:include page="../header.jsp" />

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('resources/images/main/board_img01.png');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-2 bread">FAQ 수정하기</h1>
					<p class="breadcrumbs">
						<span class="mr-2"> <a href="index.do">홈 
						<i class="ion-ios-arrow-forward" style="color: #fff;"></i></a>
						</span> 
						<span>키뷰안내 <i class="ion-ios-arrow-forward" style="color: #fff;"></i></span> 
						<span>&nbsp;FAQ</span>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- header 끝 -->


	<!-- 글쓰기 폼 -->
	<div class="jsx-903324597 content">
		<div class="jsx-3810764099 board-box">
			<div class="jsx-738848916 content-box">
				<div class="jsx-738848916 card-box">
					<div class="jsx-2265392070 board-title">
						<h3 class="jsx-2265392070">
							KIVIEW FAQ<span class="jsx-2265392070">수정하기</span>
						</h3>
						<ol class="jsx-1271347565 ">
							<li class="jsx-1271347565">홈</li>
							<li class="jsx-1271347565">공지사항</li>
						</ol>
					</div>

					<!-- 제목/작성자/내용/분류 카테고리 넘기기  -->
					<form action="faqUpdateRes.do" method="post" id="faqUpdateForm">
					<input type = "hidden" id = "faq_no" name = "faq_no" value = "${faqupdate.faq_no}">
					<input type = "hidden" id = "page" name = "page" value = "${page}">
					<input type = "hidden" id = "faqcatd" name = "faqcatd" value = "${faqcatd}">
					
						<div class="jsx-4261166144 select-wrap">
							<div class="jsx-4261166144 select-box">
								<div class="jsx-4121141969 select">
									<div class="jsx-4121141969 choice">
										<select class="form-control-sm2" id="selcatd"
											name="faq_catd" style="cursor: pointer;">
											<option value="">카테고리 선택</option>
											<option value="리뷰">리뷰</option>
											<option value="회원">회원</option>
											<option value="서비스">서비스</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<br>
						<div class="jsx-741803006 input-box">
							<div class="jsx-639067573 input">
								<input type="text" id="title" name="faq_title"
									placeholder="제목을 입력해 주세요." class="jsx-639067573"
									style="background-color: #fff; color: black;" value="${faqupdate.faq_title}">
							</div>
						</div>
						<br>

						<!-- SmartEditor2  -->
						<div class="jsx-2303464893 editor">
							<div class="fr-box fr-basic fr-top" role="application">
								<div class="fr-wrapper show-placeholder" dir="auto"
									style="overflow: scroll;">
									<textarea name="faq_content" id="smartEditor"
										style="width: 100%; height: 412px;">${faqupdate.faq_content}</textarea>
								</div>
							</div>
						</div>

						<!-- 글쓰기 취소/작성완료 -->
						<div class="jsx-738848916 btn-box">
							<div class="jsx-738848916 btn-cancel">
								<button type="button" class="jsx-462732305"
									onclick="location.href='kiviewfaq.do?faqcatd=${faqupdate.faq_catd}&page=1'"
									style="outline: none;">취소</button>
							</div>
							<div class="jsx-738848916 btn-finish">
								<button type="button" class="jsx-1357017423"
									style="outline: none;" id="savebutton">작성완료</button>
							</div>
						</div>
					</form>
					<!-- 글쓰기 폼 끝 -->
				</div>
			</div>
		</div>
	</div>

	<!-- footer 사이 띄우기  -->
	<section style="background: #fff;">
		<div class="container">
			<br> <br> <br> <br>
		</div>
	</section>

	<!-- footer 부분 -->
	<jsp:include page="../footer.jsp" />


</body>
</html>

<!-- SmartEditor2 -->
<script type="text/javascript" src="resources/js/faq-update.js"></script>