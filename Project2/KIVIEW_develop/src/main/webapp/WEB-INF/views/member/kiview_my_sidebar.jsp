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
	text-align:center;
	text-overflow: ellipsis; /* 위에 설정한 100px 보다 길면 말줄임표처럼 표시합니다. */
	white-space: nowrap; /* 줄바꿈을 하지 않습니다. */
	overflow: hidden; /* 내용이 길면 감춤니다 */ 
	
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

#paging{ 
	
  	text-align:center!important;
  	width:100%;
	margin-top:15px;  
	margin:0 auto; 
	
}

#paging ul{
	
	display:inline-block!important;

}

#paging li {
	display:inline-block!important;
}






</style>




</head>
<body id = "body">




	
				<!-- 사이드 메뉴 -->
				<div class="col-lg-3 ftco-animate"
					style="height:300px; margin-right: 20px; padding: 30px; background-color: white; border: 1px solid lightgray;" class="myside";>
   
 					   
					<h2>
						<b>마이페이지</b>
					</h2>
					<br>
					<label><a id="mypage" href="kiviewmypage.do">내 정보</a></label>
					<hr style="margin: 0px;">
					<br>
					<label><a id="myactivity" href="kiviewmyactivity.do?member_id=${login.member_id }">내 활동</a></label>
					<hr style="margin: 0px">
					 

					

				</div>

				





</body>
</html>