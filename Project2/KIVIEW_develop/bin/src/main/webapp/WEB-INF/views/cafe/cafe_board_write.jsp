<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%--  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   --%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <title>KIVIEW &mdash; Blog</title>
    
    <%@ include file = "../head.jsp" %>
    
<script type="text/javascript" src="se2/js/HuskyEZCreator.js" charset="utf-8"></script>

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
            <h1 class="mb-2 bread">키뷰 카페</h1>
               <p class="breadcrumbs">
                  <span class="mr-2"><a href="index.jsp">홈 <i
                        class="ion-ios-arrow-forward"></i></a></span> <span>키뷰카페 <i
                     class="ion-ios-arrow-forward"></i></span>
               </p>
          </div>
        </div>
      </div>
    </section>
     <!-- @@ header 끝 @@ -->
     
      
      <section class="ftco-section bg-light">
         <div class="container" style="margin-left:30px; ">   
         <div class="row" style="width:1400px; overflow:auto;"> 
            <!-- 카페 메뉴 -->
            <div class="col-lg-3 sidebar ftco-animate" style="padding:25px; margin-right:30px;  background-color:white; border:1px solid lightgray;" >
                               
               <%@include file="cafe_sidebar.jsp" %>

            </div>

            <!-- 카페 홈  -->
            
            <div id="home" class="col-lg-8 ftco-animate" style="padding:25px; margin-left:0px; background-color:white; border:1px solid lightgray; "> 
               <h2 class="mb-3"><b># 글작성</b></h2>
               <hr>
               <form action="cafeboardinsert.do" method="get" id="submitgo">
               <input type="hidden" name="cafe_menu_no" value="${cafe_menu_no }">
               <input type="hidden" name="cafe_no" value="${cafe_list[0].cafe_no }">
               <input type="hidden" name="writer" value="${login.member_id}">
               
                
                <label>말머리</label>
               <select name="menu_name" id="boardcategory1">
               <c:forEach var="menu" items="${cafe_list[1] }">
                        
                  <c:if test="${menu.cafe_menu_no eq cafe_menu_no}">                  
                     <option value="${menu.cafe_menu_no }">${menu.name }</option>
                  </c:if>   
               </c:forEach>   
               </select> 

               <select name="category" id="boardcategory2">
                  <option selected="selected">말머리 선택</option>                  
               </select>
               
               
               <br>               
               <label>제 목</label><br>
                  <input type="text" id="title" placeholder="제목을 입력하세요." name="title" size="70" minlength="4" maxlength="30" required>
                  <br><br>
               <label>내 용</label><br>              
                  
                  <textarea name="content" id="smartEditor" rows="10" cols="100" ></textarea>                  
                  
                
                  
               <br>
               <br>
               <div align="center">
               <input type="button" value="작 성" class="btn btn-secondary" style="width:20%" id="submitbefore" >
               <input type="button" value="취 소" class="btn btn-primary" style="width:20%" onclick="location.href='cafeboardlist.do?cafe_menu_no=${cafe_menu_no}&cafe_no=${cafe_list[0].cafe_no }&curpagenum=1'"> 
               </div>
               </form>
               
               <br>
               <br>
            </div>
            

            

         </div>


         
         


      </div>
      </section>

      
   <!-- @@ footer 영역 @@ -->
   <%@ include file="../footer.jsp"%>
   
   


    
  </body>

<script type="text/javascript">

var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
   oAppRef : oEditors,
   elPlaceHolder : "smartEditor",
   sSkinURI : "se2/SmartEditor2Skin.html",
   fCreator : "createSEditor2",
   htParams : {
      // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
      bUseToolbar : true,

      // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
      bUseVerticalResizer : false,

      // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
      bUseModeChanger : false
   }
});




$(function(){
   
  var no = $("#boardcategory1 option:selected").val();
   
   console.log("게시메뉴 번호     :    "+no);
   
   
   $("#boardcategory2").empty();
  
      $.ajax({
         type:"post",
         url:"ajaxcategory.do", 
         data:{"no":no},
          
         dataType:"json",
         success:function(key){
                    
            console.log(key.category2);
            
            if(key.category2==0){
                                
            $("#boardcategory2").hide();
          
            }else{
               
                $.each(key.category2,function(index,item){               
                    
                                
                                                
                   var rlist = "";                        
                        rlist += "<option value='"+item.category+"'>"+item.category+"</option>";                         
                        console.log(rlist);        
                        
                        $("#boardcategory2").append(rlist); 
                }); 
                 
            }
   
         },
         error : function(request,status,error){
           
            
            
         }
         
      });


})   

$(function() {
      $("#submitbefore").click(function() {
         oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);

         var selcatd = $("#boardcategory2 > option:selected").val();
         var title = $("#title").val();
         var content = document.getElementById("smartEditor").value;;

         
         if (title == null || title == "") {
            alert("제목을 입력해주세요.");
            $("#title").focus();
            return;
         }
         if(content == "" || content == null || content == '&nbsp;' || 
               content == '<br>' || content == '<br/>' || content == '<p>&nbsp;</p>'){
            alert("본문을 작성해주세요.");
            oEditors.getById["smartEditor"].exec("FOCUS"); //포커싱
            return;
         }
         
         
         $("#submitgo").submit();
        
      });
   })



</script>   
</html>