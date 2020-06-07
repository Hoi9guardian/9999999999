<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	window.onload = function(){ 
		var arrLast = '${arrLast}'
		alert("네이버/카카오 계정으로 로그인 되었습니다");
	
		if(arrLast.includes('review')){
			location.href=arrLast;
		} 
		else if (arrLast.includes('cafe')){
			location.href=arrLast+"member_id=${login.member_id}&member_no=${login.member_no}";
		} 
		else {
			location.href="index.do";
		}
		
		
		
	}
	
	
</script>
</head>
<body>
</body>
</html>



