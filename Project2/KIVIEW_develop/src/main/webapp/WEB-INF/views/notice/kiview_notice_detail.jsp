<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>KIVIEW &mdash; About</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

<jsp:include page="../head.jsp"/>

<!-- js -->
<script type="text/javascript" src = "resources/js/notice-detail.js"></script>
<script type="text/javascript" src = "resources/js/notice.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>



<style type="text/css">

#writebtn{
box-sizing: border-box;
    outline: none;
    font-family: 'Noto Sans KR', sans-serif;
    text-rendering: optimizeSpeed;
    -webkit-font-smoothing: antialiased;
    margin: 0;
    padding: 0;
    vertical-align: baseline;
    background: none;
    border: 0;
    cursor: pointer;
    font-size: 14px;
    text-align: center;
    line-height: 42px;
    border-radius: 26px;
    color: #ffffff;
    transition: background-color 0.3s;
    background-color: #ff9d1f;
    width: 120px;
    min-width: 120px;
    height: 42px;
}

</style>

</head>

<body id="body">

	<!-- header 부분 -->
	<jsp:include page="../header.jsp"/>

	 <section class="hero-wrap hero-wrap-2"
		style="background-image: url('resources/images/main/board_img01.png');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-2 bread">공지사항</h1>
					<p class="breadcrumbs">
						<span class="mr-2"> <a href="index.do">홈 <i
								class="ion-ios-arrow-forward"></i></a>
						</span> 
						<span>키뷰안내 <i class="ion-ios-arrow-forward"></i></span> 
						<span>&nbsp;공지사항</span>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- header 끝 -->

	<div class="jsx-903324597 content" id = "contentdiv">
		<div class="jsx-3810764099 board-box">
			<div class="jsx-1103591975 sidebar sidebar--kindergarten">
				<h2 class="jsx-1103591975">
				<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32"
						viewBox="0 0 24 24" fill="none" stroke="#dfdfdf" stroke-width="2"
						stroke-linecap="round" stroke-linejoin="round"
						style="position: relative;">
						<path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
						<polyline points="14 2 14 8 20 8"></polyline>
						<line x1="16" y1="13" x2="8" y2="13"></line>
						<line x1="16" y1="17" x2="8" y2="17"></line>
						<polyline points="10 9 9 9 8 9"></polyline></svg>
					<span class="jsx-1103591975">공지사항</span>
				</h2>
				<ul class="jsx-1103591975">
					<li class="jsx-1103591975 active">
					<a class="jsx-1103591975" style = "cursor:pointer;"
					 id = "menu01">공지사항</a></li>
					<li class="jsx-1103591975">
					<a class="jsx-1103591975" style = "cursor:pointer;"
					id = "menu02">키뷰소개</a></li>
					<li class="jsx-1103591975 ">
					<a class="jsx-1103591975" style = "cursor:pointer;"
					id = "menu03">FAQ</a></li>
				</ul>
			</div>


			<div class="jsx-3174206368 content-box">
				<div class="jsx-3174206368 card-box">
					<div class="jsx-919952047 board-title">
						<h3 class="jsx-919952047">공지사항</h3>
						<ol class="jsx-1271347565 ">
							<li class="jsx-1271347565">키뷰안내</li>
							<li class="jsx-1271347565"><a class="jsx-1271347565"
								href="/kindergarten/community/talk/articles">공지사항</a></li>
						</ol>
					</div>
					
					
					<div class="jsx-1115820773 board-header board-header--kindergarten">
						<h4 class="jsx-1115820773">
							<span class="jsx-1115820773 classfi-text">${noticedetail.cat_detail}</span>${noticedetail.notice_title}
						</h4>
						<div class="jsx-1115820773 header-info">
							<div class="jsx-1115820773 avatar-box">
								<div class="jsx-2646496749 avatar">
									<div class="jsx-2646496749 circle"
										style="background-image: url(&quot;https://d1ta1myjmiqbpz.cloudfront.net/static/images/default_image/default_user01_02@2x.png&quot;);"></div>
								</div>
								<span class="jsx-1115820773">${noticedetail.notice_writer}</span>
							</div>
							<div class="jsx-1115820773 info-box">
								<span class="jsx-1115820773 info-view">
								<span class="jsx-1115820773 hide-on-mobile">조회</span>
								<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
										viewBox="0 0 24 24" fill="none" stroke="#c1c1c1"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"
										style="position: relative; margin-right: 2px; vertical-align: -2px;">
										<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
										<circle cx="12" cy="12" r="3"></circle>
								</svg>
										<span class="jsx-1115820773">${noticedetail.notice_hit}</span>
								</span>
									<span class="jsx-1115820773 division-line"></span>
									<span class="jsx-1115820773 hide-on-mobile" style = "color:rgb(102, 102, 102)">등록</span>
									&nbsp;
									<span class="jsx-1115820773 date">${noticedetail.notice_date}</span>
							</div>
						</div>
					</div>
					
					<div class="jsx-3826147658 content">
						<div class="jsx-2567501591 editor">
							<div class="fr-view">
								<p>${noticedetail.notice_content}</p>
							</div>
						</div>
					</div>
					<div class="jsx-3826147658 content_tag">
						<a class="jsx-3826147658" href="kiviewnotice.do?page=${param.page}">#${noticedetail.cat_detail}</a>
					</div>
					<div class="jsx-2211599338 service">
						<button class="jsx-2211599338 btn-view-list" 
						style = "cursor:pointer;background:#fff;outline:none;" onclick = "backlist(${param.page});">
							<span class="jsx-2211599338 hide-on-mobile">목록보기</span>
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="#8f8f8f"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								style="position: relative;">
								<line x1="8" y1="6" x2="21" y2="6"></line>
								<line x1="8" y1="12" x2="21" y2="12"></line>
								<line x1="8" y1="18" x2="21" y2="18"></line>
								<line x1="3" y1="6" x2="3" y2="6"></line>
								<line x1="3" y1="12" x2="3" y2="12"></line>
								<line x1="3" y1="18" x2="3" y2="18"></line></svg>
						</button>
						<div class="jsx-2334299286 share share--small share--circle">
							<ul class="jsx-2334299286">
								<li class="jsx-2334299286">
								<button tabindex="0" onclick = "sendLink();"
										class="jsx-2334299286 share-link share-link--kakao" id = "btn2">
									<span class="jsx-2334299286 icon icon--kakao">
									<span class="jsx-2334299286 alt-text">카카오톡 공유</span></span>
								</button>
								<script type="text/javascript">
									Kakao.init('d29d48414026a38f5c8a4f4b7265d21f');
									// // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
									function sendLink() {
									  Kakao.Link.sendDefault({
									    objectType: 'feed',
									    content: {
									      title: '${noticedetail.notice_title}' ,
									      description: '#키뷰 #${noticedetail.cat_detail}',
									      imageUrl: 'https://ifh.cc/g/MReqA.jpg',
									      link: {
									        mobileWebUrl: 'http://www.kiview.net/kiview/kiviewdetail.do?notice_no=${noticedetail.notice_no}&page=${param.page}',
									        webUrl: 'http://www.kiview.net/kiview/kiviewdetail.do?notice_no=${noticedetail.notice_no}&page=${param.page}'
									      }
									    },
									    buttons: [
									      {
									        title: '웹으로 보기',
									        link: {
									          mobileWebUrl: 'http://www.kiview.net/kiview/kiviewdetail.do?notice_no=${noticedetail.notice_no}&page=${param.page}',
									          webUrl: 'http://www.kiview.net/kiview/kiviewdetail.do?notice_no=${noticedetail.notice_no}&page=${param.page}'
									        }
									      },
									      {
									        title: '앱으로 보기',
									        link: {
									          mobileWebUrl: 'http://www.kiview.net/kiview/kiviewdetail.do?notice_no=${noticedetail.notice_no}&page=${param.page}',
									          webUrl: 'http://www.kiview.net/kiview/kiviewdetail.do?notice_no=${noticedetail.notice_no}&page=${param.page}'
									        }
									      }
									    ]
									  });
									}
								</script>
								</li>
								
								<li class="jsx-2334299286">
								<button tabindex="0" id = "btn4" onclick="javascript:CopyUrlToClipboard()"
								class="jsx-2334299286 share-link share-link--url">
									<span class="jsx-2334299286 icon icon--url">
									<span class="jsx-2334299286 alt-text"></span>
									</span>
								</button>
								<input type = "text" id = "ShareUrl" style = "position:absolute;top:-9999em;"
								value = "http://localhost:8787/kiview/kiviewdetail.do?notice_no=${noticedetail.notice_no}&page=${param.page}"/>
								&nbsp;<div id="snackbar">클립보드로 복사되었습니다.</div>
								</li>
							</ul>
						</div>
						<button aria-label="공유하기" type="button" id = "btn5"
							class="jsx-2334299286 btn-share">
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
								viewBox="0 0 24 24" fill="none" stroke="#8f8f8f"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								style="position: relative; vertical-align: -3px; margin-right: 2px;">
								<circle cx="18" cy="5" r="3"></circle>
								<circle cx="6" cy="12" r="3"></circle>
								<circle cx="18" cy="19" r="3"></circle>
								<line x1="8.59" y1="13.51" x2="15.42" y2="17.49"></line>
								<line x1="15.41" y1="6.51" x2="8.59" y2="10.49"></line></svg>
						</button>
						
						<c:set var = "admin_id" value = "${login.member_id}"/>
						<c:set var = "writer" value = "${noticedetail.notice_writer}"/>
						<c:choose>
						<c:when test="${admin_id == writer}">
						<div class="jsx-2211599338 recommend-box">
							<button class="jsx-1407906967" id = "writebtn"
							onclick="notice_edit(${noticedetail.notice_no},${param.page})">수정하기</button>&nbsp;&nbsp;
							<span><button class="jsx-1407906967" id = "writebtn"
							onclick="notice_del(${noticedetail.notice_no},${param.page})">삭제하기</button></span>
						</div>
						</c:when>
						<c:otherwise>
						<div class="jsx-2211599338 recommend-box">
						</div>
						</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>



	<br>
	<br>
	<br>


	<!-- @@ footer 영역 @@ -->
	<jsp:include page="../footer.jsp"/>


</body>
</html>
