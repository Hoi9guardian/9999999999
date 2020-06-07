<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KIVIEW &mdash; FAQ</title>

<!-- css  -->
<jsp:include page="../head.jsp"/>
<link rel="stylesheet" href="resources/css/FAQ.css">

<!-- js -->	
<script type="text/javascript" src = "resources/js/faq.js"></script>
<script type="text/javascript" src = "resources/js/notice.js"></script>


</head>
<body>

	<!-- header 영역 -->
	<jsp:include page="../header.jsp"/>
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('resources/images/main/board_img01.png');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-2 bread">FAQ</h1>
					<p class="breadcrumbs">
						<span class="mr-2"> <a href="index.do">홈 
						<i class="ion-ios-arrow-forward"></i></a>
						</span> 
						<span>키뷰안내 <i class="ion-ios-arrow-forward"></i></span> 
						<span>&nbsp;FAQ</span>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- header 끝 -->

	<div class="jsx-903324597 content">
		<div class="jsx-3810764099 board-box">
			<div class="jsx-1103591975 sidebar sidebar--kindergarten">
				<h2 class="jsx-1103591975">
					<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32"
						viewBox="0 0 24 24" fill="none" stroke="#dfdfdf" stroke-width="2"
						stroke-linecap="round" stroke-linejoin="round"
						style="position: relative;">
						<path
							d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
						<polyline points="14 2 14 8 20 8"></polyline>
						<line x1="16" y1="13" x2="8" y2="13"></line>
						<line x1="16" y1="17" x2="8" y2="17"></line>
						<polyline points="10 9 9 9 8 9"></polyline></svg>
					<span class="jsx-1103591975">FAQ</span>
				</h2>
				<ul class="jsx-1103591975">
					<li class="jsx-1103591975">
					<a class="jsx-1103591975" style = "cursor:pointer;"
					 id = "menu01">공지사항</a></li>
					<li class="jsx-1103591975">
					<a class="jsx-1103591975" style = "cursor:pointer;"
					id = "menu02">키뷰소개</a></li>
					<li class="jsx-1103591975 active">
					<a class="jsx-1103591975" style = "cursor:pointer;"
					id = "menu03">FAQ</a></li>
				</ul>
			</div>

			<div class="jsx-2342570284 faq-box faq-box--kindergarten">
			
				<!-- 분류 카테고리 부분 -->
				<form action="kiviewfaq.do" method = "post" name = "faqcatdform">
				<input type = "hidden" name = "page" value = "1">
				<ul class="jsx-2342570284 faq-tab" id = "tabul">
					<li class="jsx-2342570284">
					<button class="jsx-2342570284 ${param.faqcatd eq '' ? 'active':''}" type = "submit" id = "btn01" 
					name="faqcatd" value="">전체</button></li>
					<li class="jsx-2342570284">
					<button class="jsx-2342570284 ${param.faqcatd eq '리뷰' ? 'active':''}" type = "submit" id = "btn02" 
					name="faqcatd" value="리뷰">리뷰</button></li>
					<li class="jsx-2342570284">
					<button class="jsx-2342570284 ${param.faqcatd eq '회원' ? 'active':''}" type = "submit" id = "btn03" 
					name="faqcatd" value="회원">회원</button></li>
					<li class="jsx-2342570284">
					<button class="jsx-2342570284 ${param.faqcatd eq '서비스' ? 'active':''}" type = "submit" id = "btn04" 
					name="faqcatd" value="서비스">서비스</button></li>
				</ul>
				</form>
				
				<!-- 분류 카테고리 끝 -->
				<div class="jsx-2342570284 faq-item-box">
					<h3 class="jsx-2342570284">
						자주 묻는 질문과 답변
						<ol class="jsx-1271347565">
							<li class="jsx-1271347565">키뷰안내</li>
							<li class="jsx-1271347565">FAQ</li>
						</ol>
					</h3>

					<!-- FAQ 게시글 -->
					<c:choose>
					<c:when test="${!empty faqlist}">
					<c:forEach var = "faqlist" items = "${faqlist}" varStatus="status">
					<ul class="jsx-2342570284 faq-item-list" id = "faqul">
						<li class="jsx-357641531 question-item--kindergarten" id = "faqli${faqlist.faq_no}">
							<button type="button" class="jsx-357641531" id = "subbtn${faqlist.faq_no}" name="faq_no" 
							value="${faqlist.faq_no}" style = "outline:none;">
								<span class="jsx-357641531 question-icon" style = "background-color:#FFDC00;">Q</span>
								<span class="jsx-357641531 tab-name">${faqlist.faq_catd}</span>
								<p class="jsx-357641531" id = "title${faqlist.faq_no}">${faqlist.faq_title}</p>
								<span class="jsx-357641531 arrow"></span>
							</button>
							<div class="jsx-357641531 content" id = "comment">
								<div class="jsx-2567501591 editor">
									<div class="fr-view">
										<p id = "${faqlist.faq_no}"></p>
										
									<c:set var = "admin_id" value = "${login.member_id}"></c:set>	
									<c:if test="${fn:contains(admin_id, 'admin')}">	
									<button class="jsx-1407906967" id = "editbtn" 
									onclick="location.href='faqupdateform.do?faq_no=${faqlist.faq_no}&page=${pageMaker.cri.page}&faqcatd=${faqlist.faq_catd}'">
									<span style="color:#ffffff">수정</span></button>
									<button class="jsx-1407906967" id = "deletebtn" onclick="faqDel()">
									<span style="color:#ffffff">삭제</span></button>
									<input type = "hidden" id = "input01" name = "faq_no" value = "${faqlist.faq_no}">
									<input type = "hidden" id = "input02" name = "faqcatd" value = "${faqlist.faq_catd}">
									</c:if>
									
									</div>
								</div>
							</div>
						</li>
					</ul>
					</c:forEach>
					</c:when>
					<c:otherwise>
					<ul class="jsx-2342570284 faq-item-list">
						<li class="jsx-357641531 question-item--kindergarten">
							<button type="button" class="jsx-357641531" id = "faqbtn01" >
								<span class="jsx-357641531 question-icon"></span>
								<span class="jsx-357641531 tab-name"></span>
								<p class="jsx-357641531">작성 된 글이 없습니다.</p>
								<span class="jsx-357641531 arrow"></span>
							</button>
							<div class="jsx-357641531 content" id = "faqcomment01">
								<div class="jsx-2567501591 editor">
									<div class="fr-view">
										<p></p>
									</div>
								</div>
							</div>
						</li>
					</ul>
					</c:otherwise>
					</c:choose>
					
					<!-- 페이징 -->
					<div class="jsx-1407906967 board-list-footer">
					<ul class="jsx-3635512122 pagination pagination--kindergarten">
						
						<c:if test = "${pageMaker.prev}">
						<li class="jsx-3635512122 prev disabled" >
						<a href = "${pageMaker.makeQuery(pageMaker.startPage - 1)}">
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
						<a href = "${pageMaker.makeQuery(idx)}" class = "on" id = "pageclick${idx}">${idx}</a>
						</c:when>
						<c:otherwise>
						<a href = "${pageMaker.makeQuery(idx)}" class = "off" id = "pageclick${idx}">${idx}</a>
						</c:otherwise>
						</c:choose>
						</li>
						</c:forEach>
						
						<c:if test = "${pageMaker.next && pageMaker.endPage > 0}">
						<li class="jsx-3635512122 next">
						<a href = "${pageMaker.makeQuery(pageMaker.endPage + 1)}">
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

					<!-- 계정에 'admin'이 포함된 member_id일 때만 글쓰기 버튼이 보이도록 -->
					<c:set var = "admin_id" value = "${login.member_id}"></c:set>
					<c:choose>
					<c:when test="${fn:contains(admin_id, 'admin')}">
					<div
						class="jsx-1407906967 btn-write btn-write--kindergarten fix-position">
						<button class="jsx-1407906967"
							onclick="location.href='kiviewfaqwrite.do?page=${pageMaker.cri.page}&faqcatd=${pageMaker.cri.faqcatd}'">글쓰기</button>
					</div>
					</c:when>
					<c:otherwise>
					<div class="jsx-1407906967 btn-write btn-write--kindergarten fix-position">
					</div>
					</c:otherwise>
					</c:choose>
				</div>
					
				</div>
			</div>
		</div>
	</div>

	<section style="background: #fff;">
		<div class="container">
			<br> <br> <br> <br>
		</div>
	</section>

	<jsp:include page="../footer.jsp"/>


</body>
</html>