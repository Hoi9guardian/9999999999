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

.paging{ 
	
  	text-align:center!important;
  	width:100%;
	margin-top:15px;  
	margin:0 auto; 
	
}

.paging ul{
	
	display:inline-block!important;

}

.paging li {
	display:inline-block!important;
}

#searchlistpaging{ 
	
  	text-align:center!important;
  	width:100%;
	margin-top:15px;  
	margin:0 auto; 
	
}

#searchlistpaging ul{
	
	display:inline-block!important;

}

#searchlistpaging li { 
	display:inline-block!important;
}

.active{
 background-color: #9bdaf2;
 border-radius: 40%; 
}  


</style>
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
               <h2 class="mb-3">
                  <b>${menu.name }</b>
               </h2>
               <div id="seachbeforetable">
                  <table class="table table" style="text-align: center">
                     <col width="10%">
                     <col width="10%">
                     <col width="50%">
                     <col width="20%">
                     <col width="10%">
                     <tr>
                        <th>번 호</th>
                        <th>작성자</th>
                        <th>제 목</th>
                        <th>작성일</th>
                        <th>조회수</th>
                     </tr>
                     <c:choose>
                        <c:when test="${fn:length(BPlist) == 0 }">
                           <tr>
                              <td colspan="5">
                                 <p>작성 된 게시글이 없습니다.</p>
                              </td>
                           </tr>
                        </c:when>

                        <c:otherwise>

                           <c:forEach var="boardlist" items="${BPlist }">
                              <tr>
                                 <td>${boardlist.cafe_board_no }</td>
                                 <td>${boardlist.writer }</td>
                                 
                                 <td>
                                 
                                    <a href="cafeboarddetail.do?cafe_no=${cafe_list[0].cafe_no }&cafe_board_no=${boardlist.cafe_board_no }&cafe_menu_no=${cafe_menu_no}&curpagenum=${pagevo.curpagenum}"
                                       style="font-size: small; text-align: left">                                        
                                    
                                 
                                 <c:if test="${fn:length(boardlist.category) != 0 && boardlist.category ne 'null' }">
                                             [ ${boardlist.category } ] 
                                          </c:if>
                                           
                                             ${boardlist.title } [${boardlist.replycount }]                                  
                                          
                                    </a>
                                 </td>
                                 <td><fmf:formatDate value='${boardlist.regdate}' pattern='yyyy-MM-dd HH:mm' /></td>
                                 <td>${boardlist.hit }</td>
                              </tr>
                           </c:forEach>
                        </c:otherwise>
                     </c:choose>

                  </table>
                  <!-- 글목록 페이징.  -->

                  <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ게시글 목록 페이징.....ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

                  
                  <div class="paging">
                  <c:if test="${pagevo.totallistcount ne '0' }">
                    
                        <ul class="pagination pull-right">
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
               <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ게시글 목록 페이징 끝ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->



               <div id="searchaftertable">
                  <table id="searchlisttable" class="table table" style="text-align: center" style="display:none;">
                  </table>
               </div>
            
            <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ검색 결과 페이징 [ajax 페이징] ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
                     
                  <div id="searchlistpaging">
                  </div>            
               
               <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ검색 결과 페이징 끝ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
            
            
            
            

               
                  <div align=right>
                     <c:choose>
                              <c:when test="${menu.authority eq 'N' }">
                                 <input type="button" value="글작성" class="btn btn-secondary"
                        onclick="location.href='boardwrite.do?cafe_no=${cafe_list[0].cafe_no}&cafe_menu_no=${cafe_menu_no }'">
                        
                             </c:when>
                             <c:when test="${menu.authority eq 'Y' && login.member_id==cafe_list[0].admin}">
                                <input type="button" value="글작성" class="btn btn-secondary"
                        onclick="location.href='boardwrite.do?cafe_no=${cafe_list[0].cafe_no}&cafe_menu_no=${cafe_menu_no }'">
                             </c:when>
                             <c:otherwise>
                             
                             </c:otherwise>
                          </c:choose>                     
                     
                  </div>
              


               <div align=center>

                  <form id="ajaxform" action="" onsubmit="return false">
                     <input id="cafe_menu_no" type="hidden" name="cafe_menu_no"
                        value="${cafe_menu_no}" /> <select id="searchopt"
                        name="searchoption" style="height: 30px">
                        <option value="title">제목</option>
                        <option value="writer">작성자</option>

                        <option value="content">내용</option>
                        <option value="title+content">제목+내용</option>
                     </select> <input id="keyword" style="height: 30px" type="text"
                        name="keyword" /> <input
                        style="height: 30px; border-top-width: 0px;" type="button"
                        onclick="ajaxboardsearch();" value="검색" id="searchingbutton">

                  </form>
               </div>
               <br> <br>
               



            </div>
            <!-- 카페 홈 div 태그 끝 -->
         </div>
         <!-- 카페 row div 태그 끝 -->
      </div>
      <!-- 컨테이너 div 태그 끝 -->
   </section>



   <!-- @@ footer 영역 @@ -->
   <%@ include file="../footer.jsp"%>

</body>
<script type="text/javascript">
   

   function PageMove(page) {
      var curpagenum = page;
      var cafe_no = '<c:out value="${cafe_list[0].cafe_no }"/>';
      var cafe_menu_no = '<c:out value="${cafe_menu_no }"/>';
      
      location.href = "cafeboardlist.do?curpagenum=" + page + "&cafe_no="
            + cafe_no + "&cafe_menu_no=" + cafe_menu_no;
   }
   
   function PageMove2(page){
      
      ajaxboardsearch(page);
   }
   

   function ajaxboardsearch(page) {
      var cafe_menu_no = $("#cafe_menu_no").val();
      var searchoption = $("#searchopt").val();
      var keyword = $("#keyword").val();
      var curpagenum = page;
      
      console.log("cafe_menu_no   :   " + cafe_menu_no);
      console.log("searchoption   :   " + searchoption);
      console.log("keyword   :   " + keyword);
      console.log("curpagenum      :"+curpagenum);

      $.ajax({
               url : "ajaxboardsearchlist.do",
               type : "post",
               dataType : "json",
               data : JSON.stringify({
                  "cafe_menu_no" : cafe_menu_no,
                  "searchoption" : searchoption,
                  "keyword" : keyword,
                  "curpagenum" : curpagenum
               }),
               contentType : "application/json",
               success : function(data) {
                 

                  $("#searchlisttable").empty();

                  if (data.slist.length == 0) {
                     $("#seachbeforetable").hide();

                     var slistnodata = '';

                     slistnodata += "<col width='10%'><col width='10%'><col width='50%'><col width='20%'><col width='10%'>"
                           + "<tr><th>번 호</th><th>작성자</th><th>제 목</th><th>작성일</th><th>조회수</th></tr>"
                           + "<tr>"
                           + "<td colspan='5' ><p>검색된 결과가 없습니다.</p></td>"
                           + "</tr>";

                     console.log(slistnodata);
                     $("#searchlisttable").append(slistnodata);

                  } else {
                    //출력문 없앰. 
                     //alert('${cafe_list[0].cafe_no}')
                     $("#seachbeforetable").hide();
                     var tablecolsetting = "<col width='10%'><col width='10%'><col width='50%'><col width='20%'><col width='10%'>"
                           + "<tr><th>번 호</th><th>작성자</th><th>제 목</th><th>작성일</th><th>조회수</th></tr>";
                     $("#searchlisttable").append(tablecolsetting);
 
                     $.each(data.slist,function(key, value) {
                                    var category = value.category;
                                    var title = value.title;
                                     

                                    console.log("category   :   "+ category);
                                    
                                    function titleinto(category,title) {
                                       if (category == null) {
                                          return title;
                                       } else {
                                          return "[" + category+ "]" + title;
                                       }
                                    }
                                    
                                    var slistdata = '';
                                    slistdata +=

                                    "<tr><td>"+ value.cafe_board_no+ "</td>"+"<td>"+ value.writer+"</td>"+
                                    "<td><a href='cafeboarddetail.do?cafe_no=${cafe_list[0].cafe_no }&cafe_board_no="+ value.cafe_board_no+"&cafe_menu_no="+ value.cafe_menu_no+"&curpagenum=1' style='font-size:small; text-align:left;'>"+ 
                                    titleinto(category,title)+ "["+ value.replycount+ "]</a></td><td>"+ changeDate(value.regdate)+ "</td>" + "<td>"+ value.hit+ "</td></tr>";
                                    console.log(tablecolsetting   + slistdata);
                                    $("#searchlisttable").append(slistdata);                     
                     
                                 })
                     // 검색 결과 페이징 .            
                     if(data.slist.length > 0){   
                        $("#searchlistpaging").empty();
                        var prepage = data.spagevo.curpagenum;
                        var prepage1 = prepage-1;
                        var nextpage1 = prepage+1;
                        var searchresultpaging1 = '';
                           searchresultpaging1 +=                              
                          
                           "<ul class='pagination pull-right' >"+
                           "<li ><a href='javascript:PageMove2(1)'>&nbsp;&nbsp; << &nbsp;&nbsp; </a> </li>";
                           $("#searchlistpaging").append(searchresultpaging1);
                           
                        if(data.spagevo.pagepre == true){
                           var searchresultpaging1 = ''; 
                           searchresultpaging1 +=                           
                           "<li ><a href='javascript:PageMove2("+prepage1+")'>&nbsp;&nbsp; < &nbsp;&nbsp;</a></li>";
                           $("#searchlistpaging").find("ul").append(searchresultpaging1);
                        }
                        
                        for(var i=data.spagevo.startpage ; i<data.spagevo.endpage+1; i++ ){
                           
                           console.log(data.spagevo.startpage);
                           
                           var searchresultpaging1 = '';
                           if(i == data.spagevo.curpagenum){
                              
                              searchresultpaging1 +=
                              "<li class='active'><a href='javascript:PageMove2("+i+")'>&nbsp;&nbsp;"+i+"&nbsp;&nbsp;</a></li>";
                              $("#searchlistpaging").find("ul").append(searchresultpaging1);
                              
                           }else{
                              
                              searchresultpaging1 +=
                              "<li ><a href='javascript:PageMove2("+i+")'>&nbsp;&nbsp;"+i+"&nbsp;&nbsp;</a></li>";
                              $("#searchlistpaging").find("ul").append(searchresultpaging1);
                              
                           }
                           
                        }
                        
                        if(data.spagevo.pagenext == true){
                           var searchresultpaging1 = '';
                           searchresultpaging1 +=
                              "<li ><a href='javascript:PageMove2("+nextpage1+")'>&nbsp;&nbsp; > &nbsp;&nbsp;</a></li>";
                           $("#searchlistpaging").find("ul").append(searchresultpaging1);   
                        }
                        
                        var searchresultpaging1 = '';
                        searchresultpaging1 +=                              
                        "<li ><a href='javascript:PageMove2("+data.spagevo.totalpagecount+")'>&nbsp;&nbsp; >> &nbsp;&nbsp; </a> </li></ul>";
                        $("#searchlistpaging").find("ul").append(searchresultpaging1);
                           
                        
                        console.log(searchresultpaging1);
                           
                           
                        
                        
                     } 
                     
                     
                     
                     
                     
                  }
                  
                  
               },
               error : function(request, status, error) {
                  alert("실패");
                  alert("code:" + request.status + "\n" + "message:"
                        + request.responseText + "\n" + "error:"
                        + error);

               }

            });

   }

   function changeDate(date) {
      date = new Date(parseInt(date));
      year = date.getFullYear();
      month = date.getMonth()+1;
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

      if (hour < 10) {
         hour = "0" + hour;
      }

      if (minute < 10) {
         minute = "0" + minute;
      }

      strDate = year + "-" + month + "-" + day + " " + hour + ":" + minute

      return strDate;
   }

   $("#searchingbutton").keydown(function() {
      if (event.keyCode === 13) {
         ajaxboardsearch();
      }
      ;
   });
</script>
</html>