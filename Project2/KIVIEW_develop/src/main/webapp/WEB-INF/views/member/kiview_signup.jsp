<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>  
<html>
<head>
<title>KIVIEW &mdash; Sign Up</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="resources/css/signup.css">
<!-- KIVIEW FAVICON-->
<link rel="icon" href="resources/images/main/logo01.png" type="image/x-icon">
</head>
<body>

	<div id="__next">
		<div class="jsx-253692965 join-page">
			<div class="jsx-3372927190 create-info">
				<div class="jsx-669562709 join-title">
					<div class="jsx-669562709 join-title-wrap">
						<a class="jsx-669562709" href="index.do">
						<img src="resources/images/main/login-logo02.png"
							alt="" class="jsx-669562709" id="kiviewLogo"></a>
						<h2 class="jsx-669562709">
							<span class="jsx-669562709">회원가입</span><span
								class="jsx-669562709">본인인증</span><span
								class="jsx-669562709 mobile-service">회원가입</span>
						</h2>
					</div>
				</div>
				<p class="jsx-3372927190 sub-title" id="signupInfo">
					Kiview에서 활동하실 아이디와 비밀번호,<br class="jsx-3372927190">이메일 등의 기본정보를
					생성합니다.
				</p>
				<form class="jsx-3372927190" action="kiviewsignupres.do" name="signupForm" id="signupForm" onsubmit="return signupChk()">
					<div class="jsx-3372927190 label-box">
						<label class="jsx-3712571264 ">
							<span class="jsx-3712571264">이름&nbsp;</span><span class="jsx-3712571264" id="signupNameMsg"></span>
							<div class="jsx-3372927190 input-flex">
								<div class="jsx-639067573 input">
									<input autocomplete="new-password"
										placeholder="이름을 입력해주세요" class="jsx-639067573 "
										name="member_name" id="member_name">
								</div>
							</div>
						</label>
					</div>
					<div class="jsx-3372927190 label-box">
						<label class="jsx-3712571264 ">
							<span class="jsx-3712571264">아이디&nbsp;</span><span class="jsx-3712571264" id="signupIdMsg"></span>
							<div class="jsx-3372927190 input-flex">
								<div class="jsx-639067573 input">
									<input autocomplete="new-password"
										placeholder="아이디를 입력해 주세요" class="jsx-639067573 "
										name="member_id" id="member_id" onkeydown="idChk_chk()">
									<input type="hidden" id="idChkChk" value="idUnchecked" />
								</div>
								<button class="jsx-771227029 btn-id-check" type="button"
									style="margin-left: 16px;" onclick="signupIdCkBtn()">중복확인</button>
							</div></label>
					</div>
					<div class="jsx-3372927190 label-box">
						<label class="jsx-3712571264 ">
							<span class="jsx-3712571264">비밀번호&nbsp;</span><span class="jsx-3712571264" id="signupPwdMsg"></span>
							<div class="jsx-3372927190 first-password">
								<div class="jsx-639067573 input">
									<input type="password" placeholder="비밀번호를 입력해주세요 (영문,숫자,특수문자 포함 5~20자리)"
										class="jsx-639067573 " name="member_pwd" id="member_pwd" onkeyup="idPwd_chk()">
								</div>
							</div>
							<div class="jsx-3372927190">
								<div class="jsx-639067573 input">
									<input type="password" placeholder="비밀번호를 다시 한번 확인 입력해 주세요"
										class="jsx-639067573 " id="member_pwdChk" onkeyup="idPwd_chk()">
								</div>
							</div>
						</label>
					</div>
					<div class="jsx-3372927190 label-box">
						<label class="jsx-3712571264 ">
							<span class="jsx-3712571264">도로명주소&nbsp;</span><span class="jsx-3712571264" id="signupAddrMsg"></span>
							<div class="jsx-3372927190 input-flex">
								<div class="jsx-639067573 input">
									<input placeholder="도로명주소"
										class="jsx-639067573 " name="member_addr" id="member_addr" readonly="readonly">
								</div>
								<button class="jsx-771227029 btn-nickname-check" type="button"
									style="margin-left: 16px;" onclick="addrPopup()">주소찾기</button>
							</div>
						</label>
						<label class="jsx-3712571264 ">
							<span class="jsx-3712571264">상세주소&nbsp;</span>
							<div class="jsx-3372927190 input-flex">
								<div class="jsx-639067573 input">
									<input placeholder="상세주소"
										class="jsx-639067573 " name="member_addrDetail" id="member_addrDetail" readonly="readonly">
								</div>
							</div>
						</label>
					</div>
					<div class="jsx-3372927190 label-box">
						<label class="jsx-3712571264 ">
							<span class="jsx-3712571264">연락처&nbsp;</span><span class="jsx-3712571264" id="signupPhoneMsg"></span>
							<div class="jsx-3372927190 input-flex">
								<div class="jsx-639067573 input">
									<input autocomplete="new-password"
										placeholder="휴대폰 번호를 입력해주세요 (숫자만 입력)" class="jsx-639067573 "
										name="member_phone" id="member_phone">
								</div>
							</div>
						</label>
						<div class="jsx-3372927190 label-box">
							<label class="jsx-3712571264 ">
								<span class="jsx-3712571264">이메일&nbsp;</span><span class="jsx-3712571264" id="signupEmailMsg"></span>
								<div class="jsx-3372927190 input-flex">
									<div class="jsx-639067573 input">
										<input placeholder="이메일을 입력해주세요"
											class="jsx-639067573 " name="member_email" id="member_email">
									</div>
								</div>
							</label>
						</div>
					</div>
					<div class="jsx-3372927190 btn-box">
						<div class="jsx-3372927190 btn-prev">
							<button type="button" class="jsx-462732305" id="prev-page"
								onclick="location.href='kiviewsignupoption.do'">이전</button>
						</div>
						<div class="jsx-3372927190 btn-finish">
							<button type="submit" class="jsx-1380763286" id="complete-page">가입완료</button>
						</div>
					</div>
				</form>
				
				<div class="jsx-2358275923 banner">
					<span class="jsx-2358275923 alt-text">아직도 댓글 알바에 속으세요? 댓글알바,
						더이상 속지마세요! 솔직통쾌한 리뷰와 깨끗한 정보가 필요하다면?</span>
				</div>
			</div>
			<address class="jsx-253692965">Copyright © Kiview Corp. All
				Rights Reserved.</address>
		</div>
		<div class="jsx-2567582721 reviews"></div>
		<div id="topmost" class="jsx-2567582721"></div>
	</div>

	<!-- script -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="resources/js/signup.js?version=1.0"></script> 



</body>

</html>