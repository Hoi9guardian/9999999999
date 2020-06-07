<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>KIVIEW &mdash; Search</title>
    
    <jsp:include page="../head.jsp"/>
    
    <style type="text/css">
    a{
     color:black;
    }
    table{
    	color:black;
    	text-align:center;
    }
    #box {
    	background-color: white;
    	border: solid 1px lightgray;
    	padding: 5%;
    }
    input[type=text] {
   border-top:0px;
   border-left:0px;
   border-right:0px;
       outline: none;  
	}
::-webkit-scrollbar {display: block};
::-webkit-scrollbar {background-color:#fff;width:16px}
::-webkit-scrollbar-track {background-color:#fff}
::-webkit-scrollbar-thumb {background-color:#babac0;border-radius:16px;border:4px solid #fff}

	
    </style>
    <script type="text/javascript">
    $(function(){
    	
    	$('#searchres').hide();
    	$('#searchresmap').hide();

    	   $("#sido").change(function() {
                var province = $('#sido option:selected').val();
                //alert(province);
                if(province=="세종특별자치시"){
                	$.ajax({
                        type: "POST",
                        url: "ajaxdong.do",
                        data: province,
                        contentType:"application/json;charset=UTF-8",
                        dataType: "json",
                        success: function(res) {
                     	  //alert(res);
                     	  $('#sigungu').hide();
                     	  $('#dong').show();
                     	  $('#dong').empty();
                     	  $("#dong").html("<option value=''>읍/면/동</option>");
                   	  	  $.each(res,function(idx, code){
                   	      if($('#sido option:selected').val() == province && code!=null){
                   		  		var newOpt=$('<option>').html(code.town);
                   		  		$('#dong').append(newOpt);
                   		  }
                   	  	});
                       },
                       error: function(e) {
                          alert("통신실패");
                       }
                    });
                }else{
                   $.ajax({
                       type: "POST",
                       url: "ajaxsigungu.do",
                       data: province,
                       contentType:"application/json;charset=UTF-8",
                       dataType: "json",
                       success: function(res) {
                    	  $('#sigungu').show();
                    	  $('#sigungu').empty();
                    	  $('#dong').show();
                    	  $('#dong').empty();
                    	  $("#sigungu").html("<option value=''>시/군/구</option>");
                    	  $("#dong").html("<option value=''>읍/면/동</option>");
                    	  $.each(res,function(idx, code){
                    	      if($('#sido > option:selected').val() == province && code.city!=null){
                    	    	  var newOpt=$('<option>').html(code.city);
                    	    	  $('#sigungu').append(newOpt);
                    		  }
                    	  });

                    	        
                      },
                      error: function(e) {
                         alert("통신실패");
                      }
                   });
                	
                }
               });
    	   
    	   $("#sigungu").change(function(){
    		   var city = $('#sigungu option:selected').val();
    		   //alert(city);
    		   $.ajax({
                   type: "POST",
                   url: "ajaxdong.do",
                   data: city,
                   contentType:"application/json;charset=UTF-8",
                   dataType: "json",
                   success: function(res) {
                	  if(res.length != 1){
                	  $('#dong').show();
                	  $('#dong').empty();
                	  $("#dong").html("<option value=''>읍/면/동</option>");
                	  $.each(res,function(idx, code){
                	      if($('#sigungu > option:selected').val() == city && code!=null){
                		  		var newOpt=$('<option>').html(code.town);
                		  		$('#dong').append(newOpt);
                		  }
                	  });
                		  
                	  }else{
                		  $('#dong').hide();
                	  }
                	        
                  },
                  error: function(e) {
                     alert("통신실패");
                  }
               });
    	   });
    	   
    	   $('.type').on('click',function(){
    		   //alert($(this).attr('id'));
    		   //alert("${vo.province}");
    		   //alert("${vo.city}");
    		   //alert("${vo.town}");
    		   <c:if test="${empty vo}">
    		   	alert("지역검색 후 선택해주세요.");
    		   </c:if>
    		   <c:if test="${not empty vo}">
    		   var type = $(this).attr('id');
    		   var province = "${vo.province}";
    		   var city = "${vo.city}";
    		   var town = "${vo.town}";
    		   console.log(type+"/"+province+"/"+city+"/"+town);
    		   var typeSearchVal ={
    				   "type":type,
    				   "province":province,
    				   "city":city,
    				   "town":town
    		   };
    		   $.ajax({
   	            type: "POST",
   	            url: "ajaxtypesearch.do",
   	            data: JSON.stringify(typeSearchVal),
   	            contentType:"application/json;charset=UTF-8",
   	            dataType: "json",
   	            success: function(res) {
   	            	//console.log(res);
   	            	
   	            	$("#tbody").empty();
   	            	$("#n_paging").empty();
   	            	
   	            	var down = $('#searchres').offset();
   		     	  	$('html').animate( { scrollTop : down.top }, 50 );
   	            	
   		     	  	if(res.length!=0){
   	            	
   	            	 $.each(res,function(idx, code){
              	      
              	     $("#tbody").append(
              	  		$("<tr>").append(
              	  			$("<td>").append(code.addr2),
              	  			$("<td>").append($("<a href='searchdetail.do?kinder_no="+code.kinder_no+"&page=1'>").append(code.name)),
              	  			$("<td>").append(code.type),
              	  			$("<td>").append($("<button class='btn btn-primary px-3' onclick='location.href=\"searchdetail.do?kinder_no="+code.kinder_no+"&page=1\"'>평점보기</button>"))	
              	  		)
              	  	);	
              	  });    	            		
   	            	}else{
   	            		$("#tbody").append(
   	               	  		$("<tr>").append(
   	               	  			$("<td colspan='4' align='center'>").append("검색결과가 없습니다.")
   	               	  		)
   	               	  	);	
   	            	}
   	         	        
   	           },
   	           error: function(e) {
   	              alert("통신실패");
   	           }
   	        });
    		   </c:if>

    	   });
    	   
    })
    
    function localChk(){
    	//alert($('#sido option:selected').val());
    	if($('#sido option:selected').val() == null || $('#sido option:selected').val() == ""){
    		alert("시/도를  선택해주세요.");
    		return false;
    	}else if($('#sigungu option:selected').val() == null || $('#sigungu option:selected').val() == ""){
    		if($('#sido option:selected').val() == "세종특별자치시"){
    			$('#localForm').submit();
    		}else{
   			alert("시/군/구를  선택해주세요.");
   			return false;    			
    		}
   		}else{
   			$('#localForm').submit();
   			
   		}
    }
    
    function nameChk(){
    	//alert($('#kindername').val().trim());
    	if($('#kindername').val()==null || $('#kindername').val().trim()==""){
    		alert("유치원 명을 입력해주세요.");
    		return false;
    	}else{
    		$('#nameForm').submit();
    		
    	}
    }
    </script>
  </head>
<body id = "body">

	<!-- @@ header 부분 @@ -->
	  <%@ include file = "../header.jsp" %>
    
     <!-- @@ <h1 class = "mb-2 bread"> sub title 이 부분 우선 header에서 따로 빼놨어요!!! </h1> @@ -->
    <section class="hero-wrap hero-wrap-2" style="background-image: url('resources/images/main/board_img02.png');">
      <!-- <div class="overlay" style = "background:#fff"></div> -->
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">유치원 검색</h1>
            <p class="breadcrumbs">
            <span class="mr-2">
            <a href="index.do">홈 <i class="ion-ios-arrow-forward"></i></a></span> 
            <span>검색 <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>
     <!-- @@ header 끝 @@ -->
     
     <section class="ftco-section bg-light">
			<div class="container">
				<div class="row" id="box">
         			<div style="width:100%;margin:0 auto;" class="col-md-15 text-center heading-section ftco-animate fadeInUp ftco-animated">
           			 <h2 class="mb-4"><span>지역별</span> 유치원 검색</h2>
						<hr>
          			</div>
          			<div style="width:100%;height:100%;margin:0 auto;" class="col-md-5 heading-section ftco-animate fadeInUp ftco-animated">
          				<div class="dg-map-area">
  							<%@ include file = "map.jsp" %>
						</div>
          			</div>
          			<div id="selectedmap" style="width:100%;margin:0 auto;margin-top:80px;line-height:5;text-align:center;display:none;" class="col-md-5 heading-section ftco-animate fadeInUp ftco-animated">
          				
          				<h4><b>시/군/구</b>를 선택해주세요</h4>
          				<div id="sigungudiv" style="height:500px;overflow:auto;margin-top:20px;">

          				</div>
						
          			</div>
          			<div id="rightdiv" style="width:100%;margin:0 auto;margin-top:80px;line-height:5;" class="col-md-5 heading-section ftco-animate fadeInUp ftco-animated">
          				<div style="padding: 20px;width: max-content;">
          				<h4><b>지역</b></h4>
          				<form id="localForm" action="localsearch.do" method="post" class="appointment-form ftco-animate fadeInUp ftco-animated">
	    				<input type = "hidden" name = "page" value = "1"/>
	    				<select id="sido" name="province" class="form-control-sm" style="overflow:scroll">
          					<option value="">시/도</option>
          					<c:forEach items="${sido}" var="sido">
          					<option value="${sido.province }">${sido.province }</option>
          					</c:forEach>
					  	</select>
					  <select id="sigungu" name="city" class="form-control-sm" style="overflow:scroll">
          				<option value="">시/군/구</option>
					  </select>
					  <select id="dong" name="town" class="form-control-sm" style="overflow:scroll">
          				<option value="">읍/면/동</option>
					  </select>
					  <button type="button" id="localBtn" class="btn btn-secondary" onclick="localChk();"><i class="icon ion-ios-search"></i></button>
	    				</form>
	    				
          				</div>
          				<div style="padding: 20px">
    					<h4><b>설립유형</b></h4>
         				<button id="all" class="type btn btn-secondary px-4 py-3">전체 </button>
         				<button id="public" class="type btn btn-secondary px-4 py-3">국공립 </button>
         				<button id="corporate" class="type btn btn-secondary px-4 py-3">법인 </button>
         				<button id="private" class="type btn btn-secondary px-4 py-3">사립</button>
          				</div>
          				<div style="padding: 20px">
         				<h4><b>유치원</b></h4>
                  		<form id="nameForm" action="namesearch.do" method="post">
                  		<input type="text" id="kindername" name="name" class="form-control-lg" placeholder="유치원 이름을 입력해주세요">
                		<button type="button" id="nameBtn" class="btn-lg btn btn-secondary" onclick="nameChk();"><i class="icon ion-ios-search"></i></button>
                  		</form>
          				</div>
          			</div>
        		</div>
			</div>
			
		</section>
		 <section id="searchres" class="ftco-section bg-light"><!-- style="padding: 0.0em 0;" -->
			<div class="container">
				<div class="row" id="box">
          			<div style="width:100%;margin:0 auto;" class="col-md-8 text-center heading-section ftco-animate fadeInUp ftco-animated">
           			 <h2 class="mb-4"><span>검색 결과</span></h2>
          			</div>
          			<div style="width:100%;margin:0 auto;" class="ftco-animate fadeInUp ftco-animated">
          			<table class="table table-hover">
						  <thead>
						   <tr style="width:100%">
						     <th style="width:20%">지 역 </th>
						     <th style="width:50%">유치원명</th>
						     <th style="width:10%">구분</th>
						     <th style="width:20%">평점보기</th>
						   </tr>
						   </thead>
						   <tbody id="tbody">
						   <c:if test="${localvo != null && localvo !='' }">
						   <c:choose>
						   	 <c:when test="${empty localvo }">
						   	 <script>
						   	 $(function(){
						   		$('#searchres').show();						   		 
						   	 })
						   	 </script>
						   	 	<tr>
						   	 		<td colspan="4" align="center">검색결과가 없습니다.</td>
						   	 	</tr>
						   	 </c:when>
						   	 <c:otherwise>
						   	 <script>
						   	 $(function(){
						   		$('#searchres').show();						   		 
						   	 })
						   	 </script>
						   	 	<c:forEach items="${localvo }" var="vo">
						   	 		<tr>
						   	 			<td>${vo.addr2 }</td>
						   	 			<td><a href="searchdetail.do?kinder_no=${vo.kinder_no }&page=1">${vo.name }</a></td>
						   	 			<td>${vo.type }</td>
						   	 			<td><button class="btn btn-primary px-3" onclick="location.href='searchdetail.do?kinder_no=${vo.kinder_no}&page=1'">평점보기</button></td>
						   	 		</tr>
						   	 	</c:forEach>
						   	 </c:otherwise>						   
						   </c:choose>  
						   </c:if>  
						   <c:if test="${namevo != null && namevo !='' }">
						   <c:choose>
						   	 <c:when test="${empty namevo }">
						   	 <script>
						   	 $(function(){
						   		$('#searchres').show();						   		 
						   	 })
						   	 </script>
						   	 	<tr>
						   	 		<td colspan="4" align="center">검색결과가 없습니다.</td>
						   	 	</tr>
						   	 </c:when>
						   	 <c:otherwise>
						   	 <script>
						   	 $(function(){
						   		$('#searchres').show();						   		 
						   	 })
						   	 </script>
						   	 	<c:forEach items="${namevo }" var="vo">
						   	 		<tr>
						   	 			<td>${vo.addr2 }</td>
						   	 			<td><a href="searchdetail.do?kinder_no=${vo.kinder_no}&page=1">${vo.name }</a></td>
						   	 			<td>${vo.type }</td>
						   	 			<td><button class="btn btn-primary px-3" onclick="location.href='searchdetail.do?kinder_no=${vo.kinder_no}&page=1'">평점보기</button></td>
						   	 		</tr>
						   	 	</c:forEach>
						   	 </c:otherwise>						   
						   </c:choose>  
						   </c:if>  
						 </tbody>
					</table>
					</div>
					<c:if test="${namevo != null && namevo !='' }">
					
					<div class="jsx-1407906967 board-list-footer" style="width:100%">
					<ul class="jsx-3635512122 pagination pagination--kindergarten" id = "n_paging">
						
						<c:if test = "${pageMaker.prev}">
						<li class="jsx-3635512122 prev disabled" >
						<a href = "${pageMaker.makeQuery(pageMaker.startPage - 1)}&name=${name}">
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
						
						<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
						<li class="jsx-3635512122 " id = "page${idx}">
						<c:choose>
						<c:when test="${idx eq param.page}">
						<a href = "${pageMaker.makeQuery(idx)}&name=${name}" class = "on" id = "pageclick${idx}">${idx}</a>
						</c:when>
						<c:otherwise>
						<a href = "${pageMaker.makeQuery(idx)}&name=${name}" class = "off" id = "pageclick${idx}">${idx}</a>
						</c:otherwise>
						</c:choose>
						</li>
						</c:forEach>
						
						<c:if test = "${pageMaker.next && pageMaker.endPage > 0}">
						<li class="jsx-3635512122 next">
						<a href = "${pageMaker.makeQuery(pageMaker.endPage + 1)}&name=${name}">
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

				</div>
				
				</c:if>
				
				<c:if test="${localvo != null && localvo !='' }">
				
				<div class="jsx-1407906967 board-list-footer" style="width:100%">
					<ul class="jsx-3635512122 pagination pagination--kindergarten" id = "n_paging">
						
						<c:if test = "${pageMaker.prev}">
						<li class="jsx-3635512122 prev disabled" >
						<a href = "${pageMaker.makeQuery(pageMaker.startPage - 1)}&province=${vo.province}&city=${vo.city}&town=${vo.town}">
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
						
						<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "idx">
						<li class="jsx-3635512122 " id = "page${idx}">
						<c:choose>
						<c:when test="${idx eq param.page}">
						<a href = "${pageMaker.makeQuery(idx)}&province=${vo.province}&city=${vo.city}&town=${vo.town}" class = "on" id = "pageclick${idx}">${idx}</a>
						</c:when>
						<c:otherwise>
						<a href = "${pageMaker.makeQuery(idx)}&province=${vo.province}&city=${vo.city}&town=${vo.town}" class = "off" id = "pageclick${idx}">${idx}</a>
						</c:otherwise>
						</c:choose>
						</li>
						</c:forEach>
						
						<c:if test = "${pageMaker.next && pageMaker.endPage > 0}">
						<li class="jsx-3635512122 next">
						<a href = "${pageMaker.makeQuery(pageMaker.endPage + 1)}&province=${vo.province}&city=${vo.city}&town=${vo.town}">
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

				</div>
				
				</c:if>
				
				</div>
			</div>
		</section>
		
		<section id="searchresmap" class="ftco-section bg-light"> <!-- style="padding: 0.0em 0;" -->
			<div class="container">
				<div class="row" id="box">
          			<div style="width:100%;margin:0 auto;" class="col-md-8 text-center heading-section ftco-animate fadeInUp ftco-animated">
           			 <h2 class="mb-4"><span>지도 검색 결과</span></h2>
          			</div>
          			<div style="width:100%;margin:0 auto;" class="ftco-animate fadeInUp ftco-animated">
          			<div id="map" style="width:100%;margin:0 auto;height:20%;height:500px;" class="col-md-15 text-center heading-section ftco-animate fadeInUp ftco-animated">
           			 </div>
          			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=194487849edd2decd3a36dbefacead0d"></script>
					</div>
				</div>
			</div>
		</section>
		
		<!-- **20/02/07 검색결과 section footer랑 띄우기** -->
 		<section style = "background:#fafafa;">
			<div class="container">
				<br><br><br><br>
			</div>
		</section>
     
     
     <!-- @@ footer 영역 @@ -->
	<jsp:include page="../footer.jsp"/>
	
	


</body>
</html>
