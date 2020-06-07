<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmf" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>KIVIEW &mdash; 카페</title>

<%@ include file="../head.jsp"%>
<style type="text/css">
td{
	word-break:break-all;
	text-overflow: ellipsis; /* 위에 설정한 100px 보다 길면 말줄임표처럼 표시합니다. */
	white-space: nowrap; /* 줄바꿈을 하지 않습니다. */
	overflow: hidden; /* 내용이 길면 감춤니다 */  
}
</style>
<script>
	$(function() {
		
		$("#categorychk").on("change",function(){
			if($("#categorychk").is(":checked")){  
				$("#category_insert").show();
			} else { 
				$("#category_insert").hide(); 
				$("input[name=category1]").val("");
				$("input[name=category2]").val("");
				$("input[name=category3]").val(""); 
			}
		})
		
		$("input[type=radio]").each(function(){
			if($(this).val()=="${vo.restriction}"){
				$(this).prop("checked",true)
			}
			
			
		})  
		
		$("input[name=concept]:input[value=table]").on("click",function(){
			$("#categorychk").attr("disabled",false);
			
		})
		
		$("input[name=concept]:input[value=guest]").on("click",function(){
			$("#categorychk").attr("disabled",true);
			$("#categorychk").attr("checked",false);
			$("#category_insert").hide();
			$("input[name=category1]").val("");
			$("input[name=category2]").val("");
			$("input[name=category3]").val("");
		})
		
		$("#categorychk").on("click",function(){
			if(("#categorychk").is(":checked")){
				$("input[name=category1]").val("");
				$("input[name=category2]").val("");
				$("input[name=category3]").val(""); 
			} 
		})

		

		$("#select").on("change", function() {

			if ($("#select option:selected").text() == "기본 정보") {
				
				$("input[type=radio]").each(function(){
					if($(this).val()=="${vo.restriction}"){
						$(this).prop("checked",true)
					}
					
					
				})
				

				$("#basic").show();
				$("#member").hide();
				$("#board").hide();
			} else if ($("#select option:selected").text() == "게시판관리") {
				
				$("#basic").hide();
				$("#member").hide();
				$("#board").show();
				$("#menuinsert_form").show();
				$("#menuupdate_form").hide(); 
			} else {
			
				$("#basic").hide();
				$("#member").show();
				$("#board").hide();
			}
		})

	})
	
	function menuinsert(){
		$("#menuinsert_form").show(); 
		$("#menuupdate_form").hide();
	}
	
	function menudetail(no){
		
		
		$.ajax({
			type:"post", 
			url:"menudetail.do",
			data:{"no":no}, 
			dataType:"json",
			success:function(data){
				console.log(data.menu.concept)
				
				if(data.menu.concept=='guest'){   
					
					$("#category_update").hide(); 
					
				} 
				
				if(data.menu.concept=='table'){   
					
					$("#category_update").show(); 
					
				} 
				
				$("#category_update").find($("input[name=category1]")).val("");  
				$("#category_update").find($("input[name=category2]")).val("");
				$("#category_update").find($("input[name=category3]")).val("");
			
				$("#menuinsert_form").hide();
				$("#menuupdate_form").show();
				$("#menuupdate_form").find($("input[name=name]")).val(data.menu.name);
				$("#menuupdate_form").find($("input[name=cafe_menu_no]")).val(data.menu.cafe_menu_no);
				$("#menuupdate_form").find($("input[name=authority]:input[value="+data.menu.authority+"]")).prop("checked",true);  
				$("#menuupdate_form").find($("input[name=concept]:input[value="+data.menu.concept+"]")).prop("checked",true);  
				$("#category_update").find($("input[name=category1]")).val(data.category[0].category);
				$("#category_update").find($("input[name=category_no1]")).val(data.category[0].cafe_category_no);
				$("#category_update").find($("input[name=category2]")).val(data.category[1].category);
				$("#category_update").find($("input[name=category_no2]")).val(data.category[1].cafe_category_no);
				$("#category_update").find($("input[name=category3]")).val(data.category[2].category); 
				$("#category_update").find($("input[name=category_no3]")).val(data.category[2].cafe_category_no);
				
				 
			
			
			},
			error:function(request,status,error){
				alert(request);
				alert(status);
				alert(error);
			}
			 
			
		})
	}
	
	function menu_delete(cafe_no, cafe_menu_no){
		
		
		if(confirm("삭제하시겠습니까?")){
			location.href="menudelete.do?cafe_no="+cafe_no+"&cafe_menu_no="+cafe_menu_no;
		}
	}
	
	function menuinsert_chk(cafe_no){
		var data = {"cafe_no":cafe_no, "name":$("input[name=name]").val()} 
		
		if(do_chk()==false){
			return false;
		}
		
		
		function do_chk(){
			
			var submit = false;
			

			$.ajax({
				type:"post",
				url:"menuchk.do",
				async : false,
				data:JSON.stringify(data),
				contentType:"application/json; charset=UTF-8;",
				dataType:"json",
				success:function(data){
					if(data.check==true){
						alert("게시판 이름이 중복됩니다.");
						submit = false;
					
					} else {
						submit = true;
					}
				
				},
				error:function(error){
					alert(error);
				}
			})
			
			
			return submit;
		}
		
		if($("#categorychk").is(":checked")){
			var category1 = $("#category_insert").find($("input[name=category1]")).val();
			var category2 = $("#category_insert").find($("input[name=category2]")).val();
			var category3 = $("#category_insert").find($("input[name=category3]")).val(); 
			
			if(category1 == "" && category2 == "" && category3 == ""){
				alert("최소 한개의 말머리를 입력하세요.");
				
				return false;
			}
			
			
			if(category1!=""){ 
				if(category1==category2 || category1==category3){
					alert(category1+"은 중복입니다.")
					return false;
				}
				
			}
			
			if(category2!=""){ 
				if(category2==category3 || category2==category1){
					alert(category2+"은 중복입니다.")
					return false;
				}
				
			}
			
			if(category3!=""){ 
				if(category1==category3 || category2==category3){
					alert(category3+"은 중복입니다.")
					return false;
				}
				
			}
		 	
		
		}
		
		return submit;
		  
		
		
	}
	
	function menuinsert_chk2(cafe_no){
		var data = {"cafe_no":cafe_no, "name":$("#category_update").find($("input[name=name]")).val()}  
		
		if(do_chk()==false){
			return false;
		}
		
		
		function do_chk(){
			
			var submit = false;
			

			$.ajax({
				type:"post",
				url:"menuchk.do",
				async : false,
				data:JSON.stringify(data),
				contentType:"application/json; charset=UTF-8;",
				dataType:"json",
				success:function(data){
					if(data.check==true){
						alert("게시판 이름이 중복됩니다.");
						submit = false;
					
					} else {
						submit = true;
					}
				
				},
				error:function(error){
					alert(error);
				}
			})
			
			
			return submit;
		}
		
		
			var category1 = $("#category_update").find($("input[name=category1]")).val();
			var category2 = $("#category_update").find($("input[name=category2]")).val();
			var category3 = $("#category_update").find($("input[name=category3]")).val(); 
			
			
			if(category1!=""){ 
				if(category1==category2 || category1==category3){
					alert(category1+"은 중복입니다.")
					return false;
				}
				
			}
			
			if(category2!=""){  
				if(category2==category3 || category2==category1){
					alert(category2+"은 중복입니다.")
					return false;
				}
				
			}
			
			if(category3!=""){ 
				if(category1==category3 || category2==category3){
					alert(category3+"은 중복입니다.")
					return false;
				}
				
			}
		 	
		
		
		
		return submit;
		  
		
		
	}
	
	function cancle(cafe_member_no){
		if(confirm("해당 유저의 가입을 거절하시겠습니까?")){
			$("#sign_list").find("tr").nextAll().remove();
			
			
			$.ajax({
				type:"post",
				url:"membercancle.do",
				data:{"cafe_no":'${cafe_list[0].cafe_no}', "cafe_member_no":cafe_member_no},
				
				dataType:"json",
				success:function(data){
					
					 $.each(data, function(idx, value){

						 if(value.signyn=="N"){
						 
							 $("#sign_list").append( 
									 			 	
										"<tr><td>"+value.name+"</td><td>"+value.answer+"</td><td>"+value.signdate+"</td>"
										+"<td> <input type='button' class='btn btn-secondary' value='가입' onclick='sign("+value.cafe_member_no+")'>"
										+"<input type='button' class='btn btn-primary' value='거절'onclick='cancle("+value.cafe_member_no+")'>"
										+"</td></tr>"
									
							) 
						
						} 
					 
					 })
					
						
						
						
					
				},
				error:function(error){
					alert(error);
				}
			})
		}
	}
	
	
	function unblock(cafe_member_no){
		if(confirm("해당 유저를 블락 해제하시겠습니까?")){
			$("#member_list").find("tr").nextAll().remove();
			
			$.ajax({
				type:"post",
				url:"memberunblock.do",
				data:{"cafe_no":'${cafe_list[0].cafe_no}', "cafe_member_no":cafe_member_no},
				
				dataType:"json",
				success:function(data){
					
					 $.each(data, function(idx, value){
						
						
						 if(value.signyn=="Y" && value.blockyn=="N"){
						 
							 $("#member_list").append( 
									 	
										"<tr><td>"+value.name+"</td><td>"+value.answer+"</td><td>"+changeDate(value.signdate)+"</td>"
										+"<td> <input type='button' class='btn btn-primary' style='background-color:black' value='블락' onclick='block("+ value.cafe_member_no
										+")'</td></tr>"
			
									
							) 
						
						} 
						 
						 if(value.signyn=="Y" && value.blockyn=="Y"){
							 
							 $("#member_list").append( 
									 	
									 //<fmf:formatDate value="${member.signdate }" pattern="yyyy-MM-dd"/>
										"<tr><td>"+value.name+"</td><td>"+value.answer+"</td><td>"+changeDate(value.signdate)+"</td>"
										+"<td> <input type='button' class='btn btn-primary' value='해제' onclick='unblock("+ value.cafe_member_no
										+")'</td></tr>"
			
									
							) 
						
						} 
						 
						 if(value.signyn=="A"){
							 
							 $("#member_list").append( 
									 	
									 //<fmf:formatDate value="${member.signdate }" pattern="yyyy-MM-dd"/>
										"<tr><td>"+value.name+"</td><td>"+value.answer+"</td><td>"+changeDate(value.signdate)+"</td>"
										+"<td></td></tr>"
			 
									
							) 
						
						} 
					 })
					
						
						
						
					
				},
				error:function(error){
					alert("에러!");
				}
			})
		}
		
		
		
	}
	function block(cafe_member_no){
		if(confirm("해당 유저를 블락하시겠습니까?")){
			$("#member_list").find("tr").nextAll().remove();
			
			$.ajax({
				type:"post",
				url:"memberblock.do",
				data:{"cafe_no":'${cafe_list[0].cafe_no}', "cafe_member_no":cafe_member_no},
				
				dataType:"json",
				success:function(data){
					
					 $.each(data, function(idx, value){
						console.log(value.signdate)
						if(value.signyn=="Y" && value.blockyn=="Y"){
							 
							 $("#member_list").append( 
									 	
									 //<fmf:formatDate value="${member.signdate }" pattern="yyyy-MM-dd"/>
										"<tr><td>"+value.name+"</td><td>"+value.answer+"</td><td>"+changeDate(value.signdate)+"</td>"
										+"<td> <input type='button' class='btn btn-primary' value='해제' onclick='unblock("+ value.cafe_member_no
										+")'</td></tr>"											
							) 						
						} 
 						
 						if(value.signyn=="Y" && value.blockyn=="N"){
							 
							 $("#member_list").append( 
									 	
									 
										"<tr><td>"+value.name+"</td><td>"+value.answer+"</td><td>"+changeDate(value.signdate)+"</td>"
										+"<td> <input type='button' class='btn btn-primary' style='background-color:black' value='블락' onclick='block("+ value.cafe_member_no
										+")'</td></tr>"			
									
							) 
						
						} 
						 
						 if(value.signyn=="A"){
							 
							 $("#member_list").append( 
									 	
									 
										"<tr><td>"+value.name+"</td><td>"+value.answer+"</td><td>"+changeDate(value.signdate)+"</td>"
										+"<td></td></tr>"
			
									
							) 
						
						}
					 })
			
				},
				error:function(error){
					alert("에러!");
				}
			})
		}
		
	}
	
	function sign(cafe_member_no){
		if(confirm("해당 유저의 가입을 승인하시겠습니까?")){
			$("#sign_list").find("tr").nextAll().remove();
			$("#member_list").find("tr").nextAll().remove();
			
			$.ajax({
				type:"post",
				url:"membersign.do",
				data:{"cafe_no":'${cafe_list[0].cafe_no}', "cafe_member_no":cafe_member_no},
				
				dataType:"json",
				success:function(data){
					
					 $.each(data, function(idx, value){
						
						
						 if(value.signyn=="N"){
						 
							 $("#sign_list").append( 
					
										"<tr><td>"+value.name+"</td><td>"+value.answer+"</td><td>"+changeDate(value.signdate)+"</td>"
										+"<td> <input type='button' class='btn btn-secondary' value='가입' onclick='sign("+value.cafe_member_no+")'>"
										+"<input type='button' class='btn btn-primary' value='거절'onclick='cancle("+value.cafe_member_no+")'>"
										+"</td></tr>"  									
							) 
						
						}
						 
 						if(value.signyn=="Y" && value.blockyn=="Y"){
							 
							 $("#member_list").append( 
									 	
									
										"<tr><td>"+value.name+"</td><td>"+value.answer+"</td><td>"+changeDate(value.signdate)+"</td>"
										+"<td> <input type='button' class='btn btn-primary' value='해제' onclick='unblock("+ value.cafe_member_no
										+")'</td></tr>"		
									
							) 
						
						} 
 						
 						if(value.signyn=="Y" && value.blockyn=="N"){
							 
							 $("#member_list").append( 
									 	
									 //<fmf:formatDate value="${member.signdate }" pattern="yyyy-MM-dd"/>
										"<tr><td>"+value.name+"</td><td>"+value.answer+"</td><td>"+changeDate(value.signdate)+"</td>"
										+"<td> <input type='button' class='btn btn-primary' style='background-color:black' value='블락' onclick='block("+ value.cafe_member_no
										+")'</td></tr>"			
									
							) 
						
						} 
						 
						 if(value.signyn=="A"){
							 
							 $("#member_list").append( 
									 	
									 //<fmf:formatDate value="${member.signdate }" pattern="yyyy-MM-dd"/>
										"<tr><td>"+value.name+"</td><td>"+value.answer+"</td><td>"+changeDate(value.signdate)+"</td>"
										+"<td></td></tr>"								
							) 
						
						} 
					 })
					
						
						
						
					
				},
				error:function(error){
					alert(error);
				}
			})
		}
	}
	
	function changeDate(date) {
		date = new Date(parseInt(date));
		year = date.getFullYear();
		month = date.getMonth();
		day = date.getDate();
		hour = date.getHours();
		minute = date.getMinutes();
		second = date.getSeconds();

		if (month < 10) {

			month = "0" + month;
		}

		if (day < 10) {
			day = "0" + day;
		}


		strDate = year + "-" + month + "-" + day

		return strDate;
	}
</script>
</head>
<body id="body">


	<%@include file="cafe_modal.jsp"%>
	<!-- @@ header 부분 @@ -->
	<%@ include file="../header.jsp"%>

	<!-- @@ <h1 class = "mb-2 bread"> sub title 이 부분 우선 header에서 따로 빼놨어요!!! </h1> @@ -->
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('resources/images/main/board_img03.png');">
		<!-- <div class="overlay"></div> -->
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-2 bread">키뷰 카페</h1>
               <p class="breadcrumbs">
                  <span class="mr-2"><a href="index.do">홈 <i
                        class="ion-ios-arrow-forward"></i></a></span> <span>키뷰카페 <i
                     class="ion-ios-arrow-forward"></i></span>
               </p>
				</div>
			</div>
		</div>
	</section>
	<!-- @@ header 끝 @@ -->


	<section class="ftco-section bg-light">
		<div class="container" style="margin-left: 30px;">
			<div class="row" style="width: 1400px; overflow: auto;">
				<!-- 카페 메뉴 -->
				<div class="col-lg-3 sidebar ftco-animate"
					style="padding: 25px; margin-right: 30px; background-color: white; border: 1px solid lightgray;">


					<%@include file="cafe_sidebar.jsp"%>

				</div>

				<!-- 카페 홈  -->

				<div id="home" class="col-lg-8 ftco-animate"
					style="padding: 25px; margin-left: 0px; background-color: white; border: 1px solid lightgray;">

					<!-- 옵션 선택 -->
					<div style="position: relative; left: 85%; width: 18%";>
						<select id="select"
							style="width: 80%; height: 40px; border-radius: 5px;">
							<option>기본 정보</option>
							<option>게시판관리</option>
							<option>회원관리</option>
						</select>
					</div>


					<!-- 기본 정보 -->
					<div id="basic">
						<h2 class="mb-3">
							<b>기본 정보</b>
						</h2>
						<hr>
						<br>
						<form:form action="cafeupdate.do" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="cafe_no"
								value="${cafe_list[0].cafe_no }">
							<input type="hidden" name="thumb" value="${cafe_list[0].thumb }">
							<input type="hidden" name="background"
								value="${cafe_list[0].background }">

							<div class="form-group">
								<label>카페명</label><br> <input type="text" size="60"
									class="form-control" value="${cafe_list[0].title }" readonly>
							</div>
							<div class="form-group">
								<label>대표 썸네일</label><br> <input type="file" name="file1">
							</div>
							<div class="form-group">
								<label>배경 이미지</label><br> <input type="file" name="file2">
							</div>

							<div id="restriction" class="form-group">
								<label>가입 방식</label><br> <input type="radio" value="Y"
									name="restriction" checked="true"> 바로 가입 <br> <input
									type="radio" value="N" name="restriction"> 승인 후 가입

							</div>

							<div class="form-group">
								<label>가입 질문</label><br> <input type="text" name="question"
									size="60" minlength="4" maxlength="100" required
									value="${cafe_list[0].question }">


							</div>



							<div class="form-group">
								<label>한줄 소개</label><br>
								<textarea name="intro" id="" cols="30" rows="7"
									class="form-control" placeholder="간단한 소개글을 입력하세요."
									minlength="4" maxlength="200" required>${cafe_list[0].intro }</textarea>
							</div>


							<div class="form-group" style="position: relative; left: 40%">
								<input type="submit" value="수정"
									class="btn btn-primary py-3 px-5">
							</div>


						</form:form>
					</div>







					<!-- 게시판 관리 -->
					<div id="board" style="display: none;">
						<h2 class="mb-3">
							<b>게시판 관리</b>
						</h2>
						<hr>

						<div class="row" style="height: 100%">


							<br>
							<!-- 게시판 선택 -->
							<div class="col-lg-4 ftco-animate"
								style="padding: 20px; overflow-y: scroll;">
								<label style="position: relative; left: 35%">게시판 선택</label> <br>

								<ul style="padding-left: 10px">
									<c:choose>
										<c:when test="${empty menu }">
											<li>게시판이 존재하지 않습니다.</li>
											<br>
										</c:when>

										<c:otherwise>
											<c:forEach var="menu" items="${menu }">
												<li style="display: inline"
													onclick="menudetail(${menu.cafe_menu_no })">${menu.name }</li>
												<a style="cursor: pointer"
													onclick="menu_delete(${menu.cafe_no},${menu.cafe_menu_no })">&nbsp;&nbsp;X</a>
												<br>
											</c:forEach>
											<br>
										</c:otherwise>
									</c:choose>

									<c:if test="${fn:length(menu) < 5 }">
										<li><a style="position: relative; left: 27%"
											onclick="menuinsert()">+&nbsp;게시판 추가하기</a></li>
									</c:if>
									<c:if test="${fn:length(menu) >= 5 }">
										<li><a style="position: relative; left: 20%">&nbsp;더
												이상 만들수 없습니다.</a></li>
									</c:if>
								</ul>


							</div>

							<!-- 게시판 추가 -->
							<div id="menuinsert_form" class="col-lg-4 ftco-animate"
								style="border-left: 1px solid lightgray; padding: 20px;">
								<form id="menuinsert" action="menuinsert.do"
									onsubmit="return menuinsert_chk(${vo.cafe_no})">
									<input type="hidden" name="cafe_no" value="${vo.cafe_no }">

									<div class="form-group">
										<label>게시판명</label><br> <input type="text" size="60"
											name="name" minlength="4" maxlength="10" required> <br>
										<br> <label>글쓰기 권한</label><br> <input type="radio"
											value="Y" name="authority" checked="true">관리자
										&nbsp;&nbsp;&nbsp; <input type="radio" value="N"
											name="authority">모 두 <br> <br> <label>게시판
											형식</label><br> <input type="radio" value="table" name="concept"
											checked="true">게시판 &nbsp;&nbsp;&nbsp; <input
											type="radio" value="guest" name="concept">방명록<br>
										<br> <label>말머리</label><br> <input id="categorychk"
											type="checkbox">적용<br> <br>

										<div id="category_insert" style="display: none">
											<label style="margin: 0px;">말머리 정보</label>
											<ol style="padding: 10px; margin: 0px;">
												<li><input type="text" name="category1"
													placeholder="말머리를 입력하세요." minlength="2" maxlength="6"><br></li>
												<li><input type="text" name="category2"
													placeholder="말머리를 입력하세요." minlength="2" maxlength="6"><br></li>
												<li><input type="text" name="category3"
													placeholder="말머리를 입력하세요." minlength="2" maxlength="6"><br></li>
											</ol>
										</div>

									</div>


									<c:if test="${fn:length(menu) >= 5 }">
										<div class="form-group" style="position: relative; left: 65%">
											<a>&nbsp;더 이상 만들수 없습니다.</a>
										</div>
									</c:if>
									<c:if test="${fn:length(menu) < 5 }">
										<div class="form-group" style="position: relative; left: 85%">
											<input type="submit" value="추가"
												class="btn btn-primary py-3 px-5">
										</div>
									</c:if>
								</form>

							</div>


							<!-- 게시판 수정 -->
							<div id="menuupdate_form" class="col-lg-4 ftco-animate"
								style="border-left: 1px solid lightgray; padding: 20px; display: none">
								<form action="menuupdate.do"
									onsubmit="return menuinsert_chk2(${cafe_list[0].cafe_no})"
									method="get">
									<input type="hidden" name="cafe_no"
										value="${cafe_list[0].cafe_no }"> <input type="hidden"
										name="cafe_menu_no">
									<div class="form-group">
										<label>게시판명</label><br> <input type="text" size="60"
											name="name" minlength="4" maxlength="10" required> <br>
										<br> <label>글쓰기 권한</label><br> <input type="radio"
											value="Y" name="authority">관리자 &nbsp;&nbsp;&nbsp; <input
											type="radio" value="N" name="authority">모 두 <br>
										<br> <label>게시판 형식</label><br> <input type="radio"
											name="concept" value="table" disabled>게시판
										&nbsp;&nbsp;&nbsp; <input type="radio" name="concept"
											value="guest" disabled>방명록<br> <br>


										<div id="category_update">
											<label style="margin: 0px;">말머리 정보</label>
											<ol style="padding: 10px; margin: 0px;">
												<li><input type="text" name="category1"
													placeholder="말머리를 입력하세요." minlength="2" maxlength="6"><br>
													<input type="hidden" name="category_no1" value="0"></li>
												<li><input type="text" name="category2"
													placeholder="말머리를 입력하세요." minlength="2" maxlength="6"><br>
													<input type="hidden" name="category_no2" value="0"></li>
												<li><input type="text" name="category3"
													placeholder="말머리를 입력하세요." minlength="2" maxlength="6"><br>
													<input type="hidden" name="category_no3" value="0"></li>
											</ol>
										</div>
										<br>
									</div>

									<div class="form-group" style="position: relative; left: 85%">
										<input type="submit" value="수정"
											class="btn btn-secondary py-3 px-5">

									</div>
								</form>


							</div>
						</div>
					</div>






					<!-- 회원 관리 -->
					<div id="member" style="display: none">
						<h2 class="mb-3">
							<b>회원 관리</b>
						</h2>
						<hr>
						<br> <label>가입 목록</label>
						<table id="member_list" class="table table"
							style="text-align: center; table-layout: fixed">
							<col width="10%">
							<col width="50%">
							<col width="20%">

							<col width="20%">
							<tr>
								<th>아이디</th>
								<th>질답</th>
								<th>가입일</th>

								<th>활동제한</th>
							</tr>
							<c:choose>

								<c:when test="${empty cafe_list[2]}">
									<tr>
									<tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="member" items="${cafe_list[2]}">
										<c:if test="${member.signyn eq 'Y' || member.signyn eq 'A' }">
											<tr>
												<td>${member.name }</td>
												<td>${member.answer }</td>
												<td><fmf:formatDate value="${member.signdate }"
														pattern="yyyy-MM-dd" /></td>

												<td><c:if
														test="${member.signyn eq 'Y' && member.blockyn eq 'N' }">
														<input type="button" class="btn btn-primary"
															style="background-color: black" value="블락"
															onclick="block(${member.cafe_member_no})">
													</c:if> <c:if
														test="${member.signyn eq 'Y' && member.blockyn eq 'Y' }">
														<input type="button" class="btn btn-primary" value="해제"
															onclick="unblock(${member.cafe_member_no})">
													</c:if> <c:if test="${member.signyn eq 'A'}">

													</c:if></td>
											</tr>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
						
						
						
						<br> <label>신청 목록</label>
						<table id="sign_list" class="table table"
							style="text-align: center; table-layout: fixed">  
							<col width="10%">
							<col width="50%">
							<col width="20%">

							<col width="20%">
							<tr>
								<th>아이디</th>
								<th>질답</th>
								<th>신청일</th>
								<th colspan="2">처리</th>
							</tr>
							<c:choose>

								<c:when test="${empty cafe_list[2]}">
									<tr>
									<tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="member" items="${cafe_list[2]}">
										<c:if test="${member.signyn eq 'N' }">

											<tr>
												<td>${member.name }</td>
												<td>${member.answer }</td>
												<td><fmf:formatDate value="${member.signdate }"
														pattern="yyyy-MM-dd" /></td>

												<td><input type="button" class="btn btn-secondary"
													value="가입" onclick="sign(${member.cafe_member_no})">
													<input type="button" class="btn btn-primary" value="거절"
													onclick="cancle(${member.cafe_member_no})"></td>
											</tr>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>

						</table>
						
						
						
					</div>
				</div>




			</div>






		</div>
	</section>
	<script type="text/javascript">
	function PageMove1(page) {
	    var curpagenum = page;
	    
	    location.href = "cafeconfig.do?cafe_no=${cafe_list[0].cafe_no }&memeberno=${login.member_no}&curpagenum1="+page+"&curpagenum2=${page}";
	 }
	
	function PageMove2(page) {
	    var curpagenum = page;
	    
	    location.href = "cafeconfig.do?cafe_no=${cafe_list[0].cafe_no }&memeberno=${login.member_no}&curpagenum1=${page}&curpagenum2="+page;
	 }
	
	</script>


	<!-- @@ footer 영역 @@ -->
	<%@ include file="../footer.jsp"%>





</body>
</html>