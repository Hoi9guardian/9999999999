<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
   
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   <%@ taglib prefix="fmf" uri="http://java.sun.com/jsp/jstl/fmt"%> 


<!DOCTYPE html>
<html lang="en">
  <head>
    <title>KIVIEW &mdash; 카페</title>
    
    <%@ include file = "../head.jsp" %>

<style type="text/css">
.paging{
   float : left;
   list-style: none;

}

.active{
 background-color: #9bdaf2;
 border-radius: 40%; 
}   




#replypaging{ 
	
  	text-align:center!important;
  	width:100%;
	margin-top:15px;  
	margin:0 auto; 
	
}

#replypaging ul{
	
	display:inline-block!important;

}

#replypaging li {
	display:inline-block!important;
} 

</style>
  </head>
  <body id = "body">
  
 <%@include file="cafe_modal.jsp" %> 
     <!-- @@ header 부분 @@ -->
     <%@ include file = "../header.jsp" %>
    
     <!-- @@ <h1 class = "mb-2 bread"> sub title 이 부분 우선 header에서 따로 빼놨어요!!! </h1> @@ -->
    <section class="hero-wrap hero-wrap-2" style="background-image: url('resources/images/main/board_img03.png');">
     <!--  <div class="overlay"></div> -->
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
               <h2 class="mb-3"><b>#글 상세보기 </b></h2>
              <br>
                              
               
                     <c:choose>
                     <c:when  test="${fn:length(cafe_board_detail.category) != 0 && cafe_board_detail.category ne 'null' }">
                                 [ ${cafe_board_detail.category } ] 
                     </c:when>
                     <c:otherwise>
                            
                     </c:otherwise>
                   </c:choose>
                 <br>     
                  <input type="text" value="${cafe_board_detail.title }" name="title" size="65" readonly>
                  
                   
               
               <span style="float:right">${cafe_board_detail.writer}  &nbsp;|&nbsp;  <fmf:formatDate value='${cafe_board_detail.regdate}' pattern='yyyy-MM-dd'/> &nbsp;|&nbsp; 조회수  ${cafe_board_detail.hit }</span> 
               <br><br> 
               
 <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ20.03.02 수정ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡhr 추가 위아래 추가ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
                                 
                  <div style=" overflow-y:auto; width:93%; ">
                      <div id="contentbefore2"></div>  
                  </div>
                   
 <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->                  
               <br>
              
               <div style="float:right; margin-right:0px; margin-top:10px"> 
               <c:if test="${cafe_board_detail.writer eq login.member_id || cafe_list[0].admin eq login.member_id  }">
                  <input type="button" onclick="location.href='cafeboardupdateform.do?cafe_board_no=${cafe_board_detail.cafe_board_no}&cafe_menu_no=${cafe_menu_no}&cafe_no=${cafe_list[0].cafe_no }&curpagenum=${curpagenum }'" value="수 정" class="btn btn-primary">
                  <input type="button" value="삭 제" class="btn btn-secondary"  onclick="location.href='cafeboarddelete.do?cafe_board_no=${cafe_board_detail.cafe_board_no}&cafe_menu_no=${cafe_menu_no}&cafe_no=${cafe_list[0].cafe_no }&curpagenum=${curpagenum }'">
               </c:if>
               <input type="button" value="목 록" class="btn btn-primary"  onclick="location.href='cafeboardlist.do?&cafe_menu_no=${cafe_menu_no}&cafe_no=${cafe_list[0].cafe_no }&curpagenum=${curpagenum }'"> 
               </div>
               
               
               <br>
               <br>
         <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->                 
               <div id="replylist" style="width:100%;"> 
                  
               <hr>
               </div>
               <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->             
               
               <div style="font-weight:bold; color:black" id="noreply">
               </div>                
               
                            
               <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->     
              <div id="replylistthis">
              </div>                
              <div id="replypaging">               
              </div>  
              
               
               
               
               <div id="reply" style="width:80%; border:0px solid lightgray"> 
               <div> 
               
               <form action="#" >
               <br>
               <label style="font-weight:bold; color:black" >${login.member_id }</label> 
               <input type="hidden" name="" value="${cafe_board_detail.cafe_board_no}" id="replyboard_no">
               <input type="hidden" name="" value="${cafe_board_detail.writer}" id="writer">
               <input type="hidden" name="" value="${login.member_id }" id="loginid">
               <input type="hidden" name="" value="${cafe_list[0].admin}" id="adminid">
                        
              
                  <br>
                  <div id="replyform">            
                  
                  </div>                
                  
               </form>          
              
             
               </div>
               
            </div>
 
         </div>

      </div>
      </section>

      
<!-- @@ footer 영역 @@ -->
<%@ include file="../footer.jsp"%>

  
<script type="text/javascript">
var curpagenum= 1;

function onTestChange() {
    var key = window.event.keyCode

    
    if (key === 13) {
        document.getElementById("replycontent").value = document.getElementById("replycontent").value + "\n";
        return false;
    }
    else {
        return true;
    }
}




var contentbefore = '${cafe_board_detail.content }';
$("#contentbefore2").append(contentbefore);
  

$(document).on("keyup","#replycontent",function(){
   var content = $("#replycontent").val();   
   var length1 = content.length ;   
   $("#replycount").val(length1);   
   });

function contentcount(num){
   $(document).on("keyup","#replycontent2",function(){
      
      var content = $("#replycontent2").val();   
      var length1 = content.length ;
      
      $("#replycount2").val(length1);
      
      
   });   
}
contentcount();

function PageMove(curpagenum){
   
   ajaxreplylist(curpagenum);
}

function ajaxreplylist(curpagenum){
   if(curpagenum.length==0){
      curpagenum = 1;
   }
   var cafe_board_no = $("#replyboard_no").val();
   
   console.log(cafe_board_no);
   
   jQuery.ajax({
          url : "ajaxreplylist.do",
          type : "post",
          dataType:"json",
          contentType:"application/json",
          data : JSON.stringify({
             "cafe_board_no" : cafe_board_no,
             "curpagenum"   :   curpagenum
          }),
                
          success : function(data){
                
                 $("#replylist").empty();
                 $("#replylistthis").empty();
                 $("#replyform").empty();
             var rlistcount = "<h5>댓글<a style='color:fda638'>"+data.pagevo.totallistcount+"</a>개</h5><hr>";       
                 $("#replylist").append(rlistcount);
                
             if(data.rlist.length==0){                
                var replyform = '';
                 replyform +=
                  "<textarea style='resize:none'cols='90' rows='4' placeholder='상대방을 향한 욕설, 음담패설은 자제해주세요. 댓글 최대 100자'  id='replycontent' maxlength='100' onkeypress='onTestChange();' required></textarea>"+                 
                  "<br>"+
                  "<input type='text' size='1' placeholder='0' id='replycount' readonly='readonly' >자"+              
                  "<input style='position:relative; left:86%;' type='button' class='btn btn-primary' value='등록' onclick='replyinsert();'>";  
                $("#replyform").append(replyform);  
                
             }else{             
                $.each(data.rlist, function(key,value){
                   
                   var content = value.content;
                   content = content.replace(/(?:\r\n|\r|\n)/g, '<br />');
                   
                   var rlist1 = '';
                   rlist1 +=
                    
                    "<div id='comment"+value.cafe_reply+"' >"+
                    
                       "<div style='font-weight:bold; color:black' id='replywriter"+value.cafe_reply+"' >"+value.writer+"</div>"+
                       "<p style='color:black' >"+content+"</p>"+
                       "<div style='font-size:smell'>"+changeDate(value.regdate)+"</div>"+ 
                       "<input type='button' value='수 정' class='btn btn-primary btnhide"+value.cafe_reply+"' onclick='replyupdate1("+value.cafe_reply+");'/>"+
                       "<input type='button' value='삭 제' class='btn btn-secondary btnhide"+value.cafe_reply+"' onclick='replydelete("+value.cafe_reply+","+data.pagevo.curpagenum+","+data.pagevo.cafe_board_no+");' />"+
                        
                         
                         
                      "</div><hr>"+
                      
                      "<div id='commentupdate"+value.cafe_reply+"' style='display:none'>"+                      
                         "<div style='font-weight:bold; color:black'>"+value.writer+"</div>"+                        
                         "<textarea style='resize:none'cols='90' rows='4' placeholder='상대방을 향한 욕설, 음담패설은 자제해주세요. 댓글 최대 100자'  id='updatecontent"+value.cafe_reply+"' maxlength='100' required>"+value.content+"</textarea>"+
                         "<div style='font-size:smell'>"+changeDate(value.regdate)+"</div>"+   
                         "<input type='button' value='수정완료' class='btn btn-primary' onclick='replyupdate2("+value.cafe_reply+","+data.pagevo.curpagenum+","+data.pagevo.cafe_board_no+");'/>"+
                         "<input type='button' value='수정취소' class='btn btn-secondary' onclick='replyupdatex("+value.cafe_reply+");'/>"+       
                                              
                      "</div>";                 
                       
                   
                   
                   
                   $("#replylistthis").append(rlist1);
                   
                   
                   
                   var loginid = $("#loginid").val();
                   var adminid = $("#adminid").val();
                   var replywriter = value.writer;                     
                    
                  if(loginid != replywriter && loginid != adminid ){
                     $(".btnhide"+value.cafe_reply).hide(); 
                  }else{
                     $(".btnhide"+value.cafe_reply).show();
                  }
                })
                
                
                
                
                
                
                
                
            /* 페이징  */
                if(data.rlist.length > 0){
                   
               $("#replypaging").empty();
               
               var prepage = data.pagevo.curpagenum;
               var prepage1 = prepage-1;
               var nextpage1 = prepage+1;
               var searchresultpaging1 = '';
                  searchresultpaging1 +=                              
                  
                  "<ul class='pagination' >"+
                  "<li class='paging'><a href='javascript:PageMove(1)'>&nbsp;&nbsp; << &nbsp;&nbsp; </a> </li>";
                  $("#replypaging").append(searchresultpaging1);
               if(data.pagevo.pagepre == true){
                  var searchresultpaging1 = '';
                  searchresultpaging1 +=                           
                  "<li class='paging'><a href='javascript:PageMove("+prepage1+")'>&nbsp;&nbsp; < &nbsp;&nbsp;</a></li>";
                  $("#replypaging").find("ul").append(searchresultpaging1);
               }
               
               for(var i=data.pagevo.startpage ; i<data.pagevo.endpage+1; i++ ){
                  
                  console.log(data.pagevo.startpage);
                  
                  var searchresultpaging1 = '';
                  if(i == data.pagevo.curpagenum){
                     
                     searchresultpaging1 +=
                     "<li class='active paging' ><a href='javascript:PageMove("+i+")'>&nbsp;&nbsp;"+i+"&nbsp;&nbsp;</a></li>";
                     $("#replypaging").find("ul").append(searchresultpaging1);
                     
                  }else{
                     
                     searchresultpaging1 +=
                     "<li class='paging'><a href='javascript:PageMove("+i+")'>&nbsp;&nbsp;"+i+"&nbsp;&nbsp;</a></li>";
                     $("#replypaging").find("ul").append(searchresultpaging1);
                     
                  }
                  
               }
               
               if(data.pagevo.pagenext == true){
                  var searchresultpaging1 = '';
                  searchresultpaging1 +=
                     "<li class='paging'><a href='javascript:PageMove("+nextpage1+")'>&nbsp;&nbsp; > &nbsp;&nbsp;</a></li>";
                  $("#replypaging").find("ul").append(searchresultpaging1);   
               }
               
               var searchresultpaging1 = '';
               searchresultpaging1 +=                              
               "<li class='paging'><a href='javascript:PageMove("+data.pagevo.totalpagecount+")'>&nbsp;&nbsp; >> &nbsp;&nbsp; </a> </li></ul>";
               $("#replypaging").find("ul").append(searchresultpaging1); 
            
            }
                
                
               var replyform = '';
               replyform +=
                "<textarea style='resize:none'cols='90' rows='4' placeholder='상대방을 향한 욕설, 음담패설은 자제해주세요. 댓글 최대 100자'  id='replycontent' maxlength='100' onkeypress='onTestChange();' required></textarea>"+                 
                "<br>"+
                "<input type='text' size='1' placeholder='0' id='replycount' readonly='readonly' >자"+              
                "<input style='position:relative; left:86%;' type='button' class='btn btn-primary' value='등록' onclick='replyinsert();'>";  
              $("#replyform").append(replyform);  
                
                
                
                
                
                
                
             }    
                   
                             
             },
          
          error : function(request,status,error){
               alert("실패");               
           }       
    });
   
   
   

   
   
}   
ajaxreplylist(curpagenum);   


   

function replyinsert(){
   
   var  content = $("#replycontent").val();
   if(content.length < 4){
      alert("4글자 이상 입력해주세요.");
      $("#replycontent").focus();
      return;
   }
   var cafe_board_no= $("#replyboard_no").val();    
   var writer = $("#loginid").val();
   jQuery.ajax({
       url : "ajaxreplyinsert.do",
       type : "post",
       dataType:"json",
       contentType:"application/json",
       data : JSON.stringify({
             "cafe_board_no" : cafe_board_no,
             "writer"       : writer,
             "content"       : content
          
          }),
       success : function(data){
         var textareacount = 0;          
         if(data.res==1){
            alert("댓글이 등록 되었습니다.");
           
            $("#replylistthis").empty();
            var page = data.insertpage;
            //alert(page);
            ajaxreplylist(page);
                     
           
            
         }else{
            alert("다시 시도 해 주세요.");
         }                    
       },
      
       error : function(request,status,error){
        //    alert("실패");               
        }       
});

}
function replydelete(cafe_reply,curpagenum,cafe_board_no){       
   console.log(cafe_reply);
   
   
   jQuery.ajax({   
      url : "ajaxreplydelete.do",
       type : "post",
       dataType:"json",
       contentType:"application/json",
       data : JSON.stringify({ 
          "cafe_reply" : cafe_reply,
          "curpagenum" : curpagenum,
          "cafe_board_no" : cafe_board_no
          }),
       success : function(data){
          
          if(data.res==1){
             alert("댓글이 삭제 되었습니다.");
             $("#replylistthis").empty();
               ajaxreplylist(data.deletepage);
          }else{
             alert("다시 시도 해주세요.");
          }
          
       },
       error : function(request,status,error){
          // alert("실패");
          
       }
   
   });
   
}


function replyupdate1(cafe_reply){
   console.log(cafe_reply);
   
   console.log("#comment"+cafe_reply);
   
   $("#comment"+cafe_reply).hide();
   $("#commentupdate"+cafe_reply).show();
}

 

function replyupdate2(cafe_reply,curpagenum,cafe_board_no){
   console.log(cafe_reply);
   
   console.log("#updatecontent"+cafe_reply);
   var content = $("#updatecontent"+cafe_reply).val();
   console.log(content);
   
   jQuery.ajax({
       url : "ajaxreplyupdate.do",
       type : "post",
       dataType:"json",
       contentType:"application/json",
       data : JSON.stringify({
              "cafe_reply" : cafe_reply, 
             "content"       : content,
             "curpagenum"   : curpagenum,
             "cafe_board_no" : cafe_board_no
          }),
       success : function(data){
                   
         if(data.res==1){
            alert("댓글이 수정되었습니다.");
            $("#replylistthis").empty();
            ajaxreplylist(data.curpagenum);            
            
         }else{
            alert("다시 시도해 주세요.");
         }                    
       },
      
       error : function(request,status,error){
            alert("실패");               
        }

       
   
   
});
}   

function replyupdatex(cafe_reply){
   $("#comment"+cafe_reply).show();
   $("#commentupdate"+cafe_reply).hide();
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
        
       month = "0"+month
    }
     
    if(day<10){
       day = "0"+day
    }
    
    if(hour<10){
       hour = "0"+hour
    }
    
    if(minute<10){
       minute = "0"+minute
    }
    
           
    strDate = year+"-"+month+"-"+day+" ";
    
    
    return strDate;
}




</script>   
  </body>
</html>