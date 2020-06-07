$(function(){

	$("#faqul li").find("#comment").hide(); 
	//#faqul id의 자식 li에서 #comment id를 가진 요소를 찾아서 hide
	
	
$("button[name='faq_no']").click(function(){
		
		var faq_no = $(this).val();
		
		if($(this).next().is(':visible')){ //button의 다음 요소인 div가 펼쳐져있으면
			$(this).next().hide(); //버튼을 누르면 div를 hide
		}else{
			$(this).next().show(); //div가 펼쳐져 있지 않으면 show(버튼을 눌렀을 때)
			
			$.ajax({ //show할 때 ajax 시작
				url:"kiviewone.do",
				data: {"faq_no":faq_no},
				type:"get",
				dataType: "json",
				success:function(result){
					
					$("#"+result.faq_no).html(result.faq_content);
					$("#"+"faqli"+result.faq_no).addClass("open");
					
					$("#"+"subbtn"+result.faq_no).click(function(){
						$("#"+"faqli"+result.faq_no).removeClass("open");
					})
					
				},error:function(){
					alert("통신 실패");
				}
			});
		}
	});
})

function faqDel(){
	
	var result = confirm("정말 삭제 하시겠습니까?");
	var faq_no = $("#input01").val();
	var faqcatd = $("#input02").val();
	
	if(result){
		alert("삭제 되었습니다.");
		$.ajax({
			url:"faqdelete.do",
			type:"get",
			data:{"faq_no":faq_no, "faqcatd":faqcatd},
			dataType:"json",
			success:function(result){
				if(result.faqDel > 0){
					location.href = "kiviewfaq.do?faqcatd="+result.faqcatd;
				}else{
					location.href = "kiviewfaq.do?faqcatd="+result.faqcatd;
				}
			}, error:function(){
				alert("통신 실패");
			}
			
		});
	}else{
		alert("취소");
		location.href = "kiviewfaq.do?faqcatd="+faq_catd;
	}
}