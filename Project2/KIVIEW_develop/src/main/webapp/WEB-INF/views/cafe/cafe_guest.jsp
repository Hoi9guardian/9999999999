<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmf" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html lang="en">
  <head>
    <title>KIVIEW &mdash; 카페</title>
    
    <%@ include file = "../head.jsp" %>
<style type="text/css">
textarea {
	resize:none; 
	padding:15px;
	
}	

.underline:hover{
	text-decoration: underline;
	cursor : pointer;
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
<script type="text/javascript">
function reply_chk(no){
	if($("#reply_text"+no).val().length<4){
		alert("최소 4글자 이상 입력해주세요.")
		return false;
	}
	
	return true;
}
function PageMove(page) {
    var curpagenum = page;
    var cafe_no = '${cafe_list[0].cafe_no }';
    var cafe_menu_no = '${pagevo.cafe_menu_no }'; 
    
    location.href = "cafeguestlist.do?curpagenum=" + page + "&cafe_no="
          + cafe_no + "&cafe_menu_no=" + cafe_menu_no;
 }

function show(cafe_board_no){
	$("#replylist"+cafe_board_no).toggle(); 
	
}


 function update(cafe_board_no){
	 $("#board"+cafe_board_no).hide();
	 $("#update"+cafe_board_no).show();
 }
 
 function cancle(cafe_board_no){
	 $("#board"+cafe_board_no).show();
	 $("#update"+cafe_board_no).hide();
 } 

 function guest_update(cafe_board_no){

	 var form = $("#update_data"+cafe_board_no);
	 var formdata = form.serialize();
	
	 
	 $.ajax({
		type:"post",
		url:"cafeguestupdate.do",
		data:formdata,
		dataType:"json",
		success:function(data){
			
			$("#update"+cafe_board_no).hide();
			$("#board"+cafe_board_no).show();
			$("#board"+cafe_board_no).empty();
		
			var button = ''
				
				if(data.guest.writer=='${login.member_id}' || '${cafe_list[0].admin}' == '${login.member_id}'){
					button = "<input type='button' value='수정' class='btn btn-secondary' onclick='update("+data.guest.cafe_board_no+")'>"+
		               "<input type='button' value='삭제' class='btn btn-primary' onclick='guest_delete("+data.guest.cafe_board_no+")'>"
				}
			
				$("#board"+cafe_board_no).append(
						
						"<label style='margin-left:10px;'>"+data.guest.writer+
						"&nbsp;&nbsp;|&nbsp;&nbsp;"+changeDate(data.guest.regdate)+"</label><br>"+  
	                   
			            "<p class='content' style='margin-left:10px;'>"+data.guest.content+"</p>"+
	   					"<div style='margin-right:60px; margin-top:10px; position:relative; left:80%'>"+
				               button+
				               "<br><br>"+   
				              
			               	"</div>"+	               
	               
			               "<br>"
			
				)
			
			}, 
		
		error:function(request){
			alert(request);
		}		 
	 })
	 
 }
 
 function guest_delete(cafe_board_no){
	 
	 if(confirm("해당 글을 삭제하시겠습니까?")){
		 $.ajax({
				type:"post",
				url:"cafeguestdelete.do",
				data:{"cafe_board_no":cafe_board_no},
				dataType:"json",
				success:function(data){
					
					
					$("#guest"+cafe_board_no).remove(); 
					
					
					
					
				
				}, 
				
				error:function(request){
					alert(request);
				}		 
			 })
	 }
	 
	 
 }
 
 
 
 
 
 function reply_write(cafe_board_no){
	 var form = $("#reply_data"+cafe_board_no);
	 var formdata = form.serialize();
	 
	 if($("#reply_text"+cafe_board_no).val().length<4){
			alert("최소 4글자 이상 입력해주세요.")
			
	} else {
		
		
 
	 $.ajax({
		 type:"post",
		 url:"cafereplywrite.do",
		 data:formdata,
		 dataType:"json",
		 success:function(data){
			 
			 $("#replylist"+cafe_board_no).show();  
			 $("#replylist"+cafe_board_no).empty();  
			 $("#reply_text"+cafe_board_no).val("");
			 
			 
			 
			 $.each(data, function(idx, value){ 
					$("#reply"+cafe_board_no).empty();
					
					
					var count = parseInt(idx)+1;
					if(value.cafe_board_no==null){
						count=0;  
					}
					
					 $("#reply"+cafe_board_no).append(
							 "댓글 <a style='color:#fda638;'>"+count+"</a>개"	   
							 
					 );
					 
					 
					 var button = ''
					 
					if(value.writer=='${login.member_id}' || '${cafe_list[0].admin}' == '${login.member_id}'){
							

						var button=	"<span style='position:absolute; color:#fda638; left:95%; cursor:pointer'onclick='reply_delete("+value.cafe_board_no+","+value.cafe_reply+")'>x</span>"

					 
					 }
					 
					 			 
					 $("#replylist"+cafe_board_no).append(
							 "<div style=' background-color:#F2F2F2'>"+
							 "<div style='font-weight:bold; color:black'>"+value.writer+
							button
							
							 
		                  
			                
							 
			                  +"</div>" +
							 
			                  "<div style='color:black'>"+value.content+"</div>"+
			                  "<div style='font-size:small'>"+changeDate(value.regdate)+"</div>"+
			               "<hr>"
							 +"</div>"
							 						 
					 );
				 })	  
		
			 
		 },
		 error:function(error){
			 alert(error);
		 }
		 
	 })
	 
	}
 }
 
 function reply_delete(cafe_board_no, cafe_reply){
	 if(confirm("해당 댓글을 삭제하시겠습니까?")){
		 $.ajax({
			 type:"post",
			 url:"cafereplydelete.do",
			 data:{"cafe_board_no":cafe_board_no, "cafe_reply":cafe_reply},
			 dataType:"json",
			 success:function(data){
				 $("#replylist"+cafe_board_no).show();  
				 $("#replylist"+cafe_board_no).empty();  
				 $("#reply_text"+cafe_board_no).val("");
				 
				 
				 $.each(data, function(idx, value){ 
						$("#reply"+cafe_board_no).empty();
						
						
						if(data[0]===0){   
							
							count=0; 
							
							 $("#reply"+cafe_board_no).append(
									 "댓글 <a style='color:#fda638;'>"+count+"</a>개"	   
									 
							 );
						} else {
							var count = parseInt(idx)+1;  
							 $("#reply"+cafe_board_no).append(
									 "댓글 <a style='color:#fda638;'>"+count+"</a>개"	   
									 
							 );
						 
						 
							 var button = ''
							 
							if(value.writer=='${login.member_id}' || '${cafe_list[0].admin}' == '${login.member_id}'){
	
								var button=	"<span style='position:absolute; color:#fda638; left:95%; cursor:pointer'onclick='reply_delete("+value.cafe_board_no+","+value.cafe_reply+")'>x</span>"
						 
							 }
						 			 
							 $("#replylist"+cafe_board_no).append(
									 "<div style=' background-color:#F2F2F2'>"+
									 "<div style='font-weight:bold; color:black'>"+value.writer+
									button
						 
					                  +"</div>" +
									 
					                  "<div style='color:black'>"+value.content+"</div>"+
					                  "<div style='font-size:small'>"+changeDate(value.regdate)+"</div>"+
					               "<hr>"
									 +"</div>"
									 						 
							 );
						}
						
				})	
					 
				 
			 },
			 error:function(error){
				 alert("명령 실행중 오류")
			 }
		 
		 })
		 
		 
		 
		 
	 }
	
	 
	 
 }
 
 function changeDate(date){
	    date = new Date(parseInt(date));
	    year = date.getFullYear();
	    month = date.getMonth()+1;
	    day = date.getDate();
	    hour = date.getHours();
	    minute = date.getMinutes();
	    second = date.getSeconds();
	    
	    if(month<10){
	    	 
	    	month = "0"+month;
	    }
	     
	    if(day<10){
	    	day = "0"+day; 
	    }
	    
	    if(hour<10){
	    	hour = "0"+hour;
	    }
	    
	    if(minute<10){
	    	minute = "0"+minute;
	    }
	    
	    	    
	    strDate = year+"-"+month+"-"+day+" "+hour+":"+minute
	    
	    
	    return strDate;
	}

 
 
</script>
  </head>
  
  <body id = "body">
 <%@include file="cafe_modal.jsp" %> 
     <!-- @@ header 부분 @@ -->
     <%@ include file = "../header.jsp" %>
    
     <!-- @@ <h1 class = "mb-2 bread"> sub title 이 부분 우선 header에서 따로 빼놨어요!!! </h1> @@ -->
    <section class="hero-wrap hero-wrap-2" style="background-image: url('resources/images/main/board_img03.png');">
      <!-- <div class="overlay"></div> -->
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">서울유치원 학부모 모임</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.do">홈 <i class="ion-ios-arrow-forward"></i></a></span> <span>키뷰 카페 <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>
     <!-- @@ header 끝 @@ -->
     
      
      <section class="ftco-section bg-light">
         <div class="container" style="margin-left:30px; ">   
         <div class="row" style="width:1650px; overflow:auto;"> 
            <!-- 카페 메뉴 -->
            <div class="col-lg-3 sidebar ftco-animate" style="padding:25px; margin-right:30px;  background-color:white; border:1px solid lightgray;" >
                
               
               <%@include file="cafe_sidebar.jsp" %>

            </div>

            <!-- 카페 홈  --> 
            
            <div id="home" class="col-lg-8 ftco-animate" style="padding:0px;  ">   
               
               <!-- 글쓰기 영역 -->
               <div class="col-lg-8 ftco-animate" style="padding:20px; width:100%;  background-color:white; border:1px solid lightgray;"> 
               		<h2 class="mb-3">
                 	 <b>${menu.name }</b>
              		 </h2>

  					
               		<label>${login.member_id } 님</label><br>
               		
	               	<form action="cafeguestwrite.do">
	               		<input type="hidden" name="cafe_no" value="${cafe_list[0].cafe_no }">
	               		<input type="hidden" name="title" value="방명록">               		
	               		<input type="hidden" name="cafe_menu_no" value=${menu.cafe_menu_no }>
	               		<input type="hidden" name="writer" value="${login.member_id }">
	                  	<textarea style="resize:none" cols="80" rows="7" name="content" placeholder="글을 입력해주세요." minlength="4" maxlength="1000" required></textarea>  
	                  	 
		               <br>
		               <br>
		               <div align="center">
		               		<c:choose>
		               			<c:when test="${menu.authority eq 'N' }">
			               			<input type="submit" value="작 성" class="btn btn-secondary" style="width:20%">
			               
			              		</c:when>
			              		<c:when test="${menu.authority eq 'Y' && login.member_id==cafe_list[0].admin}">
			              			<input type="submit" value="작 성" class="btn btn-secondary" style="width:20%">
			              		</c:when>
			              		<c:otherwise>
			              		
			              		</c:otherwise>
			              	</c:choose>
			               
			              		  
		                
		               </div>
	               	</form>
               </div>
               
               <!-- 방명록영역 -->
               <c:choose>
               	<c:when test="${empty guest }">
               	
               	</c:when>
               	<c:otherwise>
               		<c:forEach var="guest" items="${guest }" >
               	
                <div id="guest${guest.cafe_board_no }" class="col-lg-8 ftco-animate" style="padding:20px; margin-top:20px; width:100%;  background-color:white; border:1px solid lightgray;"> 
                  	
                  	<!-- 본문영역 --> 
                  	<div id="board${guest.cafe_board_no }">   
		               <label style="margin-left:10px;">${guest.writer }&nbsp;&nbsp;|&nbsp;&nbsp;<fmf:formatDate value='${guest.regdate}' pattern='yyyy-MM-dd HH:mm'/></label><br>  
		                    
		               <p class="content" style="margin-left:10px;">${guest.content }</p>
      					<div style="margin-right:60px; margin-top:10px; position:relative; left:80%">
	      					<c:if test='${cafe_list[0].admin eq login.member_id || guest.writer eq login.member_id}'>
				               <input type="button" value="수정" class="btn btn-secondary" onclick="update(${guest.cafe_board_no});">
				               <input type="button" value="삭제" class="btn btn-primary" onclick='guest_delete(${guest.cafe_board_no})'>  
				               
				            </c:if> 
			             <br><br>  
		               	</div> 		               
		              
		                   
		               <br> 
	            
		               
               		</div>
               		
               		<!-- 본문수정 -->
               		<div id="update${guest.cafe_board_no }" style="display:none"> 
               			<form id="update_data${guest.cafe_board_no }" action="cafeguestupdate.do">
               				<input type="hidden" name="cafe_board_no" value="${guest.cafe_board_no }"> 
               				<input type="hidden" name="title" value="방명록">  
			               <label style="margin-left:10px;">${guest.writer }&nbsp;&nbsp;|&nbsp;&nbsp;<fmf:formatDate value='${guest.regdate}' pattern='yyyy-MM-dd HH:mm'/></label><br>  
			                    
			       			<textarea style="resize:none" cols="80" rows="7" name="content" minlength="4" maxlength="500">${guest.content }</textarea> 
	      					<div style="margin-right:60px; margin-top:10px; position:relative; left:80%">
				               <input type="button" value="수정" class="btn btn-secondary" onclick="guest_update(${guest.cafe_board_no });">
				               <input type="button" value="취소" class="btn btn-primary" onclick="cancle(${guest.cafe_board_no })"> 
				               <br><br>   
				              
			               	</div> 		               
		              
		               </form>     
		               <br> 
	            
		               
               		</div>
               		
               		 
               		
               		<c:set var="count" value="0"/>
               		<c:forEach var="reply" items="${reply }">
	               		<c:if test="${guest.cafe_board_no==reply.cafe_board_no }">
		               				<c:set var="count" value="${count+1 }"/>
		               	</c:if> 
               		</c:forEach>
               		
               		
               		<!-- 댓글영역 -->
               		
               		<h5 id="reply${guest.cafe_board_no}" onclick="show(${guest.cafe_board_no})" class="underline">댓글 <a style="color:#fda638;" >${count }</a>개</h5>   
               		<div style="display:none" id="replylist${guest.cafe_board_no}">
	               		<c:forEach var="reply" items="${reply }">
	               			
	               		
	               			
	               			<c:if test="${guest.cafe_board_no==reply.cafe_board_no }">
			               		<div style=" background-color:#F2F2F2"> 
			               			
					                 
					               
					                  <div style=" font-weight:bold; color:black">${reply.writer  }
					                  
					                  <c:if test='${cafe_list[0].admin eq login.member_id || guest.writer eq login.member_id}'>
					                  <span style="position:absolute; color:#fda638; left:95%; cursor:pointer" onclick="reply_delete(${reply.cafe_board_no},${reply.cafe_reply})">x</span>
					                  </c:if>
					                  
					                  </div>
					                  <div style="color:black">${reply.content }</div> 
					                  <div style="font-size:small"><fmf:formatDate value='${reply.regdate}' pattern='yyyy-MM-dd HH:mm'/></label></div>
					               <hr>          
				               
			               		</div>
		               		</c:if>
	               		</c:forEach>
               		</div>
               		
               		<!-- 댓글 작성 -->
	               <div style="width:80%; border:0px solid lightgray"> 
	               	<br>
		               <form id="reply_data${guest.cafe_board_no }">
		               		<input type="hidden" name="cafe_board_no" value="${guest.cafe_board_no }">
		               		<input type="hidden" name="writer" value="${login.member_id}">
			               <label style="font-weight:bold; color:black">${login.member_id }</label> 
			               <br>
			                  <textarea id="reply_text${guest.cafe_board_no }" style="resize:none; padding:10px;" name="content" cols="80" rows="3" minlength="4" maxlength="100" required></textarea>
			                    
			                  <input style="display:inline; position:relative; left:112%"  type="button" class="btn btn-primary"  
			                  value="등록" onclick="reply_write(${guest.cafe_board_no})">        
			                   
		               </form>
	               </div>
               
                
               </div> 
               
              	</c:forEach>
               </c:otherwise>
              </c:choose>
               
                
               
               
            </div>
            
			
			 <div id="paging">
			  
        		 <c:if test="${pagevo.totallistcount ne '0' }">
                    
                        <ul  class="pagination pull">  
                           <li><a href="javascript:PageMove(1)"> &nbsp;&nbsp;<< &nbsp;&nbsp; </a> </li>
                           <c:if test="${pagevo.pagepre eq true }">
                              <li><a
                                 href="javascript:PageMove(${pagevo.curpagenum-1 })">&nbsp;&nbsp; < &nbsp;&nbsp;</a></li>
                           </c:if>
                           
                           <c:forEach var="i" begin="${pagevo.startpage }" end="${pagevo.endpage }">
                              <c:choose>
                                 <c:when test="${i eq pagevo.curpagenum }">
                                    <li class="active"><a href="javascript:PageMove(${i})">&nbsp;&nbsp;${i}&nbsp;&nbsp;</a></li>
                                 </c:when>
                                 <c:otherwise>
                                    <li><a href="javascript:PageMove(${i})">&nbsp;&nbsp;${i}&nbsp;&nbsp;</a></li>
                                 </c:otherwise>
                              </c:choose>
                           </c:forEach>
                           <c:if test="${pagevo.pagenext eq true }">
                              <li><a
                                 href="javascript:PageMove(${pagevo.curpagenum+1 })">&nbsp;&nbsp; >&nbsp;&nbsp;</a></li>
                           </c:if>
                           <li><a
                              href="javascript:PageMove(${pagevo.totalpagecount})"> &nbsp;&nbsp;>>&nbsp;&nbsp; </a></li>
                        </ul>


 
                      
                  </c:if>
         
         	</div>
            

         </div>


         
        


      </div>
      </section>

      
   <!-- @@ footer 영역 @@ -->
   <%@ include file="../footer.jsp"%>
   
   


    
  </body>
</html>