<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KIVIEW &mdash; 채팅방</title>
<style type="text/css">

.chat_member{
	padding:15px;
	width:25%; 
	height:680px; 
	border:1px solid lightgray; 
	overflow:scroll;
	margin:0px; 
	font-weight:bold;
	color:black;
}

li{
	list-style:none;
}

.chat{

	width:75%; height:680px";

}

 
.chat_top{
	width:100%; height:54px; 
	margin:0px;
	
	background-color:#fda638; 
	text-align: center; 
	vertical-align:middle;
}

.chat_body{
	background-color:#9BDAF2;
	width:100%; 
	height:557px; 
	overflow:scroll;

}

.chat_input{
border:1px solid lightgray;
padding:15px;
height:10%
	
}

.msgbox_me{
	clear:both;
	float:right;
	background-color:#F2F5A9;
	border:1px solid lightgray;
	margin:15px;
	padding:15px;
	border-radius:5px;
}

.msgbox_system{
	clear:both;
	float:center;
	text-align:center;
	
	margin:15px;
	padding:15px;
	border-radius:5px;
}

.msgbox_other{
	clear:both;
	float:left;
	text-align:right;
	background-color:white;
	border:1px solid lightgray;
	margin:15px;
	padding:10px;
	border-radius:5px;
}

label{
	color:black;
	font-weight:bold;
}


</style>
<script src="http://18.223.58.91:9000/socket.io/socket.io.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.js"></script>

<script type="text/javascript">



$(function(){
	
	var page = 1;
	var count = 0;
	
	$(".chat_body").scroll(function(){
		
		if($(".chat_body").scrollTop()==0){
			page++;
			
			
			$.ajax({
				url:"cafechatselect.do",
				type:"post",
				dataType:"json",
				data:{"cafe_no":'${cafe.cafe_no}', "member_no":'${login.member_no}', "page":page, "count":count},
				success:function(data){
				
					
					$.each(data.chat, function(key, value){
						if(value.writer=='${login.member_id}'){
							loadMsg('me',value.writer, value.msg, changeFullDate(value.senddate));
						} else if (value.writer!='system' && value.writer!='${login.member_id}') {
							loadMsg('other',value.writer, value.msg, changeFullDate(value.senddate));
						} else if (value.writer=='system'){
							loadMsg('system','SYSTEM', value.msg, changeFullDate(value.senddate));
						}
						
						
					})
					
				}
				
				
			})
		}
	})
	
	
	$.ajax({
		url:"cafechatselect.do",
		type:"post",
		dataType:"json",
		data:{"cafe_no":'${cafe.cafe_no}', "member_no":'${login.member_no}', "page":page, "count":count},
		success:function(data){
			$.each(data.chat, function(key, value){
				if(value.writer=='${login.member_id}'){
					loadMsg('me',value.writer, value.msg, changeFullDate(value.senddate));
				} else if (value.writer!='system' && value.writer!='${login.member_id}') {
					loadMsg('other',value.writer, value.msg, changeFullDate(value.senddate));
				} else if (value.writer=='system'){
					loadMsg('system','SYSTEM', value.msg, changeFullDate(value.senddate));
				}
				
				
			})
			
		}
		
		
	})
	
	var now = new Date();
	
	var socket = io("18.223.58.91:9000"); //페이지 로드시 해당 포트로 접속
	//var socket = io("localhost:9000"); //페이지 로드시 해당 포트로 접속
	
	socket.on('connection', function(data){
		if(data.type == 'connected'){
			socket.emit('connection', {
				type:'join',
				member_no:'${login.member_no}',
				member_id:'${login.member_id}',
				cafe_no:'${cafe.cafe_no}',
				title:'${cafe.title}'
				
				
			});
		}
	})
	
	
	socket.on("updateuser",function(data){                  
      
      $("#usercount").empty();
      $("#userlist").empty();
      $("#usercount").append("현재 채팅인원   : "+data.chatlist.length+" 명");      
      
      for(var i=0; i< data.chatlist.length ;i++){
         $("#userlist").append("<li>"+data.chatlist[i]+"</li>");
      }         
   })
   
   socket.on("close",function(data){
      alert(data.msg+"님은 이미 접속 중입니다.");
      self.close();
   })

	
	
	socket.on('disconnect', function(data){
		writeMsg('system','SYSTEM',data.msg,changeDate(now));
		insertMsg('${cafe.cafe_no}','${login.member_no}','system',data.msg);
		count++;
	})

	
	socket.on('system',function(data){
		writeMsg('system','SYSTEM',data.msg,changeDate(now));
		insertMsg('${cafe.cafe_no}','${login.member_no}','system',data.msg);
		count++;
	})
	
	socket.on('other',function(data){
		writeMsg('other', data.member_id, data.msg, data.time);
		socket.emit('other', {
			member_no:"${login.member_no}",
			member_id:data.member_id,
			msg:data.msg,
			
		})
		
		insertMsg('${cafe.cafe_no}','${login.member_no}',data.member_id,data.msg)
		count++;
	})
	
	socket.on("me",function(data){
		writeMsg('me', data.member_id, data.msg, data.time);
		insertMsg('${cafe.cafe_no}','${login.member_no}',data.member_id,data.msg);
			
	})
	
	
	
	$("#msg").on("keydown",function(key){
		if(key.keyCode=='13'){
			$("#msg_submit").click();
		}
	})
	
	$("#msg_submit").on("click",function(){
		
		if($("#msg").val().length<1){
			alert("메시지를 입력해주세요.");
			
		} else {
			
		count++;
		
		socket.emit("me", {
			member_no:"${login.member_no}",
			member_id:"${login.member_id}",
			msg:$("#msg").val(),
			time:changeDate(now)
			
		});
		
		
		$("#msg").val('');
		
		}
		
	})
	

	
	
	function writeMsg(type, name, msg, time){
		if(type=='me'){
			$(".chat_body").append("<div class='msgbox_me'>"+'<label>'+name+'</label>  <span>'+time+'</span>'+"<br>"+msg+"</div>")
			
			
		}
		
		if(type=='system'){
			$(".chat_body").append("<div class='msgbox_system'>"+'<label>'+name+'</label>'+"<br><span>"+time+'</span><br>'+msg+"</div>")
			
		}
		
		if(type=='other'){
			$(".chat_body").append("<div class='msgbox_other'>"+'<label>'+name+'</label>  <span>'+time+'</span>'+"<br>"+msg+"</div>")
			
			
		}
		
		$(".chat_body").scrollTop($(".chat_body").prop('scrollHeight'));
	}
	
	function loadMsg(type, name, msg, time){
		
		
		
		if(type=='me'){
			$(".chat_body").prepend("<div class='msgbox_me'>"+'<label>'+name+'</label>  <span>'+time+'</span>'+"<br>"+msg+"</div>")
			
			
		}
		
		if(type=='system'){
			$(".chat_body").prepend("<div class='msgbox_system'>"+'<label>'+name+'</label>'+"<br><span>"+time+'</span><br>'+msg+"</div>")
			
		}
		
		if(type=='other'){
			$(".chat_body").prepend("<div class='msgbox_other'>"+'<label>'+name+'</label>  <span>'+time+'</span>'+"<br>"+msg+"</div>")
			
			
		}
		
		$(".chat_body").scrollTop($(document).height()+700);
		
		
	}
	
	function insertMsg(cafe_no, member_no, writer, msg){
		var data = {"cafe_no":cafe_no, "member_no":member_no, "writer":writer, "msg":msg  }
		
		$.ajax({
			type:"post",
			data: JSON.stringify(data),
			dataType:"json",
			url:"cafechatinsert.do",
			contentType:"application/json"
			
		})
		
	}
	
	function changeDate(date){
		
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
	    
	           
	    strDate = hour+":"+minute
	    
	    
	    return strDate;
	}
	
	function changeFullDate(date){
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



})




</script>


<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/animate.css">    
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/css/magnific-popup.css">
    <link rel="stylesheet" href="resources/css/aos.css">
    <link rel="stylesheet" href="resources/css/ionicons.min.css">   
    <link rel="stylesheet" href="resources/css/flaticon.css">
    <link rel="stylesheet" href="resources/css/icomoon.css">
    <link rel="stylesheet" href="resources/css/style_chat.css"> 
    <!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- KIVIEW FAVICON-->
	<link rel="icon" href="resources/images/main/logo01.png" type="image/x-icon">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body onresize="parent.resizeTo(900,750)" onload="parent.resizeTo(900,750)" style="overflow-x:hidden; overflow-y:hidden">



<!-- 카페 홈  --> 
            
            <div class="row" style="width:900px; height:680px; margin-left:0px;" >   
               
               <!-- 채팅방 영역 -->
               <div class="chat" > 
               		<div class="chat_top">
               			<label style="padding-top:10px; color:white; font-weight:bold;  ">카페 채팅방</label> 
               		</div>
               		
               		<div class="chat_body">
					
  					
               		
               		</div>
	               
	          <div class="chat_input">
	               
	          	<input style="border-radius:5px;" placeholder="메시지를 입력하세요." type="text" size="50" name="text" id="msg">  
	         	<input style="width:20%; border-radius:5px" type="button" value="작 성" class="btn btn-secondary" id="msg_submit">
			       

		      </div>
	               	
               </div>
               
                  <!-- 채팅방 영역 -->
               <div class="chat_member">  
                     <label id="usercount"></label> 
                     <hr style="width:100%; padding-left:0px">
                     <ul id="userlist">                        
                     </ul>
               </div>
               
            </div>    
               
<script src="resources/js/main.kiview.js"></script>
	<!-- <script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/jquery-migrate-3.0.1.min.js"></script> -->
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.easing.1.3.js"></script>
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<script src="resources/js/jquery.stellar.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/aos.js"></script>
	<script src="resources/js/jquery.animateNumber.min.js"></script>
	<script src="resources/js/scrollax.min.js"></script>
	<script src="resources/js/main.js"></script>               


</body>
</html>