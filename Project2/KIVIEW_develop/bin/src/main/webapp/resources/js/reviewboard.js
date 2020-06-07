   $(function() {
      $("#myBtn").on("click", function() {
         //modal.style.display = "block";
         $("#myModal").show();

      })

      /* $("#myBtn2").on("click", function() {
         //modal.style.display = "block";
         $("#myModal2").show();

      }) */

      $("#modal-close").on("click", function() {
         $("#myModal").hide();
      })
      $(".close").on("click", function() {
         $("#myModal").hide();
      })
      $("#modal2-close").on("click", function() {
         $("#myModal2").hide();
      })
      $(".close").on("click", function() {
         $("#myModal2").hide();
      })
      
      
      $("#kinder_search").on("keyup", function(){
         $("#myModal").find($("input[name=kinder_addr]")).val("");
         if($(this).val().length>1){
            var search = []
            $.ajax({
               type:"post",
               url:"searchkinder.do",
               data:{"keyword":$("#kinder_search").val()},
               dataType:"json",
               success:function(data){
                  $.each(data.kinder, function(key, value){
                     search.push(value.name);
                  })
                  
               },
               error:function(){
                  
               }
               
            })
            
            
            $("#kinder_search").autocomplete({
               source: search
            })
         }
      })

   })
   
function kinder_search2(){
      $.ajax({
         type:"post",
         url:"searchkinder2.do",
         data:{"kinder_name":$("#kinder_search").val()},
         dataType:"json",
         success:function(map){
            console.log(map);
            //Map으로 받은 정보 중 kinder(KinderVo) 안에 있는 addr1을 가지고 온다
            var addr = map.kinder.addr1
            if(!map || addr==null || map==null) {
               alert("해당 유치원이 없습니다.");
               
            } else {
               
               console.log(map.kinder);
               $("#myModal").find($("input[name=kinder_no]")).val(map.kinder.kinder_no);
               $("#myModal").find($("input[name=kinder_addr]")).val(map.kinder.addr1);
            }
         },
         error:function(){
            alert("명령 실행 중 오류가 발생했습니다.");
         }
         
      })
      
   }   


function update_form(review_no){
   $.ajax({
      type:"post",
      url:"reviewselect.do",
      data:{"review_no":review_no},
      dataType:"json",
      success:function(data){
         $("#myModal2").find($("input[name=review_no]")).val(data.review.review_no);
         $("#myModal2").find($("input[name=kinder_no]")).val(data.review.kinder_no);
         $("#myModal2").find($("input[name=kinder_name]")).val(data.review.kinder_name);
         $("#myModal2").find($("input[name=kinder_addr]")).val(data.review.kinder_addr);
         $("#myModal2").find($("input[name=avg_score1]:input[value="+data.review.avg_score1+"]")).prop("checked", true);
         $("#myModal2").find($("input[name=avg_score2]:input[value="+data.review.avg_score2+"]")).prop("checked", true);
         $("#myModal2").find($("input[name=avg_score3]:input[value="+data.review.avg_score3+"]")).prop("checked", true);
         $("#myModal2").find($("input[name=review_title]")).val(data.review.review_title);
         $("#myModal2").find($("textarea[name=review_content]")).val(data.review.review_content);
         
         $("#review_year_update option").each(function(i){
            if($(this).val()==data.review.review_year){
               $(this).attr("selected", "selected")
            }
            
         })
         
         $("#myModal2").find($("input[name=review_date]")).val(data.review.review_date);
         
      },
      error:function(){
         alert("실패")
      }
   
   })
   
   $("#myModal2").show(); 
   
}

function insertchk(){
      
   if($("#review_year option:selected").val()=="선택"){
         
      alert("등원시기를 선택해 주세요.")
      return false;
   }
      
   
   if($("#myModal").find("input[name=kinder_addr]").val()==''){
      alert("유치원을 검색해 주세요.")
      
      return false;
      
   }
   return true;
}

/////////////////////////// 지민like //////////////////////////////

var likeSubmit = function(review_no){
   var member_no = '${login.member_no}';
   console.log(member_no);
   
   
      $.ajax({
         url: "likeSubmit.do",
         dataType:"json",
         type: "post",
         contentType:"application/json",  
         data: JSON.stringify({
            "review_no":review_no,
            "member_no":member_no       
         }),
         success:function(data){
            
            var resultFlag = data.resultFlag;
            var resultMsg = data.resultMsg;
            if(resultFlag > 0){
                if(resultMsg == "insert"){
                  alert("좋아요 목록에 추가되었습니다.");
               }else if(resultMsg == "delete"){
                  alert("좋아요 목록에서 삭제되었습니다.");
               }
            }
            
         },
         error : function(request,status,error){
            alert('오류가 발생했습니다. 다시 시도해 주세요.');
            console.log("code = "+request.status + "message = " + request.responseText + "error  =   "+ error);
         }
      });
   }
   
function NullBtn(){
   alert('로그인이 필요합니다.');
}
/////////////////////////// 지민like 끝 //////////////////////////////

//**승혜 js**
function review_join(){
	location.href = 'kiviewsignupoption.do';
}
function review_login(){
	location.href = 'login.do';
}
function reviewDel(review_no, page){
	var result = confirm("정말 삭제하시겠습니까?");
	
	if(result){
		location.href='reviewDelete.do?review_no='+review_no + '&page='+page;
	}else{
		alert("취소 되었습니다.");
		return;
	}
}
function confirmLogin(){
	
	alert("로그인이 필요합니다.");
	location.href='login.do';
	
}
